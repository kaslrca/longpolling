<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp">
<head>
	<link href="scripts/bootstrap-theme.css" rel="stylesheet" type="text/css" />
	<link href="scripts/bootstrap.css" rel="stylesheet" type="text/css" />
	<script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.14/angular.min.js"></script>
	<script src="scripts/bootstrap.min.js"></script>
	<script src="scripts/directive.js"></script>
	<script src="scripts/env.js"></script>
		
	<script type="text/javascript">
	
	var myApp = angular.module('myApp', ['directive', 'env']);
	
	myApp.controller('messageCtrl', ['$scope', 'env',
    	function messageCtrl($scope, env) {
		
			var socket = null;
			$scope.msg = "";
			
			$scope.send = function() {  
				if (!window.WebSocket) { return; }

				if (socket.readyState == WebSocket.OPEN) { 
					socket.send($scope.msg);
					$scope.msg = "";
				} else { 
					alert("The socket is not open."); 
				}
			};
		
			$scope.openSocket = function() {
				if(socket)
					return;
				
				console.log('openSocket');
				
				if (window.WebSocket) {
					socket = new WebSocket(env.ws);
					socket.onmessage = function(event) { 
						$("#context").html($("#context").html() + "<br />" + event.data );
						$("#context").scrollTop($("#context")[0].scrollHeight);
					};
					socket.onopen = function(event) { };
					socket.onclose = function(event) { };
				} else {
					alert("Your browser does not support Web Socket.");
				}
			};
			
			$scope.closeSocket = function() { 
				socket.close();
				socket = null;
			};
	 
	}]);
	</script>
  
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title></title>

</head>
<body ng-controller="messageCtrl" style="padding-top: 30px;">
	<div class="container">
		<div class="panel panel-default" style="width:380px">
			<div class="panel-heading"> web socket </div>
			<div class="panel-body" id="context" style="height:400px;overflow:auto;"></div>
			<input type="text" class="form-control" ng-model="msg"  ng-enter="send()"/>
		</div>
		<input type="button" class="btn btn-primary" value="Open Web Socket Data" ng-click="openSocket()" />
		<input type="button" class="btn btn-primary" value="Close Web Socket" ng-click="closeSocket()" />
	</div>
	
</body>
</html>