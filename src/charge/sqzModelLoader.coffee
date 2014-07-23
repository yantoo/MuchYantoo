"use strict"


fs = require 'fs'
path = require 'path'
Sequelize = require 'sequelize'
lodash = require 'lodash'


module.exports = (searchDir, dbName, user, password, options) ->
  sequelize = new Sequelize dbName, user, password, options
  modelsPack = {}

  fs
  .readdirSync searchDir
  .filter (file) ->
    file.indexOf('index.') isnt 0
  .forEach (file) ->
    model = sequelize.import path.join searchDir, file
    modelsPack[model.name] = model

  Object
  .keys modelsPack
  .forEach (modelName) ->
    modelsPack[modelName].associate? modelsPack

  appendo =
    Sequelize: Sequelize
    sequelize: sequelize

  lodash.extend appendo, modelsPack
