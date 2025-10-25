#!/usr/bin/env python3

import os
import re

# Chapter information
chapters = [
    (2, "C#: Classes"),
    (3, "C#: Object-Oriented Programming"),
    (4, "C#: Operators"),
    (5, "Unity: Terms and Concepts"),
    (6, "Unity: Scripting Basics"),
    (7, "Unity: Windows, Views, and Tools"),
    (8, "Ink: Loading Ink-Unity Plugin"),
    (9, "Ink: Introducing Story API"),
    (10, "Unity UI: Introducing Canvas and Text"),
    (11, "Unity UI: Buttons and User Input"),
    (12, "Unity UI: User Events and Dynamic Story Loading"),
    (13, "Ink: Selective Output and Story Organization"),
    (14, "Unity: Organizing Project Files"),
    (15, "Unity UI: Integrating Line Breaks and Rich Text Support"),
    (16, "Ink + Unity: Accessing and Observing Ink Variables"),
    (17, "Ink + Unity: Calling Ink Functions")
]

def update_chapter(chapter_num, title):
    file_path = f"chapter{chapter_num}/index.md"
    
    if not os.path.exists(file_path):
        print(f"File {file_path} not found")
        return
    
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Create front matter
    front_matter = f"""---
title: "{title}"
order: {chapter_num}
chapter_number: {chapter_num}
layout: chapter
---

"""
    
    # Remove the existing title line and TOC header
    # Look for patterns like "# Title" or "# C\#: Title"
    title_pattern = r'^# .*?\n\n'
    content = re.sub(title_pattern, '', content, flags=re.MULTILINE)
    
    # Remove the table of contents that starts with "- [Title]"
    toc_pattern = r'^- \[.*?\]\(#.*?\)\n(  - \[.*?\]\(#.*?\)\n)*'
    content = re.sub(toc_pattern, '', content, flags=re.MULTILINE)
    
    # Remove extra dashes if they exist at the beginning
    content = re.sub(r'^---\n', '', content, flags=re.MULTILINE)
    
    # Add front matter to the beginning
    new_content = front_matter + content.strip() + '\n'
    
    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(new_content)
    
    print(f"Updated chapter {chapter_num}: {title}")

# Change to the _chapters directory
os.chdir('/Users/dancox/Projects/learning-ink-unity-1/_chapters')

# Update all chapters
for chapter_num, title in chapters:
    update_chapter(chapter_num, title)

print("All chapters updated!")