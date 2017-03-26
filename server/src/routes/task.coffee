express = require('express');
db=require('./../libs/db');
taskBiz=require('./../biz/taskBiz')
router = express.Router();
commonBiz=require('./../biz/commonBiz')
#按照Restful设计原则规划路由
#添加任务
router.post('/task',commonBiz.setUserinfo,commonBiz.isLogined,taskBiz.addTask)
#修改任务
router.put('/task',commonBiz.setUserinfo,commonBiz.isLogined,taskBiz.updateTask)
#删除
router.delete('/task/:id',commonBiz.setUserinfo,commonBiz.isLogined,taskBiz.deleteTask)
router.get('/task/:id',commonBiz.setUserinfo,commonBiz.isLogined,taskBiz.findTaskById)
router.get('/task',commonBiz.setUserinfo,commonBiz.isLogined,taskBiz.findTaskList)
module.exports = router;