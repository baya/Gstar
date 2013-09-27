'use strict';

/* Services */

// In this case it is a simple value service.
angular.module('gStar.services', ['ngResource']).
    value('version', '0.1').
    factory('SearchStars', ['$resource', function($resource){
	return $resource('/stars?q=:q')
    }]).
    factory('SaveStarDescription', ['$resource', function($resource){
	return $resource('/saveStarDescription')
    }])
