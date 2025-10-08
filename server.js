#!/usr/bin/env node

// Import your Express app
var app = require('./app');  // adjust path if needed
var debug = require('debug')('test-app:server');
var http = require('http');

// Set the port
const PORT = process.env.PORT || 3000;
app.set('port', PORT);

// Create HTTP server
var server = http.createServer(app);

// Listen on provided port
server.listen(PORT, '0.0.0.0', () => {
  console.log(`Server started on http://0.0.0.0:${PORT}`);
});

// Optional: handle errors
server.on('error', (error) => {
  console.error('Server error:', error);
  process.exit(1);
});

server.on('listening', () => {
  const addr = server.address();
  console.log(`Listening on ${typeof addr === 'string' ? addr : addr.port}`);
});
