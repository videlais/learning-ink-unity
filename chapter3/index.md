# Chapter 3: C\#: Operators

- [Chapter 3: C\#: Operators](#chapter-3-c-operators)
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
    - [`as`](#as)
    - [`typeof`](#typeof)

**Summary:** In this chapter, operators and conditionals in C# are reviewed.

---

## Assignment Operator

The most common operator in any programming language is the *assignment* operator, `=`. This "assigns" a value to a variable.

```C#
int example = 5;
```

While it most commonly appears when a variable is being created, it is also used to overwrite a value.

```C#
example = 6;
```

> **Note:** Trying to re-assign a value to a *constant* will result in an error. Once assigned a new value **cannot** be assigned.

## Arithmetic Operators

All number values can be used with *arithmetic* operators that exist in C#.

### Addition

The addition operator, `+`, can be used with any number values.

```C#
int example = 5;
// 10
example = example + 5;
```

> **Note:** If an **Integer** is added to a **Float** value, the result is a **Float** value.

### Addition Assignment

The addition assignment operator, `+=`, performs both actions. In the cases where a value would be added to a variable and then save again, the additional assignment operator combines the two.

```C#
int example = 5;
// 10
example += 5;
```

### Subtraction

The subtraction operator, `-`, can be used with any number values.

```C#
float example = 10.5f;
// 5.5f
example = example - 5;
```

> **Note:** If an **Integer** is subtracted from a **Float** value, the result is a **Float** value.

### Subtraction Assignment

The subtraction assignment operator, `-=`, performs both actions. In the cases where a value would be subtract from a variable and then saved again, the additional assignment operator combines the two.

```C#
int example = 5;
// 0
example -= 5;
```

### Multiplication

The multiplication operator, `*`, can be used with any number values.

```C#
int example = 5;
// 10
example = example * 2;
```

> **Note:** If an **Integer** is multiplied with a **Float** value, the result is a **Float** value.

### Division

The addition operator, `/`, can be used with any number values.

```C#
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

```C#
int example = 4;
// 5
example++;
```

### Decrement

The decrement operator, `--`, can be used with any number value. It *decreases* the value by `1`. Unlike other operators, the decrement operator *follows* the variable.

```C#
int example = 4;
// 3
example--;
```

## String Operators

The **String** data type supports the addition operator, `+`. This "adds" the values together in an operation named as *concatenation*.

### Concatenation

All non-collection built-in data types have a special method called **toString()**. This converts or otherwise represents the value as a **String**. This allows data types like **Integer** to be "added" to a **String** to create a new **String** value.

```C#
string example = "Hi" + 5;
```

### String Escape Sequences

When using strings, there is often a need to represent values such as "the end of a line" or "a single quotation mark." For these purposes, string also support *escape sequences*. These start with the backslash character, `\`, and then a character to mark a sequence.

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

```C#
"Hi\nmy\nname\nis\nFred."
```

-- would produce the following output:

```bash
Hi
my
name
is
Fred
```

The escape sequence `\n` represents a new line and thus, when the string value is printed, each sequence within the string value would start a new line.

### String Interpolation

Often, even when using the addition operator, `+`, it can become confusing when different values are used with strings. To help with this, strings also support *interpolation*. This allows, instead of concatenating values together, to create a final value that *interpolates* other variables.

```C#
string name = "Fred";

// Is your name, Fred?
$"Is your name, {name}?";
```

String *interpolations* start with a dollar sign, `$`, before the opening double-quotation mark. Any values, including variables or methods that returning a value, can be used inside of opening (`{`) and closing (`}`) curly brackets.

## Comparison Operators

Beyond saving values, the other most common operation in programming is to compare them. Built into languages like C# as part of its use of the keywords `if` and `else`, *comparison* operators produce Boolean values.

> **Note:** Booleans values are either `true` or `false`.

When combined with the keyword `if`, a comparison operator moves the control of the code into its *block*, section marked with opening (`{`) and closing (`}`) curly brackets, if the result of the comparison is `true`.

**Example:**

```C#
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

However, they can also be wrapped in opening (`)`) and closing (`)`) parentheses to make *complex* comparisons whose final result will be either `true` or `false`. This can also be combined with the negation operator, `!`, as well.

To help with these, programming languages like C# have *Boolean logical operators* for combining multiple possible comparisons together in complex comparisons using *logical operators*.

#### AND

When testing values, any two Boolean values can be tested *together* using the *and* operator, `&&`. If *both* comparisons or values are `true`, the result is `true`.

#### OR

When testing values, any two Boolean values can be tested *together* using the *or* operator, `||`. If *either* value or comparison is `true`, the result is `true`.

## Type-Testing Operators

### `is`

### `as`

### `typeof`
