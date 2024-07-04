# Chapter 16: Ink + Unity: Accessing and Observing Ink Variables

- [Chapter 16: Ink + Unity: Accessing and Observing Ink Variables](#chapter-16-ink--unity-accessing-and-observing-ink-variables)
  - [*variablesState*](#variablesstate)
    - [Accessing](#accessing)
    - [Mutating](#mutating)
  - [Observing Variables](#observing-variables)
    - [**ObserveVariable()**](#observevariable)
    - [**ObserveVariables()**](#observevariables)
    - [Removing Observers](#removing-observers)
  - [Using Variable Observers in Unity UI](#using-variable-observers-in-unity-ui)
    - [Observing Values](#observing-values)
    - [Updating **Text** Values](#updating-text-values)

---

Along with providing methods load story content, the Ink Story API also provides two ways to interact with Ink variables: state and observing variables.

## *variablesState*

The Ink Story API property *variableState* provides proxy access to all global variables in Ink. These are accessed through their names using opening, `[`, and closing, `]`, square brackets after the property.

### Accessing

Internally, the Ink data type **VariablesState** uses a **Dictionary**-like collection where the name of a variable can be used to access its value after the story has been loaded.

> **Reminder:** Ink variables *cannot* be accessed until after the story has been loaded. As part of the Ink Story API, a **Story** object must be created and loaded a compiled JSON file.

**New Ink.ink:**

```ink
VAR example = "Hi!"

This is story content.
```

**NewBehaviourScript.cs:**

```csharp
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
// Add the Ink Runtime namespace
using Ink.Runtime;

public class NewBehaviourScript : MonoBehaviour
{
    // Add a TextAsset for the compiled (JSON) file
    public TextAsset InkJSONFile;

    // Start is called before the first frame update
    void Start()
    {
        // Load the Story using the compiled file
        Story localStory = new Story(InkJSONFile.text);

        // Print "Hi!"
        Debug.Log(localStory.variablesState["example"]);
    }

    // Update is called once per frame
    void Update()
    {
    }
}
```

In the above code, the Ink variable *example* can be accessed through `localStory.variablesState["example"]`.

### Mutating

In programming terminology, the term *mutating* means changing a value of a variable. In the case of using the Ink Story API property *variablesState*, any variable that can be accessed can also be changed.

**New Ink.ink:**

```ink
VAR example = "Hi!"

This is story content.
```

**NewBehaviourScript.cs:**

```csharp
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
// Add the Ink Runtime namespace
using Ink.Runtime;

public class NewBehaviourScript : MonoBehaviour
{
    // Add a TextAsset for the compiled (JSON) file
    public TextAsset InkJSONFile;

    // Start is called before the first frame update
    void Start()
    {
        // Load the Story using the compiled file
        Story localStory = new Story(InkJSONFile.text);

        // Change a value
        localStory.variablesState["example"] = "Howdy!";

        // Print "Howdy!" (This was changed from its previous value.)
        Debug.Log(localStory.variablesState["example"]);
    }

    // Update is called once per frame
    void Update()
    {
    }
}
```

In the above code, the use of the line `localStory.variablesState["example"] = "Howdy!";` would change the value of the Ink value *example*.

Once loaded, any variables can be accessed and changed in this way.

## Observing Variables

While the Ink Story API **variablesState** gives access to Ink variables after a story has been loaded, there is often a need to know when a value changes as a result of other events or actions in a story. One approach could be to poll (check the value on a set schedule), but the Ink Story API provides two methods for detecting changes in Ink variables: **ObserveVariable()** and **ObserveVariables()**.

### **ObserveVariable()**

The Ink Story API method **ObserveVariable()** accepts a **string** value (the value to observe) and a **Story.VariableObserver** delegate function that should be called when the Ink variable changes internally.

> **Note:** The follow example uses [Lambda expressions](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/statements-expressions-operators/lambda-expressions). Because they can convert to delegates, this is an easy way to call the internal **Story.VariableObserver** `delegate` method without creating more complicated code structures.

**New Ink.ink:**

```Ink
VAR example = ""

This is story content.

~ example = "Hi!"
```

**NewBehaviourScript.cs:**

```csharp
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
// Add the Ink Runtime namespace
using Ink.Runtime;

public class NewBehaviourScript : MonoBehaviour
{
    // Add a TextAsset for the compiled (JSON) file
    public TextAsset InkJSONFile;

    // Start is called before the first frame update
    void Start()
    {
        // Load the Story using the compiled file
        Story localStory = new Story(InkJSONFile.text);

        // Observe the variable "example"
        //
        // When it changes, call a lambda expression.
        // Pass it the name of the variable and the new value.
        localStory.ObserveVariable("example", (variableName, newValue) =>
        {
            // Print the new value
            Debug.Log(newValue);
        });

        // Load the next chunk of the story
        localStory.Continue();
    }

    // Update is called once per frame
    void Update()
    {
    }
}
```

In the above code, the story is loaded, a variable observer is created, and then the method **Continue()** is called. After the use of the story loading method **Continue()**, the delegate (lambda expression) is called and the internal method **Debug.Log()** is called.

Because the story is loaded in chunks, the the variable observer is not called until the variable changes from its initial value. Internally, this is an empty string value that then becomes "Hi!" later in the story.

> **Reminder:** Variable observers, like most functionality that is part of the Ink Story API, can only act when methods like **Continue()** are called first. While variable observers can be set after a story has been initially loaded, assuming variables exist at that point, they are affected by story actions, which are only triggered when the next chunk of story is loaded.

### **ObserveVariables()**

The method **ObserveVariables()** works like **ObserveVariable()**, but allows specifying multiple variables to watch. For each variable watched, a **VariableObserver** `delegate` method is called.

The first parameter accepts anything that has a [**IList** interface](https://docs.microsoft.com/en-us/dotnet/api/system.collections.ilist?view=netcore-3.1). This includes **List**, **ArrayList**, and other data types.

The second parameter, like with **ObserveVariable()**, accepts a **Story.VariableObserver** `delegate` method. A lambda expression can be used because it can easily translate into a delegate method.

**New Ink.ink:**

```Ink
VAR a = 1
VAR b = 2
VAR c = 3

This is story content.

~ a = 4
~ b = 5
~ c = 6
```

**NewBehaviourScript.cs:**

```csharp
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
// Add the Ink Runtime namespace
using Ink.Runtime;

public class NewBehaviourScript : MonoBehaviour
{
    // Add a TextAsset for the compiled (JSON) file
    public TextAsset InkJSONFile;

    // Start is called before the first frame update
    void Start()
    {
        // Load the Story using the compiled file
        Story localStory = new Story(InkJSONFile.text);

        // Create a List of strings
        List<string> variablesToWatch = new List<string>();

        // Add variables a, b, and c to watch list
        variablesToWatch.Add("a");
        variablesToWatch.Add("b");
        variablesToWatch.Add("c");

        // Observe variables.
        //
        // When any change, call a lambda expression and pass it the name of the variable and the new value
        localStory.ObserveVariables(variablesToWatch, (variableName, newValue) =>
        {
            // Print the variable
            Debug.Log(variableName);

            // Print the variable
            Debug.Log(newValue);
        });

        // Load the next chunk of the story
        localStory.Continue();
    }

    // Update is called once per frame
    void Update()
    {
    }
}
```

In the above code, the **ObserveVariables()** method is given a **List** and the lambda expression. This will be called *every* time any of the variables change.

> **Reminder:** Variable observers, like most functionality that is part of the Ink Story API, can only act when methods like **Continue()** are called first. While variable observers can be set after a story has been initially loaded, assuming variables exist at that point, they are affected by story actions, which are only triggered when the next chunk of story is loaded.

### Removing Observers

To help with variable observers, the Ink Story API provides both variable observers and the ability to remove those observers. The method **RemoveVariableObserver()** accepts either a **Story.VariableObserver** `delegate` method (or `null`) or the **string** name of an Ink variable to stop watching (or `null`).

```Ink
VAR a = 1

This is story content.

~ a = 2

This is story content.

~ a = 3

This is story content.

~ a = 4
```

**NewBehaviourScript.cs:**

```csharp
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
// Add the Ink Runtime namespace
using Ink.Runtime;

public class NewBehaviourScript : MonoBehaviour
{
    // Add a TextAsset for the compiled (JSON) file
    public TextAsset InkJSONFile;

    // Start is called before the first frame update
    void Start()
    {
        // Load the Story using the compiled file
        Story localStory = new Story(InkJSONFile.text);

        // Observe variable "a"
        //
        // When it changes, call a lambda expression and pass it the name of the variable and the new value
        localStory.ObserveVariable("a", (variableName, newValue) =>
        {
            // Print the variable
            Debug.Log(variableName);

            // Print the variable
            Debug.Log(newValue);
        });

        // Load the next chunk of the story
        Debug.Log(localStory.Continue());

        // Load the next chunk of the story
        Debug.Log(localStory.Continue());

        // Remove any delegate methods watching the variable "a"
        localStory.RemoveVariableObserver(null, "a");

        // Load the next chunk of the story
        Debug.Log(localStory.Continue());
    }

    // Update is called once per frame
    void Update()
    {
    }
}
```

In the above code, the Console window would show the initial change to the Ink variable *a* with the use of the method **Continue()**. Those that follow the use of the method **RemoveVariableObserver()**, which removes any methods associated with that Ink variable, would not register as changed with the observer.

## Using Variable Observers in Unity UI

The Ink Story API method **ObserveVariables()** grants the ability to watch Ink variables and then use their new values. Previously in the chapter, the example of using **Debug.Log()** was shown to print these values in the Console window. However, as values, they can also be used with existing UI GameObjects in Unity.

### Observing Values

Because Unity has access to Ink variables via the Ink Story API method **ObserveVariables()**, values can be used as part of Unity UI GameObjects such as updating the *text* property of a **Button** based on user events.

For example, using Ink code that loops through using diverts, it is possible to create an internal loop structure.

```Ink
VAR a = 1

-> IncreaseValue

=== IncreaseValue ===
+ Increase
  ~ a = a + 1
  -> IncreaseValue
```

Based on this, code can be written to watch the Ink variable *a* and update the *text* property of a **Button**.

```csharp
// Observe variable "a"
//
// When it changes, call a lambda expression and pass it the name of the variable and the new value
localStory.ObserveVariable("a", (variableName, newValue) =>
{
  // Update the text content
  buttonText.text = "Current count: " + (int) newValue;
});
```

However, as the *newValue* passed to the **Story.VariableObserver** `delegate` method is of type **object**, it needs to be cast as something else. In this case, with numerical values, the data types **int** can be used before it is dynamically cast into a **string**.

> **Note:** While it may seem strange to cast a data type into one, **int**, before it is cast into another, **string**, this process and order is important. As the incoming value will be numeric in nature, casting it into an **int** will retain its value *before* been concatenated. Casting it into a **string** directly would not retain the original value.

### Updating **Text** Values

Through adding a **Button** to an empty project in Unity, a new **Canvas** can be generated. Following examples in earlier parts of this book, a new scripting component can be added to the **Canvas**.

Using previous patterns, the Ink Story API methods **Continue()** and **ChooseChoiceIndex()** can be combined to choose the first choice of a set and then load the next chunk of a story. Because a loop is created through using a divert, this will act on the choice and then re-load it again.

Combined with a sticky choice in Ink, it can be chosen repetitively. In Unity, every click of the **Button** would call its `delegate`, choose the first choice, and reload the Ink knot. Because the Ink variable *a* would then be updated, this would trigger a call to the variable observer and thus update the **Button**'s *text* with the current value of *a*.

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

        // Load the initial story chunk
        Refresh();

        // Find the Button in the current GameObject's children
        Button internalButton = GetComponentInChildren<Button>();

        // Find the Text in the Button children
        Text buttonText = internalButton.GetComponentInChildren<Text>();

        // Change the text of the button
        buttonText.text = "Current count: 0";

        // Observe variable "a"
        //
        // When it changes, call a lambda expression and pass it the name of the variable and the new value
        localStory.ObserveVariable("a", (variableName, newValue) =>
        {
            // Update the text content
            buttonText.text = "Current count: " + (int) newValue;
        });

        // Add a listener
        //
        // When clicked, refresh the current content
        internalButton.onClick.AddListener(delegate
        {
            // Choose the first (0) index
            localStory.ChooseChoiceIndex(0);

            // Load the next story chunk
            Refresh();
        });

    }

    void Refresh()
    {
        // Is there more story to load?
        if(localStory.canContinue)
        {
            // Load the next story chunk
            localStory.Continue();
        }
    }

    // Update is called once per frame
    void Update()
    {
    }
}
```
