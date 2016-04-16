'use strict'
App.controllerProvider.register('customerController', ['$scope', '$http', function ($scope, $http) {
        var customer = function () {
            return {
                "customerName": null,
                "address": null,
                "city": null,
                "state": {"sid": null},
                "postalCode": null,
                "country": {"countryId": null},
                "tin": null,
                "cstno": null,
                "cstdate": null,
                "phone": null,
                "fax": null,
                "emailId": null,
                "website": null,
                "contact": null,
                "contactPhone": null
            }
        };

        $scope.cust = customer();
        $scope.submitCustomer = function () {
            $scope.submitted = true;
            // check to make sure the form is completely valid
            if ($scope.CMForm.$valid) {
                $scope.submitted = false;
                var response = $http.post('soreCustomer.do', $scope.cust);
                response.success(function (data, status, headers, config) {
                    $scope.cust = customer();
                    $scope.CMForm.$setPristine();
                    commonresult(data.customerName);
                });
                response.error(function (data, status, headers, config) {
                    console.log(data);                    
                });
            }
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

