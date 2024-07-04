# Chapter 5: Terms and Concepts

- [Chapter 5: Terms and Concepts](#chapter-5-terms-and-concepts)
  - [Common Terms](#common-terms)
    - [Project](#project)
    - [Scene](#scene)
    - [Asset](#asset)
    - [GameObject](#gameobject)
    - [Component](#component)
  - [Concepts](#concepts)
    - [Entity-Component Model](#entity-component-model)
    - [Game Loops](#game-loops)
    - [Composition Over Inheritance](#composition-over-inheritance)

---

## Common Terms

### Project

Everything in Unity starts with *projects*. These are configurations, files, and builds based on their name as created in Unity or through the Unity Hub. They contain scenes, assets, game objects, and components needed to create, run, and build the project.

It is often helpful to think of each project as its own *game*, but the name "project" is a general description for any collection of settings and files used to create something in Unity.

When creating a project in Unity or the Unity Hub, there are also two general types are available: 2D and 3D. The difference between the two concern what general camera options are available; however, one type of project can easily become another.

A single Unity project will often have multiple scenes.

### Scene

Unity organizes projects into units called *scenes*. In order to use Unity, a scene must be *open*, and running anything means running a scene.

It is often helpful to think of a scene as a level, environment, or other section of a larger game. Because they contain other useful functionality such as cameras and game objects, Unity starts with scenes and then then breaks organization down into other concepts.

A single scene will often have many assets.

### Asset

An *asset* is any file or data that is added to a project. These can be images, text files, or more complicated things such as character models or multiple scenes.

Unity has an *Asset Store* where signed-in users can download and use *assets* created by others for different purposes. These include everything from plugins for working with different languages and tools to 3D models or even templates for creating games.

Assets are used with working with GameObjects.

### GameObject

Anything that appears in or is used as part of a scene is a *GameObject*. This includes cameras, 3D models, text, and many other things. In Unity, GameObjects are the fundamental entities of any project. Adding or changing *anything* to a scene means working with a GameObject in some form or another.

While the foundation of scenes, GameObjects are actually containers for Components.

### Component

Every GameObject has its own set of *Components*. Each is used to change or augment functionality associated with that GameObject. Each, in turn, has *properties* that describe its relationship to the project and often other GameObjects in the scene.

**Every** GameObject has a built-in component called *Transform* that represents its position, rotation, and scale. Every GameObject, then, has a position in the project, even if not visible to the player or as part of the current view.

---

## Concepts

### Entity-Component Model

Unity is based on the *Entity-Component Model*. Generally, the Entity-Component Model is broken up into three terms that can also be used to help understand Unity.

- **Entity**: The smallest unit in a project. In Unity, every GameObject is an *entity*. This means that it has a unique identification. For example, every character added to a scene would have a different name.

- **Component**: these are properties, relationships, or other data that describes the entity. In Unity, because every GameObject has a Transform component among others depending on its type, values are adjusted in a component to influence its relationships to the project and other GameObjects in the scene.

- **System**: one or more processes that work on entities. For example, in Unity, there are rendering and physics systems. These each work separately, but understand a scene through its GameObjects and the components each has that define itself and its relationships.

### Game Loops

Unity is based on different *systems*. As a project runs, each one performs different tasks, and they all have the possibility of influencing each other.

Consider, for example, a 2D platformer game where a player presses a button and a character moves on the screen. Such an interaction, while seemingly simple, works through these different systems. These could include a physics system that performed calculations that kept the character from passing through the floor of a level. It would also include an event system that accepted keyboard presses and translated those into character movement.

In game design terms, this is known as a *game loop*. While a game "runs," it is actually performing a loop (in programming terms) of the same systems as a series of steps each time. One runs, the next runs, and then then loop resets and they all run again.

Unity uses the term "order of execution" to describe these steps. In general terms, the following steps are run for **every** GameObject in the scene.

1) **Initialization**: Values are created and if the GameObject has a **Start()** method, it is run.

1) **Physics**: Any internal physics calculations are run and the properties of the Transform component of any affected GameObjects are updated.

1) **Input Events**: Input values are collected from devices such as keyboard, mice, or controllers.

1) **Game Logic**: If the GameObject should react to input or other existing values, it does.

1) **Renderering**: If a GameObject's Transform component is changed and have a visual element, it is updated.

1) **Decommissioning**: As a GameObject is removed (destroyed), it can perform final actions.

As a scene is running, the Physics, Input Events, Game Logic, and Rendering systems run in sequence each loop. In fact, they run every *frame*.

In animation terms, a *frame* is a single image that is part of a sequence that creates the illusion of motion. Depending on the frames per second (FPS), Unity will perform calculations to match the visual frequency of the images shown.

As a scene is running, Unity creates the visual elements of the game through using a *camera* (a select area of a larger possible game space). The camera's view is what a player would see as the game runs. Images (frames) are created based on what the camera is viewing and if any GameObjects are within the selected area of the camera. If they are, the player can "see" them; if not, the player cannot.

A game loop runs different systems (Physics, Input Events, Game Logic, and Rendering) on the GameObjects that are active in the scene to calculate their interactions and relationships, updating each frame to create motion on screen.

### Composition Over Inheritance

Unity understands the programming language C\#. However, while it uses this object-oriented programming language (OOP), Unity strongly prefers *composition* over using inheritance. In the object-oriented programming model, objects can *inherit* from each other through creating a more generic version and then inheriting its properties and methods to create a more specific object.

Unity uses scenes to organize GameObjects. Each, in turn, has its own components. Any of these could be *scripted components* that are C\# code that are used to adjust the behavior of that GameObject. In fact, these are what Unity calls *Behavior Scripts*.

Any GameObject can have a behavior script. Any created inherit from an object called **MonoBehavior** that provides a set of basic methods that allow a script to interact with the GameObject.

**Example Behavior Script:**

```csharp
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class NewBehaviourScript : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
    }

    // Update is called once per frame
    void Update()
    {
    }
}

```

When using these scripts (C\# code), Unity strongly prefers that developers *compose* projects that start from scene, move to GameObjects, and then use scripted components on those objects. Instead of creating new objects that are used to create more specific ones, Unity strongly prefers the Entity-Component Model where GameObjects are the entities and any scripting (C\# programming) is scripted components on those entities.

In other words, instead of starting with code building up, Unity starts with GameObjects within a scene. If a GameObject needs some extra scripting, it is added as a *scripted component*. Otherwise, no new code is added and components, such as the built-in Transform component, are used to adjust properties and relationships.
