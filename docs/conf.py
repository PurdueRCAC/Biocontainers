# Configuration file for the Sphinx documentation builder.
#
# This file only contains a selection of the most common options. For a full
# list see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Path setup --------------------------------------------------------------

# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.
#
import json
import os


# -- Project information -----------------------------------------------------

project = 'RCAC Biocontainers'
copyright = '2022, Yucheng Zhang'
author = 'Yucheng Zhang'

# The full version, including alpha/beta/rc tags
release = 'v1.0'


# -- General configuration ---------------------------------------------------

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = ['sphinx_design']

# Add any paths that contain templates here, relative to this directory.
templates_path = ['_templates']

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path.
exclude_patterns = []


# -- Options for HTML output -------------------------------------------------

# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
#
html_theme = 'sphinx_rtd_theme'

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_static_path = ['_static']

html_css_files = ['catalog.css']
html_js_files = ['catalog_data.js', 'catalog.js']


def _generate_catalog_data(app):
    """Write docs/_static/catalog_data.js from the inventory JSON at build time."""
    docs_dir = os.path.dirname(os.path.abspath(__file__))
    json_path = os.path.join(docs_dir, '..', 'scripts', 'documentation',
                             'rcac_biocontainers_inventory.json')
    static_dir = os.path.join(docs_dir, '_static')
    os.makedirs(static_dir, exist_ok=True)

    with open(json_path, 'r') as f:
        data = json.load(f)

    js_path = os.path.join(static_dir, 'catalog_data.js')
    with open(js_path, 'w') as f:
        f.write('/* Auto-generated from rcac_biocontainers_inventory.json — do not edit */\n')
        f.write('const CATALOG_DATA = ')
        json.dump(data, f, separators=(',', ':'))
        f.write(';\n')


def setup(app):
    app.connect('builder-inited', _generate_catalog_data)
