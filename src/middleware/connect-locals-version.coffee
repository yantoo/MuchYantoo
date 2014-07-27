"use strict"

version = require('../../package.json').version

module.exports = ->
  (req, res, next) ->
    res.locals.version = version
    next()
