"use strict"

if !!window.angular
  YT_APP_ATTR = 'yt-app'
  appElem = angular.element "[#{ YT_APP_ATTR }]"
  appName = appElem.attr YT_APP_ATTR
  return if !appName
  appElem.ready ->
    angular.bootstrap appElem, [ appName ]
