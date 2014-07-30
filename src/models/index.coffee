"use strict"

loadModels = require '../charger/sqzModelLoader'

ConfDB = GLOBAL.config.database

dbConfig = ConfDB[ConfDB.type]
dbOption =
  dialect: ConfDB.type
  host   : dbConfig.host
  port   : dbConfig.port

module.exports = loadModels __dirname, dbConfig.schema, dbConfig.user, dbConfig.password, dbOption
