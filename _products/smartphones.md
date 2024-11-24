---
layout: default
title: Our Smartphones
---
# This is from smartPhones
# {{ page.title }}

{% for phone in site.data.data.products.smartphones %}
## {{ phone.name }}
**Price:** ${{ phone.price }}

### Key Features:
{% for feature in phone.features %}
- {{ feature }}
{% endfor %}

---
{% endfor %}
