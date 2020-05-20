# Chapter 2: C#: Classes and Objects

- [Chapter 2: C#: Classes and Objects](#chapter-2-c-classes-and-objects)
  - [Class Anatomy](#class-anatomy)
    - [Fields](#fields)
    - [Properties](#properties)
      - [`get`](#get)
      - [`set`](#set)
    - [Methods](#methods)
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

1) What they return
2) What their name is
3) What values they accept
4) What they do
5) What they return

A method borrows its meaning from mathematics where a *function* is something which accepts input, performs a task, and has output.

```C#
public string Greeting() {
    return "Hi!";
}
```

> **Note:** Methods, like the differences between fields and properties, can also use the keyword `private` and `public`. In either case, this defines if it can be used outside of the class or not.

---

## Object-Oriented Programming

### Inheritances

### Parent and Child Classes

### Polymorphism
