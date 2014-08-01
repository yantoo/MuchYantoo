"use strict"

passport = require 'passport'
WeiboStrategy = require('passport-weibo-2').Strategy

ConfCamus = GLOBAL.config.camus
ConfWeibo = GLOBAL.config.social.weibo

express = require 'express'
router = express.Router()


models = require '../../models'
User = models.User


retrieveWeiboUser = (wbUserData, callback) ->
  User.findOrCreate { weibo_id: wbUserData.weibo_id }, wbUserData
  .then (user) ->
    throw Error('weibo_id does not match.') if user.weibo_id isnt wbUserData.weibo_id
    user.nickname = wbUserData.nickname
    user.avatar_url = wbUserData.avatar_url
    user.weibo_access_token = wbUserData.weibo_access_token
    if user.isDirty
      fieldsToUpdate = Object.keys wbUserData
      user.save fieldsToUpdate
    else
      user
  .then (user) ->
    callback null, user.values
  .catch (err) ->
    console.error err
    callback err, null
  .done()

weiboOptions =
  clientID    : ConfWeibo.appKey
  clientSecret: ConfWeibo.appSecret
  callbackURL : "http://#{ ConfCamus.host }/auth/weibo/callback"

weiboVerify = (accessToken, refreshToken, profile, done) ->
#  console.log 'weiboVerify >>>'
#  console.log 'accessToken: ', accessToken
#  console.log 'refreshToken: ', refreshToken
#  console.log 'profile: ', profile
#  console.log 'done: ', done
#  console.log 'weiboVerify <<<'
  if !accessToken or !profile
    done Error('accessToken or refreshToken is incorrect.')
    return

  wbUserData =
    weibo_id          : profile.id.toString()
    nickname          : profile.nickname
    avatar_url        : profile.avatarUrl
    weibo_access_token: accessToken
  retrieveWeiboUser wbUserData, done


passport.use new WeiboStrategy(weiboOptions, weiboVerify)

passport.serializeUser (user, done) ->
  console.log 'serializeUser:', user
  done null, user # can be done by DB

passport.deserializeUser (user, done) ->
  #console.log 'deserializeUser:', user
  done null, user # can be done by DB


router.get '/', passport.authenticate('weibo'), (req, res) ->
  # The request will be redirected to weibo for authentication, so this
  # function will not be called.

router.get '/callback', passport.authenticate('weibo', failureRedirect: '/login'), (req, res) ->
  # Successful authentication, redirect home.
  res.redirect '/'


module.exports = router
