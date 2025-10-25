---
title: "C#: Operators"
order: 4
chapter_number: 4
layout: chapter
---

## Objectives

- **Apply** assignment and arithmetic operators to manipulate values
- **Utilize** string operators including concatenation, escape sequences, and interpolation
- **Evaluate** expressions using comparison operators
- **Construct** complex conditional logic with AND and OR operators
- **Implement** pattern matching with the `is` operator
- **Use** null-conditional and null-coalescing operators for safe null handling
- **Apply** switch expressions for concise conditional logic
- **Access** collection elements using range and index operators

## Table of Contents

- [Assignment Operator](#assignment-operator)
- [Arithmetic Operators](#arithmetic-operators)
  - [Addition](#addition)
  - [Addition Assignment](#addition-assignment)
  - [Subtraction](#subtraction)
  - [Subtraction Assignment](#subtraction-assignment)
  - [Multiplication](#multiplication)
  - [Division](#division)
  - [Modulus](#modulus)
  - [Increment](#increment)
  - [Decrement](#decrement)
- [String Operators](#string-operators)
  - [Concatenation](#concatenation)
  - [String Escape Sequences](#string-escape-sequences)
  - [String Interpolation](#string-interpolation)
- [Comparison Operators](#comparison-operators)
  - [Equality](#equality)
  - [Inequality](#inequality)
  - [Negation](#negation)
  - [Less-than](#less-than)
  - [Greater-than](#greater-than)
  - [Less-Than-Or-Equal-To](#less-than-or-equal-to)
  - [Greater-Than-Or-Equal-To](#greater-than-or-equal-to)
  - [Complex Comparisons](#complex-comparisons)
    - [AND](#and)
    - [OR](#or)
- [Type-Testing Operators](#type-testing-operators)
  - [`is`](#is)
  - [`typeof`](#typeof)

---

## Assignment Operator

The most common operator in any programming language is the *assignment* operator, `=`. This "assigns" a value to a variable.

```CSharp
int example = 5;
```

While it most commonly appears when a variable is being created, it is also used to overwrite a value.

```CSharp
example = 6;
```

> **Note:** Trying to re-assign a value to a *constant* will result in an error. Once assigned a new value **cannot** be assigned.

## Arithmetic Operators

All number values can be used with *arithmetic* operators that exist in C\#.

### Addition

The addition operator, `+`, can be used with any number values.

```CSharp
int example = 5;
// 10
example = example + 5;
```

> **Note:** If an **Integer** is added to a **Float** value, the result is a **Float** value.

### Addition Assignment

The addition assignment operator, `+=`, performs both actions. In the cases where a value would be added to a variable and then save again, the additional assignment operator combines the two.

```CSharp
int example = 5;
// 10
example += 5;
```

### Subtraction

The subtraction operator, `-`, can be used with any number values.

```CSharp
float example = 10.5f;
// 5.5f
example = example - 5;
```

> **Note:** If an **Integer** is subtracted from a **Float** value, the result is a **Float** value.

### Subtraction Assignment

The subtraction assignment operator, `-=`, performs both actions. In the cases where a value would be subtract from a variable and then saved again, the additional assignment operator combines the two.

```CSharp
int example = 5;
// 0
example -= 5;
```

### Multiplication

The multiplication operator, `*`, can be used with any number values.

```CSharp
int example = 5;
// 10
example = example * 2;
```

> **Note:** If an **Integer** is multiplied with a **Float** value, the result is a **Float** value.

### Division

The addition operator, `/`, can be used with any number values.

```CSharp
int example = 10;
// 2
example = example / 5;
```

> **Note:** If an **Integer** is divided by a **Float** value or would produce a decimal value, the result is a **Float** value.

### Modulus

The modulus operator, `%`, can be used with any number values.

In programming terminology, the *modulus* operation returns the reminder of division. For example, if `10 / 2` the value becomes `5`. However, if `10 % 9`, the result would be `1`.

### Increment

The increment operator, `++`, can be used with any number value. It *increases* the value by `1`. Unlike other operators, the increment operator *follows* the variable.

```CSharp
int example = 4;
// 5
example++;
```

### Decrement

The decrement operator, `--`, can be used with any number value. It *decreases* the value by `1`. Unlike other operators, the decrement operator *follows* the variable.

```CSharp
int example = 4;
// 3
example--;
```

## String Operators

The **String** data type supports the addition operator, `+`. This "adds" the values together in an operation named as *concatenation*.

### Concatenation

All non-collection built-in data types have a special method called **toString()**. This converts or otherwise represents the value as a **String**. This allows data types like **Integer** to be "added" to a **String** to create a new **String** value.

```CSharp
string example = "Hi" + 5;
```

### String Escape Sequences

When using strings, there is often a need to represent values such as "the end of a line" or "a single quotation mark." For these purposes, **string** also support *escape sequences*. These start with the backslash character, `\`, and then a character to mark a sequence.

| Escape Sequence | Represents            |
|-----------------| ----------------------|
| `\b`            | Backspace             |
| `\f`            | Form feed             |
| `\n`            | New line              |
| `\r`            | Carriage return       |
| `\t`            | Horizontal tab        |
| `\v`            | Vertical tab          |
| `\'`            | Single quotation mark |
| `\"`            | Double quotation mark |
| `\\`            | Backslash             |
| `\?`            | Literal question mark |

When a string escape sequence is "printed" (shown on console or written to a file), what it represents rather than its value is used.

For example, the following string value --

```CSharp
"Hi\nmy\nname\nis\nFred."
```

-- would produce the following output:

```Text
Hi
my
name
is
Fred
```

The escape sequence `\n` represents a new line and thus, when the string value is printed, each sequence within the string value would start a new line.

### String Interpolation

Often, even when using the addition operator, `+`, it can become confusing when different values are used with strings. To help with this, strings also support *interpolation*. This allows, instead of concatenating values together, to create a final value that *interpolates* other variables.

```CSharp
string name = "Fred";

// Is your name, Fred?
$"Is your name, {name}?";
```

String *interpolations* start with a dollar sign, `$`, before the opening double-quotation mark. Any values, including variables or methods that returning a value, can be used inside of opening (`{`) and closing (`}`) curly brackets.

## Comparison Operators

Beyond saving values, the other most common operation in programming is to compare them. Built into languages like C\# as part of its use of the keywords `if` and `else`, *comparison* operators produce Boolean values.

> **Reminder:** Booleans values are either `true` or `false`.

When combined with the keyword `if`, a comparison operator moves the control of the code into its *block*, section marked with opening (`{`) and closing (`}`) curly brackets, if the result of the comparison is `true`.

**Example:**

```CSharp
if("Hi!" == "Hi!") {
  // Run this code!
}
```

In the above example, if the result of the comparison between one value, `"Hi!"`, is equal to (the same as) the value `"Hi!"`, the code block of the `if` *statement* would be run.

### Equality

The *equality* operator, `==`, compares any two values. If they are the same, the result is `true`.

> **Note:** Objects and Collections in C# have a method called **Equals()** that accepts an object of the same data type (or one that can be converted via polymorphism) and compares them. When overridden in new classes, this allows new data types to be compared to each other.

### Inequality

The *inequality* operator, `!=`, compares any two values. If they are *not* the same, the result is `true`.

### Negation

All Booleans values can be *negated*. This "flips" a value from `true` to `false` or `false` to `true`. When used with a comparison, it changes to the "opposite" value (`true` to `false` or `false` to `true`).

### Less-than

Numerical values can be compared using the less-than operator, `<`. If the value on the left-hand side is *less than* the value on the right-hand side, the result is `true`.

### Greater-than

Numerical values can be compared using the greater-than operator, `>`. If the value on the left-hand side is *greater than* the value on the right-hand side, the result is `true`.

### Less-Than-Or-Equal-To

Numerical values can be compared using the less-than-or-equal-to operator, `<=`. If the value on the left-hand side is *less than* **or** *equal to* the value on the right-hand side, the result is `true`.

### Greater-Than-Or-Equal-To

Numerical values can be compared using the greater-than-or-equal-to operator, `>=`. If the value on the left-hand side is *greater than* **or** *equal to* the value on the right-hand side, the result is `true`.

### Complex Comparisons

The equality, inequality, less-than, greater-than, less-than-or-equal-to, and greater-than-or-equal-to are *binary* operators. They need both a *left-hand* and *right-hand* values between the operator. Two values.

However, they can also be wrapped in opening, `(`, and closing, `)`, parentheses to make *complex* comparisons whose final result will be either `true` or `false`. This can also be combined with the negation operator, `!`, as well.

To help with these, programming languages like C\# have *Boolean logical operators* for combining multiple possible comparisons together in complex comparisons using *logical operators*.

#### AND

When testing values, any two Boolean values can be tested *together* using the *and* operator, `&&`. If *both* comparisons or values are `true`, the result is `true`.

```CSharp
if(1 == 1 && 2 != 3) {
 // Run this code
}
```

#### OR

When testing values, any two Boolean values can be tested *together* using the *or* operator, `||`. If *either* value or comparison is `true`, the result is `true`.

```CSharp
if(2 != 4 || 1 == 1) {
  // Run this code
}
```

## Type-Testing Operators

Because C# has a focus on the types of data used, it also provides functionality to test the type of an object.

### `is`

The `is` keyword compares an object with a known data type. It is a *binary* operator, which means that a value appears on the left-hand side and a known data type appears on the right-hand side.

```CSharp

string name = "Fred";

if(name is string) {
  // Run this code
}

```

**Modern C# (7.0+) supports pattern matching with `is`**, which allows you to test and extract values in one operation:

```CSharp
object obj = "Hello";

// Pattern matching with type test and variable declaration
if (obj is string str) {
  // str is available here as a string
  Console.WriteLine(str.ToUpper());
}

// Property pattern matching (C# 8.0+)
if (person is { Age: > 18 }) {
  // Person is an adult
}
```

### `typeof`

The keyword `typeof` returns a **Type** object containing the *type*.

```CSharp
// System.String
typeof(string)
```

## Null-Handling Operators (C# 6.0+)

Modern C# provides several operators to safely handle `null` values, which are common sources of errors.

### Null-Conditional Operator (`?.`)

The null-conditional operator safely accesses members only if the object is not null:

```CSharp
string name = person?.Name;  // Returns null if person is null
int? length = name?.Length;  // Returns null if name is null
```

### Null-Coalescing Operator (`??`)

The null-coalescing operator provides a default value when the left side is null:

```CSharp
string name = person?.Name ?? "Unknown";  // Use "Unknown" if null
int count = list?.Count ?? 0;             // Use 0 if null
```

### Null-Coalescing Assignment (`??=`, C# 8.0+)

Assigns a value only if the variable is currently null:

```CSharp
name ??= "Default";  // Only assign if name is null
```

## Switch Expressions (C# 8.0+)

Switch expressions provide a more concise alternative to traditional switch statements:

```CSharp
// Traditional switch statement
string result;
switch (value) {
  case 1:
    result = "One";
    break;
  case 2:
    result = "Two";
    break;
  default:
    result = "Other";
    break;
}

// Modern switch expression
string result = value switch {
  1 => "One",
  2 => "Two",
  _ => "Other"  // _ is the discard pattern (default)
};
```

Switch expressions can also use pattern matching:

```CSharp
string description = person switch {
  { Age: < 13 } => "Child",
  { Age: < 20 } => "Teenager",
  { Age: < 65 } => "Adult",
  _ => "Senior"
};
```

## Range and Index Operators (C# 8.0+)

C# provides operators for working with sequences more easily.

### Index from End (`^`)

The `^` operator counts from the end of a sequence:

```CSharp
int[] numbers = { 1, 2, 3, 4, 5 };
int last = numbers[^1];      // 5 (last element)
int secondLast = numbers[^2]; // 4
```

### Range Operator (`..`)

The `..` operator creates a range of indices:

```CSharp
int[] numbers = { 1, 2, 3, 4, 5 };
int[] slice = numbers[1..4];    // { 2, 3, 4 }
int[] fromStart = numbers[..3]; // { 1, 2, 3 }
int[] toEnd = numbers[2..];     // { 3, 4, 5 }
```

> **Note:** These modern operators make C# code more concise and expressive. While Unity's MonoBehaviour scripts may not use all of them, understanding these patterns will help when working with modern C# codebases or Unity's newer APIs.
