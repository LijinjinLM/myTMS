#tmsUtils文件提供了一系列的工具方法
angular.module('myApp')
.factory('tmsUtils',[()->
 processHttpError = (res)->
   #获得服务端的响应
   data=res.data
   console.log("data="+data)
   if data.message
     #如果有错误，将错误弹出
     alert(data.message)
 return{
   processHttpError:processHttpError
 }

])