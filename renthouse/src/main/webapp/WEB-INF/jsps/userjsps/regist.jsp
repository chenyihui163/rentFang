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
    <title>CWH直租 | 注册</title>

    <!--导入bootstrap css-->
    <link href="../js/bootstrap/dist/css/bootstrap.css" rel="stylesheet">
    <!--自定义样式-->
    <link href="../css/user/common.css" rel="stylesheet">
    <link href="../css/user/regist.css" rel="stylesheet">
    
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

<div class="container">
    <div class="row">
        <div class="col-sm-3 col-xs-3"></div>
        <div class="col-sm-6 col-xs-6">
            <div class="row">
                <div class="col-sm-6">
                    <h1>
                        <span style="position: relative">用户注册</span>
                    </h1>
                </div>
                <div class="col-sm-6">
                    <span style="position: absolute; top: 25px;right: 0px;">已有账号？请<a href="/skipLoginPage.action">登陆</a></span>
                </div>
            </div>
            <div class="row">
            	<div class="alert alert-warning alert-dismissible sr-only" role="alert" id="alert">
				  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
				  	<span aria-hidden="true">&times;</span>
				  </button>
				  <span style="color:red" id="alert_msg">${msgErr }</span>
				</div>
            </div>
            <form method="post" action="/regist.action" id="form">
                <div class="form-group" id="uname_form">
                    <div class="input-group">
                        <span class="input-group-addon">用 户 名:</span>
                        <input
                                style="height: 50px" type="text" name="uname"
                                class="form-control" id="uname" value="${userinput.uname }"
                                aria-describedby="helpBlock1" placeholder="请输入您的帐户名和登陆名">
                    </div>
                    <span style="top: 8px" class="" id="uname_span"
                          aria-hidden="true"></span>
                    <span id="uname_error" style="color: red"></span>
                    <span id="uname_mess" class="help-block">支持中文、字母、数字，2-20个字符</span>
                </div>
                <div class="form-group" id="utele_form">
                    <div class="input-group">
                        <span class="input-group-addon">手 机 号:</span>
                        <input
                                style="height: 50px" type="text" name="utele"
                                class="form-control" id="utele" value="${userinput.utele }"
                                aria-describedby="helpBlock1" placeholder="请输入您的常用手机号码">
                    </div>
                    <span style="top: 8px" class="" id="utele_span"
                          aria-hidden="true"></span>
                    <span id="utele_error" style="color: red"></span> <span
                        id="utele_mess" class="help-block"> 建议用常用的手机号</span>
                </div>
                <div class="form-group" id="upasswd_form">
                    <div class="input-group">
                        <span class="input-group-addon">设 置 密 码:</span>
                        <input
                                style="height: 50px" type="password" name="upasswd"
                                class="form-control" id="upasswd" aria-describedby="helpBlock1"
                                placeholder="建议使用至少两种字符的组合">
                    </div>
                    <span style="top: 8px" class="" id="upasswd_span"
                          aria-hidden="true"></span>
                    <span id="upasswd_error" style="color: red"></span>
                    <span id="upasswd_mess" class="help-block">建议使用字母、数字和符号两种及以上的组合，6-20个字符</span>
                </div>

                <div class="form-group" id="uRePasswd_form">
                    <div class="input-group">
                        <span class="input-group-addon">确 认 密 码:</span>
                        <input
                                style="height: 50px" type="password" name="uRePasswd"
                                class="form-control" id="uRePasswd"
                                aria-describedby="helpBlock1" placeholder="请再一次输入密码">
                    </div>
                    <span style="top: 8px" class="" id="uRePasswd_span"
                          aria-hidden="true"></span>
                    <span id="uRePasswd_error" style="color: red"></span>
                    <span id="uRePasswd_mess" class="help-block">请再次输入密码</span>
                </div>
                <div class="form-group" id="uemail_form">
                    <div class="input-group">
                        <span class="input-group-addon">电 子 邮 箱:</span>
                        <input
                                style="height: 50px" type="text" name="uemail"
                                class="form-control" id="uemail" value="${userinput.uemail }"
                                aria-describedby="helpBlock1" placeholder="请输入邮箱">
                    </div>
                    <span style="top: 8px" class="" id="uemailemail_span"
                          aria-hidden="true"></span>
                    <span id="uemail_error" style="color: red"></span>
                    <span id="uemail_mess" class="help-block">请输入格式正确的邮箱</span>
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
                        <span id="vcode_mess" class="help-block">看不清？点击图片更换验证码</span>
                    </div>
                    <div class=" col-md-4">
                        <img id="img_vCode" onclick="changeVcode()"
                             style="height: 50px; width: auto"
                             src="<c:url value='/getVerifyCode.action'/>" alt="看不清,点我更换验证码">
                    </div>
                </div>
                <div class="row text-center">
                    <input id="submitBtn" type="submit" class="btn" value="注册"/>
                </div>
            </form>
        </div>
        <div class="col-md-3 col-xs-3"></div>
    </div>
</div>

<!--底部-->
<jsp:include page="/WEB-INF/jsps/userjsps/bottom.jsp"/>
</body>

<!--导入jQuery-->
<script src="../js/jquery-1.8.3.min.js"></script>
<!-- 导入bootstrap js支持-->
<script src="../js/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- 自定义js -->
<script src="../js/user/regist.js"></script>
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
</script>
</html>