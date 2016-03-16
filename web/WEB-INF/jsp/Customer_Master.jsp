
<%-- 
    Document   : Customer Master
    Created on : 14 Mar, 2016, 4:46:59 PM
    Author     : admin
--%>
<%@ page language="java" import="java.sql.*"  pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Page Body -->
<div class="page-body">
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div id="results"></div>
        </div>
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="widget">
                        <div class="widget-header bordered-bottom bordered-blue">
                            <span class="widget-caption"><strong>Customer Master</strong></span>
                            <div class="buttons-preview">
                                <button class="btn btn-info" onclick="showModal()" data-accesskey='v'>
                                    <i class="fa fa-search"></i><u class="scut">V</u >iew</button>
                            </div>
                        </div>
                        <div class="widget-body">
                            <form id="CMForm" method="post" class="form-horizontal bv-form" novalidate="novalidate">
                                <div class="col-md-12">
                                    <div class="form-group col-md-6">
                                        <label class="col-md-5 control-label"><strong>Customer <u class="scut">N</u>ame*</strong></label>
                                        <div class="col-md-7">
                                            <input type="text" class="form-control" name="customerName" id="customerName" 
                                                   data-html="true" data-placement="left" placeholder="Customer Name"
                                                   data-bv-notempty="true"
                                                   data-bv-notempty-message="The Customer Name is required and cannot be empty" data-accesskey='c'/>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="col-md-5 control-label"><strong><u class="scut">A</u>ddress*</strong></label>
                                        <div class="col-md-7">
                                            <textarea class="form-control" name="address" id="address"
                                                      data-html="true" data-placement="left" placeholder="Address"
                                                      data-bv-notempty="true"
                                                      data-bv-notempty-message="Customer Address is required and cannot be empty" data-accesskey='a'/></textarea>

                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-group col-md-6">
                                        <label class="col-md-5 control-label"><strong> City</strong></label>
                                        <div class="col-md-7">
                                            <input type="text" class="form-control" name="city" id="city" 
                                                      data-html="true" data-placement="left" placeholder="City"/>

                                        </div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="col-md-5 control-label"><strong> Postal Code</strong></label>
                                        <div class="col-md-7">
                                            <input type="text" class="form-control" name="postalCode" id="postalCode" 
                                                      data-html="true" data-placement="left" placeholder="City"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group col-md-6">
                                        <label class="col-md-5 control-label"><strong> Country</strong></label>
                                        <div class="col-md-7">
                                            <select class="form-control" name="country" id="country" 
                                                      data-html="true" data-placement="left" placeholder="Country">
                                                <option value="">-Select-</option>
                                                <c:if test="${not empty countryList}">
                                                    <c:forEach items="${countryList}" var="country">
                                                        <option value="${country.countryId}">${country.countryName}</option>
                                                    </c:forEach>
                                                </c:if>
                                            </select>

                                        </div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="col-md-5 control-label"><strong> State</strong></label>
                                        <div class="col-md-7">
                                            <select class="form-control" name="state" id="state" 
                                                      data-html="true" data-placement="left" placeholder="State">
                                                <option value="">-Select-</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group col-md-6">
                                        <label class="col-md-5 control-label"><strong> <u class="scut">T</u>IN*</strong></label>
                                        <div class="col-md-7">
                                            <input type="text" class="form-control" name="TIN" id="TIN" data-html="true"
                                                      data-placement="left" placeholder="TIN"
                                                      data-bv-notempty="true"
                                                      data-bv-notempty-message="The TIN is required and cannot be empty" data-accesskey='a'
                                                      />

                                        </div>
                                    </div>
                                </div> 
                                <div class="col-md-12">
                                    <div class="form-group col-md-6">
                                        <label class="col-md-5 control-label"><strong> <u class="scut">C</u>STNO</strong></label>
                                        <div class="col-md-7">
                                            <input type="text" class="form-control capsON" name="CSTNo" id="CSTNo"
                                                   data-html="true" data-placement="left" placeholder="CSTNO"
                                                   />
                                        </div>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label class="col-md-5 control-label"><strong>CST<u class="scut">D</u>ate</strong></label>

                                        <div class="col-md-7">
                                            <div class="input-group">
                                                <input type="text" class="form-control" name="CSTDate" id="CSTDate" placeholder="CSTDate" data-accesskey="D" data-date-format="yyyy-mm-dd" readonly="">
                                                <span class="input-group-addon">
                                                    <i class="fa fa-calendar"></i>
                                                </span>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group col-md-6">
                                        <label class="col-md-5 control-label"><strong> <u class="scut">P</u>hone No</strong></label>
                                        <div class="col-md-7">
                                            <input type="text" class="form-control capsON" name="phone" id="phone"  
                                                   data-html="true" data-placement="left" placeholder="Phone No"
                                                   />
                                        </div>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label class="col-md-5 control-label"><strong> <u class="scut">F</u>ax</strong></label>
                                        <div class="col-md-7">
                                            <input type="text" class="form-control capsON" name="fax" id="fax" 
                                                   data-html="true" data-placement="left" placeholder="Fax"
                                                   />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group col-md-6">
                                        <label class="col-md-5 control-label"><strong> <u class="scut">E</u>mail ID</strong></label>
                                        <div class="col-md-7">
                                            <input type="text" class="form-control capsON" name="emailId" id="emailId"  
                                                   data-html="true" data-placement="left" placeholder="Email Id"
                                                   />
                                        </div>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label class="col-md-5 control-label"><strong> <u class="scut">W</u>ebsite </strong></label>
                                        <div class="col-md-7">
                                            <input type="text" class="form-control capsON" name="website" id="website"  
                                                   data-html="true" data-placement="left" placeholder="Website"
                                                   />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group col-md-6">
                                        <label class="col-md-5 control-label"><strong> <u class="scut">C</u>ontact Name</strong></label>
                                        <div class="col-md-7">
                                            <input type="text" class="form-control capsON" name="contact" id="contact"  
                                                   data-html="true" data-placement="left" placeholder="Contact"
                                                   />
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="col-md-5 control-label"><strong> <u class="scut">C</u>ontact Phone No</strong></label>
                                        <div class="col-md-7">
                                            <input type="text" class="form-control capsON" name="contactPhone" id="contactPhone"   
                                                   data-html="true" data-placement="left" placeholder="Contact Phone No"
                                                   />
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-md-offset-6 col-md-8">                                        
                                        <input type="hidden" name="prefix" id="prefix" value="">
                                        <button type="submit" class="btn btn-blue" data-accesskey='s'><u class="scut">S</u>ubmit</button>
                                    </div>
                                </div>                                
                            </form>
                            <div id="test"></div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>
</div>
<!-- /Page Body -->

<script>

    $(document).ready(function () {
        $('#cstdate').datepicker({
            format: 'dd-mm-yyyy'
        }).on('changeDate show', function (e) {
            $('#CMForm').bootstrapValidator('revalidateField', 'cstdate');
        });

        $('#country').on('change',function(){
            $.ajax({
                url: "getStates.do",
                type: 'POST',
                data: {cid: $("#country").val()},
                success: function (data, textStatus, jqXHR) {
                    var option="<option>-Select-</option>"
                    for(var i=0; i<data.length; i++){
                        option += "<option value='"+data[i][0]+"'>"+data[i][1]+"</option>"
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
        $('#CMForm').bootstrapValidator({
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
            $.ajax({
                url: "soreCustomer.do",
                type: 'POST',
                cache: false,
                async: false,
                data: $("#CMForm").serialize(),
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
                }
            });

        });
    });

</script>

