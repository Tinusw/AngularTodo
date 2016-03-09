// require Angular Module

var app = angular.module('todo', []);

// Workaround for turbolinks gem

$(document).on('ready page:load', function() {
	angular.bootstrap(document.body, ['todo'])
});

app.controller('ItemsCtrl', ['$scope', function($scope){
  // Here will be all code belonging to this controller
  $scope.items =[
	  {desc: "do groceries", crit: 1},
    {desc: "cut hair",  crit: 3},
    {desc: "fight my mom", crit: 2}
    ];
  
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