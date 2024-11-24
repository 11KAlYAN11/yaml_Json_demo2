# yaml_demo2

Note: Here we are adding to render data from both data.yaml : data.json & _config.json : _config.yaml. As of now both files is there in _data & _config folder but As json files placed first in the folder so it will be rendered first.  This _plugings folder also added while makeing _congfig.yaml to _config.json because .json natively not supported by jekyll so we haved added plugin in _plugins.

Let me explain how the layout system works:

Layout System (default.html linking to index.html):
When Jekyll processes index.html, it sees layout: default in the front matter (the --- section at the top)
It then takes all the content from index.html and inserts it where the {{ content }} tag is in default.html
So the final HTML will be:
All the HTML structure and styling from default.html
Your index.html content inserted where {{ content }} is
This means your content gets wrapped in the common layout (header, styling, container div, etc.)

Collections in _config.yml:
collections:
  products:
    output: true
    permalink: /products/:path/


This configuration:

Creates a collection called "products"
output: true tells Jekyll to generate a page for each markdown file in the _products folder
permalink: /products/:path/ defines the URL structure:

_products/laptops.md becomes /products/laptops/
_products/smartphones.md becomes /products/smartphones/
_products/accessories.md becomes /products/accessories/


Let me show you one of the product markdown files:



Let me explain with a visual example how everything connects:

File Structure and URL Mapping:

File                          URL
_products/laptops.md    ->    /products/laptops/
_products/smartphones.md ->    /products/smartphones/
_products/accessories.md ->    /products/accessories/


Content Flow:


_layouts/default.html           _products/laptops.md
+------------------+           +------------------+
| <!DOCTYPE html>  |           | ---             |
| <html>          |           | layout: default  |
| <head>...</head>|           | title: Laptops   |
| <body>          |           | ---             |
|   {{ content }} | <-------- | # Laptops       |
| </body>         |           | Content here...  |
| </html>         |           |                  |
+------------------+           +------------------+


Data Flow:

_data/data.yaml               _products/laptops.md
+------------------+         +------------------+
| products:        |         | {% for laptop in |
|   laptops:      | ------> | site.data.data   |
|     - name: X   |         | .products.laptops|
|       price: Y  |         | %}              |
+------------------+         +------------------+


So when someone visits /products/laptops/:

Jekyll finds _products/laptops.md
Sees it uses layout: default
Takes the content from laptops.md
Inserts it into default.html where {{ content }} is

Processes any Liquid tags (like {% for %}) using data from data.yaml
Generates the final HTML page

The collections configuration in _config.yml is what makes this possible by:

Telling Jekyll to process files in _products folder
Generate HTML pages for each markdown file
Create URLs in the /products/name/ format
Allow these files to access the site's layouts and data
Would you like me to show you how the data flows from data.yaml to one of these pages?



Let me show you how the data flows by examining the data.yaml file:


Task Completed
Here's how the Jekyll site structure works:

Layout System (_layouts/default.html -> Any page):
When a page has layout: default in its front matter, Jekyll takes that page's content and inserts it into default.html where {{ content }} appears
This gives every page the same structure, styling, and header/footer
Collections (_config.yml configuration):

collections:
  products:
    output: true
    permalink: /products/:path/

This tells Jekyll to:

Create a collection called "products"
Generate pages for files in _products/ folder

Create URLs like /products/laptops/ for _products/laptops.md
Data Flow (_data/data.yaml -> Product Pages):
Data is stored in _data/data.yaml

Product pages (like laptops.md) access this data using:

{% for laptop in site.data.data.products.laptops %}
  {{ laptop.name }}
  {{ laptop.price }}
  {{ laptop.specs.cpu }}
{% endfor %}

Jekyll processes these templates and generates HTML pages with the data
So when you visit /products/laptops/:

Jekyll uses laptops.md content
Wraps it in default.html layout
Fills in data from data.yaml
Creates the final HTML page
To modify content, just update data.yaml and Jekyll will automatically update all pages using that data.