# Chapter 5: Editor Basics

- [Chapter 5: Editor Basics](#chapter-5-editor-basics)
  - [Views](#views)
    - [Hierarchy View](#hierarchy-view)
    - [Inspector View](#inspector-view)
  - [Scripting Files](#scripting-files)
  - [Modes](#modes)
    - [Editor](#editor)
    - [Runtime](#runtime)

## Views

### Hierarchy View

The central view is the Hierarchy View. It contains game objects, the smallest unit in Unity. When working with images on the screen or even different user interface elements, these are all game objects. In Unity, the primary way to add new game objects is through the Hierarchy View.

### Inspector View

When working with a single game object, the Inspector View shows details about it. Depending on the object and its own components, different details such as its position, appearance, and how it interacts with events can be changed directly. The Inspector View is also how new components are added to a game object.

## Scripting Files

Unity uses the C# programming language for scripting purposes. Files are added through being attached as a new component to a game object. This allows the script to access details about the game object it is associated with and react or manipulate it as a result.

---

## Modes

The Unity Editor has two modes: runtime and editor mode. While in runtime mode, Unity is displaying any game objects in the current scene and running any code. The properties and settings of game objects can be changed while in runtime and they will be updated in real-time. However, any changes made during the runtime mode will not be retained when it ends.

The editor mode is the main mode for editing game objects in Unity. Any changes made during this mode are retained into the next runtime mode.

### Editor

### Runtime
