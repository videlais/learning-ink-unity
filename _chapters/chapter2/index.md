---
title: "C#: Classes"
order: 2
chapter_number: 2
layout: chapter
---

- [Class Anatomy](#class-anatomy)
  - [Fields](#fields)
  - [Properties](#properties)
    - [get](#get)
    - [set](#set)
    - [PascalCase Naming](#pascalcase-naming)
    - [Auto-Implemented Properties](#auto-implemented-properties)
    - [Init-Only Setters (C# 9.0+)](#init-only-setters-c-90)
    - [Required Properties (C# 11.0+)](#required-properties-c-110)
  - [Methods](#methods)
    - [Method Anatomy](#method-anatomy)
      - [Return Type](#return-type)
      - [Name](#name)
      - [Parameters](#parameters)
      - [Bodies](#bodies)
      - [Return Statement](#return-statement)
    - [Calling Methods](#calling-methods)
      - [Arguments](#arguments)
      - [Returning Values](#returning-values)
    - [Constructor](#constructor)
    - [Variable Scope](#variable-scope)
  - [`this`](#this)
  - [`new`](#new)
  - [Records (C# 9.0+)](#records-c-90)

---

## Class Anatomy

In C\#, code is written in *classes*. These are the "blueprints" of future sections of code. When they are created, they become `new` instances based on their blueprint (class).

Each file in C\# is a separate *class*. These are defined with the keyword `class` and then open (`{`) and closing (`}`) curly brackets. Everything inside the brackets is part of the class.

**MainClass.cs:**

```CSharp
class MainClass {
}
```

> **Note:** It is strong recommended, and in fact most functionality depends on, the name of a file matching its class.
>
> For example, the class **MainClass** is in the file `MainClass.cs`.

Inside of the `class` are four possible parts that can exist either all together or as parts: fields, properties, methods, and constructor.

### Fields

A *field* is label for private data within a class. It is created, and can be used, as a variable within the class using a known data type.

**Example:**

```CSharp
class MainClass {
    int example = 5;
}
```

In the above example, the variable *example* is a *field* of the class *MainClass*. It is also, through being defined in the class, *private* to the class. It cannot, by itself, be used outside of the class.

> **Note:** When not specified, C\# will assume the use of the keyword `private` in front of any fields. They are, by default *private fields* of the class.

### Properties

A property is a *public* way to access field or other values in a class. It *exposes* private fields in a class.

A field becomes a property through the use of the keyword `public`. It allows the value to be accessed *outside* of the class.

```CSharp
class MainClass {
  
  public int example = 5;

}
```

To access the the *private fields* of a class, C\# also supports two additional keywords: `get` and `set`.

#### get

The `get` keyword defines a *getter*, special functionality in C\#. When used inside of a property, a *getter* defines what value is *returned* when an external objects uses the property. It defines what is *gotten*.

It is used *inside* of a property, which looks like a public field, but has internal getters, and often setters, that are used when accessed.

```CSharp
class MainClass {
  
  private string _name = "Dan";
  
  public string Name {
    get {
      return _name;
    }
  }
}
```

In the above example, there is a property *Name* of the class **MainClass**. It has a private field, *_name*, that is accessed through the public property of *Name*.

> **Note:** There is a common pattern of naming a private field starting with an underscore. This is not a rule of C\#, but is common in some code.

#### set

The keyword `set` defines a *setter*, special functionality in C\#. When used inside of a property, a *setter* defines what value is *set* when an external objects uses the property. It defines what *sets*.

It is used *inside* of a property, which looks like a public field, but has internal getters, and often setters, that are used when accessed.

```CSharp
class MainClass {
  
  private string _name = "Dan";
  
  public string Name {
    get {
      return _name;
    }
    set {
        _name = value;
    }
  }
}
```

In the above example class named **MainClass**, it has a property named *Name*. It has both a getter and a setter. When used in its getting context, it *returns* the internal, private field. When used as a setter, the keyword `value` is whatever is used to set the value.

> **Note:** The keyword `return` is used whenever a value needs to be "returned" to an external block of code. While used with getters, it is most commonly part of methods.

#### PascalCase Naming

Variables internal to a program are often capitalized in different ways. For properties in C\#, it is generally expected that they follow the PascalCase pattern where the first letter of each word is capitalized.

For example, in the above code examples, the property **Name** began with a capital 'N'.

#### Auto-Implemented Properties

Modern C# supports *auto-implemented properties*, which provide a shorthand for simple getters and setters without needing a private backing field:

```CSharp
class Person {
  public string Name { get; set; }
  public int Age { get; set; }
}
```

The compiler automatically creates the private backing field for you.

#### Init-Only Setters (C# 9.0+)

**Init-only setters** allow properties to be set during object initialization but become read-only afterward:

```CSharp
class Person {
  public string Name { get; init; }
  public int Age { get; init; }
}

var person = new Person { Name = "Alice", Age = 30 };
// person.Name = "Bob";  // Error! Cannot modify after initialization
```

#### Required Properties (C# 11.0+)

The `required` keyword ensures properties must be set during object initialization:

```CSharp
class Person {
  public required string Name { get; init; }
  public required int Age { get; init; }
}

// Must provide values for required properties
var person = new Person { Name = "Alice", Age = 30 };
```

### Methods

A *method* is a function attached to a class. They should start with a capital letter and act as internal *functions*.

Because programming borrows from a longer history of mathematics, the term *function* is carried over. In very general terms, a function is a section of code that performs some task. Functions are a way to break up what would be very long sections of code into smaller parts that can be more easily organized and tested based on the task they perform.

> **Note:** The terms *methods* and *functions* are often used interchangeable. However, they have different, technical meanings. When functions are part of classes, they are *methods*. When used outside of a class, which is very rare in C\#, they are *functions*.

#### Method Anatomy

A *method* has five different parts:

1) What they return (Return Type)
2) What their name is (Name)
3) What values they accept (Parameters)
4) What they do (Bodies)
5) What they return (Return Statement)

A method, like a function, borrows its meaning from mathematics where it is something which accepts input, performs a task, and optionally has output.

```CSharp
public string Greeting() {
    return "Hi!";
}
```

> **Note:** Methods, like the differences between fields and properties, can also use the keyword `private` and `public`. In either case, this defines if it can be used outside of the class or not.

##### Return Type

Methods can return data. They do so via a *return type* that matching existing data types.

**Example:**

```CSharp
public string Greeting() {
    return "Hi!";
}
```

In the above example, the method's *return type* is **String**. That is the type of data returned.

##### Name

The name of a method, like with a variable, is how it is referenced by other objects or within its class. The name of a method follows the same rules as variables: it can contain letters, numbers, and the underscore. It **cannot** contain spaces.

**Example:**

```CSharp
public string Greeting() {
    return "Hi!";
}
```

In the above example, the name of the method is **Greetings**.

> **Note:** It is strongly recommended to start the name of a method with a capital letter. This is a common naming pattern found even within the C\# documentation.

##### Parameters

Like its roots in mathematics, methods can accept data. What type and the name of the data accepts are called its *parameters*.

The parameters of a method are included in the opening and closing parentheses after its name.

**Example:**

```CSharp
public string Greeting(string name) {
    return name;
}
```

As with all data in CSharp, method parameters are a form of *variables* and thus must have a data type and name. However, unlike class fields and other variable usages, they can only be used inside of the method itself.

##### Bodies

The *body* of its method is the code found inside of the opening (`{`) and closing (`}`) curly brackets of a method. Its body is "what it does."

As methods can do anything from calculate new values to work with existing, private fields, each method in a class is different.

**Example:**

```CSharp
public string Greeting() {
    return "Hi!";
}
```

In the above example, the *body* of the method is a single line, `return "Hi!"`. Other, more complex methods could potentially have dozens to hundreds of lines.

##### Return Statement

In programming terminology, a single line of code is often called a *statement*. The phrase "return statement" borrows from this usage and means the use of the keyword `return` and whatever the methods "returns" to some external code.

The *return statement* of a method is directly connected to the *return type* of the method. They have to match! A method **must** return data of the same type of its return statement and return type.

**Example:**

```CSharp
public string Greeting() {
    return "Hi!";
}
```

In the above example, the return statement is the line `return "Hi!";`. The *type* of data is a **String**, which also matches the return type before the name!

#### Calling Methods

When a method is used, it is *called*. This temporarily passes control to the method in order to run some code and then it returns control back. Calling a method takes the form of its name and then open (`(`) and close (`)`) parentheses.

```CSharp
Greeting();
```

##### Arguments

Data can be passed into a method through giving it *arguments*. Any values separated by commas when it is called become *arguments* to the method. These are mapped to its *parameters*.

**Example:**

```CSharp
public int Add(int x, int y) {
    return x + y;
}

Add(2, 2);

```

In the above example, the arguments are `2` and `2`. These are mapped to its *parameters*, *x* and *y* of the **Add()** method.

Inside of the method, the value of *x* becomes `2` and value of *y* becomes `2`.

##### Returning Values

All methods *return* values. The return type of a method is the type of value that is returned by the method.

**Example:**

```CSharp
public int Add(int x, int y) {
    return x + y;
}

int answer = Add(2, 2);
```

In the above example, the return type of the method **Add()** is **Integer**. When the arguments of `2` and `2` are passed to the method, the variables *x* and *y* have these values. The return statement of the method would then *return* the combined values. The right-hand value would then become `4` and the variable *answer* would contain the same value.

#### Constructor

A *constructor* is a specially-named method in a class. It is called when an object is created based on the class.

A constructor shares the same name as the class. It is called whenever an object is created. This allows a class to accept, as arguments, values into this method and thus the class itself.

```CSharp
class Person {
  
  Person() {
  }

}
```

#### Variable Scope

All variables have *scope*. This describes where within code a variable can be accessed.

Within a class, a field, property, or method that is *private* can only be accessed within that class. Anything that is *public* can be accessed via the object's name.

Anything created outside of a class within the same file have a *higher* scope than the class. These variables can be accessed inside of the class.

The same rules apply to a method. Any parameters used in a method are *local* to the method. They cannot be accessed outside of that method.

### `this`

There needs to be a way for classes to refer to its own fields, properties, and methods. Many programming languages use the keyword `this`. C\# does the same.

In classes, the keyword `this` refers to the class itself. Its fields, properties, and methods can be accessed through what is called the "dot notation." A period, `.`, is used between the keyword `this` and any of its fields, properties, and methods names.

```CSharp
class Person {
  
  private string name;
  private float Height;

  Person(string name, float height) {
    this.name = name;
    this.height = height;
  }

}
```

Inside of a constructor, values can be "constructed" through using the keyword `this` to refer its its private fields.

### `new`

An object is created through using the keyword `new`. This creates a *new* object based on the "blueprint" of a class.

Internally, it calls the *constructor* of that class. Combined with the ability of a method to accept arguments, this allows a new object to receive values.

```CSharp
class Person {

  private string _name;

  Person(string name) {

    this._name = name;
  
  }

}

class Example {
  
  public Person p = new Person("Fred");

}
```

### Records (C# 9.0+)

**Records** are a modern C# feature designed for creating immutable data objects with less code. They're perfect for data transfer objects and value-based equality:

```CSharp
// Traditional class
class PersonClass {
  public string Name { get; init; }
  public int Age { get; init; }
}

// Modern record (much simpler!)
record Person(string Name, int Age);
```

Records automatically provide:

- Value-based equality (two records with same values are considered equal)
- Immutability by default
- Built-in `ToString()` implementation
- Copy-and-modify syntax with the `with` keyword

```CSharp
var person1 = new Person("Alice", 30);
var person2 = new Person("Alice", 30);

// true - records use value equality
bool areEqual = person1 == person2;

// Create a copy with modified properties
var person3 = person1 with { Age = 31 };
```

> **Note:** Records are particularly useful in Unity for data that doesn't change often, like configuration settings or game state snapshots.
