/* Interactive application catalog table — biocontainer-doc */

document.addEventListener('DOMContentLoaded', function () {
  var tbody = document.getElementById('catalog-tbody');
  if (!tbody) return; // only active on the index page

  var clusters = ['anvil', 'bell', 'gautschi', 'gilbreth', 'negishi', 'scholar'];
  var searchInput = document.getElementById('app-search');
  var countEl = document.getElementById('app-count');
  var allBtn = document.getElementById('cluster-btn-all');

  var clusterBtns = {};
  clusters.forEach(function (c) {
    clusterBtns[c] = document.getElementById('cluster-btn-' + c);
  });

  var selectedClusters = new Set(); // empty = show all

  // Build all table rows from CATALOG_DATA (injected via catalog_data.js)
  var rows = [];
  var apps = Object.keys(CATALOG_DATA).sort(function (a, b) {
    return a.localeCompare(b);
  });

  apps.forEach(function (app) {
    var info = CATALOG_DATA[app];
    var availability = info.availability || {};
    var tr = document.createElement('tr');
    tr.dataset.app = app;
    var appClusters = clusters.filter(function (c) { return availability[c]; });
    tr.dataset.clusters = appClusters.join(',');

    // App name cell with link to its doc page
    var tdApp = document.createElement('td');
    var a = document.createElement('a');
    a.href = 'source/' + app + '/' + app + '.html';
    a.textContent = app;
    tdApp.appendChild(a);
    tr.appendChild(tdApp);

    // One cell per cluster
    clusters.forEach(function (cluster) {
      var td = document.createElement('td');
      if (availability[cluster] && availability[cluster].length > 0) {
        td.textContent = '\u2713'; // ✓
        td.className = 'cluster-yes';
        td.title = availability[cluster].join(', ');
      } else {
        td.textContent = '';
        td.className = 'cluster-no';
      }
      tr.appendChild(td);
    });

    tbody.appendChild(tr);
    rows.push(tr);
  });

  function updateCount() {
    var visible = rows.filter(function (r) { return r.style.display !== 'none'; }).length;
    countEl.textContent = visible + ' application' + (visible !== 1 ? 's' : '') + ' shown';
  }

  function applyFilters() {
    var query = searchInput.value.toLowerCase().trim();
    rows.forEach(function (row) {
      var nameMatch = !query || row.dataset.app.indexOf(query) !== -1;
      var rowClusters = row.dataset.clusters ? row.dataset.clusters.split(',') : [];
      var clusterMatch = selectedClusters.size === 0 ||
        Array.from(selectedClusters).some(function (c) { return rowClusters.indexOf(c) !== -1; });
      row.style.display = (nameMatch && clusterMatch) ? '' : 'none';
    });
    updateCount();
  }

  function updateButtonStates() {
    if (selectedClusters.size === 0) {
      allBtn.classList.add('cluster-btn-active');
    } else {
      allBtn.classList.remove('cluster-btn-active');
    }
    clusters.forEach(function (c) {
      var btn = clusterBtns[c];
      if (btn) {
        if (selectedClusters.has(c)) {
          btn.classList.add('cluster-btn-active');
        } else {
          btn.classList.remove('cluster-btn-active');
        }
      }
    });
  }

  allBtn.addEventListener('click', function () {
    selectedClusters.clear();
    updateButtonStates();
    applyFilters();
  });

  clusters.forEach(function (c) {
    var btn = clusterBtns[c];
    if (!btn) return;
    btn.addEventListener('click', function () {
      if (selectedClusters.has(c)) {
        selectedClusters.delete(c);
      } else {
        selectedClusters.add(c);
      }
      updateButtonStates();
      applyFilters();
    });
  });

  searchInput.addEventListener('input', applyFilters);

  // Initial render
  updateButtonStates();
  updateCount();
});
