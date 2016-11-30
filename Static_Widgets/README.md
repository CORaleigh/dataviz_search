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


## Knyle Style Sheets
source in 'stylequide.tpl' directory and output in 'styleguide' directory. For more information visit http://warpspire.com/kss/.

## Static Widgets
Source in 'templates/src' and 'templates/inc' directories. 
Output during 'gulp watch' task goes to ['stylequide/templates'](https://github.com/CORaleigh/dataviz_search/tree/master/Static_Widgets/styleguide/templates) directory. 

All html pages with 'widget-' in name are the original wigets created with all needed CSS/JS need for layout and functionality. Pages without 'widget-' are plain markup with no css/js as requested by City of Raleigh developers.

gulpfile.js - contains tasks to complete above functionality

js/init.js - global init functions for selectboxit, google charts, toggling content and fix for google chart alt attribute accessabiltiy issue.

js/global.js - compiled during 'gulp watch' task. Currently includes js/jquery.selectBoxIt.js and js/jquery-ui/jquery-ui.min.js (selectboxit dependancy) . Task for this compilation is located at line #111 of gulpfile.js

## Icomoon Font (https://icomoon.io/)
To add more icons import fonts/selection.json into icomoon app (https://icomoon.io/app/#/select). Then add new icons to set and export. Update font files and selection.json in fonts/  directory.


## Other Notes

### Issues
If running 'gulp watch' returns an error with a version of less, run 'npm install less' to install the latest version.

### Favicons

By default, Carbon has the fallback favicon in the `favicons/` folder. However, it's best to use a generator to create the abundant amount of special favicons needed for individual devices. We recommend: http://realfavicongenerator.net/. Just upload a minimum 260x260 .png and follow the step-by-step process. Once finished:

> 1. Step through the generator (path files to `favicons/`, not the root)
> 2. Copy the new images into `favicons/`
> 3. Copy/Paste the calls into your `<head>`


Done!
