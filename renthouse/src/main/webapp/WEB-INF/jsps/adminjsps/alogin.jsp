<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>后台登陆页面</title>
</head>
<!--导入bootstrap css-->
<link href="../js/bootstrap/dist/css/bootstrap.css" rel="stylesheet">
<!--自定义样式-->
<link href="../css/user/common.css" rel="stylesheet">
<link rel="icon" href="../img/songzi.png" type="image/x-icon"/>
<style>
    body{
        background: url("../img/admin/login.jpg") no-repeat;
    }
    .title{
        font-size: 30px;
        font-family: "Courier New", Courier, monospace;
    }
    .login{
        border:1px solid grey;
        background-color: white;
        border-radius: 10px;
        margin-top: 150px;
    }
    .btn{
        width: 200px;
    }
</style>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-3"></div>
            <div class="col-sm-6 login">
                <div class="col-sm-2"></div>
                <div class="col-sm-8">
                    <br>
                    <span class="title">CWH直租后台管理系统</span>
                    <br>
                    <br>
                    <div class="alert alert-warning alert-dismissible sr-only" role="alert" id="alert">
					  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
					  	<span aria-hidden="true">&times;</span>
					  </button>
					  <span style="color:red" id="alert_msg">${msgErr }</span>
					</div>
                    <form method="post" action="/adminLogin.action" id="form">
                    	<input type="hidden" name="requri" value="${requri }">
                        <div class="form-group" id="aname_form">
                            <div class="input-group">
                                <span class="input-group-addon">登 陆 名:</span>
                                <input style="height: 50px" type="text" name="aname"
                                       class="form-control" id="aname" value=""
                                       aria-describedby="helpBlock1" placeholder="">
                            </div>
                        </div>
                        <div class="form-group" id="apasswd_form">
                            <div class="input-group">
                                <span class="input-group-addon">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:</span>
                                <input style="height: 50px;" type="password" name="apasswd"
                                       class="form-control" id="apasswd" aria-describedby="helpBlock1"
                                       placeholder="">
                            </div>
                        </div>
                    </form>
                    <div class="col-sm-3"></div>
                    <div class="col-sm-6">
                        <input type="button" class="btn btn-lg btn-info" id="btn" value="登陆">
                        <br><br>
                    </div>
                    <div class="col-sm-2"></div>
                    <br>
                    <br>
                </div>
                <div class="col-sm-3"></div>
                </div>
                <div class="col-sm-3"></div>
        </div>
    </div>
    
    <jsp:include page="/WEB-INF/jsps/modal.jsp" />
</body>
<!--导入jQuery-->
<script src="../js/jquery-1.8.3.min.js"></script>
<!-- 导入bootstrap js支持-->
<script src="../js/bootstrap/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/modalMsg.js"></script>
<script>

	$(function(){
		$("#aname").focus();
		$("#btn").bind("click", function(){
			var bool = true;
			
			var aname = $("#aname").val();
			if(aname == null || $.trim(aname).length == 0){
				bool = false;
				$("#aname").css("border", "1px solid red").focus();
			}
			
			var apasswd = $("#apasswd").val();
			if(apasswd == null || $.trim(apasswd).length == 0){
				bool = false;
				$("#apasswd").css("border", "1px solid red").focus();
			}
			
			if(bool){
				$("#form").submit();
			}
		});
	});
	var msg = '${msgErr}';
	if(msg != ''){
		$("#alert").removeClass("sr-only");
	}else{
		$("#alert").addClass("sr-only");
	}
</script>
</html>