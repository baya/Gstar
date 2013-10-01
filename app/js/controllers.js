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
	var q = $routeParams.q;
	var ws = q.split(" ").join("|");
	$scope.newRegex = function(){
	    return new RegExp("("+ ws +")","ig");
	}
	$scope.regex = $scope.newRegex();
	$scope.hit = '<em>$1</em>';
	$scope.stars = SearchStars.query($routeParams);
    }]);
