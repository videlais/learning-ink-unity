# Chapter 4: Unity Basics

- [Chapter 4: Unity Basics](#chapter-4-unity-basics)
  - [Common Terms](#common-terms)
    - [Projects](#projects)
    - [Scenes](#scenes)
    - [Asset](#asset)
    - [GameObject](#gameobject)
    - [Component](#component)
  - [Concepts](#concepts)
    - [Entity-Component Model](#entity-component-model)
    - [Game Loop](#game-loop)
  - [Views](#views)
    - [Hierarchy View](#hierarchy-view)
    - [Inspector View](#inspector-view)
  - [Scripting Files](#scripting-files)
  - [Modes](#modes)
    - [Editor](#editor)
    - [Runtime](#runtime)
  - [Unity Concepts](#unity-concepts)

## Common Terms

### Projects

Everything in Unity starts with *projects*. These are configurations, files, and builds based on their name as created in Unity or through the Unity Hub. They contain scenes, assets, game objects, and components needed to create, run, and build the project.

It is often helpful to think of each project as its own *game*, but the name "project" is a general description for any collection of settings and files used to create something in Unity.

When creating a project in Unity or the Unity Hub, there are also two general types are available: 2D and 3D. The difference between the two concern what general camera options are available; however, one type of project can easily become another.

A single Unity project will often have multiple scenes.

### Scenes

Unity organizes projects into units called *scenes*. In order to use Unity, a scene must be *open*, and running anything means running a scene.

It is often helpful to think of a scene as a level, environment, or other section of a larger game. Because they contain other useful functionality such as cameras and game objects, Unity starts with scenes and then then breaks organization down into other concepts.

A single scene will often have many assets.

### Asset

An *asset* is any file or data that is added to a project. These can be images, text files, or more complicated things such as character models or even  other projects.

Unity has an *Asset Store* where signed-in users can download and use *assets* created by others for different purposes. These include everything from plugins for working with different languages and tools to 3D models or even templates for creating games.

Assets are used with working with GameObjects.

### GameObject

Anything that appears in or is used as part of a scene is a *GameObject*. This includes cameras, 3D models, text, and many other things. In Unity, GameObjects are the fundamental entities of any project. Adding or changing *anything* to a scene means working with a GameObject in some form or another.

While the foundation of scenes, GameObjects are actually containers for Components.

### Component

Every GameObject has its own set of *Components*. Each is used to change or augment functionality associated with that GameObject. Each, in turn, has *properties* that describe its relationship to the project and often other GameObjects in the scene.

**Every** GameObject has a built-in component called *Transform* that represents its position, rotation, and scale. Every GameObject, then, has a position in the project, even if not visible to the player or as part of the current view.

## Concepts

### Entity-Component Model

Unity is based on the *Entity-Component Model*. Generally, the Entity-Component Model is broken up into three terms that can also be used to help understand Unity.

- **Entity**: The smallest unit in a project. In Unity, every GameObject is an *entity*. This means that it has a unique identification. For example, every character added to a scene would have a different name.

- **Component**: these are properties, relationships, or other data that describes the entity. In Unity, because every GameObject has a Transform component among others depending on its type, values are adjusted in a component to influence its relationships to the project and other GameObjects in the scene.

- **System**: one or more processes that work on entities. For example, in Unity, there are rendering and physics systems. These each work separately, but understand a scene through its GameObject and the components each has that define itself and its relationships.

### Game Loop

TODO

## Views

### Hierarchy View

The central view is the Hierarchy View. It contains game objects, the smallest unit in Unity. When working with images on the screen or even different user interface elements, these are all game objects. In Unity, the primary way to add new game objects is through the Hierarchy View.

### Inspector View

When working with a single game object, the Inspector View shows details about it. Depending on the object and its own components, different details such as its position, appearance, and how it interacts with events can be changed directly. The Inspector View is also how new components are added to a game object.

## Scripting Files

Unity uses the C# programming language for scripting purposes. Files are added through being attached as a new component to a game object. This allows the script to access details about the game object it is associated with and react or manipulate it as a result.

## Modes

The Unity Editor has two modes: runtime and editor mode. While in runtime mode, Unity is displaying any game objects in the current scene and running any code. The properties and settings of game objects can be changed while in runtime and they will be updated in real-time. However, any changes made during the runtime mode will not be retained when it ends.

The editor mode is the main mode for editing game objects in Unity. Any changes made during this mode are retained into the next runtime mode.

### Editor

### Runtime

## Unity Concepts
