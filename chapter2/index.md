# Chapter 2: C#: Classes and Objects

- [Chapter 2: C#: Classes and Objects](#chapter-2-c-classes-and-objects)
  - [Class Anatomy](#class-anatomy)
    - [Fields](#fields)
    - [Properties](#properties)
      - [`get`](#get)
      - [`set`](#set)
    - [Methods](#methods)
      - [Method Return Type](#method-return-type)
      - [Method Name](#method-name)
      - [Method Parameters](#method-parameters)
      - [Method Bodies](#method-bodies)
      - [Method Return Statement](#method-return-statement)
  - [Object-Oriented Programming](#object-oriented-programming)
    - [Inheritances](#inheritances)
    - [Parent and Child Classes](#parent-and-child-classes)
    - [Polymorphism](#polymorphism)

## Class Anatomy

C# is a programming language based on the *object-oriented* programming paradigm.

Code is defined as *classes*. These are the "blueprints" of future objects. When they are created, they become `new` instances of an object based on its *class*.

Each file in C# is a separate *class*. These are defined with the keyword `class` and then open (`{`) and closing (`}`) curly brackets. Everything inside the brackets is part of the class.

**MainClass.cs:**

```C#
class MainClass {
}
```

> **Note:** It is strong recommended, and in fact most functionality depend on, the name of a file matching its class.
>
> For example, the class **MainClass** is in the file `MainClass.cs`.

Inside of the `class` are three possible parts that can exist either all together or as parts: fields, properties, and methods.

### Fields

A *field* is label for private data within a class. It is created, and can be used, as a variable within the class using a known data type.

**Example:**

```C#
class MainClass {
    int example = 5;
}
```

In the above example, the variable *example* is a *field* of the class *MainClass*. It is also, through being defined in the class, *private* to the class. It cannot, by itself, be used outside of the class.

> **Note:** When not specified, C# will assume the use of the keyword `private` in front of any fields. They are, by default *private fields* of the class.

### Properties

A property is a *public* way to access field or other values in a class. It *exposes* private fields in a class.

A field can become a property through the use of the keyword `public`. It allows the value to be accessed *outside* of the class.

```C#
class MainClass {
  
  public int example = 5;

}
```

To access the the *private fields* of a class, C# also supports two additional keywords: `get` and `set`.

#### `get`

The `get` keyword defines a *getter*, special functionality in C#. When used inside of a property, a *getter* defines what value is *returned* when an external objects uses the property. It defines what is *gotten*.

It is used *inside* of a property, which looks like a public field, but has internal getters, and often setters, that are used when accessed.

```C#
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

> **Note:** There is a common pattern of naming a private field starting with an underscore. This is not a rule of C#, but is a very common and often expected naming style.

#### `set`

The keyword `set` defines a *setter*, special functionality in C#. When used inside of a property, a *setter* defines what value is *set* when an external objects uses the property. It defines what *sets*.

It is used *inside* of a property, which looks like a public field, but has internal getters, and often setters, that are used when accessed.

```C#
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

### Methods

A *method* is a function attached to a class. They should start with a capital letter and act as internal *functions*.

> **Note:** The terms *methods* and *functions* are often used interchangeable. However, they have different, technical meanings. When functions are part of classes, they are *methods*. When used outside of a class, which is very rare in C#, they are *functions*.

A *method* has five different parts:

1) What they return (Method Return Type)
2) What their name is (Method Name)
3) What values they accept (Method Parameters)
4) What they do (Method Bodies)
5) What they return (Method Return Statement)

A method borrows its meaning from mathematics where a *function* is something which accepts input, performs a task, and has output.

```C#
public string Greeting() {
    return "Hi!";
}
```

> **Note:** Methods, like the differences between fields and properties, can also use the keyword `private` and `public`. In either case, this defines if it can be used outside of the class or not.

#### Method Return Type

Methods can return data. They do so via a *return type* that matching existing data types.

**Example:**

```C#
public string Greeting() {
    return "Hi!";
}
```

In the above example, the method's *return type* is **String**. That is the type of data returned.

#### Method Name

The name of a method, like with a variable, is how it is referenced by other objects or within its class. The name of a method follows the same rules as variables: it can contain letters, numbers, and the underscore. It **cannot** contain spaces.

**Example:**

```C#
public string Greeting() {
    return "Hi!";
}
```

In the above example, the name of the method is **Greetings**.

> **Note:** It is strongly recommended to start the name of a method with a capital letter. This is a common naming pattern found even within the C# documentation.

#### Method Parameters

Like its roots in mathematics, methods can accept data. What type and the name of the data accepts are called its *parameters*.

The parameters of a method are included in the opening and closing parentheses after its name.

**Example:**

```C#
public string Greeting(string name) {
    return name;
}
```

As with all data in C#, method parameters are a form of *variables* and thus must have a data type and name. However, unlike class fields and other variable usages, they can only be used inside of the method itself.

#### Method Bodies

The *body* of its method is the code found inside of the opening (`{`) and closing (`}`) curly brackets of a method. Its body is "what it does."

As methods can do anything from calculate new values to work with existing, private fields, each method in a class is different.

**Example:**

```C#
public string Greeting() {
    return "Hi!";
}
```

In the above example, the *body* of the method is a single line, `return "Hi!"`. Other, more complex methods could potentially have dozens to hundreds of lines.

#### Method Return Statement

In programming terminology, a single line of code is often called a *statement*. The phrase "return statement" borrows from this usage and means the use of the keyword `return` and whatever the methods "returns" to some external code.

The *return statement* of a method is directly connected to the *return type* of the method. They have to match! A method **must** return data of the same type of its return statement and return type.

**Example:**

```C#
public string Greeting() {
    return "Hi!";
}
```

In the above example, the return statement is the line `return "Hi!";`. The *type* of data is a **String**, which also matches the return type before the name!

---

## Object-Oriented Programming

C# is *object-oriented*. This means that all interactions between code happens between *objects*. This also means that classes -- as the "blueprints" of an object -- are written to include fields, properties, and methods in order to calculate values and potentially communicate between objects.

Object-oriented *programming* is a paradigm -- way of thinking -- that breaks up coding problems into their objects and how those objects relate to each other. The possible relationships exist in three possible options.

To help understand these relationships, the metaphor of parents, children, and toys are used:

- A child, being based on a parent, exists in a "is a" relationship to the parent.
- A child whose has a toy is in a "has a" relationship to the toy.
- Because the child has a toy, and the parent does not, there is no relationship between the parent and the toy.

### Inheritances

### Parent and Child Classes

### Polymorphism
