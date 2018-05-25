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
					<li><a class="active">用户管理</a></li>
				</ol>

			</div>
			<div id="page-inner">
				<div id="toolbar" class="btn-group">
					<button id="btn_add" type="button" class="btn btn-default" 
					data-toggle="modal" data-target="#myModal1">
						<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
					</button>
					<!-- <button id="btn_edit" type="button" class="btn btn-default">
						<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
					</button> -->
					<button id="btn_delete" type="button" class="btn btn-default">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
					</button>
				</div>
				<div id="table"></div>
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
					<h4 class="modal-title" id="myModalLabel">新增管理员</h4>
				</div>
				<br>
				<div class="row">
					<div class="col-sm-2"></div>
					<div class="col-sm-8">
						<form method="post" action="/admin/addAdmin.action" id="form">
							<input type="hidden" name="isAdmin" value="1">
							<div class="form-group" id="uname_form">
								<div class="input-group">
									<span class="input-group-addon">登 陆 名:</span> <input
										style="height: 50px" type="text" name="aname"
										class="form-control" id="aname" value="${aadmin.aname}"
										aria-describedby="helpBlock1" placeholder="">
								</div>
								<span style="top: 8px" class="" id="aname_span"
									aria-hidden="true"></span> <span id="aname_error"
									style="color: red"></span>
							</div>
							<div class="form-group" id="apasswd_form">
								<div class="input-group">
									<span class="input-group-addon">登 陆 密 码:</span> <input
										style="height: 50px" type="password" name="apasswd"
										class="form-control" id="apasswd" value=""
										aria-describedby="helpBlock1" placeholder="">
								</div>
								<span style="top: 8px" class="" id="apasswd_span"
									aria-hidden="true"></span> <span id="apasswd_error"
									style="color: red"></span>
							</div>
							<div class="modal-footer">
								<input type="button" class="btn btn-danger" data-dismiss="modal"
									value="关闭"> <input onclick="postForm()" type="button"
									class="btn btn-warning" value="添加" />
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

	<!-- 提示框 -->
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

	<script src="../js/admin/bootstrap-table.min.js"></script>
	<script src="../js/admin/bootstrap-table-zh-CN.min.js"></script>
	<script src="../js/admin/table_admin.js"></script>
	<script type="text/javascript" src="../js/modalMsg.js"></script>

	<script>
		$(function() {
			//显示时间
			setInterval(
					"curtime.innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt (new Date().getDay());",
					1000);
			
			$("#btn_delete").bind("click", function(){
				var arrid = new Array();
				arrid = $("#table").bootstrapTable("getSelections");
				
				if(arrid.length == 0){
					alert("请选择需要删除的数据");
					return;
				}
				
				var ids = new Array();
				//过滤出所有勾选项的id
				for(var i =0; i <arrid.length; i++){
					ids.push(arrid[i].aid);
				}
				
				$.ajax({
					url:'/admin/delAdminByids.action',
					cache:false,
					data:{
						ids: ids.toString()
					},
					type : "POST",
					dataType : "json",
					async : false,// 是否异步请求，如果是异步，那么不会等服务器返回，我们这个函数就向下运行了。
					cache : false,
					success : function(result){
						alert(result.mess);
						$("#table").bootstrapTable("refresh");
					}
				});
			});
		})

		function postForm() {
			var bool = true;

			var aname = $("#aname").val();
			if (aname === null || $.trim(aname).length == 0) {
				$("#aname").focus().css("border", "1px solid red");
				bool = false;
			}

			var apasswd = $("#apasswd").val();
			if (apasswd === null || $.trim(apasswd).length == 0) {
				$("#apasswd").focus().css("border", "1px solid red");
				bool = false;
			}

			if (bool) {
				$("#form").submit();
			}
		}
	</script>
</body>

</html>