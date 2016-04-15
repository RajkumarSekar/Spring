'use strict'
App.controllerProvider.register('customerController', ['$scope', '$http', function ($scope, $http) {

        $scope.submitCustomer = function () {

            // check to make sure the form is completely valid
            //if ($scope.CMForm.$valid) {
                // var customerObj = $('#CMForm').serialize();



               /* var customerObj = {
                    "customerName": $scope.customerName,
                    "address": $scope.address,
                    "city": $scope.city,
                    "postalCode": $scope.postalCode,
                    "country": {"countryId": $scope.country},
                    "state": {"SID": $scope.state},
                    "TIN": $scope.TIN,
                    "CSTNo": $scope.CSTNo,
                    "CSTDate": $scope.CSTDate,
                    "phone": $scope.phone,
                    "fax": $scope.fax,
                    "emailId": $scope.emailId,
                    "website": $scope.website,
                    "contact": $scope.contact,
                    "contactPhone": $scope.contactPhone
                };*/

                var customerObj = {
                    "customerName":$scope.customerName,
                    "address":$scope.address,
                    "city":$scope.city,
                    "state":{"sid": $scope.state},
                    "postalCode":$scope.postalCode,
                    "country":{"countryId": $scope.country},
                    "tin":$scope.TIN,
                    "cstno":$scope.CSTNo,
                    "cstdate":$scope.CSTDate,
                    "phone":$scope.phone,
                    "fax":$scope.fax,
                    "emailId":$scope.emailId,
                    "website":$scope.website,
                    "contact":$scope.contact,
                    "contactPhone":$scope.contactPhone
                }

                console.log(customerObj);
                var response = $http.post('soreCustomer1.do', customerObj);
                response.success(function (data, status, headers, config) {
                    console.log(data);
                });
                response.error(function (data, status, headers, config) {
                    alert("Exception details: " + JSON.stringify({data: data}));
                });

            //}

        };
    }]);


$(document).ready(function () {
//    $('#CSTDate').datepicker({
//        format: 'dd-mm-yyyy',
//        onRender: function (date) {
//                return date.valueOf();
//            }
//    }).on("changeDate",function(e){
//        
//        $('#CSTDate').trigger('keydown');
//    });
    $('#country').on('change', function () {
        $.ajax({
            url: "getStates.do",
            type: 'POST',
            data: {cid: $("#country").val()},
            success: function (data, textStatus, jqXHR) {
                var option = "<option value=''>-Select-</option>"
                for (var i = 0; i < data.length; i++) {
                    option += "<option value='" + data[i][0] + "'>" + data[i][1] + "</option>"
                }
                $("#state").html(option);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                //$('#test').html(jqXHR.responseText);
                //alert("Error: "+jqXHR.responseText);
                alert(errorThrown);
            }
        });
    });

});

