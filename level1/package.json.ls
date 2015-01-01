name: "axe-g0v-tw-level1"
version: "0.0.1"
private: true
scripts:
  republish: "node_modules/.bin/lsc -cj package.json.ls && node_modules/.bin/lsc -c xit.ls"
  start: "node xit.js"
keywords:
  * "g0v"
author: "Pomin Wu <pomin5@gmail.com>"
license: "MIT"
devDependencies:
  LiveScript: "*"
dependencies:
  request: "*"
  cheerio: "*"
  'prelude-ls': "*"
