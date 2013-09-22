'use strict';

/* Controllers */

angular.module('gStar.controllers', []).
    controller('SearchFormCtrl', ['$scope', '$location', function($scope, $location){
	$scope.q = $location.search().q;
	$scope.submit = function(){
	    if(this.q){
		$location.path('stars').search({q: this.q});
	    }
	};
    }]).
    controller('StarsCtrl', ['$scope', '$routeParams', 'SearchStars', function($scope, $routeParams, SearchStars){
	$scope.stars = SearchStars.query({q: $routeParams.q});
    }]).
    controller('MyCtrl2', [function() {
    }]);