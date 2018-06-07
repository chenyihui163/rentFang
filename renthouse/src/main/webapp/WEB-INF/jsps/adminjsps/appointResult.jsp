<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>CWH直租后台管理系统</title>
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
					<li><a class="active">预约结果</a></li>
				</ol>

			</div>
			<div id="page-inner">
			<div id="search">
            		<div class="row">
            			<form class="form-horizontal" style="border: 1px solid #5bc0de;border-radius: 10px">
            				<div style="background:#5bc0de; color:white; font-size: 18px; padding: 10px 0; border-radius: 10px"">
            					<span style="margin-left:10px">查询条件</span>
            				</div>
            				<br>
							<div class="form-group">
								<label for="antime" class="col-sm-2 control-label">预约时间:</label>
								<div class="col-sm-2">
									<input type="text" class="form-control" id="antime" name="antime" value="">
								</div>
								
								<label for="name" class="col-sm-1 control-label">预约人:</label>
								<div class="col-sm-2">
									<input type="text" class="form-control" id="name" name="name" value=""> 
								</div>
								<label for="atele" class="col-sm-1 control-label">手机号:</label>
								<div class="col-sm-2">
									<input type="text" class="form-control" id="atele" name="atele" value=""> 
								</div>
							</div>
							<div class="form-group">
								<label for="rtype" class="col-sm-2 control-label">预约类型:</label>
								<div class="col-sm-2">
									<select name="rtype" id="rtype" class="form-control">
										<option value="">请选择预约类型</option>
										<option value="1">业主加盟</option>
										<option value="0">看房预约</option>
									</select> 
								</div>
								
								<label for="result" class="col-sm-1 control-label">签约:</label>
								<div class="col-sm-2">
									<select name="result" id="result" class="form-control">
										<option value="">请选择签约状态</option>
										<option value="1">已签约</option>
										<option value="0">未签约</option>
									</select> 
								</div>
								<label for="state" class="col-sm-1 control-label">联系:</label>
								<div class="col-sm-2">
									<select name="state" id="state" class="form-control">
										<option value="">请选择联系状态</option>
										<option value="1">已联系</option>
										<option value="0">未联系</option>
									</select> 
								</div>
								<div class="col-sm-2 text-left">
									<input type="button" class="btn btn-info" id="query" value="查询" style="width:100px"> 
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

	<!-- JS Scripts-->
	<!-- jQuery Js -->
	<script src="../ht/assets/js/jquery-1.10.2.js"></script>
	<!-- Bootstrap Js -->
	<script src="../ht/assets/js/bootstrap.min.js"></script>

	<!-- Metis Menu Js -->
	<script src="../ht/assets/js/jquery.metisMenu.js"></script>
	<!-- Custom Js -->
	<script src="../ht/assets/js/custom-scripts.js"></script>

	<script src="../js/admin/bootstrap-table.min.js"></script>
	<script src="../js/admin/bootstrap-table-zh-CN.min.js"></script>
	<script src="../js/admin/table_appointResult.js"></script>
	<script type="text/javascript" src="../js/jquery.datetimepicker.full.min.js"></script>

	<script>
		$(function() {
			setInterval(
					"curtime.innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt (new Date().getDay());",
					1000);
			//时间选择器
			$.datetimepicker.setLocale('ch');
			$("#antime").datetimepicker({
				format: "Y-m-d H:i:s",
			});
			$("#query").bind("click", function(){
				$("#table").bootstrapTable('refresh');
			});
		})
	</script>
</body>

</html>