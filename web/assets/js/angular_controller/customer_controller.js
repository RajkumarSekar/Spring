'use strict'
App.controllerProvider.register('customerController', ['$scope', '$http', function ($scope, $http) {
        $scope.list = [];
        $scope.submitCustomer = function () {



            //var customerObj = {"customerName": "cust", "address": "address", "city": "city",  "TIN": "tin", "CSTNo": "cstno", "phone": "789654", "fax": "fax", "emailId": "email", "website": "web", "contact": "cont", "contactPhone": "cont"};
            var customerObj = {"customerName": "cust name", "country.countryId":98};

            //console.log(JSON.stringify(customerObj));
            var response = $http.post('soreCustomer.do', customerObj);
            response.success(function (data, status, headers, config) {
                console.log("user return data", data);
                $scope.list.push(data);
            });
            response.error(function (data, status, headers, config) {
                alert("Exception details: " + JSON.stringify({data: data}));
            });
//            // check to make sure the form is completely valid
//            if ($scope.CMForm.$valid) {
//                // var customerObj = $('#CMForm').serialize();              
//
//
//
//
//
//            }

        };
    }]);


$(document).ready(function () {
    $('#CSTDate').datepicker({
        format: 'dd-mm-yyyy'
    });
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
    var prefix = '';
    /*    $('#CMForm').bootstrapValidator({
     // Only disabled elements are excluded
     // The invisible elements belonging to inactive tabs must be validated
     excluded: [':disabled'],
     feedbackIcons: {
     valid: 'glyphicon glyphicon-ok',
     invalid: 'glyphicon glyphicon-remove',
     validating: 'glyphicon glyphicon-refresh'
     },
     submitHandler: function (validator, form, submitButton) {
     
     },
     fields: {
     customerName: {
     validators: {
     notEmpty: {
     message: 'Please Enter Customer Name'
     }
     }
     },
     address: {
     validators: {
     notEmpty: {
     message: 'Please Enter Address'
     }
     }
     },
     TIN: {
     validators: {
     notEmpty: {
     message: 'Please Enter TIN'
     }
     }
     }
     }
     }).on('success.form.bv', function (e) {
     // Prevent submit form
     e.preventDefault();
     var $form = $(e.target),
     validator = $form.data('bootstrapValidator');
     var customerObj = $('#CMForm').serializeObject();
     console.log(customerObj);
     $.ajax({
     url: "soreCustomer.do",
     type: 'POST',
     cache: false,
     async: false,
     contentType: 'application/json',
     dataType: 'json',
     data: customerObj,
     success: function (data)
     {
     var myclass = "alert-success";
     if ($.trim(data).substring(0, 3) === "err")
     {
     myclass = "alert-danger";
     }
     $("#results").hide();
     var res = '<div class="alert ' + myclass + ' fade in"><button class="close" data-dismiss="alert">';
     res += '× </button><i class="fa-fw fa fa-check"></i>';
     res += $.trim(data) + '</div>';
     $("#results").html(res);
     $("#results").fadeIn(500);
     $("#results").delay('7000').fadeOut(1000);
     $('#CMForm')[0].reset();
     $('#CMForm').bootstrapValidator('resetForm', true);
     $('#mmname').focus();
     },
     error: function (jqXHR, textStatus, errorThrown) {
     $('#test').html(jqXHR.responseText);
     //alert("Error: "+jqXHR.responseText);
     //alert(errorThrown);
     }
     });
     });*/
});

