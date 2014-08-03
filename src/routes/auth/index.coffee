#
#  Created by Victor on 14/8/4.
#

"use strict"

express = require 'express'
router = express.Router()

router.get '/me', (req, res) ->
  res.send req.session?.passport?.user

router.use '/weibo', require './weibo'

module.exports = router
