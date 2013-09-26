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
		var inputElement = $( element.children()[1] );
		var textElement = $( element.children()[0] );
		
		
		element.addClass( 'edit-in-place' );

		$scope.editing = false;

		$scope.edit = function(){
		    $scope.editing = true;
		    element.addClass( 'active' );
		    var textHeight = textElement.height();
		    var patchHeight = 4
		    inputElement.height(textHeight + patchHeight);
		    inputElement[0].focus();
		};

		inputElement.on( 'blur', function(){
		    $scope.editing = false;
		    $(element).removeClass( 'active' );
		    // $scope.description = 'OK'
		    // textElement.text($scope.description);
		});
	    }
	};
    }])
