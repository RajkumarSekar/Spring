<%-- 
    Document   : chat
    Created on : 9 Mar, 2016, 11:37:58 AM
    Author     : rajkumar.s
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en" ng-app>
  <head>
    <title>Chat Example</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="<c:url value="/assets/css/bootstrap.min.css"/>" rel="stylesheet" />
    <style>
      body {
        padding-top: 60px;
      }
    </style>
    <script>
      function ChatController($scope) {
        var socket = io.connect('http://abcom277:3000');

        $scope.messages = [];
        $scope.roster = [];
        $scope.name = '';
        $scope.text = '';

        socket.on('connect', function () {
          $scope.setName();
        });

        socket.on('message', function (msg) {
          $scope.messages.push(msg);
          $scope.$apply();
        });

        socket.on('roster', function (names) {
          $scope.roster = names;
          $scope.$apply();
        });

        $scope.send = function send() {
          console.log('Sending message:', $scope.text);
          socket.emit('message', $scope.text);
          $scope.text = '';
        };

        $scope.setName = function setName() {
          socket.emit('identify', $scope.name);
        };
        socket.on('temp',function(data){
            console.log(data);
        });
      }
    </script>
  </head>
  <body>
    <div class="container" ng-controller="ChatController">
      <div class="navbar navbar-fixed-top navbar-inverse">
        <div class="navbar-inner">
          <div class="pull-right">
            <a href="https://c9.io" class="brand">Cloud9 IDE</a>
          </div>
        </div>
      </div>
      <div class="page-header">
        <h1>Chat Example</h1>
      </div>
      <div class="row">
        <div class="span3">
          <ul class="nav nav-list well">
            <li class="nav-header">Local Users</li>
            <li ng-repeat="user in roster" ng-bind="user">
            </li>
          </ul>
        </div>
        <div class="span9">
          <table class="table table-striped table-bordered">
            <thead>
              <tr>
                <th class="span2">Name</th>
                <th class="span7">Text</th>
              </tr>
            </thead>
            <tbody>
              <tr ng-repeat="msg in messages">
                <td class="span2" ng-bind="msg.name"></td>
                <td class="span7" ng-bind="msg.text"></td>
              </tr>
            </tbody>
          </table>
          <div class="row controls">
            <form ng-submit="send()">
              <div class="span2"><input type="text" class="input-block-level" ng-model="name" ng-change="setName()" placeholder="Your Name"></div>
              <div class="input-append span7">
                <input type="text" class="span6" ng-model="text" placeholder="Message">
                <input type="submit" class="span1 btn btn-primary" value="Send" ng-disabled="!text">
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    <script src="http://abcom277:3000/socket.io/socket.io.js"></script>
    <script src="<c:url value="/assets/js/jquery.min.js"/>"></script>
    <script src="<c:url value="/assets/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/assets/js/angular.min.js"/>"></script>
  </body>
</html>


