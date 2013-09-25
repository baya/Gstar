'use strict';

/* Directives */

angular.module('gStar.directives', []).
    directive('appVersion', ['version', function(version) {
	return function(scope, elm, attrs) {
	    elm.text(version);
	};
    }]).
    directive('editInPlace', [function(){
	return {
	    restrict: 'E',
	    scope: {description: '@description'},
	    template: '<p ng-click="edit()" ng-bind="description"></p><textarea ng-model="description"></textarea>',
	    link: function( $scope, element, attrs ){
		var inputElement = angular.element( element.children()[1] );
		
		element.addClass( 'edit-in-place' );

		$scope.editing = false;

		$scope.edit = function(){
		    $scope.editing = true;
		    element.addClass( 'active' );
		    inputElement[0].focus();
		};

		inputElement.prop( 'onblur', function(){
		    $scope.editing = false;
		    element.removeClass('active');
		});
	    }
	};
    }])
