<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<div class="container" style="background-color: #f2f2f2">
    <div class="row">
    	<c:if test="${empty sessionScope.user }">
	        <!--未登录显示-->
	        <div class="col-sm-3 text-center">
	        	<br>
	            <span style="font-size:18px;">欢迎来到松子直租，请<a href="/skipLoginPage.action">登陆</a></span>
	        	<br>
	        	<br>
	        </div>
        </c:if>
        <c:if test="${sessionScope.user != null}">
        	<div class="col-sm-3 text-center">
        		<h5>欢迎光临寒舍~</h5>
	        </div>
	        <!--登陆显示-->
	        <div class="col-sm-8 text-right">
	            <!-- Single button -->
	            <span class="glyphicon glyphicon-user"></span>
	            <div class="btn-group">
	                <button type="button" style="background-color: #f2f2f2;border: none" class="btn btn-default dropdown-toggle" data-toggle="dropdown"
	                        aria-haspopup="true" aria-expanded="false">${sessionScope.user.uname }&nbsp;<span class="caret"></span>
	                </button>
	                <ul class="dropdown-menu">
	                    <li><a href="/user/skipPersonInfoPage.action">个人中心</a></li>
	                    <!-- <li><a href="/skipMyHousePage.action">我的房源</a></li> -->
	                    <!-- <li><a href="/skipMyFavorPage.action">我的收藏</a></li> -->
	                    <li><a href="/user/exit.action">退出</a></li>
	                </ul>
	            </div>
	        </div>
	        <div class="col-sm-1"></div>
		</c:if>
    </div>
</div>
