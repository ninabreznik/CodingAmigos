var fs = require('fs');
var arguments = process.argv.slice(2);
var directory = arguments[0];
var extension = "." + arguments[1];
var listOfFiles

function filter () = {
  fs.readdir(directory, function doneReading(err, content) {
    listOfFiles = content.toString().split('extension')
    console.log(listOfFiles);
  }); 
}