## after-brunch
Want to run something on the command line everytime [brunch](http://brunch.io) compiles? Easy.

## Usage
Add `"after-brunch": "x.y.z"` to `package.json` of your brunch app.
Or `npm install after-brunch --save`.

Then in your `config.coffee` just add any commands to the afterBrunch array.
For example, you might want to use styledocco to create a live styleguide of your stylesheets.

```coffeescript
exports.config =
  …
  plugins:
    afterBrunch: [
      'styledocco -n "My Project" css'
    ]
```

Commands can also be executed from within the public directory. This can be useful if your public path changes depending on the current brunch environment.

```coffeescript
exports.config =
  …
  plugins:
    afterBrunch: [
      {
        command: 'styledocco -n "My Project" css',
        usePublicPath: true
      }
    ]
    overrides:
        someEnvironment:
            paths:
                public: '../place/where/public/is'
```
