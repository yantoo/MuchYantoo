/**
 * Created by Victor on 14/7/30.
 */
"use strict";

module.exports = {
  development: {
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
    storage : {
      type: 'oss',
      oss : {
        accessKeyId    : 'ACC_KEY_ID',
        accessKeySecret: 'ACC_KEY_SC',
        bucket         : 'BUCKET.NAME',
        region         : 'OSS.LOCATION.CONSTRAINT',
        boundHost      : 'CUSTOM.BOUND.HOST.DOMAIN'
      }
    },
    social  : {
      weibo: {
        appKey   : 'APP.KEY',
        appSecret: 'APP.SECRET'
      }
    }
  },
  production : {
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
    storage : {
      type: 'oss',
      oss : {
        accessKeyId    : 'ACC_KEY_ID',
        accessKeySecret: 'ACC_KEY_SC',
        bucket         : 'BUCKET.NAME',
        region         : 'OSS.LOCATION.CONSTRAINT',
        boundHost      : 'CUSTOM.BOUND.HOST.DOMAIN'
      }
    },
    social  : {
      weibo: {
        appKey   : 'APP.KEY',
        appSecret: 'APP.SECRET'
      }
    }
  }
};
