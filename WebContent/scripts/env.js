var env = angular.module('env', []);

env.constant('env', {'ip':'http://10.1.100.76:88', 'ws':'ws://10.1.100.76:89/websocket'});
env.constant('action', {'send':'send', 'saveName':'saveName', 'listener':'listener'});
env.constant('index', Math.floor((Math.random() * 100) + 1));