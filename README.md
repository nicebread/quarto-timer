# Quarto Timer

This extension provides the ability to add visible progress timers to your slides. This might be helpful, if, for example, you want your audience to think about a specific topic for 5 minutes.
 
![Timer in action](https://www.produnis.de/blog/posts/2024-01-16-QuartoExtensions/4mintimer.jpg)

## Installation
In the RStudio terminal:

```
$ quarto add nicebread/quarto-timer
```

## Usage

You can add timers using:

- raw HTML
- LUA filter (recommended)

### Raw HTML/JavaScript
If you want to add a timer in raw HTML, you can use the following code snippet in your `qmd`-File:

```
<div id="UNIQUE-ID"></div>
<script src="_extensions/nicebread/timer/timer.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        initializeTimer("UNIQUE-ID", SECONDS, STARTON); 
    });
</script>
```

...and replace `UNIQUE-ID` with a (tadaaa) unique ID, `SECONDS` with the seconds to count down, and `STARTON` with `presentation`, `slide`, or `interaction` to indicate when the timer become active:

- From the start of a `presentation`
- When the `slide` is visible
- On `interaction`, clicking on the timer

Here is an example of a 4 minute timer that start when the slide is on focus:

```
Please think about this for 4 minutes.
<div id="4minWaiting"></div>
<script src="_extensions/nicebread/timer/timer.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        initializeTimer("4minWaiting", 240, "slide"); 
    });
</script>
```

### Lua filter

This extension also provides a lua-filter that can be activated in YAML with:

```
---
filters: 
  - timer
---
```

Having the filter ready, you can more easily add a timer with:

```
:::{.timer #UNIQUE-ID seconds=100 starton=presentation}
:::
```

The above will start timing from when the presentation is loaded.
The example below starts when the slide or page becomes visible.

```
:::{.timer #UNIQUE-ID seconds=100 starton=slide}
:::
```

Or inserting a timer that requires clicking to start:

```
:::{.timer #UNIQUE-ID seconds=100 starton=interaction}
:::
```

You can use as many timers on your slides as you want, as long as you use a unique `UNIQUE-ID` every time.

![multiple timers in action](https://www.produnis.de/blog/posts/2024-01-04-Revealjs-Timer/revealjstimer.jpg)

### Extended Features

This extended version of the timer includes three new features extending the original tool:

1. **Default Reset Button**: A small reset icon is automatically added to the bottom of every timer. Clicking the timer toggles pause/play, while clicking the reset icon pauses and resets the timer to its initial state.
2. **Variable Size**: You can scale the timer by passing a `size` attribute. By default, it is `100%` (which corresponds to 300px).
3. **Optional Sound**: You can enable an audio notification (`bing.wav`) when the timer finishes by passing `sound=true`.

#### Raw HTML/JavaScript

If you are using raw HTML/JavaScript, the `initializeTimer` function now accepts two additional parameters: `size` and `sound`.

```
<div id="UNIQUE-ID"></div>
<script src="_extensions/timer/timer.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        // initializeTimer(ID, SECONDS, STARTON, SIZE, SOUND)
        initializeTimer("UNIQUE-ID", 100, "interaction", "50%", "true"); 
    });
</script>
```

#### Lua filter

Having the filter ready, you can easily add the extended features in YAML/Markdown:

```
:::{.timer #UNIQUE-ID seconds=100 starton=interaction size=50% sound=true}
:::
```

## Credits

Initially created by Joerg grosse Schlarmann ([produnis](https://github.com/produnis)) and extended by [@nicebread](https://github.com/nicebread) and [@David-Rieger](https://github.com/David-Rieger).

### License

This project is licensed under the MIT License.
