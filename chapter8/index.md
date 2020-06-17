# Chapter 8: Ink: Introducing Story API

- [Chapter 8: Ink: Introducing Story API](#chapter-8-ink-introducing-story-api)
  - [Loading Story Chunks](#loading-story-chunks)
    - [**Continue()**](#continue)
    - [**ContinueMaximally()**](#continuemaximally)
    - [End of Story](#end-of-story)
    - [*canContinue*](#cancontinue)
  - [Loading Choices](#loading-choices)
  - [Loading Tags](#loading-tags)

---

## Loading Story Chunks

There are two methods for loading the next part of the story: **Continue()** and **ContinueMaximally()**. Using this methods are also affected by End of Story and the *canContinue* property of the Story API.

### **Continue()**

The method **Continue()** will load the next story chunk from the current point until the next newline character in the story. In other words, it will load a "paragraph" until there is a line between what it loaded and the next part of the story.

**New Ink.ink:**

```ink
First chunk.

Second chunk.

Third chunk.
```

```CSharp
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
// Add the Ink Runtime
using Ink.Runtime;

public class NewBehaviourScript : MonoBehaviour
{
    // Add a TextAsset representing the compiled Ink Asset
    public TextAsset InkJSONAsset;

    // Start is called before the first frame update
    void Start()
    {
        Story exampleStory = new Story(InkJSONAsset.text);

        Debug.Log(exampleStory.Continue());

        Debug.Log(exampleStory.Continue());

        Debug.Log(exampleStory.Continue());
    }

    // Update is called once per frame
    void Update()
    {
    }
}
```

![alt text](./ContinueConsole.png "Continue Console")

In the above code example, the repeated uses of the **Continue()** method will load the story. The Console window will show "First chunk.", "Second chunk.", and then "Third chunk.".

### **ContinueMaximally()**

The **ContinueMaximally()** method will load all text content until it encounters a choice or the end of the story.

**New Ink.ink:**

```ink
First chunk.

Second chunk.

Third chunk.
```

```CSharp
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
// Add the Ink Runtime
using Ink.Runtime;

public class NewBehaviourScript : MonoBehaviour
{
    // Add a TextAsset representing the compiled Ink Asset
    public TextAsset InkJSONAsset;

    // Start is called before the first frame update
    void Start()
    {
        Story exampleStory = new Story(InkJSONAsset.text);

        Debug.Log(exampleStory.ContinueMaximally());

        Debug.Log(exampleStory.ContinueMaximally());

    }

    // Update is called once per frame
    void Update()
    {

    }
}
```

![alt text](./ContinueMaximallyConsole.png "ContinueMaximally() Console")

In the above code, the text "First chunk. / Second chunk." will be loaded first. With the second call to **ContinueMaximally()**, the End of the Story will be encountered.

### End of Story

Attempting to load story content after a story has ended will result in an error.

**New Ink.ink:**

```ink
First chunk.
```

```CSharp
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
// Add the Ink Runtime
using Ink.Runtime;

public class NewBehaviourScript : MonoBehaviour
{
    // Add a TextAsset representing the compiled Ink Asset
    public TextAsset InkJSONAsset;

    // Start is called before the first frame update
    void Start()
    {
        Story exampleStory = new Story(InkJSONAsset.text);

        Debug.Log(exampleStory.Continue());

        Debug.Log(exampleStory.Continue());
    }

    // Update is called once per frame
    void Update()
    {
    }
}
```

![alt text](./CantContinue.png "Can't Continue")

To help with this common issue, the Story API provides a property named *canContinue*.

### *canContinue*

TODO

## Loading Choices

## Loading Tags
