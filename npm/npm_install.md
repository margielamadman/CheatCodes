# npm install

## command line usage

### With no arguments

Will install all dependencies listed in `package.json` file.

### With `--production` flag

Will not install `devDependencies` listed in `package.json` file.

### With `<package>` argument

Aliases: `npm i`, `npm add`

Installs locally by default.

Adds package to `dependencies` by default.

Use `-P` or `-D` flags to add package to `dependencies` or `devDependecies` respectively.

`--no-save` will not save a package to dependencies.

Package will be in `./node-modules`

Install packages locally if you will `require()` them.

### Install package globally

`npm install -g` or `npm install --global`

Package will be in `/usr/local` or wherever node is installed.

Install packages globally if you want to run them on the command line.
