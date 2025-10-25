---
layout: page
title: All Chapters
permalink: /chapters/
---

## Table of Contents

{%- assign chapters = site.chapters | sort: 'order' -%}

### Introduction and Setup

{% for chapter in chapters %}
  {% if chapter.order == 0 %}
- [{{ chapter.title }}]({{ chapter.url | relative_url }})
  {% endif %}
{% endfor %}

{% for chapter in chapters %}
  {% if chapter.order == -1 %}
- [{{ chapter.title }}]({{ chapter.url | relative_url }})
  {% endif %}
{% endfor %}

### Code Basics

{% for chapter in chapters %}
  {% if chapter.order >= 1 and chapter.order <= 4 %}
- [Chapter {{ chapter.chapter_number }}: {{ chapter.title }}]({{ chapter.url | relative_url }})
  {% endif %}
{% endfor %}

### Editor Basics

{% for chapter in chapters %}
  {% if chapter.order >= 5 and chapter.order <= 7 %}
- [Chapter {{ chapter.chapter_number }}: {{ chapter.title }}]({{ chapter.url | relative_url }})
  {% endif %}
{% endfor %}

### Using Plugins and Libraries

{% for chapter in chapters %}
  {% if chapter.order >= 8 and chapter.order <= 9 %}
- [Chapter {{ chapter.chapter_number }}: {{ chapter.title }}]({{ chapter.url | relative_url }})
  {% endif %}
{% endfor %}

### Building an Ink-Based UI in Unity

{% for chapter in chapters %}
  {% if chapter.order >= 10 and chapter.order <= 12 %}
- [Chapter {{ chapter.chapter_number }}: {{ chapter.title }}]({{ chapter.url | relative_url }})
  {% endif %}
{% endfor %}

### Organizing and Optimizing

{% for chapter in chapters %}
  {% if chapter.order >= 13 and chapter.order <= 15 %}
- [Chapter {{ chapter.chapter_number }}: {{ chapter.title }}]({{ chapter.url | relative_url }})
  {% endif %}
{% endfor %}

### Advanced Ink Story API Usage

{% for chapter in chapters %}
  {% if chapter.order >= 16 and chapter.order <= 17 %}
- [Chapter {{ chapter.chapter_number }}: {{ chapter.title }}]({{ chapter.url | relative_url }})
  {% endif %}
{% endfor %}