<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>松子直租后台管理系统</title>
<!-- Bootstrap Styles-->
<link href="../ht/assets/css/bootstrap.css" rel="stylesheet" />
<!-- FontAwesome Styles-->
<link href="../ht/assets/css/font-awesome.css" rel="stylesheet" />
<!-- Custom Styles-->
<link href="../ht/assets/css/custom-styles.css" rel="stylesheet" />
<!-- Google Fonts-->
<link href='https://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />

<link href="../css/admin/bootstrap-table.min.css"
	rel="stylesheet" />
<link rel="icon" href="../img/songzi.png" type="image/x-icon" />
<link href="../js/jquery.datetimepicker.css" rel="stylesheet">
<style>
.curtime {
	color: white;
	margin-right:330px;
	font-size: 18px;
}

.curtime:hover {
	cursor: pointer;
	color: yellow;
}
</style>
</head>

<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/jsps/adminjsps/nav_top.jsp" />
		<jsp:include page="/WEB-INF/jsps/adminjsps/nav_left.jsp" />

		<div id="page-wrapper">
			<div class="header">
				<ol class="breadcrumb">
					<li><a href="/admin/skipAdminIndexPage.action">首页</a></li>
					<li><a class="active">账单管理</a></li>
				</ol>

			</div>
			<div id="page-inner">
				<div id="search">
					<div class="row">
						<form class="form-horizontal"
							style="border: 1px solid #5bc0de; border-radius: 10px">
							<div
								style="background: #5bc0de; color: white; font-size: 18px; padding: 10px 0; border-radius: 10px"">
								<span style="margin-left: 10px">查询条件</span>
							</div>
							<br>
							<div class="form-group">
								<label for="btime" class="col-sm-2 control-label">月份:</label>
								<div class="col-sm-2">
									<input type="text" class="form-control" id="btime" name="mtime"
										value="">
								</div>

								<label for="uname" class="col-sm-1 control-label">登录名:</label>
								<div class="col-sm-2">
									<input type="text" class="form-control" id="uname" name="uname"
										value="">
								</div>

								<label for="rname" class="col-sm-1 control-label">客户名:</label>
								<div class="col-sm-2">
									<input type="text" class="form-control" id="rname" name="rname"
										value="">
								</div>
							</div>
							<div class="form-group">
								<label for="cid" class="col-sm-2 control-label">合同编码:</label>
								<div class="col-sm-2">
									<input type="text" class="form-control" id="cid" name="cid"
										value="">
								</div>

								<label for="uid" class="col-sm-1 control-label">用户编码:</label>
								<div class="col-sm-2">
									<input type="text" class="form-control" id="uid" name="uid"
										value="">
								</div>

								<label for="state" class="col-sm-1 control-label">支付状态:</label>
								<div class="col-sm-2">
									<select id="state" name="state" class="form-control">
										<option value="0">未支付</option>
										<option value="1">已支付</option>
									</select>
								</div>
								<div class="col-sm-2 text-left">
									<input type="button" class="btn btn-info" id="query" value="查询"
										style="width: 100px">
								</div>
							</div>
						</form>
					</div>
				</div>
				<br>
				<div id="table" style=""></div>
				<jsp:include page="/WEB-INF/jsps/adminjsps/footer.jsp" />
			</div>
			<!-- /. PAGE INNER  -->
		</div>
		<!-- /. PAGE WRAPPER  -->
	</div>
	<!-- /. WRAPPER  -->
	
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 id="" class="modal-title" id="myModalLabel">修改账单</h4>
				</div>
				<br>
				<div class="row">
					<div class="col-sm-1"></div>
					<div class="col-sm-11">
						<form action="/admin/updateBill.action" method="post" id="form1"
							class="form-horizontal">
							<input type="hidden" name="bid" id="bid" />
							
							<div class="form-group">
								<label for="bdue" class="col-sm-2 control-label">收款原因:</label>
								<div class="col-sm-8">
									<textarea rows="4" cols="75" name="bdue" id="bdue"
										class="form-control"></textarea>
									<span id="bdue_error" style="color: red"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="bprice" class="col-sm-2 control-label">金额:</label>
								<div class="col-sm-8">
									<input class="form-control" id="bprice" name="bprice">
									<span id="bprice_error" style="color: red"></span>
								</div>
							</div>
							<div class="modal-footer">
								<input type="button" class="btn btn-default" data-dismiss="modal"
									value="关闭"> <a class="btn btn-danger"
									id="updateBill">修改</a>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>

	<jsp:include page="/WEB-INF/jsps/modal.jsp" />
	<!-- JS Scripts-->
	<!-- jQuery Js -->
	<script src="../ht/assets/js/jquery-1.10.2.js"></script>
	<!-- Bootstrap Js -->
	<script src="../ht/assets/js/bootstrap.min.js"></script>

	<!-- Metis Menu Js -->
	<script src="../ht/assets/js/jquery.metisMenu.js"></script>
	<!-- Custom Js -->
	<script src="../ht/assets/js/custom-scripts.js"></script>

	<script type="text/javascript"
		src="../js/jquery.datetimepicker.full.min.js"></script>
	<script src="../js/admin/bootstrap-table.min.js"></script>
	<script src="../js/admin/bootstrap-table-zh-CN.min.js"></script>
	<script src="../js/admin/table_bill.js"></script>
	<script type="text/javascript" src="../js/modalMsg.js"></script>

	<script>
		$(function() {
			//时间选择器
			$.datetimepicker.setLocale('ch');
			$("#btime").datetimepicker({
				format: "Y-m-d",
				timepicker:false,
			});
			$("#query").bind("click", function() {
				$("#table").bootstrapTable('refresh');
			});
			//时间
			setInterval(
					"curtime.innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt (new Date().getDay());",
					1000);
			$("#form1 .form-control").focus(function() {
			    $("#" + $(this).attr("id") + "_error").text("");
			    $(this).css("border", "null");
			  });
			$("#form1 #updateBill").bind("click", function(){
				var bool = true;
				$("#form1 .form-control").each(function(){
					if( $(this).val() == null || $.trim($(this).val()).length == 0){
						bool = false;
						$("#" + $(this).attr("id") + "_error").text("该项是必填项");
						$("#" + $(this).attr("id")).css("border", "1px solid red");
					}
				});
				if(bool){
					$("#form1").submit();
				}
			});
		});
	</script>
</body>

</html>