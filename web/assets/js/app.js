'use strict';

var App = angular.module('myApp', ['ngRoute']);

App.config(function ($routeProvider) {
    $routeProvider.
            when('/dashboard.do', {
                templateUrl: 'dashboard.do'
            }).
            when('/newcustomer.do', {
                templateUrl: 'newcustomer.do' 
            }).
            otherwise({
                redirectTo: '/dashboard.do'
            });
});

/*
App.controller('dashboardController', function ($scope) {
    $scope.test = "test";
});

App.controller('newcustomercontroller', function ($scope) {
    $scope.check = "checking";
});
*/