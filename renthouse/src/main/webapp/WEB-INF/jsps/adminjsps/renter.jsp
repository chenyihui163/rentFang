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
					<li><a class="active">租客管理</a></li>
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
								<label for="cstime" class="col-sm-2 control-label">签约时间:</label>
								<div class="col-sm-2">
									<input type="text" class="form-control" id="cstime"
										name="cstime" value="">
								</div>

								<label for="cname" class="col-sm-1 control-label">客户名:</label>
								<div class="col-sm-2">
									<input type="text" class="form-control" id="cname" name="cname"
										value="">
								</div>

								<label for="ctele" class="col-sm-1 control-label">手机号:</label>
								<div class="col-sm-2">
									<input type="text" class="form-control" id="ctele" name="ctele"
										value="">
								</div>
							</div>

							<div class="form-group">
								<label for="hposition" class="col-sm-2 control-label">房源位置:</label>
								<div class="col-sm-2">
									<input type="text" class="form-control" id="hposition"
										name="hposition" value="">
								</div>
								<label for="cid" class="col-sm-1 control-label">合同编码:</label>
								<div class="col-sm-2">
									<input type="text" class="form-control" id="cid" name="cid"
										value="">
								</div>
								<label for="uname" class="col-sm-1 control-label">登录名:</label>
								<div class="col-sm-2">
									<input type="text" class="form-control" id="uname" name="uname"
										value="">
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
				<div id="table"></div>
				<jsp:include page="/WEB-INF/jsps/adminjsps/footer.jsp" />
			</div>
			<!-- /. PAGE INNER  -->
		</div>
		<!-- /. PAGE WRAPPER  -->
	</div>
	<!-- /. WRAPPER  -->

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
	<script src="../js/admin/table_renter.js"></script>
	<script type="text/javascript" src="../js/modalMsg.js"></script>

	<script>
		$(function() {
			//时间选择器
			$.datetimepicker.setLocale('ch');
			$("#cstime").datetimepicker({
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
		});
	</script>
</body>

</html>