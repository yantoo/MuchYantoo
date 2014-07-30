/**
 * Created by Victor on 14/7/30.
 */
"use strict";

module.exports = {
  tempDir : '',
  host    : 'yantoo.net',
  session : {
    type : 'redis',
    redis: {
      host: 'localhost',
      port: 6379
    }
  },
  database: {
    type : 'mysql',
    mysql: {
      host    : 'localhost',
      port    : 3306,
      schema  : 'much',
      user    : 'much_admin',
      password: ''
    }
  },
  social  : {
    weibo: {
      appKey   : 'APP.KEY',
      appSecret: 'APP.SECRET'
    }
  }
};
