# Chapter 6: Windows, Views, and Tools

- [Chapter 6: Windows, Views, and Tools](#chapter-6-windows-views-and-tools)
  - [Windows](#windows)
    - [Hierarchy](#hierarchy)
      - [Visibility and Picking](#visibility-and-picking)
      - [Searching](#searching)
    - [Inspector](#inspector)
      - [Transform Component](#transform-component)
      - [Adding Components](#adding-components)
        - [Adding Scripting Components](#adding-scripting-components)
      - [Inspecting Assets](#inspecting-assets)
    - [Project](#project)
  - [Views](#views)
    - [Game](#game)
    - [Scene](#scene)
  - [Tools](#tools)
    - [Transform](#transform)
    - [Gizmo Settings](#gizmo-settings)
      - [Position](#position)
      - [Rotation](#rotation)
    - [Play, Pause, and Step](#play-pause-and-step)
      - [Modes](#modes)
    - [Collaborate](#collaborate)
    - [Cloud](#cloud)
    - [Account](#account)
    - [Layers](#layers)
    - [Layout](#layout)

---

The user interface of the Unity Editor is divided up into three central metaphors: windows, views, and tools.

## Windows

### Hierarchy

![alt text](./Hierarchy.png "Hierarchy")

The Hierarchy window lists every GameObject in the Scene.

The name "hierarchy" also comes from the representation of relationships between GameObjects in the Scene. If one GameObject is the parent or container of one or more GameObjects, their names will be under their parent's name in the listing.

Through dragging-and-dropping one or more GameObjects, they can be placed under a parent or removed from that parent through moving them out from "under" their name.

#### Visibility and Picking

![alt text](./VisibilityandPicking.png "Visibility and Picking")

As the number of GameObjects can potentially be quite large, the Hierarchy window also includes visibility settings for every GameObject. Through clicking on the eye icon to the left of one or more GameObjects, it will be hidden in the Scene view.

Next to the Scene Visibility icon is also the Picking icon. Through clicking on a GameObject's picking icon, it becomes selected in the Scene View. This allows for quickly selecting certain GameObjects without also potentially excluding others.

#### Searching

![alt text](./Searching.png "Searching")

To help with finding a GameObject by its name, the Hierarchy window includes a search bar. As the name of a GameObject is typed, the results are shown under the name of the current Scene.

### Inspector

![alt text](./Inspector.png "Inspector")

When a GameObject or Asset is selected in the Hierarchy window, its components will appear in the Inspector window.

Depending on the type of object, it may have multiple built-in components whose values can be adjusted directly.

#### Transform Component

![alt text](./TransformComponent.png "Transform Component")

All GameObjects have a Transform Component for adjusting their Position, Rotation, and Scale.

#### Adding Components

![alt text](./AddComponent.png "Transform Component")

Clicking on the "Add Component" button open a menu for selecting new components to add.

##### Adding Scripting Components

![alt text](./AddingScriptComponent.png "Adding Scripting Component")

Selecting "New script" from the "Add Component" menu prompts for the new of a new behavior script.

Clicking "Create and Add" (assuming a script does not already exist with the same name) will create the script in the Project window and attach it as a scripting component to the current GameObject.

Double-clicking the file will open it in Visual Studio.

TODO

#### Inspecting Assets

allows you to view and edit all the properties of the currently selected GameObject. Because different types of GameObjects have different sets of properties, the layout and contents of the Inspector window change each time you select a different GameObject.

### Project

displays your library of Assets that are available to use in your Project. When you import Assets into your Project, they appear here.

## Views

### Game

view simulates what your final rendered game will look like through your Scene Cameras
. When you click the Play button, the simulation begins.

### Scene

 The Scene view allows you to visually navigate and edit your Scene. The Scene view can show a 3D or 2D perspective, depending on the type of Project you are working on.

---

## Tools

### Transform

### Gizmo Settings

![alt text](./GizmoSettings.png "Gizmo Settings")

> **Note:** In Unity terminology, a *gizmo* is a graphical overlay associated with a GameObject when selected in the Scene view.

#### Position

The Pivot/Center button adjusts the position of the Gizmo.

When Pivot is selected, the Gizmo is positioned at the pivot point of the GameObject as defined by the Transform component.

If Center is selected, the Gizmo position is set to the center position of the GameObject.

#### Rotation

The Local/Global button adjusts rotation of the Gizmo in relation to the GameObject.

- When Local is selected, the Gizmo's rotation is relative to the GameObject.

- When Global is selected, the Gizmo is oriented to the world space.

### Play, Pause, and Step

![alt text](./PlayPauseStep.png "Play, Pause, and Step")

The Play, Pause, and Step buttons control if the scene is running and its current status.

- Clicking on the Play button will start to play the scene and will continue until clicked again or an error occurs that prevents the scene from continuing.

- The Pause button stops the scene from playing. It can be resumed through clicking on the Pause button a second time or clicking on the Play button.

- If debugging is being used, the Step button will move to the next debugging point, if available. If there are no debugging points in the current scene, the Step button will not be available.

#### Modes

The Unity Editor has two modes: runtime and editor mode. While in runtime mode, Unity is displaying any game objects in the current scene and running any code. The properties and settings of game objects can be changed while in runtime and they will be updated in real-time. However, any changes made during the runtime mode will not be retained when it ends.

### Collaborate

Launch Unity Collaborate from the Collab drop-down menu.

### Cloud

Click the Cloud button to open the Unity Services window.

### Account

Access your Unity Account from the Account drop-down menu.

### Layers

You can control which objects appear in Scene view from the Layers drop-down menu.

### Layout

ou can change the arrangement of your views and then save the new layout or load an existing from the Layout drop-down menu.
