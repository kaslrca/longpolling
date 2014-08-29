<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="longpolling">
<head>
	<link href="scripts/bootstrap-theme.css" rel="stylesheet" type="text/css" />
	<link href="scripts/bootstrap.css" rel="stylesheet" type="text/css" />
	<script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.14/angular.min.js"></script>
	<script src="scripts/bootstrap.min.js"></script>
	<script src="scripts/env.js"></script>
	<script src="scripts/directive.js"></script>
	<script src="scripts/service.js"></script>
	<script src="scripts/controller.js"></script>
	
	<script type="text/javascript">
	
	var myApp =  angular.module('longpolling', ['env', 'longpolling.controllers', 'longpolling.services', 'directive']);

	myApp.run(['service', function(service){
		angular.element(document).ready(function() {
			
			var polling = false;
			window.setInterval(function () {
				if (!polling) {
					polling = true;
		
					service.listen(function(r) {
						$("#context").html($("#context").html() + "<br />" + r );
						$("#context").scrollTop($("#context")[0].scrollHeight);
						polling = false;
					});
				}
			}, 300);
		});
	}]);
	</script>
  
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title></title>

</head>
<body ng-controller="messageCtrl" style="padding-top: 30px;">
	<div class="container">
		<div class="panel panel-default" style="width:380px">
			<div class="panel-heading">
				<div ng-hide="hasName" class="ng-hide" ><input type="text" ng-model="name" ng-enter="saveName()" /></div>
				<div ng-show="hasName" ><div>{{name}}</div></div>
			</div>
			<div class="panel-body" id="context" style="height:400px;overflow:auto;"></div>
			<input type="text" class="form-control" ng-model="msg"  ng-enter="send()"/>
		</div>
	</div>
	
</body>
</html>