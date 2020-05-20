# C\#: Variables, Data Types, and Collections

- [C\#: Variables, Data Types, and Collections](#c-variables-data-types-and-collections)
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

**Summary:** In this chapter, variables and collections in C# are reviewed.

---

## Comments

A *comment* is a special type of code that is ignored by computers. Comments are written as notes for other programmers or as reminders. They are part of the code, but not run when a program starts.

In C#, comments start with two backslashes, `//`. Anything after the backslashes until the end of the line is considered a *comment*.

**Example:**

```C#
// Single line comment!
// Another single line comment!
```

For multi-line comments, a single backslash, `/`, and asterisk, `*`, mark the beginning of a multiline comment. It ends when a asterisk, `*`, followed by a backslash, `/`.

```C#
/* This is a
multi-line
comment. */
```

---

## Variables and Constants

A *variable* is a container for data that can change when a program is run. Depending on the *type* of data, different labels, *data types*, are used when the container is created to explain how the data should be treated or stored when a program is run.

```C#
example = 5;
```

In C#, variable *names* can contain letters, numbers, and the underscore. They **cannot** contain any spaces.

The following are valid variables names:

```C#
example = 5;
example2 = 6;
_example = 7;
anotherExample = 8;
```

> **Note:** Because variable names cannot contain spaces, it is very common to write variable names in the camelCase pattern where the first word starts with a lowercase letter and any additional words start with an uppercase letter.

### Common Data Types

In C#, there are many different *data types*. These identify the *type* of data in the variable. They also appear *before* the name of the variable when it is created.

Some of the more common types are **Integers**, **Floats**, **Booleans**, and **Characters**.

#### Integers

An **Integer** is a whole number. It does not contain a decimal point. Examples include numbers like `5`, `15`, and `899999`.

In C#, an Integer can be any number within the range of `-2,147,483,648` to `2,147,483,647`.

**Integers** are created in C# through the keyword `int`.

```C#
int example = 5;
```

#### Floats

A **Float** is a value containing a decimal point. They are named "floats" based on the term "floating point," which is the technical name for any decimal point values represented digitally. The decimal point can "float."

In C#, float value can be between `-3.4 x 1038` to `+3.4 x 1038`.

**Floats** are created through the keyword `float`.

```C#
float example = 3.14;
```

#### Booleans

A **Boolean** value is named after George Boole who invented a way to write algebra using only `true` (1) and `false` (0) values.

In C#, boolean values can be either `true` or `false`.

Booleans are created using the keyword `bool`.

```C#
bool example = true;
```

> **Note:** A boolean variable can **only** use the special keywords `true` and `false` for its values.

#### Characters

A **Character** is a single letter, number, or other symbol in C#.

In C#, characters are created through the keyword `char`.

```C#
char example = '3';
```

> **Note:** Characters **must** be a single letter, number, or other symbol. Their values **must** also be enclosed in *single* quotation marks.

### Constants

Variables change. However, there is a special type of variable called a *constant* that does not. In C#, a *constant*, once created, cannot ever change its value.

Constants are created using the keyword `const`. It appears *before* the label for any other data type.

```C#
const int PI = 3.14159;
```

> **Note:** A common pattern when creating constants is to write them in all capital letters. This signals their importance and inability of their values to be changed.

## Collections

Many programming languages define *types* of data that can hold others. In C#, these are known as *collections* because they "collect" other data types.

### Arrays

The most common type of *collection* in any programming language is an **Array**. It defines a sequence of values where **order is important**.

```C#
int[] exampleArray;
```

Arrays are created using the name of a data type and then opening (`[`]) and closing (`]`) square brackets after it. They appear *before* the name of the variable.

Values are created with an Array in C# through specifying its data type, *length* (number of entries), and then its initial values in opening (`{`}) and closing (`}`) curly brackets.

```C#
int[] example = new int[5]{1,2,3,4,6};
```

> **Note:** The `new` keyword signals that an *object* is being created. Classes and objects are explained in the section on Object-Oriented Programming.

Values within an array are defined in reference to their position called their *index*. To access data within an array, its index is needed. In C#, indices start with 0 and increase up to (1 - *length*).

```C#
int[] example = new int[5]{1,2,3,4,6};
// 2
example[1];
// 1
example[0]
```

### Lists

A **List** is like an **Array**, but provides the ability to search, sort, and manipulate its entries. Order is **not** important to a **List**.

Generic Lists are created using a notation of `<Type>` where each "Type" is a known data type following the keyword `List`.

```C#
List<char> exampleList = new List<char>();
```

Values are accessed through using opening (`[`) and closing (`]`) square brackets for their *index*.

```C#
List<char> exampleList = new List<char>();
exampleList.Add('A');
exampleList.Add('B');
// 'A'
exampleList[0];
```

### Dictionaries

A *Dictionary* is a set of key-value pairs. A key is used to refer to a *value*. A *dictionary* is named as much because, like its namesake, something is looked up (a key) to get something else (a value).

Generic Dictionaries are created using a notation of `<Type, Type>` where each "Type" is a known data type following the keyword `Dictionary`.

```C#
Dictionary<int, char> dict = new Dictionary<int, char>();
```

In the above example, the key would be an **Integer** and any values associated with it **Characters**.

Values are accessed through using opening (`[`) and closing (`]`) square brackets for their *key*.

```C#
Dictionary<int, char> dict = new Dictionary<int, char>();
dict.Add(99, 'A');
// 'A'
dict[99];
```

> **Note:** In order to be accessed by their key, values must be added to a dictionary through the method **Add()**. Methods are explained as part of the Object-Oriented Programming section.

### Strings

A *String* is a special type of collection that can only contain **Characters**.

Strings are created using the keyword `String`

```C#
String example = "Hi!";
```

> **Note:** String values should *always* be enclosed in double-quotation marks.
