"use strict"

caldav = require 'node-caldav'

caldav.getList 'https://yantoo.net:5232/ice/', 'ice', 'ice', (data) ->
  console.log 'list:', data

caldav.getEvents 'https://yantoo.net:5232/ice/cal.ics/', 'ice', 'ice', (data) ->
  console.log 'events:', data
