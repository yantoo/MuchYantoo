"use strict"

module.exports = (app) ->
  (req, res, next) ->
    res.locals.node_env = app.get 'env'
    next()
