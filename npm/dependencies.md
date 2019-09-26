# Specifying dependecies in package.json

## 2 types of dependencies

### dependencies

Packages required by your app in production.

`npm install <package>` will add that to the dependencies list by default.

`npm install <package> --save-prod` will do it explicitly.

`npm install <package> -P` same as above.

### devDependencies

Packages that are only needed for local development and testing.

`npm install <package> --save-dev` will add the package to the devDependencies list.

`npm install <package> -D` same as above.
