---
title: 'A Recap on JavaScript Tooling'
date: 2020-02-23T11:25:10-05:00
draft: false
description: 'A recap on JavaScript tooling.'
author:      "Sisi"
image: ''
tags: ['JavaScript']
---

# A Recap on JS Toolings

## Modules

- AMD (Browser)
- CommonJS (Node.js)
- UMD (Browser and Node.js)
- ES6 Modules (Browser)

##### CommonJS

Exporting

```
module.exports = <...>
```

Importing

```
const Foo = require('<foo.js>')
```

##### ES6 Modules

In order to use ES6 modules

```
type='module'
```

Exporting

```
export default {}
```

Importing

```
import {...} from './foo.js'
```

## ES6 Tooling

##### Transpiler:

A translator + compiler
It's a tool that convert the Modern JS code into code that all browsers can understand. The most popular Transpiler is Babel.

An example of using Babel, set up the script in Package.json file.

```
"scripts" : {
    "babel": "babel --presets env index.js -o build/index.js
}
```

##### Bundler:

It is responsible for combing all our .js files to a single .js file. It reduces the size of the js file that we serve to the client. The most popular Bundler is Webpack.
