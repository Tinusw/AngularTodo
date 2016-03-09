// require Angular Module

var app = angular.module('todo', []);

// Require factory angular service

app.factory('models', [function(){
	var x = {
		items: []
	};
	return x;
}]);

// Workaround for turbolinks gem

$(document).on('ready page:load', function() {
	angular.bootstrap(document.body, ['todo'])
});

// Actual Controller
app.controller('ItemsCtrl', ['$scope', 'models', function($scope, models){

	// Setting items = to our models factory
	$scope.items = models.items;
  
  // Add an item
  $scope.addItem = function(){
  	if(!$scope.newItem.desc === ''){ return; }
  	// if user doesn't select crit value, auto-assign '3'
  	// if(!$scope.newItem.crit === ''){ return '3'}
	  $scope.items.push($scope.newItem);
}
  
  //Delete an item
  $scope.deleteItem = function(item){
  	$scope.items.splice($scope.items.indexOf(item), 1);
  }
}]);