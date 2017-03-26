#提供鉴权等通用任务
db=require('./../libs/db')
#查看用户是否登录
setUserinfo =(req,res,next)->
#客户端在提交请求时,要将他的令牌token一起提交过来,以便让服务器端知道它是谁
#从req中获取客户端的提交过来的token
  token = req.headers['x-token']
  #根据token去获取user表中的查找对应的user
  db.users.findOne({token:token,expiredTime:{$gt:Date.now()}},(err,user) ->
#将查询到的用户信息保存到req对象中
    req.userinfo = user if not err
    next()
  )
#检查用户是否已经登录
isLogined=(req,res,next) ->
  if not req.userinfo
    res.status(401)
    return res.send('未授权')
  next()
module.exports={
  setUserinfo:setUserinfo
  isLogined:isLogined
}



