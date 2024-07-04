# Chapter 17: Ink + Unity: Calling Ink Functions

- [Chapter 17: Ink + Unity: Calling Ink Functions](#chapter-17-ink--unity-calling-ink-functions)
  - [**EvaluateFunction()**](#evaluatefunction)
    - [Function Call](#function-call)
    - [Function Call and Arguments](#function-call-and-arguments)
    - [Function Call, Text Output, and Arguments](#function-call-text-output-and-arguments)
  - [Buttons to Functions](#buttons-to-functions)
    - [Calling A Function As A Result of Clicking](#calling-a-function-as-a-result-of-clicking)
    - [Calling A Function and Saving Its Results As A Result of Clicking](#calling-a-function-and-saving-its-results-as-a-result-of-clicking)

---

## **EvaluateFunction()**

In Ink, functions are globally accessible. This means that, once defined, they can be accessed from anywhere inside of an Ink story. To help in accessing these functions *outside* of a story, the Ink Story API provides the method **EvaluateFunction()**. This allows for *evaluating* Ink functions and receiving their output in C\#.

Internally, there are two versions of **EvaluateFunction()**. The initial argument of both methods is the same: the name of the Ink function to call. Where they differentiate is on their second and third arguments. In practice, there are three general forms of using **EvaluateFunction()**.

### Function Call

In the first general form of using **EvaluateFunction()**, only the first argument is used. As this is the name of an Ink function, it should be a **string** value.

**New Ink.ink:**

```Ink
What is it?

== function ExampleFunction() ==
~ return "It's it!"
```

**NewBehaviourScript.cs:**

```csharp
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
// Add the Ink Runtime namespace
using Ink.Runtime;
// Add UnityEngine.UI
using UnityEngine.UI;

public class NewBehaviourScript : MonoBehaviour
{
    // Add a TextAsset for the compiled (JSON) file
    public TextAsset InkJSONFile;

    // Load the Story using the compiled file
    Story localStory;

    // Start is called before the first frame update
    void Start()
    {
        // Load the Story using the compiled file
        localStory = new Story(InkJSONFile.text);

        // Call the "ExampleFunction" function in Ink
        //
        // This will print "It's it!" using Debug.Log()
        Debug.Log(localStory.EvaluateFunction("ExampleFunction"));

    }

    // Update is called once per frame
    void Update()
    {
    }
}
```

In the above example, the Ink function **ExampleFunction()** is called and its return value is used as part of the **Debug.Log()** method.

### Function Call and Arguments

In the second form, both the name of the function (a **string** value) and arguments to that function are passed from C\# to Ink. Passing arguments is done through using additional parameters to the **ExampleFunction()** method.

**New Ink.ink:**

```Ink
Story content.

== function ExampleFunction(a, b) ==
~ return a + b
```

**NewBehaviourScript.cs:**

```csharp
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
// Add the Ink Runtime namespace
using Ink.Runtime;
// Add UnityEngine.UI
using UnityEngine.UI;

public class NewBehaviourScript : MonoBehaviour
{
    // Add a TextAsset for the compiled (JSON) file
    public TextAsset InkJSONFile;

    // Load the Story using the compiled file
    Story localStory;

    // Start is called before the first frame update
    void Start()
    {
        // Load the Story using the compiled file
        localStory = new Story(InkJSONFile.text);

        // Call the "ExampleFunction" function in Ink
        //
        // Pass it 1 (first argument) and 2 (second argument)
        //
        // Print the result of adding the numbers: 3
        Debug.Log(localStory.EvaluateFunction("ExampleFunction", 1, 2));

    }

    // Update is called once per frame
    void Update()
    {
    }
}
```

### Function Call, Text Output, and Arguments

In the third form, the Ink function, its text output, and optional arguments are used. In this case, the special keyword `out` needs to be used with the **string** parameter value, specifying that it should be retained inside the method call and returned.

**New Ink.ink:**

```Ink
Story content.

== function ExampleFunction() ==
This is text output.
```

**NewBehaviourScript.cs:**

```csharp
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
// Add the Ink Runtime namespace
using Ink.Runtime;
// Add UnityEngine.UI
using UnityEngine.UI;

public class NewBehaviourScript : MonoBehaviour
{
    // Add a TextAsset for the compiled (JSON) file
    public TextAsset InkJSONFile;

    // Load the Story using the compiled file
    Story localStory;

    // Start is called before the first frame update
    void Start()
    {
        // Load the Story using the compiled file
        localStory = new Story(InkJSONFile.text);

        // Create string to save future function output
        string functionOutput = "";

        // Call the "ExampleFunction" function in Ink
        //
        // Pass a out string value to record its output
        localStory.EvaluateFunction("ExampleFunction", out functionOutput);

        // Print the text output
        Debug.Log(functionOutput);

    }

    // Update is called once per frame
    void Update()
    {
    }
}
```

## Buttons to Functions

When working with **Button** GameObjects, the *onClick* event can be used as part of working with the Ink Story API. Often, it can be useful to call an Ink function as a result of clicking a **Button**.

### Calling A Function As A Result of Clicking

An new project was created. To this, the Ink Unity Integration plugin was added.

Following a pattern created earlier in this book, a **Button** was added to an empty project. This created a **Canvas** GameObject as a result. A scripting component was then added to **Canvas**, `NewBehaviourScript.cs`.

**New Ink.ink:**

```Ink
Story content.

== function ExampleFunction() ==
~ return "This is text output."
```

**NewBehaviourScript.cs:**

```csharp
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
// Add the Ink Runtime namespace
using Ink.Runtime;
// Add UnityEngine.UI
using UnityEngine.UI;

public class NewBehaviourScript : MonoBehaviour
{
    // Add a TextAsset for the compiled (JSON) file
    public TextAsset InkJSONFile;

    // Load the Story using the compiled file
    Story localStory;

    // Start is called before the first frame update
    void Start()
    {
        // Load the Story using the compiled file
        localStory = new Story(InkJSONFile.text);

        // Find a Button in the children of the Canvas
        Button localButton = GetComponentInChildren<Button>();

        // Listen for the onClick event
        localButton.onClick.AddListener(delegate
        {
            // Call the "ExampleFunction" function in Ink
            Debug.Log(localStory.EvaluateFunction("ExampleFunction"));
        });
    }

    // Update is called once per frame
    void Update()
    {
    }
}
```

In the above example, the code listens for the *onClick* event of the added **Button**. When it is clicked, it uses the Ink Story API method **EvaluateFunction()**. This, in turn, calls the Ink function **ExampleFunction()**. When this function returns internally, it passes this value back from Ink to C\# and is printed to the Console window.

### Calling A Function and Saving Its Results As A Result of Clicking

An new project was created. To this, the Ink Unity Integration plugin was added.

Following a pattern created earlier in this book, a **Button** was added to an empty project. This created a **Canvas** GameObject as a result. A scripting component was then added to **Canvas**, `NewBehaviourScript.cs`.

A **Text** GameObject was also added.

**New Ink.ink:**

```Ink
Story content.

== function ExampleFunction() ==
This is text output.
```

To help with better organizing the project, public properties were added for the compiled JSON, **Button**, and **Text** GameObjects. (This was used in place of trying to find them via the **GetComponentsInChildren\<GameObject\>()** method in previous examples.)

**NewBehaviourScript.cs:**

```csharp
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
// Add the Ink Runtime namespace
using Ink.Runtime;
// Add UnityEngine.UI
using UnityEngine.UI;

public class NewBehaviourScript : MonoBehaviour
{
    // Add a TextAsset for the compiled (JSON) file
    public TextAsset InkJSONFile;

    // Add Button reference
    public Button ButtonExample;

    // Add Text reference
    public Text TextExample;

    // Start is called before the first frame update
    void Start()
    {
        // Load the Story using the compiled file
        Story localStory = new Story(InkJSONFile.text);

        // Listen for the onClick event
        ButtonExample.onClick.AddListener(delegate
        {
            // Create an empty string value
            string textOutput = "";

            // Call the "ExampleFunction" function in Ink
            //
            // Return the text output and set its value to textOutput
            localStory.EvaluateFunction("ExampleFunction", out textOutput);

            // Set whatever was returned to the text property
            TextExample.text = textOutput;
        });
    }
}
```

In the above code, when the **Button** is clicked, its text output is saved via the variable  *textOutput*. This is then used as part of the *text* property.

In an extended example, such a pattern could be used to load different parts of a story or run Ink functions that performed calculations and return or use their text output.
