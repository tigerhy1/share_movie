'use strict';

require('bootstrap/dist/css/bootstrap.min.css');
require('font-awesome/css/font-awesome.css');
require('./share_movie.css');

// Require index.html so it gets copied to dist
require('./index.html');

var Elm = require('./Main.elm');
var mountNode = document.getElementById('main');

// The third value on embed are the initial values for incomming ports into Elm
var app = Elm.Main.embed(mountNode);
