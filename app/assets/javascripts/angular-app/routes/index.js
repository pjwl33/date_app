htl.config(['$routeProvider',
  function($routeProvider) {
    $routeProvider.
    when('/', {
      templateUrl: '/ang-views/index.html',
      controller: 'HomeCtrl'
    }).
    when('/404', {
      templateUrl: '/ang-views/404.html'
    }).
    otherwise({
      redirectTo: '/404'
    });
}]);