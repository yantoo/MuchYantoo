"use strict"

module.exports = ->
  (req, res, next) ->
    res.locals.node_env = process.env.NODE_ENV
    next()
