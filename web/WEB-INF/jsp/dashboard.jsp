<%-- 
    Document   : dashboard
    Created on : 8 Mar, 2016, 10:13:39 AM
    Author     : rajkumar.s
--%>

<%@taglib  uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<sec:authentication var="user" property="principal" />
<c:set var="username" value="${user.username}"/>
<!-- Page Body -->

<div class="row">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="row">
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="databox bg-white radius-bordered">
                    <div class="databox-left bg-themesecondary">
                        <div class="databox-piechart">
                            <div data-toggle="easypiechart" class="easyPieChart" data-barcolor="#fff" data-linecap="butt" data-percent="50" data-animate="500" data-linewidth="3" data-size="47" data-trackcolor="rgba(255,255,255,0.1)"><span class="white font-90">50%</span></div>
                        </div>
                    </div>
                    <div class="databox-right">
                        <span class="databox-number themesecondary">28</span>
                        <div class="databox-text darkgray">NEW TASKS</div>
                        <div class="databox-stat themesecondary radius-bordered">
                            <i class="stat-icon icon-lg fa fa-tasks"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="databox bg-white radius-bordered">
                    <div class="databox-left bg-themethirdcolor">
                        <div class="databox-piechart">
                            <div data-toggle="easypiechart" class="easyPieChart" data-barcolor="#fff" data-linecap="butt" data-percent="15" data-animate="500" data-linewidth="3" data-size="47" data-trackcolor="rgba(255,255,255,0.2)"><span class="white font-90">15%</span></div>
                        </div>
                    </div>
                    <div class="databox-right">
                        <span class="databox-number themethirdcolor">5</span>
                        <div class="databox-text darkgray">NEW MESSAGE</div>
                        <div class="databox-stat themethirdcolor radius-bordered">
                            <i class="stat-icon  icon-lg fa fa-envelope-o"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="databox bg-white radius-bordered">
                    <div class="databox-left bg-themeprimary">
                        <div class="databox-piechart">
                            <div id="users-pie" data-toggle="easypiechart" class="easyPieChart" data-barcolor="#fff" data-linecap="butt" data-percent="76" data-animate="500" data-linewidth="3" data-size="47" data-trackcolor="rgba(255,255,255,0.1)"><span class="white font-90">76%</span></div>
                        </div>
                    </div>
                    <div class="databox-right">
                        <span class="databox-number themeprimary">92</span>
                        <div class="databox-text darkgray">NEW USERS</div>
                        <div class="databox-state bg-themeprimary">
                            <i class="fa fa-check"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="databox bg-white radius-bordered">
                    <div class="databox-left no-padding">
                        <img src="<c:url value="/assets/img/avatars/John-Smith.jpg"/>" style="width:65px; height:65px;">
                    </div>
                    <div class="databox-right padding-top-20">
                        <div class="databox-stat palegreen">
                            <i class="stat-icon icon-xlg fa fa-phone"></i>
                        </div>
                        <div class="databox-text darkgray">JOHN SMITH</div>
                        <div class="databox-text darkgray">TOP RESELLER</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row col-lg-12">
    <sec:authorize access="isAuthenticated()">
        ${user}
    </sec:authorize>
</div>

<div class="row">

    <div class="col-md-12 col-sm-12 col-xs-12" ng-controller="UserController as ctrl">
        <div class="widget">
            <div class="widget-header bordered-bottom bordered-blue">
                <span class="widget-caption"><strong>User Creation</strong></span>
                <div class="buttons-preview">
                    <button class="btn btn-info" onclick="showModal()" data-accesskey="v">
                        <i class="fa fa-search"></i><u class="scut">V</u>iew</button>
                </div>
            </div>
            <div class="widget-body">
                <form id="CMForm" name="myForm" ng-submit="ctrl.submit()" method="post" class="form-horizontal bv-form" novalidate><button type="submit" class="bv-hidden-submit" style="display: none; width: 0px; height: 0px;"></button>
                    <div class="col-md-12">
                        <div class="form-group col-md-6 has-feedback">
                            <label class="col-md-5 control-label"><strong>User <u class="scut">N</u>ame*</strong></label>
                            <div class="col-md-7">
                                <input type="text" ng-model="ctrl.user.username" class="form-control" name="customerName" id="customerName" data-html="true" data-placement="left" placeholder="Customer Name" data-bv-notempty="true" data-bv-notempty-message="The Customer Name is required and cannot be empty" data-accesskey="c" data-bv-field="customerName"><i class="form-control-feedback" data-bv-icon-for="customerName" style="display: none;"></i>
                                <small class="help-block" data-bv-validator="notEmpty" data-bv-for="customerName" data-bv-result="NOT_VALIDATED" style="display: none;">The Customer Name is required and cannot be empty</small></div>
                        </div>
                        <div class="form-group col-md-6 has-feedback">
                            <label class="col-md-5 control-label"><strong><u class="scut">A</u>ddress*</strong></label>
                            <div class="col-md-7">
                                <textarea class="form-control" ng-model="ctrl.user.address" name="address" id="address" data-html="true" data-placement="left" placeholder="Address" data-bv-notempty="true" data-bv-notempty-message="Customer Address is required and cannot be empty" data-accesskey="a" data-bv-field="address"></textarea><i class="form-control-feedback" data-bv-icon-for="address" style="display: none;"></i>

                                <small class="help-block" data-bv-validator="notEmpty" data-bv-for="address" data-bv-result="NOT_VALIDATED" style="display: none;">Customer Address is required and cannot be empty</small></div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group col-md-6">
                            <label class="col-md-5 control-label"><strong> Email</strong></label>
                            <div class="col-md-7">
                                <input type="email" ng-model="ctrl.user.email" class="form-control" name="city" id="city" data-html="true" data-placement="left" placeholder="City">

                            </div>
                        </div>

                    </div>


                    <div class="form-group">
                        <div class="col-md-offset-6 col-md-8">
                            <button type="submit" class="btn btn-blue" data-accesskey="s">{{(ctrl.user.id!=null)?"Update":"Create"}}</button>
                        </div>
                    </div>                                
                </form>
                <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>ID.</th>
                                <th>Name</th>
                                <th>Address</th>
                                <th>Email</th>
                                <sec:authorize access="hasRole('ADMIN')">
                                <th width="20%"></th>
                                </sec:authorize>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="u in ctrl.users">
                                <td><span ng-bind="u.id"></span></td>
                                <td><span ng-bind="u.username"></span></td>
                                <td><span ng-bind="u.address"></span></td>
                                <td><span ng-bind="u.email"></span></td>
                                <sec:authorize access="hasRole('ADMIN')">
                                <td>
                                    <button type="button" ng-click="ctrl.edit(u.id)" class="btn btn-success btn-xs">Edit</button>  
                                    <button type="button" ng-click="ctrl.remove(u.id)" class="btn btn-danger btn-xs">Remove</button>
                                </td>
                                </sec:authorize>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>


</div>

<script>
    
        //-------------------------Initiates Easy Pie Chart instances in page--------------------//
        InitiateEasyPieChart.init();
   
</script>
<!-- /Page Body -->

