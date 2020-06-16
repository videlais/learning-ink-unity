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
    - [Scene](#scene)
      - [Draw Mode](#draw-mode)
      - [2D / 3D](#2d--3d)
      - [Scene Lighting](#scene-lighting)
      - [Scene Audio](#scene-audio)
      - [Effects](#effects)
      - [Hidden Objects](#hidden-objects)
      - [Grid Visibility](#grid-visibility)
    - [Game](#game)
      - [Displays](#displays)
      - [Resolution Aspect](#resolution-aspect)
      - [Scale](#scale)
      - [Maximize on Play](#maximize-on-play)
      - [Mute Audio](#mute-audio)
      - [Stats](#stats)
      - [Gizmo Options](#gizmo-options)
  - [Tools](#tools)
    - [Transform](#transform)
    - [Gizmo Settings](#gizmo-settings)
      - [Position](#position)
      - [Rotation](#rotation)
    - [Play, Pause, and Step](#play-pause-and-step)
      - [Runtime Editing](#runtime-editing)
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

#### Inspecting Assets

![alt text](./AssetInspector.png "Asset Inspector")

If an Asset is selected from the Project window, its properties and contents will be shown in the Inspector window. Depending on the type, different settings, properties, and options will be available.

### Project

![alt text](./ProjectWindow.png "Project Window")

The Project windows shows all assets that are part of the current project. This also include any imported assets or files added to the asset folder outside of using the Unity Editor to create them.

The contents of the Project Window can be sorted through creating new folders using either the "+" menu under its title or using the right-click context menu. By default, the Project window includes a folder "Scenes" containing the current scene. (This is "SampleScene" by default).

It is recommended to create folders for all types of Assets using in the Project sorted by either scene or by type of data. In a project with multiple scenes, for example, sorting assets by scene can help in organizing them. For smaller project, or those with only one scene, sorting by type is a good approach. Creating a folder called "Scripts" for all files related to scripting components and other for "Tiles", if they are used in the Project, for example.

## Views

In the default layout, there are two views in the center of the Unity Editor window: Scene and Game.

### Scene

![alt text](./Scene.png "Scene View")

As GameObjects are added to the scene, they appear in both the Hierarchy window and Scene view. Through selecting GameObjects in the Scene view, they can be manipulated through their gizmos or using the toolbar.

#### Draw Mode

![alt text](./DrawMode.png "Draw Mode")

Under the Scene title is the Draw Mode. By default "Shaded" is selected. However, other shading and baked lighting options can be chosen if the GameObjects in the scene support them.

#### 2D / 3D

![alt text](./2D.png "2D")

If a project is created in 2D, the 2D option and button will be selected.

![alt text](./3D.png "3D")

If the project is using 3D, the 2D option will be disabled and an additional 3D gizmo is added to the scene for changing the viewing orientation and perspective.

#### Scene Lighting

![alt text](./SceneLighting.png "Scene Lighting")

Depending on toggle, the scene will use the scene lighting or a light attached to the Scene camera view.

#### Scene Audio

![alt text](./SceneAudio.png "Scene Audio")

Depending on the toggle, audio will play in the scene or not.

#### Effects

![alt text](./SceneEffects.png "Scene Effects")

Different scene effects such as the Skybox, Fog, and Particle Systems can be toggled on and off.

#### Hidden Objects

![alt text](./SceneVisibility.png "Hidden Objects")

If any GameObjects have been hidden in the Hierarchy window, the current count is shown. The entire scene can also be hidden.

#### Grid Visibility

![alt text](./GridVisibility.png "Grid Visibility")

Depending on the orientation, the visibility of the axis (X, Y, or Z) can be adjusted along with its opacity.

### Game

![alt text](./GameView.png "GameView")

When a Scene is running, the Game View shows a simulation of what the rendered game would look like using the Scene camera.

If the Play button is clicked, the Unity Editor will automatically shift from the Scene View to the Game View.

#### Displays

![alt text](./GameDisplays.png "Game Displays")

Depending on the cameras and their settings used in the scene, Unity supports up to eight different displays.

#### Resolution Aspect

![alt text](./ResolutionAspect.png "Resolution Aspect")

The current resolution and aspect ration can be adjusted when simulating the rendering of the scene.

#### Scale

![alt text](./Scale.png "Scale")

The current scaling of the game View can be adjusted.

#### Maximize on Play

![alt text](./MaximizeonPlay.png "Maximize on Play")

If Maximize on Play is selected, the Game View will fill all available horizontal and vertical space in the Unity Editor while the scene is running.

#### Mute Audio

![alt text](./MuteAudio.png "Mute Audio")

Scene audio can be muted.

#### Stats

![alt text](./Stats.png "Stats")

Clicking on the "Stats" button shows the current graphical and computational statistics of the scene.

#### Gizmo Options

![alt text](./GizmoOptions.png "Gizmo Options")

The Gizmos menu allows for enabling or disabling the gizmos for types of GameObjects.

---

## Tools

### Transform

![alt text](./TransformTools.png "Transform Tools")

When a GameObject is selected, it can be manipulated through the Transform tools. This allows for moving, positioning, rotating, selecting multiple GameObjects (Rect Tool), and then adjusting those GameObjects.

If any custom tools have been added, they can also be accessed through the Custom Tool menu button.

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

#### Runtime Editing

When a scene is running, GameObjects can be manipulated and the values of its properties and components changed. However, **these changes are not saved.** Any changes made while a scene is running only affect that scene. They are not saved.

### Collaborate

![alt text](./Collab.png "Collaborate")

Clicking on the "Collab" menu for the first time (assuming the user is signed in) provides the option to "Start now!". Clicking the button synchronizes the current project remotely and allows for accessing the project, when saved remotely, from another computer running Unity.

![alt text](./Sync.png "Sync")

Through synchronizing changes, files can be saved remotely and accessed from either another device or by other users.

(Clicking on the Teams button in the lower, right-hand corner opens the Unity Dashboard in a browser and allows for adjusting organization and group settings for the project.)

### Cloud

![alt text](./Cloud.png "Cloud")

Clicking on the Cloud button opens the currently available Cloud options and their current settings.

### Account

![alt text](./Account.png "Account")

Clicking on the Account button shows the current signed-in user and the option to upgrade account access.

### Layers

![alt text](./Layers.png "Layers")

The "Layers" menu allows access to which objects appear in the Scene view. If a GameObject is associated with the layer and that layer is hidden, those GameObjects will not be shown.

### Layout

![alt text](./Layout.png "Layout")

Clicking on the "Layout" button allows for quickly changing the layout of the windows and views within the Unity Editor.

Once windows and views are arranged, the layout can also be saved as either an option to be used at a later time.
