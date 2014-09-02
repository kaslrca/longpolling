var modules = ['ui.router', 'ngAnimate', 'env', 'longpolling.controllers', 'longpolling.services', 'directive'];
var myApp =  angular.module('longpolling.module', modules);

myApp.config(['$stateProvider', '$urlRouterProvider', '$locationProvider', 
	function($stateProvider, $urlRouterProvider, $locationProvider) {
		$stateProvider
			.state('login', {
				url: '/', 
				views: {
					"master": {
						controller: 'loginCtrl', 
						templateUrl: 'login.html'
					}
				}
			})
			.state('chart', {
				url: '/chart', 
				views: {
					"master": {
						templateUrl: 'chart.html'
					},
					"board@chart":{
						templateUrl: 'context.html'
					}, 
					"keyIn@chart":{
						controller: 'messageCtrl',
						templateUrl: 'KeyIn.html'
					}
				}
			});
}]);