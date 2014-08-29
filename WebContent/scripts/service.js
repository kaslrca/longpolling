var messageService = angular.module('longpolling.services', []);

function service(env, action, index) {
	var userName = "";
	this.sendMessage = function(msg) {
		$.ajax({
			url: env.ip + "/" + action.send + "/" + index, 
			type: "POST",
			data: msg });
	};
	
	this.saveName = function(name) {
		userName = name;
		$.ajax({
			url: env.ip + "/"+ action.saveName + "/" + index + "/" + name, 
			type: "GET"});
	};
	
	this.listen = function(callback) {
		$.get(env.ip + "/"+ action.listener + "/" + index, null, callback);
	};
	
	this.getUserName = function () {
		return userName;
	};
};

messageService.service('service', ['env', 'action', 'index', service]);