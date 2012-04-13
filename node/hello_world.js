//  run with:
//    node hello_world.js

var http = require('http');
 
http.createServer(function (request, response) {
    response.writeHead(200, {'Content-Type': 'text/plain'});
    response.end('Hi from node.js!\n');
}).listen(8000);
 
console.log('Server running at http://localhost:8000/');