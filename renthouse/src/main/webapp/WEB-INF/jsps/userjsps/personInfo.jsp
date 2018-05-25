<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>松子直租 | 个人中心</title>

<!--导入bootstrap css-->
<link href="../js/bootstrap/dist/css/bootstrap.css"
	rel="stylesheet">
<!--自定义样式-->
<link href="../css/user/personinfo.css" rel="stylesheet">
<link href="../css/user/common.css" rel="stylesheet">

<link rel="icon" href="../img/songzi.png" type="image/x-icon"/>
<link href="../css/admin/bootstrap-table.min.css" rel="stylesheet" />

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

	<jsp:include page="/WEB-INF/jsps/userjsps/ttop.jsp" />
	<!--头部-->
	<jsp:include page="/WEB-INF/jsps/userjsps/top.jsp" />

	<!--内容区-->
	<div class="container" style="background-color: #f8f8f8">
		<input type="hidden" id="uid" value="${sessionScope.user.uid}">
		<div class="row">
			<div class="col-sm-12 text-center" style="background-color: white">
				<img src="../img/user/user_pic" class="user_img">
				<br>
				<h3 class="tele">${sessionScope.user.utele }</h3>
				<a href="#" class="update" data-toggle="modal"
					data-target="#myModal1">修改资料 ></a>
				<br><br>
			</div>
		</div>
		<div class="row" style="margin-top:10px">
			<div class="col-sm-12" style="background-color: white">
				<h3>我的合同</h3>
				<div id="table_contract"></div>
			</div>
		</div>
		
		<div class="row" style="margin-top:10px">
			<div class="col-sm-12" style="background-color: white">
				<h3>账单列表</h3>
				<div id="toolbar">
					<form class="form-horizontal">
						<div class="form-group">
							<select id="bstate" name="state" class="form-control">
								<option value="0"> 未支付</option>
								<option value="1"> 已支付</option>
							</select>
						</div>
					</form>
				</div>
				<div id="table_bill"></div>
			</div>
		</div>
		<br>
	</div>
	<!--底部-->
	<jsp:include page="/WEB-INF/jsps/userjsps/bottom.jsp"/>

	<!--弹出框-->
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">修改用户信息</h4>
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
						<form method="post" action="/user/updateUser.action" id="form">
							<input type="hidden" name="uid" value="${sessionScope.user.uid}">
							<div class="form-group" id="uname_form">
								<div class="input-group">
									<span class="input-group-addon">用 户 名:</span> <input
										style="height: 50px" type="text" name="uname"
										class="form-control" id="uname" value="${user.uname }"
										aria-describedby="helpBlock1" placeholder="请输入您的帐户名和登陆名">
								</div>
								<span style="top: 8px" class="" id="uname_span"
									aria-hidden="true"></span> <span id="uname_error"
									style="color: red"></span>
							</div>
							<div class="form-group" id="utele_form">
								<div class="input-group">
									<span class="input-group-addon">手 机 号:</span> <input
										style="height: 50px" type="text" name="utele"
										class="form-control" id="utele" value="${user.utele }"
										aria-describedby="helpBlock1" placeholder="请输入您的常用手机号码">
								</div>
								<span style="top: 8px" class="" id="utele_span"
									aria-hidden="true"></span> <span id="utele_error"
									style="color: red"></span>
							</div>
							<div class="form-group" id="upasswd_form">
								<div class="input-group">
									<span class="input-group-addon">请输入旧密码:</span> <input
										style="height: 50px" type="password" name="upasswd"
										class="form-control" id="upasswd" value=""
										aria-describedby="helpBlock1" placeholder="">
								</div>
								<span style="top: 8px" class="" id="upasswd_span"
									aria-hidden="true"></span> <span id="upasswd_error"
									style="color: red"></span>
							</div>
							
							<div class="form-group" id="newpasswd_form">
								<div class="input-group">
									<span class="input-group-addon">设 置新 密 码:</span> <input
										style="height: 50px" type="password" name="newpasswd"
										class="form-control" id="newpasswd" value=""
										aria-describedby="helpBlock1" placeholder="建议使用至少两种字符的组合">
								</div>
								<span style="top: 8px" class="" id="newpasswd_span"
									aria-hidden="true"></span> <span id="newpasswd_error"
									style="color: red"></span>
							</div>

							<div class="form-group" id="uemail_form">
								<div class="input-group">
									<span class="input-group-addon">电 子 邮 箱:</span> <input
										style="height: 50px" type="text" name="uemail"
										class="form-control" id="uemail" value="${userinput.uemail }"
										aria-describedby="helpBlock1" placeholder="请输入邮箱">
								</div>
								<span style="top: 8px" class="" id="uemailemail_span"
									aria-hidden="true"></span> <span id="uemail_error"
									style="color: red"></span>
							</div>
							<div class="modal-footer">
								<input type="button" class="btn btn-danger" data-dismiss="modal"
									value="关闭">
								<input onclick="postForm()" type="button"
									class="btn btn-warning" value="提交" />
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
	
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 id="" class="modal-title" id="myModalLabel">选择银行</h4>
				</div>
				<br>
				<div class="row">
					<div class="col-sm-1"></div>
					<div class="col-sm-10">
						<form
				action="/user/payment.action"
				method="post" target="_top" id="topayform">
				<input type="hidden" name="bid" id="bid"/>
				<div class="row pay_yh">
					<div class="col-md-6 col-xs-6 text-center">
						<input id="CCB-NET-B2C" type="radio" name="yh" value="CCB-NET-B2C" checked="checked"/>
						<img name="CCB-NET-B2C" align="middle"
							src="../img/user/bank_img/ccb.bmp" />
					</div>
					<div class="col-md-6 col-xs-6 text-center">
						<input id="CMBCHINA-NET-B2C" type="radio" name="yh"
							value="CMBCHINA-NET-B2C" /> <img name="CMBCHINA-NET-B2C"
							align="middle" src="../img/user/bank_img/cmb.bmp"/>
					</div>
				</div>
				<br>
				<div class="row pay_yh">
					<div class="col-md-6 col-xs-6 text-center" style="margin-bottom: 20px">
						<input id="BCCB-NET-B2C" type="radio" name="yh"
							value="BCCB-NET-B2C" /> <img name="BCCB-NET-B2C" align="middle"
							src="../img/user/bank_img/bj.bmp" />
					</div>
					<div class="col-md-6 col-xs-6 text-center">
						<input id="BOCO-NET-B2C" type="radio" name="yh"
							value="BOCO-NET-B2C" /> <img name="BOCO-NET-B2C" align="middle"
							src="../img/user/bank_img/bcc.bmp" />
					</div>
				</div>
				<div class="row pay_yh">
					<div class="col-md-6 col-xs-6 text-center" style="margin-bottom: 20px">
						<input id="CMBC-NET-B2C" type="radio" name="yh"
							value="CMBC-NET-B2C" /> <img name="CMBC-NET-B2C" align="middle"
							src="../img/user/bank_img/cmbc.bmp" />
					</div>
					<div class="col-md-6 col-xs-6 text-center">
						<input id="CEB-NET-B2C" type="radio" name="yh" value="CEB-NET-B2C" />
						<img name="CEB-NET-B2C" align="middle"
							src="../img/user/bank_img/guangda.bmp" />
					</div>
				</div>
				<div class="row pay_yh">
					<div class="col-md-6 col-xs-6 text-center" style="margin-bottom: 20px">
						<input id="CBHB-NET-B2C" type="radio" name="yh"
							value="CBHB-NET-B2C" /> <img name="CBHB-NET-B2C" align="middle"
							src="../img/user/bank_img/bh.bmp" />
					</div>
					<div class="col-md-6 col-xs-6 text-center">
						<input id="HKBEA-NET-B2C" type="radio" name="yh"
							value="HKBEA-NET-B2C" /> <img name="HKBEA-NET-B2C"
							align="middle" src="../img/user/bank_img/dy.bmp" />
					</div>
				</div>
				<div class="row pay_yh">
					<div class="col-md-6 col-xs-6 text-center" style="margin-bottom: 20px">
						<input id="SDB-NET-B2C" type="radio" name="yh" value="SDB-NET-B2C" />
						<img name="SDB-NET-B2C" align="middle"
							src="../img/user/bank_img/sfz.bmp" />
					</div>
					<div class="col-md-6 col-xs-6 text-center">
						<input id="GDB-NET-B2C" type="radio" name="yh" value="GDB-NET-B2C" />
						<img name="GDB-NET-B2C" align="middle"
							src="../img/user/bank_img/gf.bmp" />
					</div>
				</div>
				<div class="row text-right">
					<input type="submit" class="btn payorder" value="支付订单" />
				</div>
				<br>
			</form>
					</div>
					<div class="col-sm-1"></div>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>

</body>

<!--导入jQuery-->
<script src="../js/jquery-1.8.3.min.js"></script>
<!-- 导入bootstrap js支持-->
<script src="../js/bootstrap/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/modalMsg.js"></script>
<script type="text/javascript" src="../js/user/updateUser.js"></script>
<script src="../js/admin/bootstrap-table.min.js"></script>
<script src="../js/admin/bootstrap-table-zh-CN.min.js"></script>
<script src="../js/user/table_contract.js"></script>
<script src="../js/user/table_bill.js"></script>

<script>
$(function(){
	$("#bstate").bind("change", function(){
		$("#table_bill").bootstrapTable('refresh');
	});
	$(".pay").bind("click", function(){
		$(this).attr("data-toggle", "modal").attr("data-target", "#myModal2");
		$("#bid").val($(this).attr("id"));
	});
});

$("img").click(function() {
	$("#" + $(this).attr("name")).attr("checked", true);
});
</script>
</html>