---
title: "C#: Variables, Data Types, and Collections"
order: 1
chapter_number: 1
layout: chapter
---

## Objectives

- **Define** variables, constants, and data types in C#
- **Distinguish** between common data types (integers, floats, booleans, characters, strings)
- **Apply** type inference using the `var` keyword
- **Create** and manipulate arrays, lists, and dictionaries
- **Utilize** modern C# collection expressions and target-typed new syntax
- **Implement** raw string literals for multi-line text

## Table of Contents

- [Comments](#comments)
- [Variables and Constants](#variables-and-constants)
  - [Common Data Types](#common-data-types)
    - [Integers](#integers)
    - [Floats](#floats)
    - [Booleans](#booleans)
    - [Characters](#characters)
  - [Constants](#constants)
- [Collections](#collections)
  - [Arrays](#arrays)
  - [Lists](#lists)
  - [Dictionaries](#dictionaries)
  - [Strings](#strings)

---

## Comments

A *comment* is a special type of code that is ignored by computers. Comments are written as notes for other programmers or as reminders. They are part of the code, but not run when a program does.

In C\#, a single-line comment start with two backslashes, `//`. Anything after the backslashes until the end of the line is considered a *comment*.

**Example:**

```CSharp
// Single line comment!
// Another single line comment!
```

For multi-line comments, a single backslash, `/`, and asterisk, `*`, mark the beginning of a multiline comment. It ends when a asterisk, `*`, followed by a backslash, `/`.

```CSharp
/* This is a
multi-line
comment. */
```

---

## Variables and Constants

A *variable* is a container for data that can change when a program is run. Depending on the *type* of data, different labels, *data types*, are used when the container is created to explain how the data should be treated or stored when a program is run.

```CSharp
example = 5;
```

Variable *names* can contain letters, numbers, and the underscore. They **cannot** contain any spaces.

The following are valid variables names:

```CSharp
example = 5;
example2 = 6;
_example = 7;
anotherExample = 8;
```

> **Note:** Because variable names cannot contain spaces, it is very common to write variable names in a pattern using uppercase and lowercase letters to mark where the next word starts.

### Common Data Types

There are many different *data types*. These identify the *type* of data in the variable. They also appear *before* the name of the variable when it is created.

Some of the more common types are **Integers**, **Floats**, **Booleans**, and **Characters**.

#### Integers

An **Integer** is a whole number. It does not contain a decimal point. Examples include numbers like `5`, `15`, and `899999`.

An Integer can be any number within the range of `-2,147,483,648` to `2,147,483,647`.

**Integers** are created in C\# through the keyword `int`.

```CSharp
int example = 5;
```

#### Floats

A **Float** is a value containing a decimal point. They are named "floats" based on the term "floating point," which is the technical name for any decimal point values represented digitally. They are called this because decimal point can "float."

Float value can be between `-3.4 x 1038` to `+3.4 x 1038`.

**Floats** are created through the keyword `float`.

```CSharp
float example = 3.14f;
```

> **Note:** The use of the letter `f` after a **Float** value is part of how decimal numbers are written. It lets C\# know not to convert the value into something else and leave it a "float" value.

#### Booleans

A **Boolean** value is named after George Boole, who invented a way to write algebra using only `true` (1) and `false` (0) values.

Boolean values can be either `true` or `false`.

They are created using the keyword `bool`.

```CSharp
bool example = true;
```

> **Note:** A Boolean variable can **only** use the special keywords `true` and `false` for its values.

#### Characters

A **Character** is a single letter, number, or other symbol enclosed in single quotation marks.

Characters are created through the keyword `char`.

```CSharp
char example = '3';
```

> **Note:** Characters **must** be a single letter, number, or other symbol. Their values also **must** be enclosed in *single* quotation marks.

### Constants

Variables change. However, there is a special type of variable called a *constant* that does not. In C\#, a *constant*, once created, cannot ever change its value.

Constants are created using the keyword `const`. It appears *before* the label for any other data type.

```CSharp
const float PI = 3.14159f;
```

> **Note:** A common pattern when creating constants is to write it using only capital letters. This signals its visual importance in the code.

### Type Inference with `var`

Modern C# (since version 3.0, enhanced in later versions) supports *type inference* using the keyword `var`. When a variable is declared with `var`, the compiler automatically determines the type based on the value assigned to it.

```CSharp
var example = 5;          // Inferred as int
var pi = 3.14f;           // Inferred as float
var greeting = "Hello!";  // Inferred as string
var isActive = true;      // Inferred as bool
```

> **Note:** While `var` is convenient and widely used in modern C#, it can only be used when the type can be clearly inferred from the assignment. The variable is still *strongly typed* - it doesn't change the type, just lets the compiler figure it out for you.

## Collections

Many programming languages define *types* of data that can hold others. In C\#, these are known as *collections* because they "collect" other data types.

### Arrays

The most common type of *collection* in any programming language is an **Array**. It defines a sequence of values where **order is important**.

```CSharp
int[] exampleArray;
```

Arrays are created using the name of a data type and then opening (`[`]) and closing (`]`) square brackets after it. They appear *before* the name of the variable.

Values are created with an Array in C\# through specifying its data type, *length* (number of entries), and then its initial values in opening (`{``) and closing (`}`) curly brackets.

```CSharp
int[] example = new int[5]{1,2,3,4,6};
```

> **Note:** The `new` keyword signals that an *object* is being created. Classes and objects are explained in the chapter on [Object-Oriented Programming](../chapter3/index.md).

**Modern C# (9.0+) also supports target-typed `new` expressions**, which lets you omit the type on the right side when it's obvious:

```CSharp
int[] example = new[]{1,2,3,4,6};      // Simpler syntax
int[] example2 = [1,2,3,4,6];          // Collection expression (C# 12.0+)
```

Values within an array are defined in reference to their position called their *index*. To access data within an array, its index is needed. In C\#, indices start with 0 and increase up to (1 - *length*).

```CSharp
int[] example = new int[5]{1,2,3,4,6};
// 2
example[1];
// 1
example[0]
```

### Lists

A **List** is like an **Array**, but provides the ability to search, sort, and manipulate its entries. Order is **not** important to a **List**.

Lists are created using a notation of `<Type>` where each "Type" is a known data type following the keyword `List`.

```CSharp
List<char> exampleList = new List<char>();
```

**In modern C#**, you can use simpler syntax:

```CSharp
var exampleList = new List<char>();    // Target-typed new
List<char> exampleList2 = [];         // Collection expression (C# 12.0+)
```

Values are accessed through using opening (`[`) and closing (`]`) square brackets for their *index*.

```CSharp
List<char> exampleList = new List<char>();
exampleList.Add('A');
exampleList.Add('B');
// 'A'
exampleList[0];
```

### Dictionaries

A *Dictionary* is a set of key-value pairs. A key is used to refer to a *value*. A *dictionary* is named as much because, like its namesake, something is looked up (a key) to get something else (a value).

Dictionaries are created using a notation of `<Type, Type>` where each "Type" is a known data type following the keyword `Dictionary`.

```CSharp
Dictionary<int, char> dict = new Dictionary<int, char>();
```

**In modern C#**, you can use simpler syntax:

```CSharp
var dict = new Dictionary<int, char>();  // Target-typed new
```

In the above example, the key would be an **Integer** and any values associated with it **Characters**.

Values are accessed through using opening (`[`) and closing (`]`) square brackets for their *key*.

```CSharp
Dictionary<int, char> dict = new Dictionary<int, char>();
dict.Add(99, 'A');
// 'A'
dict[99];
```

> **Note:** In order to be accessed by their key, values must be added to a dictionary through the method **Add()**. Methods are explained as part of the Object-Oriented Programming chapter.

### Strings

A *String* is a special type of collection that can only contain **Characters**.

Strings are created using the keyword `string`

```CSharp
string example = "Hi!";
```

> **Note:** String values are *always* enclosed in double-quotation marks.

**Modern C# (11.0+) also supports raw string literals** using triple quotes, which is especially useful for multiline strings or strings containing quotes:

```CSharp
string json = """
    {
        "name": "Fred",
        "age": 25
    }
    """;
```
