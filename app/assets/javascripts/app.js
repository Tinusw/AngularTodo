// require Angular Module

var app = angular.module('todo', []);

// Workaround for turbolinks gem

$(document).on('ready page:load', function() {
	angular.bootstrap(document.body, ['todo'])
});

app.controller('ItemsCtrl', ['$scope', function($scope){
  // Here will be all code belonging to this controller
  $scope.items =[
	  {desc: "do groceries", done: "yes", crit: 1},
    {desc: "cut hair", done: "no", crit: 3},
    {desc: "fight my mom", done: "no"}
    ];
}]);