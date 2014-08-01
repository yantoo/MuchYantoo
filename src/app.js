"use strict";

GLOBAL.config = require('../config');

var express = require('express');
var path = require('path');

var app = express();

// Support CoffeeScript in runtime for development only.
if (app.get('env') === 'development') {
  require('coffee-script/register');
}

// Middleware
var favicon = require('static-favicon');
var logger = require('morgan');
var compress = require('compression');
var bodyParser = require('body-parser');

var csProvider = require('./middleware/cookie-session-provider')(app.get('env'));
//var passport = require('passport');

var localsNodeEnv = require('./middleware/connect-locals-node-env');
var localsVersion = require('./middleware/connect-locals-version');


var routes = require('./routes/index');

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(favicon());
app.use(compress());
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded());

//app.use(require('less-middleware')(path.join(__dirname, 'public')));
app.use(express.static(path.join(__dirname, 'public')));

app.use(csProvider.cookieParser());
app.use(csProvider.session());

//app.use(passport.initialize());
//app.use(passport.session());

app.use(localsNodeEnv());
app.use(localsVersion());

///
app.use(function (req, res, next) {
  var session = req.session;
  var locals = res.locals;
  // TODO
  next();
});

/// Routes
app.use('/', routes);

/// catch 404 and forward to error handler
app.use(function (req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

/// error handlers

// development error handler
// will print stacktrace
if (app.get('env') === 'development') {
  app.use(function (err, req, res, next) {
    res.status(err.status || 500);
    res.render('error', {
      message: err.message,
      error  : err
    });
  });
}

// production error handler
// no stacktraces leaked to user
app.use(function (err, req, res, next) {
  res.status(err.status || 500);
  res.render('error', {
    message: err.message,
    error  : {}
  });
});


module.exports = app;
