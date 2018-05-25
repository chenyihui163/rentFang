<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>松子直租 | 业主加盟</title>
</head>
<!--导入bootstrap css-->
<link href="../js/bootstrap/dist/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="../css/user/common.css">
<link rel="stylesheet" href="../css/user/join.css">

<link rel="icon" href="../img/songzi.png" type="image/x-icon"/>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<body>

<jsp:include page="/WEB-INF/jsps/userjsps/ttop.jsp"/>
<!--头部-->
<jsp:include page="/WEB-INF/jsps/userjsps/top.jsp"/>
    <div class="container">
        <div class="row">
            <div class="joinimg">
                <div class="jointitle">
                    <span class="title">开启全新的房屋托管模式</span>
                    <br>
                    <span class="text">房屋交给松子直租，做省心房东</span>
                    <br>
                    <br>
                    <button class="btn btn-lg btn-info" data-toggle="modal"
                            data-target="#myModal1">立即委托</button>
                </div>
            </div>
        </div>
    </div>
    
    <jsp:include page="/WEB-INF/jsps/userjsps/bottom.jsp"/>

    <!--弹出框-->
    <div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">我有房子要委托出租</h4>
                </div>
                <br>
                <div class="row">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-8">
                        <div class="alert alert-warning alert-dismissible sr-only"
                             role="alert" id="alert">
                            <button type="button" class="close" data-dismiss="alert"
                                    aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <span style="color: red" id="alert_msg">${msgErr }</span>
                        </div>
                        <form method="post" action="/joinHouse.action" id="form">
                            <div class="form-group" id="jname_form">
                                <div class="input-group">
                                 <span class="input-group-addon">姓名:</span>
                                    <input
                                        style="height: 50px" type="text" name="jname"
                                        class="form-control" id="jname" value="${join.jname }"
                                        aria-describedby="helpBlock1" placeholder="请输入您的姓名">
                                </div>
                                <span style="top: 8px" class="" id="jname_span"
                                      aria-hidden="true"></span> <span id="jname_error"
                                                                       style="color: red"></span>
                            </div>
                            <div class="form-group" id="jtele_form">
                                <div class="input-group">
                                <span class="input-group-addon">联系方式:</span>
                                    <input
                                        style="height: 50px" type="text" name="jtele"
                                        class="form-control" id="jtele" value="${join.jtele }"
                                        aria-describedby="helpBlock1" placeholder="请输入您的常用手机号码">
                                </div>
                                <span style="top: 8px" class="" id="jtele_span"
                                      aria-hidden="true"></span> <span id="jtele_error"
                                                                       style="color: red"></span>
                            </div>
                            <div class="form-group" id="jposition_form">
                                <div class="input-group">
                                 <span class="input-group-addon">位置:</span>
                                    <input
                                            style="height: 50px" type="text" name="jposition"
                                            class="form-control" id="jposition" value="${join.jposition }"
                                            aria-describedby="helpBlock1" placeholder="请输入您的房源的位置">
                                </div>
                                <span style="top: 8px" class="" id="jposition_span"
                                      aria-hidden="true"></span> <span id="jposition_error"
                                                                       style="color: red"></span>
                            </div>
                            <div class="row">
                                <div class=" col-md-8 form-group" id="vcode_form">
                                    <div class="input-group">
                                    <span class="input-group-addon"> 验证码:</span>
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
                            <div class="modal-footer">
                                <input type="button" class="btn btn-danger" data-dismiss="modal"
                                       value="关闭">
                                <input onclick="postForm()" type="button"
                                       class="btn btn-warning" value="立即委托" />
                            </div>
                        </form>
                    </div>
                    <div class="col-sm-2"></div>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal -->
    </div>
    
    <jsp:include page="/WEB-INF/jsps/modal.jsp"/>
</body>
<!--导入jQuery-->
<script src="../js/jquery-1.8.3.min.js"></script>
<!-- 导入bootstrap js支持-->
<script src="../js/bootstrap/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/modalMsg.js"></script>
<script src="../js/user/join.js"></script>	
<script>

    var changeVcode = function(){
        var src = "/getVerifyCode.action?time=" + new Date().getTime();
        $("#img_vCode").attr("src", src);
    }
</script>
</html>