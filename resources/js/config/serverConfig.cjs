const cors = require('cors');
const express = require('express');
const winston = require('winston');

function configureServer(app) {
  try {
    // Setup Winston logger
  const logger = winston.createLogger({
    level: 'info',
    format: winston.format.json(),
    transports: [
      new winston.transports.File({ filename: 'error.log', level: 'error' }),
      new winston.transports.File({ filename: 'combined.log' }),
    ],
  });

  // Middleware, etc.
  app.use(cors());
  app.use(express.json());
  } catch (error) {
    console.log(error)
  }
  
}

module.exports = { configureServer };
