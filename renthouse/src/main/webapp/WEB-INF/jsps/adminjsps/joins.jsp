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
					<li><a class="active">业主加盟</a></li>
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
								<label for="jtime" class="col-sm-2 control-label">预约时间:</label>
								<div class="col-sm-2">
									<input type="text" class="form-control" id="jtime"
										name="atime" value="">
								</div>

								<label for="jname" class="col-sm-1 control-label">房东名:</label>
								<div class="col-sm-2">
									<input type="text" class="form-control" id="jname" name="aname"
										value="">
								</div>

								<label for="jtele" class="col-sm-1 control-label">手机号:</label>
								<div class="col-sm-2">
									<input type="text" class="form-control" id="jtele" name="atele"
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

	<!-- 取消预约弹出框 -->
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 id="" class="modal-title" id="myModalLabel">取消加盟预约</h4>
				</div>
				<br>
				<div class="row">
					<div class="col-sm-1"></div>
					<div class="col-sm-11">
						<form action="/admin/cancelJoinAppoint.action" method="post" id="form"
							class="form-horizontal">
							<input type="hidden" name="jid" id="jid" /> 
							<input type="hidden" name="name" id="jname" /> 
							<input type="hidden" name="atele" id="jtele" /> 
							<input type="hidden" name="antime" id="jtime" />
							<div class="form-group">
								<label for=state class="col-sm-2 control-label">是否联系:</label>
								<div class="col-sm-8">
									<select name="state" class="form-control"
										style="width: 40%">
										<option value="0">未联系</option>
										<option value="1">已联系</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for=resaon class="col-sm-2 control-label">取消原因:</label>
								<div class="col-sm-8">
									<textarea rows="4" cols="75" name="reason" id="reason"
										class="form-control"></textarea>
									<span id="error" style="color: red"></span>
								</div>
							</div>
							<div class="modal-footer">
								<input type="button" class="btn btn-default" data-dismiss="modal"
									value="关闭"> <a class="btn btn-danger"
									id="cancelAppoint">取消预约</a>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<!-- 增加房源信息 -->
		<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
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
						<form action="/admin/addJoinHouse.action" method="post" id="form1"
							class="form-horizontal" enctype="multipart/form-data">
							<input type="hidden" name="jid" id="jid" /> 
							<input type="hidden" name="jname" id="jname" /> 
							<input type="hidden" name="jtele" id="jtele" /> 
							<input type="hidden" name="jtime" id="jtime" /> 
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

	<script type="text/javascript"
		src="../js/jquery.datetimepicker.full.min.js"></script>
	<script src="../js/admin/bootstrap-table.min.js"></script>
	<script src="../js/admin/bootstrap-table-zh-CN.min.js"></script>
	<script src="../js/admin/table_joins.js"></script>
	<script type="text/javascript" src="../js/modalMsg.js"></script>
	<script type="text/javascript" src="../js/admin/house.js"></script>

	<script>
$("#reason").val("");
$(function() {
  //时间选择器
  $.datetimepicker.setLocale("ch");
  $("#jtime").datetimepicker({
    format: "Y-m-d H:i"
  });
  //时间
  setInterval(
    "curtime.innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt (new Date().getDay());",
    1000
  );
  $(".form-control").focus(function() {
    $("#error").text("");
  });
  //取消预约校验
  $("#cancelAppoint").bind("click", function() {
    var bool = true;

    var val = $("#reason");
    if (val == null || $.trim(val).length == 0) {
      $("#error").text("取消原因必须填写");
      bool = false;
    }

    if (bool) {
      $("#form").submit();
    }
  });
  $("#form1 .form-control").focus(function() {
    $("#" + $(this).attr("name") + "_tip").text("");
    $(this).css("border", "null");
  });
  
  $("#query").bind("click", function() {
    $("#table").bootstrapTable("refresh");
  });
});
</script>
</body>

</html>