// require Angular Module

var app = angular.module('todo', ['ngResource']);

// Workaround for turbolinks gem

$(document).on('ready page:load', function() {
	angular.bootstrap(document.body, ['todo'])
});

// Require factory angular service

app.factory('models', ['$resource',function($resource){
	var items_model = $resource("items/:id.json", {id: "@id"});
	var x = {
		items: items_model
	};
	return x;
}]);

// Items Controller
app.controller('ItemsCtrl', ['$scope', 'models', function($scope, models){

	// Setting items = to our models factory
	$scope.items = models.items.query();
  
  // Add an item
  $scope.addItem = function(){
  	item = models.items.save($scope.newItem, function(){
  		recent_item = models.items.get({id: item.id});
  		$scope.items.push(recent_item);
  		$scope.newItem = '';
  	});
}
  
  //Delete an item
  $scope.deleteItem = function(item){
  	models.items.delete(item);
  	$scope.items.splice($scope.items.indexOf(item), 1);
  }
}]);