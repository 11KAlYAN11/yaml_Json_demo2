---
layout: default
title: Our Laptops
---
# This is from laptops
# {{ page.title }}

{% for laptop in site.data.data.products.laptops %}
## {{ laptop.name }}
**Price:** ${{ laptop.price }}

### Specifications:
- CPU: {{ laptop.specs.cpu }}
- RAM: {{ laptop.specs.ram }}
- Storage: {{ laptop.specs.storage }}

---
{% endfor %}
