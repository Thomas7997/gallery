const express = require('express');
const path = require('path');
const passport = require('passport');
const logger = require('morgan');
const session = require('express-session');
const cors = require('cors');
const fileUpload = require('express-fileupload');

// Routes
const indexApi = require('./routes/index');
const userApi = require("./routes/user");
const mediaApi = require("./routes/media");

require('dotenv').config();

// Passport Config
require('./config/passport')(passport);

var server = express();

server.use(cors());
server.use(logger('dev'));
server.use(express.urlencoded({ extended: false }));
server.use(express.json());
server.use(fileUpload());
server.use(express.static(path.join(__dirname, 'public')));
server.use(session({ secret: 'our new secret'}));
server.use(passport.initialize());
server.use(passport.session());

server.use('/index', indexApi);
server.use('/user', userApi);
server.use('/media', mediaApi);

// catch 404 and forward to error handler
server.use(function(req, res, next) {
  res.status(404).json({ msg : "La page n'existe pas." });
});

// error handler
server.use(function(err, req, res, next) {
  // render the error page
  res.status(err.status || 500);
  
  if (req.user) {
    res.json({ msg : err.message });
    console.log(err.message);
  } else {
  	res.json({ msg : err.message });
  	console.log(err.message);
  }
});

const port = process.env.APP_PORT || 5000;

server.listen(port, () => console.log(`Server running on port ${port}`));