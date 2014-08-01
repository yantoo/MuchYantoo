"use strict"

express = require 'express'
router = express.Router()

router.get '/', (req, res) ->
  res.render 'index', { title: 'Much Yantoo.net' }

#router.use '/auth/weibo', require './auth/weibo'

module.exports = router
