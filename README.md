## After-brunch
Want to run something on the command line everytime [brunch](http://brunch.io) compiles? Easy.

## 

## Usage
Add `"after-brunch": "x.y.z"` to `package.json` of your brunch app.
Or `npm install after-brunch --save`.

Then in your `config.coffee` just add any commands to the afterBrunch array.
For example, you might want to use styledocco to create a live styleguide of your stylesheets.

You can now use the new configuration to pass parameters:

```coffeescript
exports.config =
  …
  plugins:
    disableOnWatch: true
      commands: [
        'styledocco -n "My Project" css'
      ]
```

Parameters available:
--------
* disableOnWatch: Boolean - Disable the commands on grunt watching mode


The old configuration is still available: 

```coffeescript
exports.config =
  …
  plugins:
    afterBrunch: [
      'styledocco -n "My Project" css'
    ]
```