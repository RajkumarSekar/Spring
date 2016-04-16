'use strict';
var $routeProviderReference;
var App = angular.module('myApp', ['ngRoute']);

App.config(['$routeProvider',
    '$controllerProvider',
    '$compileProvider',
    '$filterProvider',
    '$provide',
    function ($routeProvider, $controllerProvider, $compileProvider, $filterProvider, $provide) {

        App.controllerProvider = $controllerProvider;
        App.compileProvider = $compileProvider;
        App.routeProvider = $routeProvider;
        App.filterProvider = $filterProvider;
        App.provide = $provide;
        $routeProviderReference = $routeProvider;
//        $routeProvider.
//                when('/dashboard.do', {
//                    templateUrl: 'dashboard.do'
//                }).
//                when('/newcustomer.do', {
//                    templateUrl: 'newcustomer.do'
//                }).
//                when('/newcustomer1.do', {
//                    templateUrl: 'newcustomer1.do'
//                });
    }]);
App.run(function ($rootScope, $routeParams, $http, $route, Utility) {
    $http.get('http://localhost:8084/springDemo/assets/js/route.json').success(function (routes) {
        for (var i = 0; i < routes.length; i++) {
            var currentRoute = routes[i];
            $routeProviderReference
                    .when(currentRoute.name, {
                        templateUrl: currentRoute.templateUrl,
                        title: currentRoute.title,
                        data: currentRoute.data
                    });
        }
        $routeProviderReference.otherwise(
                {redirectTo: 'dashboard.do'});

        $route.reload();

        $rootScope.$on('$routeChangeSuccess', function (event, current, previous) {
            if (current.hasOwnProperty('$$route')) {
                $rootScope.title = current.$$route.title;
            }
            if (angular.isDefined(current.$$route)) {
                //$rootScope.title = Utility.parseTitle(current.$$route.title, $routeParams);
            }
        });
    });
});

App.service('Utility', function () {
    this.parseTitle = function (title, params) {
        //alert(title, params);
    };
});
App.directive('datepicker', function () {
    return function (scope, element, attrs) {
        element.datepicker({
            format: 'dd/mm/yyyy'
        }).on('changeDate', function (e) {
            var modelPath = $(this).attr('ng-model');
            putObject(modelPath, scope, $(this).val());
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

function commonresult(data, type) {
    var myclass = "alert-success";
    if ($.trim(data).substring(0, 3) === "err") {
        myclass = "alert-danger";
    }
    $("#results").hide();
    var res = '<div class="alert ' + myclass + ' fade in"><button class="close" data-dismiss="alert">';
    res += '× </button><i class="fa-fw fa fa-check"></i>';
    res += $.trim(data) + '</div>';
    $("#results").html(res);
    $("#results").fadeIn(500);
    $("#results").delay('7000').fadeOut(1000);
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