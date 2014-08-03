#
#  Created by Victor on 14/8/1.
#

"use strict"

cookieParser = require('cookie-parser')
session = require('express-session')
RedisStore = require('connect-redis')(session)

COOKIE_PARSER_SECRET = 'sadgkj324tefds89uVKtuwa98yhivrt8gdfbs13yqgehwavnbovxweafsd534rte'
SESSION_SECRET = 'ksOywq7Y1shldg312wefss9CXIHKDSHJirfycb39qfcjksahd'

ConfRedis = GLOBAL.config.session.redis

REDIS_STORE_OPTS =
  app   : 'Much'
  host  : ConfRedis.host
  port  : ConfRedis.port
  db    : ConfRedis.db
  prefix: 'mcrs:'

SESSION_COOKIE_OPTS =
  path    : '/'
  httpOnly: true
  maxAge  : 1000 * 60 * 1200

SESSION_OPTS =
  key              : 'sid'
  store            : new RedisStore(REDIS_STORE_OPTS)
  secret           : SESSION_SECRET
  cookie           : SESSION_COOKIE_OPTS
  resave           : true
  saveUninitialized: true


module.exports =
  cookieParser: ->
    cookieParser(COOKIE_PARSER_SECRET)
  session     : ->
    session(SESSION_OPTS)
