var messageControllers = angular.module('longpolling.controllers', []);

messageControllers.
	controller('messageCtrl', ['$scope', 'env', 'action', 'service',
	function ($scope, env, action, service) {
		$scope.name = service.getUserName();
		$scope.msg = "";
		$scope.send = function() {
		
			service.sendMessage($scope.msg);
			$scope.msg = ""; 
		};
	}]).
	controller('loginCtrl', ['$scope', 'env', 'action', 'service', '$state',
	function ($scope, env, action, service, $state) {
		$scope.name = "";
		$scope.saveName = function () {
			service.saveName($scope.name);
			$state.go('chart');
		};
	}]);
