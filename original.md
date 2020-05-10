# Chapter 14: Working with Unity

- [Chapter 14: Working with Unity](#chapter-14-working-with-unity)
  - [Unity Basics](#unity-basics)
    - [Scenes](#scenes)
    - [Hierarchy View](#hierarchy-view)
    - [Inspector View](#inspector-view)
    - [Scripting Files](#scripting-files)
  - [Unity Editor Modes](#unity-editor-modes)
  - [Importing and Testing](#importing-and-testing)
    - [Getting the Ink Unity Plugin](#getting-the-ink-unity-plugin)
    - [Adding Ink Files](#adding-ink-files)
    - [Writing Ink Code](#writing-ink-code)
    - [Testing](#testing)
    - [Associating Files](#associating-files)
    - [Debugging *Continue()*](#debugging-continue)
    - [Checking the Console](#checking-the-console)
  - [Working with the Ink API](#working-with-the-ink-api)
    - [Working with *canContinue*](#working-with-cancontinue)
    - [Working with Choices](#working-with-choices)
    - [Choosing Choices](#choosing-choices)
    - [Reviewing Ink API](#reviewing-ink-api)
    - [Building an Interface](#building-an-interface)
    - [Building a UI](#building-a-ui)
      - [Creating a Canvas](#creating-a-canvas)
      - [Adding a Vertical Layout Group](#adding-a-vertical-layout-group)
      - [Planning UI](#planning-ui)
      - [Working with a Prefab](#working-with-a-prefab)
    - [Tags and Rich Text](#tags-and-rich-text)
      - [Parsing Tags](#parsing-tags)
      - [Rich Text](#rich-text)
      - [Marking Options](#marking-options)
    - [Keep-on Continuing](#keep-on-continuing)
      - [Styled User Interface](#styled-user-interface)
    - [Ink Variables and Functions](#ink-variables-and-functions)
      - [Global Variables](#global-variables)
      - [Calling Functions](#calling-functions)

**Summary:** In this chapter, you will learn about Unity, how to import and use the Ink Unity Integration plugin, and how to work with the Story API to create a simple button-based example project.

---

## Unity Basics

The creators of Ink, Inkle Studio, have created an Ink Unity Integration plugin for working with Ink in the game engine Unity, providing ways to test compiled Ink files, make new Ink files, and work with the Story API in Unity game object scripts to load blocks of a story and its choices.

Unity is a popular cross-platform game engine for making 2D and 3D games. It supports virtual and augmented reality projects and has been used by major game development projects to make everything from small, indie projects to major AAA titles. Using the game engine is free, but accessing the asset store, where additional resources and plugins can be found, requires registering an account with Unity before being able to access materials.

*What are the basics of Unity Editor?*

### Scenes

The Unity Editor organizes itself around different views. These expose different aspects of the development process and help users to see which parts or objects they are interacting with at any one time.

### Hierarchy View

The central view is the Hierarchy View. It contains game objects, the smallest unit in Unity. When working with images on the screen or even different user interface elements, these are all game objects. In Unity, the primary way to add new game objects is through the Hierarchy View.

### Inspector View

When working with a single game object, the Inspector View shows details about it. Depending on the object and its own components, different details such as its position, appearance, and how it interacts with events can be changed directly. The Inspector View is also how new components are added to a game object.

### Scripting Files

Unity uses the C# programming language for scripting purposes. Files are added through being attached as a new component to a game object. This allows the script to access details about the game object it is associated with and react or manipulate it as a result.

---

## Unity Editor Modes

The Unity Editor has two modes: runtime and editor mode. While in runtime mode, Unity is displaying any game objects in the current scene and running any code. The properties and settings of game objects can be changed while in runtime and they will be updated in real-time. However, any changes made during the runtime mode will not be retained when it ends.

The editor mode is the main mode for editing game objects in Unity. Any changes made during this mode are retained into the next runtime mode.

---

## Importing and Testing

The first step to using Ink in Unity is to have Unity installed. Download the Unity Hub (or a specific version). Inside either the Unity Hub or via some other means, create a new project.

This example will be using a project called "Ink Testing".

### Getting the Ink Unity Plugin

In the new project, go to Window -> Asset Store to open a new tab to the Asset Store.

> **Note:** Only signed-in users can use assets from the store. Before going forward, double-check there is a user signed-in to the Unity Store.

In the search bar, search for "Ink Unity" until the Ink logo is visible on an asset called "Ink Unity Integration" created by Inkle.

Click on this asset. Click on the "Download" button and then click on the now named "Import" button.

In the importing window, click on the "All" button and then the "Import" button.

Click on the game object "Main Camera" in the Hierarchy View.

In the Inspector View, click on "Add Component" and then scroll down to "New Script".

Click on "New Script". Name this file "Ink Example" and then click on the "Create and Add" button.

### Adding Ink Files

Select the "Assets" folder in the Project View. Through either right-clicking or the "Create" button, select "Folder".

Name this new folder "Ink".

With the new folder named "Ink" selected, right-click or click on the "Create" button in the Project View.

With the Ink Plugin added to the Project, Ink files can be created directly from Unity itself. Choose "Ink" from the menu.

Name this new Ink file "InkTesting". As soon as it is named, the Ink Unity plugin will compile it. Going forward, any time this file is updated while Unity is open, it will be re-compiled.

### Writing Ink Code

Clicking on a Ink file from the Project View will show it in the Inspector View. Each file as an associated JSON Asset (the compiled file) and the ability to be played in Unity.

The Ink Unity Integration plugin DOES NOT come with an editor or the ability to edit Ink files directly in Unity itself. For writing Ink, the Inky Editor is recommended.

Clicking on the "Open" button from the Inspector View will prompt for the system-wide default editing program to associate the file with when opening. It is again highly recommended to use the Inky Editor when first learning Ink, but any text editor can work.

Once open, add the following example Ink code:

```ink
* Choice 1
    Nothing here!
    -> DONE
* Choice 2
    Nothing here either!
    -> DONE
```

Save the file. (Back in Unity, it will have been re-compiled.)

### Testing

In Unity, double-click on the “InkExample” script file from the Project View.

Because this code will be using the Ink Runtime, the library will need to be included.

```C#
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Ink.Runtime; //Add this line after the others!
```

Two new variables will needed to be added within the object as well.

```C#
public TextAsset inkJSONAsset;
private Story story;
```

The first inkJSONAsset will serve as the input to this file and will be associated with the JSON Asset of the Ink file.

The second, **story**, will be the private Story object used across different internal functions.

Finally, within the *Start()* function, add the following:

```C#
 story = new Story(inkJSONAsset.text);
```

The JSON asset file’s text will be loaded as the input to a new Story object as its reference will be the internal variable story.
Save the file.

### Associating Files

Clicking on the game object Main Camera in the Hierarchy View shows a new change in the Inspector View. In the Script Component area, there is a new field "Ink JSON Asset" with nothing associated with it.

With this file selected in the Project View, drag and drop the compiled JSON file from the Project View to this field.

Once accomplished, the compiled JSON file will be associated with that field and, in turn, the public variable inkJSONAsset within the script file.

### Debugging *Continue()*

Through either double-clicking (if closed) or moving to the window with the file open, return to the "InkExample.cs" file.

Add a new line after the loading in the Start() function:

```C#
 // Start is called before the first frame update
    void Start()
    {
        story = new Story(inkJSONAsset.text);
        Debug.Log(story.Continue());
    }
```

Save the file.

In Unity, click on the "Play" button.

### Checking the Console

The use of *Debug.log()* wrote to the Unity console.

If this window is not already open, go to Window -> General -> Console to open it. (Dragging the window to another can dock it there as a tab.)

The latest message of the Console window should be the following:

```log
"This is an example Ink file."
```

The use of the *Continue()* function loaded and returned the next text chunk of the story. Using the *Debug.Log()* function displayed it for testing purposes.

If this message was displayed, everything worked correctly and the Ink Unity Integration plugin is working!

**Full Code:**

```C#
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Ink.Runtime;
public class InkExample : MonoBehaviour
{
    private Story story;
    public TextAsset inkJSONAsset;
    // Start is called before the first frame update
    void Start()
    {
        story = new Story(inkJSONAsset.text);
        Debug.Log(story.Continue());
    }
    // Update is called once per frame
    void Update()
    {
    }
}
```

---

## Working with the Ink API

In the previous part, the Ink function *Continue()* was used to load and return the next text chunk. It is one of many functions that are exposed as part of using a Story object.

### Working with *canContinue*

The previous example, the Ink code was not very complicated. It had some initial text and two choices as part of that block.

This is an example Ink file.

```ink
* Choice 1
    Nothing here!
    -> DONE
* Choice 2
    Nothing here either!
    -> DONE
```

Using the *Debug.log()* function, the first chunk was loaded. However, calling it again would produce an error.

```C#
 // Start is called before the first frame update
    void Start()
    {
        story = new Story(inkJSONAsset.text);
        Debug.Log(story.Continue() );
        Debug.Log(story.Continue());
    }
```

The error shown mentions *canContinue*. This is a property of the Story object whose purpose is, like its name implies, to expose a value if there is more story to continue or not.

The *canContinue* property has a Boolean value if there is more story or not. This is needed before calling *Continue()* (as it mentions) to make sure the error does not happen again.

As this process of checking canContinue and then calling *Continue()* is a common action, it should also be made into its own function.

```C#
 // Load and potentially return the next story block
    string getNextStoryBlock()
    {
        string text = "";
        if(story.canContinue)
        {
            text = story.Continue();
        }
        return text;
    }
```

### Working with Choices

Working with *canContinue* exposes if there is more story or not. The function *Continue()* loads and returns the next text block. Neither of these deal with choices, a central aspect of Ink. For that, the property currentChoices is needed.

For each call of *Continue()*, the *currentChoices* property is populated with a List of Choice objects. However, and as its description mentions, once *canContinue* becomes false, it will often be populated with the last List it loaded.

Moving through the List of Choice objects can be accomplished using *foreach()* in C#.

```C#
// Start is called before the first frame update
    void Start()
    {
        story = new Story(inkJSONAsset.text);
        Debug.Log( getNextStoryBlock() );
        foreach (Choice choice in story.currentChoices)
        {
            Debug.Log("The index is " + choice.index + " and its text is '" + choice.text + "'");
        }
    }
```

Each Choice object has two important properties: *index* and *text*. The order of choices matters. Their index is used to mark which of the choices was chosen. It text property is the option to show to the user.

### Choosing Choices

To make a choice, its index is needed. This is used with another function,*ChooseChoiceIndex()*, that accepts an index that less than the length of currentChoices.

```C#
// Start is called before the first frame update
    void Start()
    {
        story = new Story(inkJSONAsset.text);
        Debug.Log( getNextStoryBlock() );
        foreach (Choice choice in story.currentChoices)
        {
            Debug.Log("The index is " + choice.index + " and its text is '" + choice.text + "'");
        }
        story.ChooseChoiceIndex(0);
        Debug.Log(getNextStoryBlock());
    }
```

Based on the example Ink story, the calls to *Debug.log()* would show the initial text, the index and text of each Choice, and then the text of the choice.

### Reviewing Ink API

**Property:**

- *canContinue*:  Is true if the story can continue to run or false otherwise.
- *currentChoices*: A `List<Choice>` of the current choices. (Each entry's text property contains their text and index.)

**Method:**

- *Continue()*: Returns the next text block and loads the next choices, if any.
- *ChooseChoiceIndex()*: Supplying a valid index matching the length of the `List<Choice>` of *currentChoices* will consider that entry "clicked."

### Building an Interface

In the first part, the Ink Unity Integration plugin was added to a Unity project. In the second, the Ink API was used to load, parse, and work through a story’s text and choices.

The Ink example used throughout this series was the following:

This is an example Ink file.

```ink
* Choice 1
    Nothing here!
    -> DONE
* Choice 2
    Nothing here either!
    -> DONE
```

### Building a UI

In the previous two parts, a Script was used as a component on the game object Main Camera. This was used as a way to demonstrate how the different Ink API worked together. However, this is not an efficient use of the types of game objects in Unity.

Click on the Main Camera game object. In the Inspector View, look for the Ink Example (Script) and click on the right-most icon, the gizmo. From the drop-down listing, click on “Remove Component”. This will disassociate the file from the Main Camera.

#### Creating a Canvas

Working with UI in Unity works best with a Canvas, a game object used to hold other game objects and other UI elements.

In the Hierarchy View, click on the Create or right-click and then UI -> Canvas.

Select the new Canvas game object. Click on Add Component from the Inspector View.

Select "Scripts" and then the Ink Example file. This will associate the file with the Canvas object.

#### Adding a Vertical Layout Group

With the Canvas game object selected, click on Add Component again.

This time, choose Layout -> Vertical Layout Group. This will serve, as new elements are added, to create a row-like structure.

In the Inspector View, click on Padding in the new Vertical Layout Group component. Set Left, Right, Top, and Bottom to 30. Click on Width for both Child Controls Size and Child Force Expand.

The padding around the canvas will serve to leave a small border around all of the content from it and the edges of the canvas itself.

The second option will force the contents to expand and allow the elements themselves to control its own width.

#### Planning UI

This new interface needs to replicate a fairly standard appearance of having text over some elements the user can interact with below it.

To have the text appear above choices, the UI element Text can be used. However, to make things easier, this will be added to a new game object that contains it.

```C#
 // Create a new GameObject
        GameObject newGameObject = new GameObject("TextChunk");
        // Set its transform to the Canvas (this)
        newGameObject.transform.SetParent(this.transform, false);
```

Once created, the new game object will need to be associated with the same transform space of its parent (the canvas). The function transform.*SetParent()* does this, matching the transform passed to it.

```C#
// Add a new Text component to the new GameObject
        Text newTextObject = newGameObject.AddComponent<Text>();
        // Set the fontSize larger
        newTextObject.fontSize = 24;
        // Set the text from new story block
        newTextObject.text = getNextStoryBlock();
        // Load Arial from the built-in resources
        newTextObject.font = Resources.GetBuiltinResource(typeof(Font), "Arial.ttf") as Font;
```

Next, a new Text object can be added through the `AddComponent<Type>()` function. A new Text component can be added to the new game object and the reference saved.

To help with visibility, its fontSize and font are set. The text property is set using the previously-defined *getNextStoryBlock()* function from the previous part.

For each choice, following a model from the previous part, the *foreach()* function can parse them all. However, instead of using **Text**, **Button** objects can be used instead.

```C#
 foreach (Choice choice in story.currentChoices)
        {
            Button choiceButton = Instantiate(buttonPrefab) as Button;
            choiceButton.transform.SetParent(this.transform, false);
            // Gets the text from the button prefab
            Text choiceText = choiceButton.GetComponentInChildren<Text>();
            choiceText.text = choice.text;
            // Set listener
            choiceButton.onClick.AddListener(delegate {
                OnClickChoiceButton(choice);
            });
        }
```

For the listener, an onClick event is used. The delegate keyword is used to pass a method as a parameter to the *AddListenerer()* function. Whenever a button is clicked, the function *onClickChoiceButton()* function is used.

```C#
// When we click the choice button, tell the story to choose that choice!
    void OnClickChoiceButton(Choice choice)
    {
        story.ChooseChoiceIndex(choice.index);
        refresh();
    }
```

Separating out the *ChooseChoiceIndex()* function to its own now, the *OnClickChoiceButton()* function now takes a choice and tells the story a certain choice has been made.

This also calls *refresh()*, the new function that will serve as the central hub for all of the UI elements. However, once final things is needed: *clearUI()*.

Each time the *refresh()* function is called, it should update all of the UI elements. It cannot know ahead of time how much text or how many choices might be per story chunk. Therefore, all of the game objects should be cleared and then re-created per click action.

```C#
// Clear out all of the UI, calling Destory() in reverse
    void clearUI()
    {
        int childCount = this.transform.childCount;
        for (int i = childCount - 1; i >= 0; --i)
        {
            GameObject.Destroy(this.transform.GetChild(i).gameObject);
        }
    }
```

#### Working with a Prefab

In the existing code, the *Instantiate()* function is used to clone an existing object from in the Unity project. What is cloned is a Prefab **Button**.

To create this Prefab, create a Button.

In the Project View, create a folder. Name it "Prefabs".

Drag and drop the game object from the Hierarchy View to the Project View and in the "Prefabs" folder.

Right-click on the new Button and choose Delete. (Make sure it is in the Prefabs folder before deleting!)

In the InkExample.cs file, add the following about the existing functions:

```C#
  public Button buttonPrefab;
```

Select the Canvas object from the Hierarchy View.

Drag and drop the compiled InkTesting file (if not already associated). Drag and drop the prefab Button to the Button Prefab field, connecting that object as well.

```C#
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;
public class InkExample : MonoBehaviour
{
    public TextAsset inkJSONAsset;
    private Story story;
    public Button buttonPrefab;
    // Start is called before the first frame update
    void Start()
    {
        // Load the next story block
        story = new Story(inkJSONAsset.text);
        // Start the refresh cycle
        refresh();
    }
    // Refresh the UI elements
    //  - Clear any current elements
    //  - Show any text chunks
    //  - Iterate through any choices and create listeners on them
    void refresh()
    {
        // Clear the UI
        clearUI();
        // Create a new GameObject
        GameObject newGameObject = new GameObject("TextChunk");
        // Set its transform to the Canvas (this)
        newGameObject.transform.SetParent(this.transform, false);
        // Add a new Text component to the new GameObject
        Text newTextObject = newGameObject.AddComponent<Text>();
        // Set the fontSize larger
        newTextObject.fontSize = 24;
        // Set the text from new story block
        newTextObject.text = getNextStoryBlock();
        // Load Arial from the built-in resources
        newTextObject.font = Resources.GetBuiltinResource(typeof(Font), "Arial.ttf") as Font;
        foreach (Choice choice in story.currentChoices)
        {
            Button choiceButton = Instantiate(buttonPrefab) as Button;
            choiceButton.transform.SetParent(this.transform, false);
            // Gets the text from the button prefab
            Text choiceText = choiceButton.GetComponentInChildren<Text>();
            choiceText.text = choice.text;
            // Set listener
            choiceButton.onClick.AddListener(delegate {
                OnClickChoiceButton(choice);
            });
        }
    }
    // When we click the choice button, tell the story to choose that choice!
    void OnClickChoiceButton(Choice choice)
    {
        story.ChooseChoiceIndex(choice.index);
        refresh();
    }
    // Clear out all of the UI, calling Destory() in reverse
    void clearUI()
    {
        int childCount = this.transform.childCount;
        for (int i = childCount - 1; i >= 0; --i)
        {
            GameObject.Destroy(this.transform.GetChild(i).gameObject);
        }
    }
    // Load and potentially return the next story block
    string getNextStoryBlock()
    {
        string text = "";
        if (story.canContinue)
        {
            text = story.Continue();
        }
        return text;
    }
    // Update is called once per frame
    void Update()
    {

    }
}
```

### Tags and Rich Text

Working across these sections, the Ink Unity Integration plugin was used imported, tested, and then used to build a simple button-based interface. However, there is one more tool Ink has that can be used in Unity: tags.

In Ink, tags are extra code that are ignored. They start with the hash character, `#`, and run to the end of the line or until another tag is found.

Tags are also attached to the text in front of them. For a single line, its tag would go at the end. For multiple lines, the tags would go at the end of all of text.

```ink
"What? Have you never seen a dialogue system before?" #Dan
```

One way to use tags in Ink when working with Unity, then, is as "speech tags." These can mark who is saying which words during dialogue.

#### Parsing Tags

One of the properties not previously discussed so far is currentTags. This is also part of the StoryAPI and, like *currentChoices*, is populated by a call to the *Continue()* function.

The *currentTags* property holds a `List<string>`. If there are no tags, it will be empty. Therefore, its own property Count can be tested. If its “count” is greater than zero, use the first tag. Otherwise, ignore it.

```C#
// Get the current tags (if any)
List<string> tags = story.currentTags;
// If there are tags, use the first one.
// Otherwise, just show the text.
if (tags.Count > 0)
{
   newTextObject.text = tags[0] + " - " + text;
}
else
{
   newTextObject.text = text;
}
```

Now, if there is a speech tag, it will precede any text and show who is speaking in the interface.

#### Rich Text

The Ink documentation mentions using tags for things like color or other styling information for text. This could be done, but Unity provides an easier way: rich text.

By default, **Text** objects have rich text enabled. This means that text can be styled in Ink and passed through to Unity. (In fact, Inky supports a smaller subset of styles as well!)

```ink
"What? Have you <i>never</i> seen a dialogue system before?" #Dan
```

To add emphasis on some text, the `<i></i>` markup can be used. Added to the text, it will be passed through to Unity and show up as emphasized.

Instead of using tags for colors, the rich text code can be added to Ink directly — or even used directly in Unity itself. For example, to style the color of any speech tags (names), it could be added around them.

```C#
 // Load the next block and save text (if any)
 string text = getNextStoryBlock();
 // Get the current tags (if any)
 List<string> tags = story.currentTags;
 // If there are tags, use the first one.
 // Otherwise, just show the text.
 if (tags.Count > 0)
 {
    newTextObject.text = "<color=grey>" + tags[0] + "</color> - " + text;
 }
 else
 {
    newTextObject.text = text;
 }
```

#### Marking Options

As a small user interface change, each option (what is shown to the user) can be marked with a number matching its choice index. However, as choosing a zero option might be off-putting for some users, this could be increased by one.

```C#
foreach (Choice choice in story.currentChoices)
{
   Button choiceButton = Instantiate(buttonPrefab) as Button;
    choiceButton.transform.SetParent(this.transform, false);
   // Gets the text from the button prefab
   Text choiceText = choiceButton.GetComponentInChildren<Text>();
   choiceText.text = " " + (choice.index + 1) + ". " + choice.text;
   // Set listener
   choiceButton.onClick.AddListener(delegate {
      OnClickChoiceButton(choice);
   });

}
```

### Keep-on Continuing

Along with improving the interface, another change (and function) needs to be made. So far, the function *Continue()* has been used. This is good if the goal is load content line by line. However, with multi-line content, and those potentially using more rich text markup, this is not as useful.

The function *ContinueMaximally()* will load content until it finds the next set of choices. In this code, it can be used to load blocks of text until it reaches another choice or the end of the story.

```C#
// Load and potentially return the next story block
string getNextStoryBlock()
{
   string text = "";
   if (story.canContinue)
   {
      text = story.ContinueMaximally();
   }
   return text;
}
```

#### Styled User Interface

Updating the Ink code, it can now include the following as a much more complex example which also includes usage of rich text markup.

```ink
"What? Have you <i>never</i> seen a dialogue system before?" #Dan
* ["No. Of course I have!"]
    "That's good. As this is the beginnings of one.
    "It even has <b>multiple</b> lines of dialogue.
    "That's neat, right?" #Dan
    -> DONE
```

**Code:**

```C#
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;
public class InkExample : MonoBehaviour
{
    public TextAsset inkJSONAsset;
    private Story story;
    public Button buttonPrefab;
    // Start is called before the first frame update
    void Start()
    {
        // Load the next story block
        story = new Story(inkJSONAsset.text);
        // Start the refresh cycle
        refresh();
    }
    // Refresh the UI elements
    //  - Clear any current elements
    //  - Show any text chunks
    //  - Iterate through any choices and create listeners on them
    void refresh()
    {
        // Clear the UI
        clearUI();
        // Create a new GameObject
        GameObject newGameObject = new GameObject("TextChunk");
        // Set its transform to the Canvas (this)
        newGameObject.transform.SetParent(this.transform, false);
        // Add a new Text component to the new GameObject
        Text newTextObject = newGameObject.AddComponent<Text>();
        // Set the fontSize larger
        newTextObject.fontSize = 24;
        // Load the next block and save text (if any)
        string text = getNextStoryBlock();
        // Get the current tags (if any)
        List<string> tags = story.currentTags;
        // If there are tags, use the first one.
        // Otherwise, just show the text.
        if (tags.Count > 0)
        {
            newTextObject.text = "<color=grey>" + tags[0] + "</color> - " + text;
        }
        else
        {
            newTextObject.text = text;
        }
        // Load Arial from the built-in resources
        newTextObject.font = Resources.GetBuiltinResource(typeof(Font), "Arial.ttf") as Font;
        foreach (Choice choice in story.currentChoices)
        {
            Button choiceButton = Instantiate(buttonPrefab) as Button;
            choiceButton.transform.SetParent(this.transform, false);
            // Gets the text from the button prefab
            Text choiceText = choiceButton.GetComponentInChildren<Text>();
            choiceText.text = " " + (choice.index + 1) + ". " + choice.text;
            // Set listener
            choiceButton.onClick.AddListener(delegate {
                OnClickChoiceButton(choice);
            });
        }
    }
    // When we click the choice button, tell the story to choose that choice!
    void OnClickChoiceButton(Choice choice)
    {
        story.ChooseChoiceIndex(choice.index);
        refresh();
    }
    // Clear out all of the UI, calling Destory() in reverse
    void clearUI()
    {
        int childCount = this.transform.childCount;
        for (int i = childCount - 1; i >= 0; --i)
        {
            GameObject.Destroy(this.transform.GetChild(i).gameObject);
        }
    }
    // Load and potentially return the next story block
    string getNextStoryBlock()
    {
        string text = "";
        if (story.canContinue)
        {
            text = story.ContinueMaximally();
        }
        return text;
    }
    // Update is called once per frame
    void Update()
    {
    }
}
```

### Ink Variables and Functions

To close out this chapter, two more aspects of working with Ink in Unity need to be examined: variables and functions.

#### Global Variables

In Ink, all variables created using the `VAR` keyword are global. These values can be accessed and changed anywhere in a project. What this also means is that external programs can also change them as well.

As part of the Story API, the property *variablesState* is an accessor to any global variables available in the story.

An updated version of the previous Ink code now containing a global variable looks like the following:

```ink
VAR name = "Freya"
"What? Have you <i>never</i> seen a dialogue system before, {name}?" #Dan
* ["No. Of course I have!"]
    "That's good. As this is the beginnings of one.
    "It even has <b>multiple</b> lines of dialogue.
    "That's neat, right?" #Dan
    -> DONE
```

As any variables defined at the beginning of a story exist outside of its content, they can be changed before even loading anything.

```C#
// Add a new Text component to the new GameObject
Text newTextObject = newGameObject.AddComponent<Text>();
// Set the fontSize larger
newTextObject.fontSize = 24;
// Access the global variable and change its value
story.variablesState["name"] = "Alva";
// Load the next block and save text (if any)
string text = getNextStoryBlock();
// Get the current tags (if any)
List<string> tags = story.currentTags;
```

Now, instead of using the value set in Ink, the Unity C# code is overwriting it during run-time.

#### Calling Functions

While working with variables directly is one approach to working with the values within an Ink story, there is also another, calling functions.

Like with the variables, it is also possible to call functions in Ink from Unity. The function to do this is *EvaluateFunction()*. It accepts the name of the function to call and any parameters to pass to the function as comma-separated values.

Returning to the Ink code, it could be updated to the following where, now, a function changes the internal value, leaving the work up to Ink on how to handle things internally.

```INK
VAR name = "Freya"

"What? Have you <i>never</i> seen a dialogue system before, {name}?" #Dan
* ["No. Of course I have!"]
    "That's good. As this is the beginnings of one.
    "It even has <b>multiple</b> lines of dialogue.
    "That's neat, right?" #Dan
    -> DONE
=== function changeName(newName) ===
~ name = newName
```

In the Unity code, the change can happen on the same line as the previous *variablesState* usage.

```C#
 // Add a new Text component to the new GameObject
 Text newTextObject = newGameObject.AddComponent<Text>();
 // Set the fontSize larger
newTextObject.fontSize = 24;
// Access the global variable and change its value
story.EvaluateFunction("changeName", "Alva");
// Load the next block and save text (if any)
string text = getNextStoryBlock();
```

The result is the same.

*Why would I need to change a variable or call an Ink function in Unity?*

When working with Unity, additional UI elements can be added. Some of these, like InputField, can be used to accept data from a user. In a game context, collecting a name from a user and then changing the value in Ink to match is an easy and common example. Another use case might be to update values after loading a save file or some settings.

**Code:**

```C#
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;
public class InkExample : MonoBehaviour
{
    public TextAsset inkJSONAsset;
    private Story story;
    public Button buttonPrefab;
    // Start is called before the first frame update
    void Start()
    {
        // Load the next story block
        story = new Story(inkJSONAsset.text);
        // Start the refresh cycle
        refresh();
    }
    // Refresh the UI elements
    //  - Clear any current elements
    //  - Show any text chunks
    //  - Iterate through any choices and create listeners on them
    void refresh()
    {
        // Clear the UI
        clearUI();

        // Create a new GameObject
        GameObject newGameObject = new GameObject("TextChunk");
        // Set its transform to the Canvas (this)
        newGameObject.transform.SetParent(this.transform, false);
        // Add a new Text component to the new GameObject
        Text newTextObject = newGameObject.AddComponent<Text>();
        // Set the fontSize larger
        newTextObject.fontSize = 24;
        // Access the global variable and change its value
        story.EvaluateFunction("changeName", "Alva");
        // Load the next block and save text (if any)
        string text = getNextStoryBlock();
        // Get the current tags (if any)
        List<string> tags = story.currentTags;
        // If there are tags, use the first one.
        // Otherwise, just show the text.
        if (tags.Count > 0)
        {
            newTextObject.text = "<color=grey>" + tags[0] + "</color> - " + text;
        }
        else
        {
            newTextObject.text = text;
        }
        // Load Arial from the built-in resources
        newTextObject.font = Resources.GetBuiltinResource(typeof(Font), "Arial.ttf") as Font;
        foreach (Choice choice in story.currentChoices)
        {
            Button choiceButton = Instantiate(buttonPrefab) as Button;
            choiceButton.transform.SetParent(this.transform, false);
            // Gets the text from the button prefab
            Text choiceText = choiceButton.GetComponentInChildren<Text>();
            choiceText.text = " " + (choice.index + 1) + ". " + choice.text;
            // Set listener
            choiceButton.onClick.AddListener(delegate {
                OnClickChoiceButton(choice);
            });
        }
    }
    // When we click the choice button, tell the story to choose that choice!
    void OnClickChoiceButton(Choice choice)
    {
        story.ChooseChoiceIndex(choice.index);
        refresh();
    }

    // Clear out all of the UI, calling Destory() in reverse
    void clearUI()
    {
        int childCount = this.transform.childCount;
        for (int i = childCount - 1; i >= 0; --i)
        {
            GameObject.Destroy(this.transform.GetChild(i).gameObject);
        }
    }
    // Load and potentially return the next story block
    string getNextStoryBlock()
    {
        string text = "";
        if (story.canContinue)
        {
            text = story.ContinueMaximally();
        }
        return text;
    }
    // Update is called once per frame
    void Update()
    {
    }
}
```
