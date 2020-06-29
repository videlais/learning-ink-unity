# Chapter 3: C\#: Object-Oriented Programming

- [Chapter 3: C\#: Object-Oriented Programming](#chapter-3-c-object-oriented-programming)
  - [Inheritance](#inheritance)
    - [Inheriting Fields, Properties, and Methods](#inheriting-fields-properties-and-methods)
    - [Using `static`](#using-static)
      - [**Main()**](#main)
      - [Cannot Access `this`](#cannot-access-this)
  - [Polymorphism](#polymorphism)
    - [Run-Time Polymorphism](#run-time-polymorphism)
    - [Accessing `base`](#accessing-base)
    - [Overriding Base Methods](#overriding-base-methods)
      - [Virtual Methods](#virtual-methods)
      - [Abstract Methods](#abstract-methods)

---

C\# is *object-oriented*. This means that all interactions between code happens between *objects*. This also means that classes, as the "blueprints" of an object, are written to include fields, properties, and methods in order to calculate values and potentially communicate between objects.

Object-oriented *programming* is a paradigm (way of thinking) that breaks up coding problems into their objects and how those objects relate to each other. The possible relationships exist in three options covering the options of "is a", "has a", and none.

To help understand these relationships, the metaphor of parents, children, and toys are used:

- A child, being based on a parent, exists in a "is a" relationship to the parent.
- A child, whose has a toy, is in a "has a" relationship to the toy.
- Because the child has a toy, and the parent does not, there is no relationship between the parent and the toy.

## Inheritance

Classes that exists in a "is a" relationship to another are often called *child classes* to the *parent class*. In fact, this metaphor is also extended into an important concept for object-oriented programming: *inheritance*.

A class is said to *inherit* from another class in C\# when a colon and then the name of another class follows its own when being defined.

```CSharp
class Person {
}

class Fred : Person {
}
```

In the above code, for example, the parent class is *Person* and the child is **Fred**.

### Inheriting Fields, Properties, and Methods

If a class *inherits* from another class, it gains all of its fields, properties, and methods. In fact, this design is how objects should be treated when programming in C\#! A more generic object of, for example, **Person** is created with fields, properties, and methods, and then a more specific version of the **Person** class is created (**Fred**) that builds on that original blueprint.

```CSharp
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

### Using `static`

The keyword `static` creates a field, property, or method that is "static" to a single class. It **cannot** be inherited.

Any method with the keyword `static` can also be called from outside of a class *without* creating an object.

```CSharp
class Example {
  
  static public int Add(int x, int y) {
    return x + y;
  }

}

Example.Add(2, 2);
```

#### **Main()**

In C\#, the special combination of `public`, `static` and `void Main()` signals that this is the *starting* method of the entire project. This will be *called first* before any other method.

```CSharp
class Example {

  public static void Main () {
  }

}
```

> **Note:** The data type `void` is special. It cannot be used with variables, but signals that a method *does not return a value*.

#### Cannot Access `this`

Any method with the keyword `static` within a class cannot access the keyword `this`.

## Polymorphism

In object-oriented programming, one object can be converted into another if they both share the same parent class. This is known as *polymorphism*.

### Run-Time Polymorphism

```CSharp
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

### Accessing `base`

A child class can access its parents fields, properties, and methods through the keyword `base`. This references its *base* class.

```CSharp
public class Person {
  
  public string Name;

  public string Greeting() {
    return "Hi!";
  }

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

  public string BobGreeting() {
    return base.Greeting();
  }

}
```

### Overriding Base Methods

A child class can also *override* any fields, properties, and methods if a parent's methods use `virtual` or `abstract` and the child uses `override` on a method named the same.

#### Virtual Methods

Any method marked as `virtual` can be overridden in a child class. This *allows* future child classes the ability to override them as needed instead of using the keyword `base` to call it directly.

```CSharp
public class Person {
  
  public string Name;

  public virtual string Greeting() {
    return "Hi!";
  }

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

  public override string Greeting() {
    return "Hello!";
  }

}
```

#### Abstract Methods

Any method marked as `abstract` can be overridden in a child class. However, this *forces* future child classes to override it and does (and should) not provide its own method body.

Abstract methods **must** be used in classes that are also *abstract*.

```CSharp
public abstract class Person {
  
  public string Name;

  public abstract string Greeting();

}

public class Bob: Person {
  
  public Bob() {
    this.Name = "Bob";
  }

  public override string Greeting() {
    return "Hello!";
  }

}
```
