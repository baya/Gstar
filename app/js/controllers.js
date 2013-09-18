'use strict';

/* Controllers */

angular.module('gStar.controllers', []).
    controller('StarsCtrl', ['$scope', '$routeParams', 'SearchStars', function($scope, $routeParams, SearchStars){
	$scope.stars = SearchStars.get({q: $routeParams.q});
    }]).
    controller('MyCtrl2', [function() {
    }]);