# Chapter 2: C#: Classes and Objects

- [Chapter 2: C#: Classes and Objects](#chapter-2-c-classes-and-objects)
  - [Class Anatomy](#class-anatomy)
    - [Fields](#fields)
    - [Properties](#properties)
      - [`get`](#get)
      - [`set`](#set)
    - [Methods](#methods)
      - [Method Anatomy](#method-anatomy)
        - [Method Return Type](#method-return-type)
        - [Method Name](#method-name)
        - [Method Parameters](#method-parameters)
        - [Method Bodies](#method-bodies)
        - [Method Return Statement](#method-return-statement)
      - [Calling Methods](#calling-methods)
        - [Arguments](#arguments)
        - [Returning Values](#returning-values)
      - [Constructor](#constructor)
      - [Variable Scope](#variable-scope)
    - [`this`](#this)
    - [`new`](#new)
  - [Object-Oriented Programming](#object-oriented-programming)
    - [Inheritance](#inheritance)
      - [Inheriting Fields, Properties, and Methods](#inheriting-fields-properties-and-methods)
      - [Using `static`](#using-static)
        - [**Main()**](#main)
        - [Cannot Access `this`](#cannot-access-this)
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

> **Note:** It is strong recommended, and in fact most functionality depends on, the name of a file matching its class.
>
> For example, the class **MainClass** is in the file `MainClass.cs`.

Inside of the `class` are four possible parts that can exist either all together or as parts: fields, properties, methods, and constructor.

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

#### Method Anatomy

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

##### Method Return Type

Methods can return data. They do so via a *return type* that matching existing data types.

**Example:**

```C#
public string Greeting() {
    return "Hi!";
}
```

In the above example, the method's *return type* is **String**. That is the type of data returned.

##### Method Name

The name of a method, like with a variable, is how it is referenced by other objects or within its class. The name of a method follows the same rules as variables: it can contain letters, numbers, and the underscore. It **cannot** contain spaces.

**Example:**

```C#
public string Greeting() {
    return "Hi!";
}
```

In the above example, the name of the method is **Greetings**.

> **Note:** It is strongly recommended to start the name of a method with a capital letter. This is a common naming pattern found even within the C# documentation.

##### Method Parameters

Like its roots in mathematics, methods can accept data. What type and the name of the data accepts are called its *parameters*.

The parameters of a method are included in the opening and closing parentheses after its name.

**Example:**

```C#
public string Greeting(string name) {
    return name;
}
```

As with all data in C#, method parameters are a form of *variables* and thus must have a data type and name. However, unlike class fields and other variable usages, they can only be used inside of the method itself.

##### Method Bodies

The *body* of its method is the code found inside of the opening (`{`) and closing (`}`) curly brackets of a method. Its body is "what it does."

As methods can do anything from calculate new values to work with existing, private fields, each method in a class is different.

**Example:**

```C#
public string Greeting() {
    return "Hi!";
}
```

In the above example, the *body* of the method is a single line, `return "Hi!"`. Other, more complex methods could potentially have dozens to hundreds of lines.

##### Method Return Statement

In programming terminology, a single line of code is often called a *statement*. The phrase "return statement" borrows from this usage and means the use of the keyword `return` and whatever the methods "returns" to some external code.

The *return statement* of a method is directly connected to the *return type* of the method. They have to match! A method **must** return data of the same type of its return statement and return type.

**Example:**

```C#
public string Greeting() {
    return "Hi!";
}
```

In the above example, the return statement is the line `return "Hi!";`. The *type* of data is a **String**, which also matches the return type before the name!

#### Calling Methods

When a method is used, it is *called*. This temporarily passes control to the method in order to run some code and then it returns control back. Calling a method takes the form of its name and then open (`(`) and close (`)`) parentheses.

```C#
Greeting();
```

##### Arguments

Data can be passed into a method through giving it *arguments*. Any values separated by commas when it is called become *arguments* to the method. These are mapped to its *parameters*.

**Example:**

```C#
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

```C#
public int Add(int x, int y) {
    return x + y;
}

int answer = Add(2, 2);
```

In the above example, the return type of the method **Add()** is **Integer**. When the arguments of `2` and `2` are passed to the method, the variables *x* and *y* have these values. The return statement of the method would then *return* the combined values. The right-hand value would then become `4` and the variable *answer* would contain the same value.

#### Constructor

In object-oriented programming, a *constructor* is a specially-named method in a class. It is called when an object is created based on the class.

A constructor shares the same name as the class. It is called whenever an object is created. This allows a class to accept, as arguments, values into this method and thus the class itself.

```C#
class Person {
  
  Person() {
  }

}
```

#### Variable Scope

All variables have *scope*. This dictates where within code a variable can be accessed.

Within a class, a field, property, or method that is *private* can only be accessed within that class. Anything that is *public* can be accessed via the object's name.

Anything created outside of a class within the same file have a *higher* scope than the class. These variables can be accessed inside of the class.

The same rules apply to a method. Any parameters used in a method are *local* to the method. They cannot be accessed outside of that method.

### `this`

There needs to be a way for classes to refer to its own fields, properties, and methods. Many programming languages use the keyword `this`. C# does the same.

In classes, the keyword `this` refers to the class. Its fields, properties, and methods can be accessed through what is called the "dot notation." A period, `.`, is used between the keyword `this` and any of its fields, properties, and methods names.

```C#
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

```C#
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

---

## Object-Oriented Programming

C# is *object-oriented*. This means that all interactions between code happens between *objects*. This also means that classes -- as the "blueprints" of an object -- are written to include fields, properties, and methods in order to calculate values and potentially communicate between objects.

Object-oriented *programming* is a paradigm -- way of thinking -- that breaks up coding problems into their objects and how those objects relate to each other. The possible relationships exist in three possible options.

To help understand these relationships, the metaphor of parents, children, and toys are used:

- A child, being based on a parent, exists in a "is a" relationship to the parent.
- A child whose has a toy is in a "has a" relationship to the toy.
- Because the child has a toy, and the parent does not, there is no relationship between the parent and the toy.

### Inheritance

Classes that exists in a "is a" relationship to another are often called *child classes* to the *parent class*. In fact, this metaphor is also extended into an important concept for object-oriented programming: *inheritance*.

A class is said to *inherit* from another class in C# when a colon and then the name of another class follows its own when being defined.

```C#
class Person {
}

class Fred : Person {
}
```

In the above code, for example, the parent class is *Person* and the child is **Fred**.

#### Inheriting Fields, Properties, and Methods

If a class *inherits* from another class, it gains all of its fields, properties, and methods. In fact, this design is how objects should be treated when programming in C#! A more generic object of, for example, **Person** is created with fields, properties, and methods, and then a more specific version of the **Person** class is created (**Fred**) that builds on that original blueprint.

```C#
class Person {
  public string Name;
  public float Height;
}

class Fred : Person {

  Fred() {
    this.Name = "Fred";
    this.Height = 5.4f;
  }

}
```

#### Using `static`

The keyword `static` creates a field, property, or method that is "static" to a single class. It **cannot** be inherited.

Any method with the keyword `static` can also be called from outside of a class *without* creating an object.

```C#
class Example {
  
  static public int Add(int x, int y) {
    return x + y;
  }

}

Example.Add(2, 2);
```

##### **Main()**

In C#, the special combination of `public`, `static` and `void Main()` signals that this is the *starting* method of the entire project. This will be *called first* before any other method.

```C#
class Example {

  public static void Main () {
  }

}
```

> **Note:** The data type `void` is special. It cannot be used with variables, but signals that a method *does not return a value*.

##### Cannot Access `this`

Any method with the keyword `static` within a class cannot access the keyword `this`.

### Polymorphism

In object-oriented programming, one object can be converted into another if they both share the same parent class. This is known as *polymorphism*.

```C#
public class Person {
  public string Name;
}

public class Alice : Person {
  public Alice() {
    this.Name = "Alice";
  }
}

public class Bob: Person {
  public Bob() {
    this.Name = "Bob";
  }
}

public class MainClass {

  public static void Main () {

    Person a = new Alice();
    Person b = new Bob();

    Console.WriteLine("Hi!");

  }

}
```

In the above example, the variables *a* and *b* inside of the method **Main()** have the data type of **Person**. However, when created, the variable *a* is the object of the type **Alice** and *b* is an object of the type **Bob**.

The variables are *polymorphed* during run-time from their parent **Person** into **Alice** and **Bob** individually.
