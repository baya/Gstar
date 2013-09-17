'use strict';

/* Controllers */

angular.module('gStar.controllers', []).
    controller('StarsCtrl', [function() {
    }])
    .controller('SearchStarsCtrl', ['$scope', function($scope){
	$scope.q = '';
	$scope.submit = function(){
	    if (this.q){
		alert(this.q);
	    } else {
		alert('OK');
	    }
	    
	}
    }])
    .controller('MyCtrl2', [function() {

    }]);