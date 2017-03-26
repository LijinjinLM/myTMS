angular.module('myApp')
.controller('RegistCtrl',['$scope','$location','$http','tmsUtils',($scope,$location,$http,tmsUtils)->
     $scope.userEntity=
            username:''
            password:''
            password2:''

     $scope.doReg= ->
       console.log($scope.userEntity)
       $http.post("#{Tms.apiAddr}/api/user/regist",{
         username:$scope.userEntity.username
         password:$scope.userEntity.password
         password2:$scope.userEntity.password2
       }).then(
         (res)->
           data=res.data
           location.path('/login').replace()
         ,tmsUtils.processHttpError
       )


])