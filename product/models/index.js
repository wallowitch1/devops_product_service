const Sequelize = require('sequelize');
const config = require('../config/config.json'); // 데이터베이스 설정 파일 위치에 맞게 경로를 수정해주세요

const sequelize = new Sequelize(config.database, config.username, config.password, {
  host: config.host,
  dialect: config.dialect,
  logging: false,
  pool: {
    max: 5,
    min: 0,
    idle: 10000,
  },
});

const db = {};

db.Sequelize = Sequelize;
db.sequelize = sequelize;

// 모델 파일들을 임포트하고 객체에 추가하세요

db.Product = require('./Product.js')(sequelize, Sequelize);


module.exports = db;
