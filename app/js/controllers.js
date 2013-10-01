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
	var res = SearchStars.get($routeParams, function(){
	    $scope.stars = res.stars;
	    $scope.getPages = function(){
		var pages = [];
		var pageCount = res.total / res.limit;
		if(res.total % res.limit > 0){
		    pageCount = pageCount + 1;
		}
		pageCount = Math.floor(pageCount);

		for(var i = 0; i < pageCount; i++){
		    var num = i + 1;
		    var start = i * res.limit;
		    var current = res.start == res.limit * i ? 'current' : ''
		    var page = {num: num, href: '#', current: current};
   		    page.href = '/#/stars?' + 'q=' + q + '&start=' + start;
		    
		    pages[i] = page;
		}

		return pages;
	    };

	    $scope.pages = $scope.getPages();
	    $scope.hide = false;

	});

	$scope.newRegex = function(){
	    return new RegExp("("+ ws +")","ig");
	}
	
	$scope.regex = $scope.newRegex();
	$scope.hit = '<em>$1</em>';
	$scope.hide = true;

    }]);
