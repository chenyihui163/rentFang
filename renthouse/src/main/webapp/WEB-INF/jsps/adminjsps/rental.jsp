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
	margin-right: 330px;
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
					<li><a class="active">租金管理</a></li>
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
								<label for="mtime" class="col-sm-2 control-label">本月交租时间:</label>
								<div class="col-sm-2">
									<input type="text" class="form-control" id="mtime" name="mtime"
										value="">
								</div>

								<label for="mname" class="col-sm-1 control-label">客户名:</label>
								<div class="col-sm-2">
									<input type="text" class="form-control" id="mname" name="cname"
										value="">
								</div>

								<label for="cid" class="col-sm-1 control-label">合同编码:</label>
								<div class="col-sm-2">
									<input type="text" class="form-control" id="cid" name="cid"
										value="">
								</div>
							</div>
							<div class="form-group">
								<label for="uname" class="col-sm-2 control-label">登录名:</label>
								<div class="col-sm-2">
									<input type="text" class="form-control" id="uname" name="uname"
										value="">
								</div>

								<label for="uid" class="col-sm-1 control-label">用户编码:</label>
								<div class="col-sm-2">
									<input type="text" class="form-control" id="uid" name="uid"
										value="">
								</div>

								<label for="state" class="col-sm-1 control-label">交租状态:</label>
								<div class="col-sm-2">
									<select id="state" name="state" class="form-control">
										<option value="2">请选择交租状态</option>
										<option value="1">已交租</option>
										<option value="0">未交租</option>
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
				<div id="toorbar" class="row">
					<div class="col-sm-12 text-left">
						<button class="btn btn-warning btn-lg sendBill">发送本月账单给客户</button>
					</div>
				</div>
				<div id="table"></div>
				<jsp:include page="/WEB-INF/jsps/adminjsps/footer.jsp" />
			</div>
			<!-- /. PAGE INNER  -->
		</div>
		<!-- /. PAGE WRAPPER  -->
	</div>
	<!-- /. WRAPPER  -->

	<jsp:include page="/WEB-INF/jsps/modal.jsp" />
</body>
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
<script src="../js/admin/table_rental.js"></script>
<script type="text/javascript" src="../js/modalMsg.js"></script>

<script>
	$(function() {
		//时间选择器
		$.datetimepicker.setLocale('ch');
		$("#mtime").datetimepicker({
			format : "Y-m-d H:i",
		});
		//table从新发送请求
		$("#query").bind("click", function() {
			$("#table").bootstrapTable('refresh');
		});
		//时间
		setInterval(
				"curtime.innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt (new Date().getDay());",
				1000);
		$(".sendBill").bind("click", function() {
			//空判断
			if($("#table").bootstrapTable("getSelections").length == 0){
				$("#tips").text("请勾选需要发送账单的用户");
				$("#myModal").modal({
					"show" : true
				});
				return;
			}
			//获取当前时间
			var date = new Date();
			var month = '';
			if((date.getMonth() + 1) < 10){
				month += '0' + (date.getMonth() + 1);
			}else{
				month += (date.getMonth() + 1);
			}
			var day = '';
			if(date.getDate() < 10){
				day += '0' + date.getDate();
			}else{
				day += date.getDate();
			}
			var year = date.getFullYear();
			
			date = [year, month, day].join('-');
			
			//判断当前账户是否到了交租时间
			var selected = $("#table").bootstrapTable("getSelections");
			for(var i = 0; i < selected.length; i++){
				//到了交租日期，但是没有交租的发送账单给客户
				if(new Date(Date.parse(selected[i].mntime)) < new Date(Date.parse(date)) && selected[i].mtime == ''){
					//继续判断是否已经发送了账单给该用户 根据客户编码和账单生成时间进行判断是否发送了账单
					$.ajax({
						url : "/admin/checkSendBill.action",
						data : {
							cid : selected[i].cid
						},// 给服务器的参数
						type : "POST",
						dataType : "json",
						async : false,
						cache : false,
						success : function(result) {
							if (result.bool == "false") {
								//已经发送了
								$("#tips").text("用户[" + selected[i].mname +"]已经发送了本月账单，不能重复发送");
								$("#myModal").modal({
									"show" : true
								});
								return;
							}else{
								//发送账单 价钱 用户编码 合同编码
								$.post(
										"/admin/sendBill.action", 
										{
											cid : selected[i].cid,
											uid : selected[i].uid,
											mprice : selected[i].mprice
										}
								);
							}
						}
					})
				}else{
					$("#tips").text("您勾选了未到交租日期/已交租的用户[" + selected[i].mname +"]");
					$("#myModal").modal({
						"show" : true
					});
					return;
				}
			}
		});
	});
</script>
</html>