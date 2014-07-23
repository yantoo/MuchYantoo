"use strict"

module.exports = (env) ->
  (req, res, next) ->
    res.locals.node_env = env
    next()
