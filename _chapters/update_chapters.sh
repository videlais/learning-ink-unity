#!/bin/bash

# Update Chapter 1
sed -i '' '1s/^/---\ntitle: "C#: Variables, Data Types, and Collections"\norder: 1\nchapter_number: 1\nlayout: chapter\n---\n\n/' chapter1/index.md
sed -i '' 's/# C\\#: Variables, Data Types, and Collections//' chapter1/index.md

# Update Chapter 2
sed -i '' '1s/^/---\ntitle: "C#: Classes"\norder: 2\nchapter_number: 2\nlayout: chapter\n---\n\n/' chapter2/index.md
sed -i '' 's/# C\\#: Classes//' chapter2/index.md

# Update Chapter 3
sed -i '' '1s/^/---\ntitle: "C#: Object-Oriented Programming"\norder: 3\nchapter_number: 3\nlayout: chapter\n---\n\n/' chapter3/index.md
sed -i '' 's/# C\\#: Object-Oriented Programming//' chapter3/index.md

# Update Chapter 4
sed -i '' '1s/^/---\ntitle: "C#: Operators"\norder: 4\nchapter_number: 4\nlayout: chapter\n---\n\n/' chapter4/index.md
sed -i '' 's/# C\\#: Operators//' chapter4/index.md

# Update Chapter 5
sed -i '' '1s/^/---\ntitle: "Unity: Terms and Concepts"\norder: 5\nchapter_number: 5\nlayout: chapter\n---\n\n/' chapter5/index.md
sed -i '' 's/# Unity: Terms and Concepts//' chapter5/index.md

# Update Chapter 6
sed -i '' '1s/^/---\ntitle: "Unity: Scripting Basics"\norder: 6\nchapter_number: 6\nlayout: chapter\n---\n\n/' chapter6/index.md
sed -i '' 's/# Unity: Scripting Basics//' chapter6/index.md

# Update Chapter 7
sed -i '' '1s/^/---\ntitle: "Unity: Windows, Views, and Tools"\norder: 7\nchapter_number: 7\nlayout: chapter\n---\n\n/' chapter7/index.md
sed -i '' 's/# Unity: Windows, Views, and Tools//' chapter7/index.md

# Update Chapter 8
sed -i '' '1s/^/---\ntitle: "Ink: Loading Ink-Unity Plugin"\norder: 8\nchapter_number: 8\nlayout: chapter\n---\n\n/' chapter8/index.md
sed -i '' 's/# Ink: Loading Ink-Unity Plugin//' chapter8/index.md

# Update Chapter 9
sed -i '' '1s/^/---\ntitle: "Ink: Introducing Story API"\norder: 9\nchapter_number: 9\nlayout: chapter\n---\n\n/' chapter9/index.md
sed -i '' 's/# Ink: Introducing Story API//' chapter9/index.md

# Update Chapter 10
sed -i '' '1s/^/---\ntitle: "Unity UI: Introducing Canvas and Text"\norder: 10\nchapter_number: 10\nlayout: chapter\n---\n\n/' chapter10/index.md
sed -i '' 's/# Unity UI: Introducing Canvas and Text//' chapter10/index.md

# Update Chapter 11
sed -i '' '1s/^/---\ntitle: "Unity UI: Buttons and User Input"\norder: 11\nchapter_number: 11\nlayout: chapter\n---\n\n/' chapter11/index.md
sed -i '' 's/# Unity UI: Buttons and User Input//' chapter11/index.md

# Update Chapter 12
sed -i '' '1s/^/---\ntitle: "Unity UI: User Events and Dynamic Story Loading"\norder: 12\nchapter_number: 12\nlayout: chapter\n---\n\n/' chapter12/index.md
sed -i '' 's/# Unity UI: User Events and Dynamic Story Loading//' chapter12/index.md

# Update Chapter 13
sed -i '' '1s/^/---\ntitle: "Ink: Selective Output and Story Organization"\norder: 13\nchapter_number: 13\nlayout: chapter\n---\n\n/' chapter13/index.md
sed -i '' 's/# Ink: Selective Output and Story Organization//' chapter13/index.md

# Update Chapter 14
sed -i '' '1s/^/---\ntitle: "Unity: Organizing Project Files"\norder: 14\nchapter_number: 14\nlayout: chapter\n---\n\n/' chapter14/index.md
sed -i '' 's/# Unity: Organizing Project Files//' chapter14/index.md

# Update Chapter 15
sed -i '' '1s/^/---\ntitle: "Unity UI: Integrating Line Breaks and Rich Text Support"\norder: 15\nchapter_number: 15\nlayout: chapter\n---\n\n/' chapter15/index.md
sed -i '' 's/# Unity UI: Integrating Line Breaks and Rich Text Support//' chapter15/index.md

# Update Chapter 16
sed -i '' '1s/^/---\ntitle: "Ink + Unity: Accessing and Observing Ink Variables"\norder: 16\nchapter_number: 16\nlayout: chapter\n---\n\n/' chapter16/index.md
sed -i '' 's/# Ink + Unity: Accessing and Observing Ink Variables//' chapter16/index.md

# Update Chapter 17
sed -i '' '1s/^/---\ntitle: "Ink + Unity: Calling Ink Functions"\norder: 17\nchapter_number: 17\nlayout: chapter\n---\n\n/' chapter17/index.md
sed -i '' 's/# Ink + Unity: Calling Ink Functions//' chapter17/index.md

echo "All chapters updated!"
