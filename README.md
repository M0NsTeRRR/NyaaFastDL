[![Codacy Badge](https://api.codacy.com/project/badge/Grade/e419ff6103814666b24b69c2fdf36ed6)](https://app.codacy.com/app/M0NsTeRRR/NyaaFastDL?utm_source=github.com&utm_medium=referral&utm_content=M0NsTeRRR/NyaaFastDL&utm_campaign=Badge_Grade_Dashboard)
[![Docker Automated build](https://img.shields.io/docker/cloud/automated/monsterrr/nyaafastdl?style=flat-square)](https://hub.docker.com/r/monsterrr/nyaafastdl)
[![Docker Build Status](https://img.shields.io/docker/cloud/build/monsterrr/nyaafastdl?style=flat-square)](https://hub.docker.com/r/monsterrr/nyaafastdl)

This website will help you to download torrent faster than Nyaa website.

The goal was to learn how parse an HTML page by scrapping torrents on Nyaa.si (<3), you need to ask Nyaa.si before using this project.

# This tool uses :

* [Vue.js](https://vuejs.org/) - Progressive framework
* [Ant Design Vue](https://vue.ant.design/) - Component framework for Vue.js

# Requirements
## Classic
* Node.js >= 8.9
* npm
* Vue CLI 3

## Docker
- Docker CE
- Docker-compose

# Dev
In current directory run `npm install` 

In current directory run`npm run serve` and access to the website `http://localhost:8080`

# Production
## Classic
In current directory run `npm install` 

You can use your own CORS anywhere (Default herokuapp) by changing the constant line 336

Configure default value of input/select by editing `src/App.vue`

Default Value
~~~~
videoQualitySelected: '1080p',
languageSelected: 'VOSTFR',
filterSelected: '0',
categorySelected: '0_0',
sortSelected: undefined,
~~~~

In current directory run `npm run-script build` and serve `/dist` with a webserver

## Docker

Use the Dockerfile provided and serve static directory of Dockerfile `/opt/services/NyaaFastDL/static/` with a webserver

# Licence

The code is under CeCILL license.

You can find all details here: http://www.cecill.info/licences/Licence_CeCILL_V2.1-en.html

# Credits

Copyright © Ludovic Ortega, 2019

Contributor(s):

-Ortega Ludovic - mastership@hotmail.fr
