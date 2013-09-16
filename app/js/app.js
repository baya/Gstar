'use strict';


// Declare app level module which depends on filters, and services
angular.module('gStar', ['gStar.filters', 'gStar.services', 'gStar.directives', 'gStar.controllers']).
  config(['$routeProvider', function($routeProvider) {
    $routeProvider.when('/stars', {templateUrl: 'partials/partial1.html', controller: 'StarsCtrl'});
    $routeProvider.when('/view2', {templateUrl: 'partials/partial2.html', controller: 'MyCtrl2'});
    $routeProvider.otherwise({redirectTo: '/stars'});
  }]);
