---
layout: default
title: Our Accessories
---
# This is from accessories
# {{ page.title }}

{% for accessory in site.data.data.products.accessories %}
## {{ accessory.name }}
**Price:** ${{ accessory.price }}

{% if accessory.colors %}
### Available Colors:
{% for color in accessory.colors %}
- {{ color }}
{% endfor %}
{% endif %}

{% if accessory.features %}
### Features:
{% for feature in accessory.features %}
- {{ feature }}
{% endfor %}
{% endif %}

---
{% endfor %}
