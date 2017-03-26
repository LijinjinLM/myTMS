// Generated by CoffeeScript 1.12.4

/*angular.module('myApp',[])
.controller('testCtrl',['$scope',($scope)->
  $scope.name='Tom'
])
 */

(function() {
  angular.module('myApp', ['ngRoute']).config([
    '$routeProvider', function($routeProvider) {
      return $routeProvider.when('/login', {
        templateUrl: '/app/login/login.html',
        controller: 'LoginCtrl'
      }).when('/regist', {
        templateUrl: '/app/regist/regist.html',
        controller: 'RegistCtrl'
      }).when('/', {
        templateUrl: '/app/index/index.html',
        controller: 'IndexCtrl'
      });
    }
  ]).run([
    '$location', function($location) {
      return $location.path('/login').replace();
    }
  ]);

}).call(this);

//# sourceMappingURL=index.js.map
