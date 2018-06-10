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

<link rel="icon" href="../img/songzi.png" type="image/x-icon" />
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
					<li><a href="/admin/skipHouseManagePage.action">房源管理</a></li>
					<li><a class="active">房源明细</a></li>
				</ol>

			</div>
			<div id="page-inner">
				<div class="row">
					<div class="col-sm-12" id="check_div">
						<input type="checkbox" name="checked" id="check"><span
							style="color: red">编辑/修改</span> <br>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-sm-2">
						<img alt="" src="${house.himg }" style="width: 150px">
					</div>
					<div class="col-sm-10">

						<form action="/admin/updateHouseByHid.action" method="post"
							id="form" class="form-horizontal" enctype="multipart/form-data">

							<input type="hidden" value="${house.hid }" name="hid"> <input
								type="hidden" value="${house.himg }" name="himg">

							<div class="form-group">

								<label for="hname" class="col-sm-2 control-label">房源标题:</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="hname" name="hname"
										value="${house.hname }"> <span id="hname_tip"
										style="color: red"></span>
								</div>

								<label for="hmethod" class="col-sm-2 control-label">居住类型:</label>
								<div class="col-sm-4">
									<select name="hmethod" id="select1" class="form-control">
										<option value="2">请选择居住类型</option>
										<option value="0">合租</option>
										<option value="1">整租</option>
									</select> <span id="hmethod_tip" style="color: red"></span>
								</div>

							</div>

							<div class="form-group">

								<label for="hprice" class="col-sm-2 control-label">月租金额:</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="hprice"
										name="hprice" value="${house.hprice }"> <span
										id="hprice_tip" style="color: red"></span>
								</div>

								<label for="htype" class="col-sm-2 control-label">出租类型:</label>
								<div class="col-sm-4">
									<select name="htype" id="select2" class="form-control">
										<option value="3">请选择出租类型</option>
										<option value="0">日租</option>
										<option value="1">短租</option>
										<option value="2">长租</option>
									</select> <span id="htype_tip" style="color: red"></span>
								</div>

							</div>

							<div class="form-group">

								<label for="harea" class="col-sm-2 control-label">面积:</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="harea" name="harea"
										value="${house.harea }"> <span id="harea_tip"
										style="color: red"></span>
								</div>

								<label for="hmodel" class="col-sm-2 control-label">户型:</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="hmodel"
										name="hmodel" value="${house.hmodel }"> <span
										id="hmodel_tip" style="color: red"></span>
								</div>

							</div>

							<div class="form-group">

								<label for="hpaytype" class="col-sm-2 control-label">付款方式:</label>
								<div class="col-sm-4">
									<select name="hpaytype" id="select5" class="form-control">
										<option value="2">请选择付款方式</option>
										<option value="0">月付</option>
										<option value="1">年付</option>
									</select>
								</div>

								<label for="htoward" class="col-sm-2 control-label">朝向:</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="htoward"
										name="htoward" value="${house.htoward }">
								</div>

							</div>

							<div class="form-group">

								<label for="hfloor" class="col-sm-2 control-label">楼层:</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="hfloor"
										name="hfloor" value="${house.hfloor }">
								</div>

								<label for="hposition" class="col-sm-2 control-label">地理位置:</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="hposition"
										name="hposition" value="${house.hposition }"> <span
										id="hposition_tip" style="color: red"></span>
								</div>

							</div>

							<div class="form-group">

								<label for="hsubway" class="col-sm-2 control-label">公交路线:</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="hsubway"
										name="hsubway" value="${house.hsubway }"> <span
										id="hsubway_tip" style="color: red"></span>
								</div>

								<label for="hstate" class="col-sm-2 control-label">状态:</label>
								<div class="col-sm-4">
									<select name="hstate" id="select3" class="form-control">
										<option value="2">请选择房源状态</option>
										<option value="0">未出租</option>
										<option value="1">已出租</option>
									</select> <span id="htype_tip" style="color: red"></span> <span
										id="hstate_tip" style="color: red"></span>
								</div>

							</div>

							<div class="form-group">

								<label for="htele" class="col-sm-2 control-label">联系方式:</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="htele" name="htele"
										value="${house.htele }"> <span id="htele_tip"
										style="color: red"></span>
								</div>

								<label for="hbelong" class="col-sm-2 control-label">房源归属:</label>
								<div class="col-sm-4">
									<select name="hbelong" id="select4" class="form-control">
										<option value="2">请选择居住类型</option>
										<option value="0">自有房</option>
										<option value="1">房东直租</option>
									</select> <span id="hbelong_tip" style="color: red"></span>
								</div>

							</div>

							<div class="form-group" id="img">

								<label for="himg" class="col-sm-2 control-label">上传图片:</label>
								<div class="col-sm-4">
									<input type="file" id="himg" name="picFile"
										class="form-control" multiple="multiple"> <span
										id="himg_tip" style="color: red"></span>
								</div>
							</div>

							<div class="form-group">

								<label for=hdesc class="col-sm-2 control-label">简介:</label>
								<div class="col-sm-8">
									<textarea rows="4" cols="75" name="hdesc" id="hdesc"
										class="form-control"></textarea>
								</div>

							</div>

						</form>

						<div class="form-group text-center">
							<input type="button" value="更新" class="btn btn-info sr-only"
								id="updateBtn" style="width: 100px">
						</div>
						<div class="row text-center">
							<a
								href="/admin/delHouseByHid.action?hid=${house.hid}&himg=${house.himg}&hstate=${house.hstate}"
								class="btn btn-danger" id="deleteBtn" style="width: 100px">删除房源</a>
						</div>
					</div>
				</div>
			</div>
			<br> <br>
			<jsp:include page="/WEB-INF/jsps/adminjsps/footer.jsp" />
		</div>
		<!-- /. PAGE INNER  -->
	</div>
	<!-- /. PAGE WRAPPER  -->
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
	<script type="text/javascript" src="../js/modalMsg.js"></script>

	<script>
		$(function() {

			$(".form-control").focus(function() {
				var name = $(this).attr("name");
				$("#" + name + "_tip").text("");
			});

			setInterval(
					"curtime.innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt (new Date().getDay());",
					1000);

			var hmethod = '${house.hmethod}';
			var htype = '${house.htype}';
			var hstate = '${house.hstate}';
			var hbelong = '${house.hbelong}';
			var hdesc = '${house.hdesc}';
			var hpaytype = '${house.hpaytype}';

			$("#hdesc").text(hdesc);

			if (hstate === "1") {
				$("#check_div").addClass("sr-only");
				$("#deleteBtn").addClass("sr-only");
			}

			//将所有输入框设为禁止状态
			$(".form-control").prop("disabled", true);
			//隐藏上传图片模块
			$("#img").addClass("sr-only");
			//设置select的值
			$("#select1 option[value = '" + hmethod + "']").attr("selected",
					"selected");
			$("#select2 option[value = '" + htype + "']").attr("selected",
					"selected");
			$("#select3 option[value = '" + hstate + "']").attr("selected",
					"selected");
			$("#select4 option[value = '" + hbelong + "']").attr("selected",
					"selected");
			$("#select5 option[value = '" + hpaytype + "']").attr("selected",
					"selected");

			//给修改框绑定click事件
			$("#check").bind("click", function() {
				//如果勾选编辑框
				if ($("#check").prop("checked")) {
					//去除disabled
					$(".form-control").prop("disabled", false);
					//显示上传图片
					$("#img").removeClass("sr-only");
					//显示更新按钮
					$("#updateBtn").removeClass("sr-only");
					//隐藏删除按钮
					$("#deleteBtn").addClass("sr-only");
				} else {//没有勾选
					//disabled
					$(".form-control").prop("disabled", true);
					//隐藏上传图片
					$("#img").addClass("sr-only");
					//隐藏更新按钮
					$("#updateBtn").addClass("sr-only");
					//显示删除按钮
					$("#deleteBtn").removeClass("sr-only");
				}
			});

			//给更新按钮绑定click事件
			$("#updateBtn")
					.bind(
							"click",
							function() {

								var bool = true;

								//标题
								var hname = $("#hname").val();
								if (hname === null || $.trim(hname).length == 0) {
									$("#hname" + "_tip").text("标题不能为空");
									bool = false;
								}
								//月租金额
								var hprice = $("#hprice").val();
								if (hprice === null
										|| $.trim(hprice).length == 0) {
									$("#hprice" + "_tip").text("请输入月租金额");
									bool = false;
								}
								//地理位置
								var hposition = $("#hposition").val();
								if (hposition === null
										|| $.trim(hposition).length == 0) {
									$("#hposition" + "_tip").text("房源位置不能为空");
									bool = false;
								}

								//居住类型
								var hmethod = Number($("#select1").find(
										"option:selected").val());
								if (hmethod > 1) {
									$("#hmethod" + "_tip").text("请选择居住类型");
									bool = false;
								}
								//出租类型
								var htype = Number($("#select2").find(
										"option:selected").val());
								if (htype > 2) {
									$("#htype" + "_tip").text("请选择出租类型");
									bool = false;
								}
								//房源状态
								var hstate = Number($("#select3").find(
										"option:selected").val());
								if (hstate > 1) {
									$("#hstate" + "_tip").text("请选择房源状态");
									bool = false;
								}
								//房源归属
								var hbelong = Number($("#select4").find(
										"option:selected").val());
								if (hbelong > 1) {
									$("#hbelong" + "_tip").text("请选择房源归属");
									bool = false;
								}
								//付款方式
								var hpaytype = Number($("#select5").find(
										"option:selected").val());
								if (hpaytype > 1) {
									$("#hpaytype" + "_tip").text("请选择付款方式");
									bool = false;
								}

								if (bool) {
									$("#form").submit();
								}
							});
		})
	</script>
</body>

</html>