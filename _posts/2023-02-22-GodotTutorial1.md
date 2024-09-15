---
layout: default
title:  "Godot Accessibility Tutorial #1 - How to Build Basic Accessible Menus and Interfaces"
date:   2023-02-22 01:44:05 -0500
tags: game
---

# Godot Accessibility Tutorial #1 - How to Build Basic Blind Accessible Menus and Interfaces

# Why Accessibility?

A lot of people might think that adding accessibility to your game means that it makes it less fun, or less difficult, but this is not true in the majority of cases. Adding accessibility is really about adding a few basic features to make certain UI elements easier to use for people with different disabilities. These game design choices help make your game not just more usable to people with disabilities, but also other users of your game who will appreciate the different modes that make your game interface more usable. Difficulty can still be retained as long as the focus of accessibility is on the usability of the interface rather than simply the ability to complete a game. 

# Resources for this Tutorial

For this tutorial you will need the following resources:

* Godot 3.5
* [Godot TTS](https://github.com/lightsoutgames/godot-tts) by lightsoutgames

You can also reference [this git repository](https://gitlab.com/labadore64/accessibility-demo1) to follow along with the contents of this tutorial.

This tutorial is written for Godot 3.5. I will add Godot 4 tutorials sometime in the future when Godot 4 is more stable. 

This tutorial assumes that the reader knows how to connect signals, and use basic features of the project settings tab.

# Adding TTS to your Godot 3.5 Game

To add TTS to your Godot 3.5 game, you will need to download the [Godot TTS](https://github.com/lightsoutgames/godot-tts) addon. Go to the repository, find the "Downloads" section and download godot-tts.zip. This zip file contains all of the files you will need to get it running. Unzip the zip file in the root directory of your game, and rename the zipped directory to "addons".

The easiest way to use the TTS script is to add the script to your AutoLoads. Go to the project settings tab, and go to AutoLoads. Locate the script (it should be in ``addons/godot-tts/TTS.gd``). Now, test with the following script in your Main Scene's script:

```
func _ready():
    Tts.speak("Hello World!"
```

If you completed this correctly, you should hear "Hello World!" from the TTS voice when you load your game.

# Adding Blind Accessibility to Menus

Menus are the easiest place to start adding blind accessibility to. There are a few main requirements to make your menus more accessible:

- They must be usable with a keyboard or controller, without using a mouse.
- They must be able to be easily navigated with and not have a confusing input layout.
- They must have the buttons and HUD information read off to the player in some manner.

To do these things, we must manipulate Godot's "focus" feature. Focus is a UI term that refers to a selected UI element. Only the focused UI element can take inputs. This way it's much easier to code a UI for keyboard or controller and not have inputs interfering with each other. Fortunately, Godot's focus system is relatively easy to learn and can help you rapidly set up an easy-to-understand focus structure. 

Unfortunately, Godot requires you to manually set which button is focused when a node is ready. To do this, we can call ``grab_focus()`` on a Control, like this:
```
func _ready():
    $Button.grab_focus();
```

By doing this, it will automatically focus on the first button you want when the scene loads.

Now, to create the controller layout. When the correlated ``ui_`` input is inputted, it will automatically direct the focus to the element that is in one of these properties:

* focus_neighbour_left
* focus_neighbour_right
* focus_neighbour_bottom
* focus_neighbour_top
* focus_next
* focus_previous

By default, if these properties aren't set, Godot will automatically try to find the closest Control and set the focus based on that node. It is important to keep your UI logically coherent in a keyboard or controller layout to set these values when appropriate, and to test carefully with how your focus navigates through the scene.

Additionally, elements can be set to be focusable or not, with the ``focus_mode`` property. If you want a node to be focusable, you should set this property to ``FOCUS_MODE_ALL``. Otherwise, set it to FOCUS_MODE_NONE. In some cases, such as when you have a menu that creates another menu, you will need to turn off the focus of your buttons with ``FOCUS_MODE_NONE`` so that they don't accidentally access buttons that are not in the active open menu. Then, when you are done, you can set the focus mode back to ``FOCUS_MODE_ALL``.

After setting our focus neighbours as we need to, we can now focus on the fun stuff - the TTS implementation.

First, we will want all of our focusable Controls to say their name when they enter focus. To do this is quite simple, we just need to add a new method for the ``focus_entered`` signal:

```
# Note: This should be on a script that extends Control
func _on_focus_entered():
    var button = get_focus_owner();
        
    if button is Button:
        TTS.speak(button.text)
```

``get_focus_owner()`` will get the node, if any, that is set to the current focus. This way we know what node just recieved focus. If the node is a Button, we can just read off its text. Different kinds of nodes should be handled in ways that are appropriate for what the user needs to know when they select that node.

There is a slight issue with this implementation, however. Oftentimes, when we open a menu, the first thing we want to know isn't the first selected button, but rather the name of the menu. This way we know what menu we just entered. To do this, we will need an additional variable that tracks whether or not focus has been triggered yet for this function:

```
# This becomes true the first time that the function is run
var triggered = false;

# Note: This should be on a script that extends Control
func _on_focus_entered():
    var button = get_focus_owner();
        
    if button is Button && triggered:
        TTS.speak(button.text)
        
    triggered = true;
```

Now, if we read the title in the ``_ready()`` function, there is no conflict.

But how might one approach the HUD? Not every element should be selectable by a keyboard or controller. These elements won't be accessible by navigating around simply with the ``ui_`` buttons. For this, we will need to add an additional key that the user can hold down to navigate a menu that contains all of the present HUD information. 

First, at the top of the script, we should add a couple of variables to construct this menu:
```
var accessibility_index = 0;
var accessibility_list = [];
```

``accessibility_list`` stores a simple array of strings that can be read off in TTS to the player, while ``accessibility_index`` keeps track of where we are in that list as we navigate it.

Now, we will need to add an input to correlate with that special additional key. You can add an input by going to the project settings, go to Input Map and add an additional input. Typically, I use the name "access_key" for the input and use Shift for the keyboard key (If you want controller compatibility you should add a unique button for that as well).

After adding the input, we can now try to construct our little "HUD menu". This menu implementation is quite simple:

```
func _process(delta):
    # This value is set to true if the accessibility index changes.
    var tts_triggered = false;
    # If the access key is held down
    if Input.is_action_pressed("access_key"):
        
        # If the ui up button is pressed
        if Input.is_action_just_pressed("ui_up"):
            accessibility_index -= 1;
            tts_triggered = true
            
        # If the ui down button is pressed
        if Input.is_action_just_pressed("ui_down"):
            accessibility_index += 1
            tts_triggered = true
            
        # Updates the accessibility index so that it doesn't
        # go out-of-bounds and so that it can wrap around
        if accessibility_index >= accessibility_list.size():
            accessibility_index = 0
        elif accessibility_index < 0:
            accessibility_index = accessibility_list.size()-1
            
        # If the tts is triggered, speak the accessibility list 
        # at the selected accessibility index
        if tts_triggered:
            TTS.speak(accessibility_list[accessibility_index])
```

Basically, what this code does is check for the access key to be held down, then it will check if ``ui_up`` or ``ui_down`` are pressed. If they are, they change ``accessibility_index``. It's important to note that typically users expect ``ui_up`` to make the index go *down* while ``ui_down`` the index will go *up*. Also, when these values are pressed, a boolean is set to true to indicate that the index has changed this frame.

After this, we need to make sure the accessibility index does not go past its range, and it wraps around when it tries. This way when the user reaches the end or beginning of the list, they can easily wrap around to the next option. To do this, if ``accessibility_index`` is greater than or equal to the size of ``accessibility_list``, it should wrap back to 0. Likewise, if it is less than 0, it should be set to the size of the array -1.

Once we have corrected the index, we can check to see if the index was changed. If it was, we can say the string that is in ``acessibility_list`` at index ``accessibility_index``.

Make sure to review the [repository](https://gitlab.com/labadore64/accessibility-demo1) for this project to better understand the code. This is a very simple implementation, but for more complex interfaces, you might require things like changing the focus mode and updating ``accessibility_list`` at different times to indicate a change.

# Additional Beginner Tips

* Do NOT say your game is blind accessible until you've had a few people try it! They will give you useful feedback on where various holes in your accessibility model might lie.
* Try going onto audiogames.net or r/blind to find people who might be interested in testing your game.
* Add many different kinds of sound effects for different actions in your game so that sound effects can be used to distinguish different activities.