<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>松子直租 | 登陆</title>

    <!--导入bootstrap css-->
    <link href="../js/bootstrap/dist/css/bootstrap.css" rel="stylesheet">
    <!--自定义样式-->
    <link href="../css/user/login.css" rel="stylesheet">
    <link href="../css/user/common.css" rel="stylesheet">
    
    <link rel="icon" href="../img/songzi.png" type="image/x-icon"/>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<!--头部-->
<jsp:include page="/WEB-INF/jsps/userjsps/top.jsp"/>

<!--内容区-->
<div class="container content">
    <div class="row">
        <div class="col-sm-2"></div>
        <div class="col-sm-4">
            <img class="img" src="/renthouse/img/user/loginimg/login_img.png">
        </div>
        <div class="col-sm-4 content_login">
            <div class="text-center">
                <h1>
                    <span class="login_title">登陆</span>
                </h1>
            </div>
            <div class="alert alert-warning alert-dismissible sr-only" role="alert" id="alert">
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
			  	<span aria-hidden="true">&times;</span>
			  </button>
			  <span style="color:red" id="alert_msg">${msgErr }</span>
			</div>
            <form method="post" action="/login.action" id="form">
            	<input type="hidden" name="requri" value="${requri }">
                <div class="form-group" id="utele_form">
                    <div class="input-group">
                        <span class="input-group-addon">手 机 号:</span>
                        <input style="height: 50px" type="text" name="utele"
                               class="form-control" id="utele" value=""
                               aria-describedby="helpBlock1" placeholder="">
                    </div>
                    <span style="top: 8px" class="" id="utele_span" aria-hidden="true"></span>
                    <span id="utele_mess" class="help-block"></span>
                </div>
                <div class="form-group" id="upasswd_form">
                    <div class="input-group">
                        <span class="input-group-addon">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:</span>
                        <input style="height: 50px" type="password" name="upasswd"
                               class="form-control" id="upasswd" aria-describedby="helpBlock1"
                               placeholder="">
                    </div>
                    <span style="top: 8px" class="" id="upasswd_span" aria-hidden="true"></span>
                    <span id="upasswd_mess" class="help-block"></span>
                </div>
                <div class="row">
                    <div class=" col-md-8 form-group" id="vcode_form">
                        <div class="input-group">
                            <span class="input-group-addon">验 证 码:</span>
                            <input
                                style="height: 50px" type="text" name="vcode"
                                class="form-control" id="vcode" aria-describedby="helpBlock1"
                                placeholder="请输入验证码" maxlength="4">
                        </div>
                        <span style="top: 8px; right: 15px" class="" id="vcode_span"
                              aria-hidden="true"></span>
                        <span id="vcode_error" style="color: red"></span>
                        <span id="vcode_mess" class="help-block">看不清?点击图片更换验证码</span>
                    </div>
                    <div class=" col-md-4">
                        <img id="img_vCode" onclick="changeVcode()"
                             style="height: 50px; width: auto"
                             src="/getVerifyCode.action" alt="看不清,点我更换验证码">
                    </div>
                </div>
                <input id="submitBtn"
                       style="width: 100%; color: white; background-color: #3dbcc6; margin-bottom: 5px"
                       type="submit" class="btn" value="登陆"/>
            </form>
            <span>没有账号？<a href="skipRegistPage.action">立即注册</a></span>

        </div>
    </div>
    <div class="col-sm-2"></div>
                <br><br>
</div>

<!--底部-->
<jsp:include page="/WEB-INF/jsps/userjsps/bottom.jsp"/>
<!-- 提示框 -->
<jsp:include page="/WEB-INF/jsps/modal.jsp"/>
</body>

<!--导入jQuery-->
<script src="../js/jquery-1.8.3.min.js"></script>
<!-- 导入bootstrap js支持-->
<script src="../js/bootstrap/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/modalMsg.js"></script>

<script src="../js/user/login.js"></script>
<script>
	var msg = '${msgErr}';
	if(msg != ''){
		$("#alert").removeClass("sr-only");
	}else{
		$("#alert").addClass("sr-only");
	}
	
	//切换验证码
	var changeVcode = function(){
		var src = "/getVerifyCode.action?time=" + new Date().getTime();
		$("#img_vCode").attr("src", src);
	}
	
	// 获取cookie中的电话号码
	var utele = window.decodeURI("${cookie['utele'].value}");
	if ("${utele}") {
		utele = "${utele}";
	}
	$("#utele").val(utele);
</script>
</html>