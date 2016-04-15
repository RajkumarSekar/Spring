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
            when('/newcustomer1.do', {
                templateUrl: 'newcustomer1.do'
            }).
            otherwise({
                redirectTo: '/dashboard.do'
            });
});
App.directive('datepicker', function () {
    return function (scope, element, attrs) {
        element.datepicker({
            format: 'dd/mm/yyyy'
        }).on('changeDate', function (e) {
            var modelPath = $(this).attr('ng-model');   
            putObject(modelPath, scope,$(this).val());
            //scope[modelPath] = $(this).val();
            scope.$apply();
        });
    };
});

function putObject(path, object, value) {
    var modelPath = path.split(".");

    function fill(object, elements, depth, value) {
        var hasNext = ((depth + 1) < elements.length);
        if (depth < elements.length && hasNext) {
            if (!object.hasOwnProperty(modelPath[depth])) {
                object[modelPath[depth]] = {};
            }
            fill(object[modelPath[depth]], elements, ++depth, value);
        } else {
            object[modelPath[depth]] = value;
        }
    }
    fill(object, modelPath, 0, value);
}

/*
 App.controller('customerController',[function(){
 var self = this;
 self.test = 'test';
 }]);
 
 App.controller('newcustomercontroller', function ($scope) {
 $scope.check = "checking";
 });
 */