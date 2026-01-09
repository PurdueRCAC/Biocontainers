#!/usr/bin/env bash
# ./tools/update_apps_inventory.sh
# Full rebuild each run, availability only (no description/homepage).
# Output: ./rcac_biocontainers_inventory.json
# Requires: jq

set -euo pipefail

OUTPUT_FILE="./rcac_biocontainers_inventory.json"
MODULEDIR="../../modulefiles"
VERBOSE=0

while getopts "v" opt; do
  case $opt in
    v) VERBOSE=1 ;;
  esac
done

# skip files or folders 
skip_file() {
  local filepath="$1"
  local filename="${filepath##*/}"
  local relpath="${filepath#$MODULEDIR/}"

  [[ "$filename" =~ -[a-zA-Z0-9]{7}\.lua$ ]] && return 0
  [[ "$filename" == ".modulerc.lua" ]] && return 0
  [[ "$relpath" == */modtree/* ]] && return 0
  [[ "$relpath" == */rocmcontainers/* ]] && return 0
  [[ "$relpath" == */ngc/* ]] && return 0
  # skip Core/*.lua (not real apps, just environment/compiler modules)
  [[ "$relpath" =~ /Core/[^/]+\.lua$ ]] && return 0
  return 1
}

if [ ! -d "$MODULEDIR" ]; then
  echo "Error: modulefiles directory not found at $MODULEDIR" >&2
  exit 1
fi

# Backup old file for diffing
OLD_FILE="$(mktemp --suffix=.json)"
if [ -f "$OUTPUT_FILE" ]; then
  cp "$OUTPUT_FILE" "$OLD_FILE"
else
  echo "{}" > "$OLD_FILE"
fi

NEW_TMP="$(mktemp --suffix=.jsonl)"
trap 'rm -f "$NEW_TMP" "$OLD_FILE"' EXIT

# Delete expired symlinks from "$MODULEDIR"
find "$MODULEDIR" -type l -exec test ! -e {} \; -print -delete 2>/dev/null

# Collect all entries
find "$MODULEDIR" \( -type f -o -type l \) -name "*.lua" ! -name "default" -print0 |
while IFS= read -r -d '' filepath; do
  skip_file "$filepath" && continue

  relpath="${filepath#$MODULEDIR/}"
  filename="${filepath##*/}"

  # Split the path into an array
  IFS='/' read -ra path_parts <<< "$relpath"
  [ "${#path_parts[@]}" -lt 3 ] && continue  # skip if not enough depth

  cluster="${path_parts[0]}"
  len=${#path_parts[@]}
  app_dir="${path_parts[$((len-2))]}"
  version="${filename%.*}"

  jq -n --arg app "$app_dir" \
        --arg cluster "$cluster" \
        --arg version "$version" \
        '{app:$app, cluster:$cluster, version:$version}' >> "$NEW_TMP"

done

# === Detect default versions (symlinks like default -> xxx.lua) ===
find "$MODULEDIR" -type l -name "default" -print0 |
while IFS= read -r -d '' linkpath; do
  skip_file "$linkpath" && continue

  relpath="${linkpath#$MODULEDIR/}"
  target=$(basename "$(readlink "$linkpath")")
  [[ "$target" == *.lua ]] || continue
  default_version="${target%.lua}"

  IFS='/' read -ra path_parts <<< "$relpath"
  [ "${#path_parts[@]}" -lt 3 ] && continue
  cluster="${path_parts[0]}"
  len=${#path_parts[@]}
  app_dir="${path_parts[$((len-2))]}"

  jq -n --arg app "$app_dir" \
        --arg cluster "$cluster" \
        --arg version "$default_version" \
        '{app:$app, cluster:$cluster, default:$version}' >> "$NEW_TMP"
done

# Aggregate all entries into a single JSON structure:
# { app: { availability: { cluster: [versions] }, default: { cluster: version } } }
jq --slurp '
  reduce .[] as $it ({}; 
    .[$it.app] |= ( . // {availability:{}} ) |
    if ($it | has("default")) then
      .[$it.app].default[$it.cluster] = $it.default
    else
      .[$it.app].availability[$it.cluster] |= ((. // []) + [$it.version])
    end
  )
  | to_entries
  | map({ key: .key,
          value: (.value
            | .availability |= (
                with_entries(
                  .value |= (
                    unique
                    | sort_by(split(".") | map(tonumber? // 0))
                  )
                )
              )
          ) })
  | sort_by(.key)
  | from_entries
' "$NEW_TMP" > "${OUTPUT_FILE}.new"

# If verbose, show a diff of changes since last run
if [ "$VERBOSE" -eq 1 ]; then
  jq -r 'to_entries[] as $app 
         | ($app.value.availability // {}) 
         | to_entries[] as $c 
         | $c.value[] 
         | "\($app.key)|\($c.key)|\(.)"' "$OLD_FILE" 2>/dev/null | sort > /tmp/old_flat.txt

  jq -r 'to_entries[] as $app 
         | ($app.value.availability // {}) 
         | to_entries[] as $c 
         | $c.value[] 
         | "\($app.key)|\($c.key)|\(.)"' "${OUTPUT_FILE}.new" 2>/dev/null | sort > /tmp/new_flat.txt

  # Find added and removed entries
  added=$(comm -13 /tmp/old_flat.txt /tmp/new_flat.txt)
  removed=$(comm -23 /tmp/old_flat.txt /tmp/new_flat.txt)

  added_count=$(echo "$added" | grep -c . || true)
  removed_count=$(echo "$removed" | grep -c . || true)

  echo "=== Inventory changes since last run ==="
  echo "New entries: $added_count"
  echo "Removed entries: $removed_count"
  echo "----------------------------------------"

  if [ "$added_count" -gt 0 ]; then
    echo "+++ Newly added:"
    echo "$added" | sed -n '1,500p'
    [ "$added_count" -gt 500 ] && echo "... (truncated)"
  fi

  if [ "$removed_count" -gt 0 ]; then
    echo "--- Removed:"
    echo "$removed" | sed -n '1,500p'
    [ "$removed_count" -gt 500 ] && echo "... (truncated)"
  fi

  echo "========================================"
fi

# Replace old inventory
mv "${OUTPUT_FILE}.new" "$OUTPUT_FILE"
echo "✅ Full update complete: $OUTPUT_FILE"