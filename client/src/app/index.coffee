#ngRoute模块负责单页面应用中的路由处理
###angular.module('myApp',[])
.controller('testCtrl',['$scope',($scope)->
  $scope.name='Tom'
])###
angular.module('myApp', ['ngRoute'])
#使用config函数做路由配置
.config(['$routeProvider', ($routeProvider) ->
  #routeProvider负责路由的分发和处理
      $routeProvider.when('/login', {
        #当路径是‘login’时要加载的模块技术
           templateUrl: '/app/login/login.html',
        #指定控制器
           controller: 'LoginCtrl'
      }).when('/regist',{
            templateUrl:'/app/regist/regist.html'
            controller: 'RegistCtrl'
      }).when('/',{
            templateUrl:'/app/index/index.html'
            controller: 'IndexCtrl'
      })
]).run(['$location',($location) ->
     $location.path('/login').replace()
])