'use strict';

var express = require('express')
var router = express.Router()
var Task = require('../models/Task')

// Helper function responsible for fetching all Tasks
function getAllTasks(req, res) {
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

function postNewTask(req, res) {
  // console.log("inside the postNewTask!")
  console.log(req.body.objective);
  // console.log("end of body post")
  var task = new Task({objective: req.body.objective});
  task.save(function(err) {
    if (err) {
      return err;
    }
    else {
      console.log("Task Saved")
    }
  })
}

router.route('/tasks').get(function (req, res) {
  /** 
  * Respond with all tasks stored on database if 'GET' request to route 
  * '/tasks'; the only time we send an error back to the client
  */
    getAllTasks(req, res)
  })

router.route('/tasks').post(function (req,res) {
    postNewTask(req, res)
  })

module.exports = router