'use strict';

/* Directives */

angular.module('gStar.directives', []).
    directive('appVersion', ['version', function(version) {
	return function(scope, elm, attrs) {
	    elm.text(version);
	};
    }]).
    directive('editInPlace', ['$compile', 'SaveStarDescription', function($compile, SaveStarDescription){
	return {
	    restrict: 'E',
	    scope: {descriptionhtml: '@', starid: '@', description: '@'},
	    template: '<p ng-click="edit()" ng-bind-html="descriptionhtml"></p>'+
		'<textarea ng-model="description"></textarea>',
	    controller: 'StarsCtrl',
	    link: function( $scope, element, attrs, ctrl ){
		var inputElement = $( element.children()[1] );
		var textElement = $( element.children()[0] );
		var dataCache = {};

		element.addClass( 'edit-in-place' );

		$scope.editing = false;

		inputElement.on('focus', function(){
		    var txt = $(this).val();
		    $(this).val('');
		    $(this).val(txt);
		})

		$scope.edit = function(){
		    $scope.editing = true;
		    element.addClass( 'active' );
		    var textHeight = textElement.height();
		    var patchHeight = 16;
		    dataCache.origDescription = textElement.text();
		    inputElement.height(textHeight + patchHeight);
		    
		    inputElement.focus();
		};

		inputElement.on( 'blur', function(){
		    $scope.editing = false;
		    $(element).removeClass( 'active' );
		    if(dataCache.origDescription != $scope.description){
			var data = {id: $scope.starid, description: $scope.description};
			var nr = new SaveStarDescription(data)
			nr.$save();
			$scope.descriptionhtml = nr.description.replace($scope.re, $scope.hit);
		    }
		});
	    }
	};
    }])
