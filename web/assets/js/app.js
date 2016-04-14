'use strict';

var App = angular.module('myApp', ['ngRoute']);

App.config(function ($routeProvider, $controllerProvider, $compileProvider, $filterProvider, $provide) {

    App.controllerProvider = $controllerProvider;
    App.compileProvider = $compileProvider;
    App.routeProvider = $routeProvider;
    App.filterProvider = $filterProvider;
    App.provide = $provide;

    $routeProvider.
            when('/dashboard.do', {
                templateUrl: 'dashboard.do'
            }).
            when('/newcustomer.do', {
                templateUrl: 'newcustomer.do',
                controller: 'customerController'
            }).
            otherwise({
                redirectTo: '/dashboard.do'
            });
});

/*
 App.controller('customerController',[function(){
 var self = this;
 self.test = 'test';
 }]);
 
 App.controller('newcustomercontroller', function ($scope) {
 $scope.check = "checking";
 });
 */