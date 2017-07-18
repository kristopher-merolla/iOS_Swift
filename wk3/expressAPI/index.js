'use strict';

// Require ExpressJS (server) & body-parser (Convert request 
// body to JSON) modules from node_modules
var express = require('express')
var bodyParser = require('body-parser')

// Require user-created database configuration module 
// & application routes module
var database = require('./config/db')
var routes = require('./config/routes')
// Create instance of Express server
var app = express()

// Supply body-parser as middleware
app
  .use(bodyParser.urlencoded({ extended: true }))
  .use(bodyParser.json())

// Define routes
app.use('/', routes)

// Start server which is listening for requests on port 8000
app.listen('8000', function () {
  console.info('Listening on 8000')
})