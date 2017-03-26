// Generated by CoffeeScript 1.12.4
(function() {
  var commonBiz, db, express, router, taskBiz;

  express = require('express');

  db = require('./../libs/db');

  taskBiz = require('./../biz/taskBiz');

  router = express.Router();

  commonBiz = require('./../biz/commonBiz');

  router.post('/task', commonBiz.setUserinfo, commonBiz.isLogined, taskBiz.addTask);

  router.put('/task', commonBiz.setUserinfo, commonBiz.isLogined, taskBiz.updateTask);

  router["delete"]('/task/:id', commonBiz.setUserinfo, commonBiz.isLogined, taskBiz.deleteTask);

  router.get('/task/:id', commonBiz.setUserinfo, commonBiz.isLogined, taskBiz.findTaskById);

  router.get('/task', commonBiz.setUserinfo, commonBiz.isLogined, taskBiz.findTaskList);

  module.exports = router;

}).call(this);

//# sourceMappingURL=task.js.map
