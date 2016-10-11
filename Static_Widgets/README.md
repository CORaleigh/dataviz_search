      /$$$$$$                      /$$                          
     /$$__  $$                    | $$                          
    | $$  \__/  /$$$$$$   /$$$$$$ | $$$$$$$   /$$$$$$  /$$$$$$$
    | $$       |____  $$ /$$__  $$| $$__  $$ /$$__  $$| $$__  $$
    | $$        /$$$$$$$| $$  \__/| $$  \ $$| $$  \ $$| $$  \ $$
    | $$    $$ /$$__  $$| $$      | $$  | $$| $$  | $$| $$  | $$
    |  $$$$$$/|  $$$$$$$| $$      | $$$$$$$/|  $$$$$$/| $$  | $$
     \______/  \_______/|__/      |_______/  \______/ |__/  |__/


# Carbon Framework
Carbon is Atlantic BT's internal framework that creates the foundation for all websites and applications. It is the baseline for everything. Carbon is built using HTML5, CSS3, Sass, and other technologies to provide the most semantic, efficient code possible.

## Prerequisites
The following frameworks should be installed globally on your computer prior to running Carbon:

- NodeJS - (https://nodejs.org/)
- Gulp   - (http://gulpjs.com/)
- KSS    - `$npm install -g kss`


## Install Dependencies
With your prerequisites installed, next we'll want to install any project dependencies. These will be stored in a node_modules directory in your project.

`$ cd my-carbon-directory`

`$ npm install`


## Run Gulp
For single instance command execution:

`$ gulp`

For continuous watch command execution:

`$ gulp watch`


## Other Notes

### Issues
If running 'gulp watch' returns an error with a version of less, run 'npm install less' to install the latest version.

### Favicons

By default, Carbon has the fallback favicon in the `favicons/` folder. However, it's best to use a generator to create the abundant amount of special favicons needed for individual devices. We recommend: http://realfavicongenerator.net/. Just upload a minimum 260x260 .png and follow the step-by-step process. Once finished:

> 1. Step through the generator (path files to `favicons/`, not the root)
> 2. Copy the new images into `favicons/`
> 3. Copy/Paste the calls into your `<head>`


Done!