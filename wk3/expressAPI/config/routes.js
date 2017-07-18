'use strict';

var express = require('express')
var router = express.Router()
var Task = require('../models/Task')

// Helper function responsible for fetching all Tasks
function getAllTasks(req, res){
  Task.find({}, function (err, tasks) {
    if (err) {
        console.error(`Error: ${error}`)
        res.send(`Error: ${error}`)
    } else {
        console.log(tasks)
        res.send(tasks)
    }
  })
}

router.route('/tasks')
  .get(function (req, res) {
  /** 
  * Respond with all tasks stored on database if 'GET' request to route 
  * '/tasks'; the only time we send an error back to the client
  */
    getAllTasks(req, res)
  })

module.exports = router