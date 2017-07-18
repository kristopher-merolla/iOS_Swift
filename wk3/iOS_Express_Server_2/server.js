// Require the Express Module
var express = require('express');
// Create an Express App
var app = express();
// Require body-parser (to receive post data from clients)
var bodyParser = require('body-parser');
// Integrate body-parser with our App
app.use(bodyParser.urlencoded({ extended: true }));
// Require path
var path = require('path');

// Require mongoose to communicate with the mongoDB
var mongoose = require('mongoose');
// This is how we connect to the mongodb database using mongoose -- "tasks" is the name of the db
mongoose.connect('mongodb://localhost/tasks');

// setup the schema for the database
var TaskSchema = new mongoose.Schema({
    objective:String,
    createdAt:String
})
mongoose.model('Task',TaskSchema) // Setting the schema in the model as "Task"
var Task = mongoose.model('Task') // Retrieving the schema from the model, named "Task"

// Setting our Static Folder Directory
app.use(express.static(path.join(__dirname, './static')));
// Setting our Views Folder Directory
app.set('views', path.join(__dirname, './views'));
// Setting our View Engine set to EJS
app.set('view engine', 'ejs');

// Routes
// Root Request
app.get('/', function(req, res) {
    // This is where we will retrieve the users from the database and include them in the view page we will be rendering.
    res.render('users');
})
// Get All Task Route
app.get('/tasks', function(req,res) {
    Task.find({}, function(err, tasks) {
        if(err) {
            console.log('something went wrong');
        } else { // else console.log that we did well and then redirect to the root route
            console.log('grabbed all tasks!');
            res.send(tasks);
        }
    })
})

// // Add User Request 
// app.post('/users', function(req, res) {
//     console.log("POST DATA", req.body);
//     // This is where we would add the user from req.body to the database.
//     res.redirect('/');
// })

// Setting our Server to Listen on Port: 8000
app.listen(8000, function() {
    console.log("listening on port 8000");
})