const http = require('http');

const PORTS = [3000, 3001, 3002, 3003]; // specify the ports to use for each microservice

const RESPONSES = [
  'Hello from microservice 1!',
  'Hello from microservice 2!',
  'Hello from microservice 3!',
  'Hello from microservice 4!',
]; // specify the responses for each microservice

PORTS.forEach((port, i) => {
  http.createServer((req, res) => {
    res.writeHead(200, {'Content-Type': 'text/plain'});
    res.end(RESPONSES[i]);
  }).listen(port, () => console.log(`Microservice ${i + 1} is running on port ${port}`));
});
