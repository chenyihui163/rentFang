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

.img_div {
	border: 1px solid grey;
	border-radius: 20px;
	margin-bottom: 20px;
	background-color: white;
}

.img_div:hover {
	border: 1px solid red;
}

.price {
	color: red;
	font-size: 22px;
}

.h_position {
	color: #0b0b0b;
	font-size: 16px;
}

.h_tran {
	color: grey;
	font-size: 14px;
}

.h_img {
	padding-bottom: 20px;
}

#ustate {
	background-color: red;
	color: black;
	border-radius: 5px;
	padding: 5px;
}

#state {
	background-color: green;
	color: black;
	border-radius: 5px;
	padding: 5px;
}

#ubelong {
	background-color: yellow;
	color: black;
	border-radius: 5px;
	padding: 5px;
}

#belong {
	background-color: orange;
	color: black;
	border-radius: 5px;
	padding: 5px;
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
					<li><a class="active">房源管理</a></li>
				</ol>
			</div>
			<div id="page-inner">
				<div class="container-fluid">
					<div class="row ">
						<div class="col-sm-3"></div>
						<div class="col-sm-6">
							<div class="input-group">
								<input type="text" style="height: 46px"
									class="searchVal form-control btn-lg" placeholder="输入小区、公交路线  等">
								<span class="input-group-addon" id="basic-addon2"
									style="background-color: #3dbcc6;"> <a
									class="search btn-lg"
									style="text-decoration: none; color: white">搜索</a>
								</span>
							</div>
						</div>
						<div class="col-sm-3"></div>
					</div>
				</div>
				<br> <br>
				<div class="row ">
					<div class="col-sm-5"></div>
					<div class="col-sm-4">
						<div class="input-group">
							<a data-toggle="modal" data-target="#myModal1"
								style="font-size: 18px">新增房源信息</a>
						</div>
					</div>
					<div class="col-sm-3"></div>
				</div>
				<br> <br>
				<div class="row">
					<div class="col-sm-1 col-xs-1"></div>
					<div class="col-sm-10 col-xs-10">

						<c:forEach var="h" items="${pb.beanList }">
							<div class="col-sm-12 col-xs-12 img_div">
								<br>
								<div class="col-sm-6">
									<a href="/admin/skipAdminHouseDetailPage.action?hid=${h.hid}"><img
										class="h_img" src="${h.himg }" style="width:100%"></a>
								</div>

								<div class="col-sm-6">
									<br> <br> <br> <span class="h_price"><span
										class="price">${h.hprice }</span>元/月</span> <br> <br> <span
										class="h_position"><span>${h.hposition }</span>&nbsp;&nbsp;<span>${h.hmodel }</span></span>
									<br> <br> <span class="h_tran"><span>${h.hsubway}</span>/<span>${h.harea }</span>/<span
										style="color: red"><c:if test="${h.hpaytype eq 0}">月付</c:if>
											<c:if test="${h.hpaytype eq 1}">年付</c:if></span></span> <br> <br>
									<c:choose>
										<c:when test="${h.hstate eq 0 }">
											<span id="ustate">未出租</span>
										</c:when>
										<c:otherwise>
											<span id="state">已出租</span>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${h.hbelong eq 0 }">
											<span id="ubelong">自有房</span>
										</c:when>
										<c:otherwise>
											<span id="belong">房东直租</span>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</c:forEach>
						<jsp:include page="/WEB-INF/jsps/page.jsp" />
					</div>
					<div class="col-sm-1 col-xs-1"></div>
				</div>
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
					<h4 id="" class="modal-title" id="myModalLabel">新增房源信息</h4>
				</div>
				<br>
				<div class="row">
					<div class="col-sm-1"></div>
					<div class="col-sm-10">
						<form action="/admin/addHouse.action" method="post" id="form1"
							class="form-horizontal" enctype="multipart/form-data">

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
										<option value="0">月付</option>
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

								<label for="htele" class="col-sm-2 control-label">联系方式:</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="htele" name="htele"
										value="${house.htele }"> <span id="htele_tip"
										style="color: red"></span>
								</div>
							</div>

							<div class="form-group">

								<label for="hbelong" class="col-sm-2 control-label">房源归属:</label>
								<div class="col-sm-4">
									<select name="hbelong" id="select4" class="form-control">
										<option value="2">请选择居住类型</option>
										<option value="0">自有房</option>
										<option value="1">房东直租</option>
									</select> <span id="hbelong_tip" style="color: red"></span>
								</div>

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
							<div class="modal-footer">
								<input type="button" class="btn btn-danger" data-dismiss="modal"
									value="关闭"> <a class="btn btn-warning" id="addHouse">增加</a>
							</div>
						</form>
					</div>
					<div class="col-sm-0.5"></div>
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
	<script type="text/javascript" src="../js/modalMsg.js"></script>
	<script type="text/javascript" src="../js/admin/house.js"></script>

	<script>
		$(function() {
			setInterval(
					"curtime.innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt (new Date().getDay());",
					1000);

			$("#form1 .form-control").focus(function() {
				var name = $(this).attr("name");
				$("#" + name + "_tip").text("");
			});

			$("#form1 #addHouse")
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
								//房源归属
								var hbelong = Number($("#select4").find(
										"option:selected").val());
								if (hbelong > 1) {
									$("#hbelong" + "_tip").text("请选择房源归属");
									bool = false;
								}

								if (bool) {
									$("#form").submit();
								}
							});

			//给搜索框绑定单击时间
			$(".search")
					.bind(
							"click",
							function() {
								//得到输入框的值
								var searchVal = $(".searchVal").val();

								if (searchVal === null
										|| $.trim(searchVal).length == 0) {
									$(".searchVal").focus();
									$(".searchVal").css("border-color", "red");
								} else {
									$(".search").attr(
											"href",
											"/admin/skipHouseManagePage.action?searchVal="
													+ searchVal);
								}
							});
		});
	</script>
</body>

</html>