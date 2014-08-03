"use strict"

module.exports = (sequelize, DataTypes) ->
  User = sequelize.define 'User', {
    user_id           :
      type         : DataTypes.BIGINT
      primaryKey   : yes
      autoIncrement: yes
    email             :
      type     : DataTypes.STRING(127)
      unique   : yes
      allowNull: yes
      validate :
        isEmail: yes
    password          :
      type     : DataTypes.STRING(127)
      allowNull: yes
#      get      : ->
#        # TODO:
#        @.getDataValue 'password'
#      set      : (v) ->
#        # TODO:
#        @.setDataValue 'password', v
    nickname          :
      type     : DataTypes.STRING(127)
      allowNull: yes
#      validate :
#        is: [ "^[a-z]+$", 'i' ]
    avatar_url        :
      type     : DataTypes.STRING(255)
      allowNull: yes
      validate :
        isUrl: yes
    weibo_id          :
      type     : DataTypes.STRING(16)
      allowNull: yes
      unique   : yes
    weibo_access_token:
      type     : DataTypes.STRING(45)
      allowNull: yes
  }, {
    freezeTableName: yes
    tableName      : 't_user'
    timestamps     : yes
    underscored    : true

    classMethods:
      associate: (models) ->
#    instanceMethods:
#      verifyPassword: (pswd, callback) ->
#        callback null, @.getDataValue('password') is pswd
  }
