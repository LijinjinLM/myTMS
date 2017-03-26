angular.module('myApp')
.controller('LoginCtrl',['$scope','$location','$http','tmsUtils',($scope,$location,$http,tmsUtils)->
      $scope.userEntity=
         username:''
         password:''
         rememberMe :false
      $scope.doLogin= ->
         $http.post("#{Tms.apiAddr}/api/user/login",{
           username:$scope.userEntity.username
           password:$scope.userEntity.password
         }).then(
           (res)->
             #成功的回调函数
             token=res.data.token
             #登录成功后所有的请求都必须携带这个token
             $http.defaults.headers.common['x-token']=token

             console.log("token=#{token}")
             #如果登录成功，跳转到首页
             $location.path('/').replace();
             return;
           ,
           tmsUtils.processHttpError
         )
         console.log($scope.userEntity)

      return;



])