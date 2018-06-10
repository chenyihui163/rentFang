<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    
    <link href="../css/admin/bootstrap-table.min.css" rel="stylesheet" />
    <link rel="icon" href="../img/songzi.png" type="image/x-icon"/>
    <link href="../js/jquery.datetimepicker.css" rel="stylesheet">
    <style>
    	.curtime{
    		color:white;
    		margin-right:330px;
    		font-size: 18px;
    	}
    	.curtime:hover{
    		cursor: pointer;
    		color: yellow;
    	}

    </style>
</head>

<body>
    <div id="wrapper">
        <jsp:include page="/WEB-INF/jsps/adminjsps/nav_top.jsp"/>
        <jsp:include page="/WEB-INF/jsps/adminjsps/nav_left.jsp"/>
        
		<div id="page-wrapper">
		  	<div class="header"> 
				<ol class="breadcrumb">
				  <li><a href="/admin/skipAdminIndexPage.action">首页</a></li>
				  <li><a class="active">日志管理</a></li>
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
								<label for="loperateDate" class="col-sm-2 control-label">开始时间:</label>
								<div class="col-sm-2">
									<input type="text" class="form-control" id="loperateDate" name="loperateDate" value=""> 
								</div>
								
								<label for="ltimeout" class="col-sm-1 control-label">结束时间:</label>
								<div class="col-sm-2">
									<input type="text" class="form-control" id="ltimeout" name="ltimeout" value=""> 
								</div>
								
								<label for="aname" class="col-sm-1 control-label">操作人:</label>
								<div class="col-sm-2">
									<input type="text" class="form-control" id="aname" name="aname" value=""> 
								</div>
							</div>
							<div class="form-group">
								
								<label for="ltype" class="col-sm-2 control-label">类型:</label>
								<div class="col-sm-2">
									<select name="ltype" id="ltype" class="form-control">
										<option value="">请选择日志类型</option>
										<option value="info">info</option>
										<option value="error">error</option>
									</select> 
								</div>
								
								<label for="lmethod" class="col-sm-1 control-label">方式:</label>
								<div class="col-sm-2">
									<select name="lmethod" id="lmethod" class="form-control">
										<option value="">请选择请求方式</option>
										<option value="GET">get</option>
										<option value="POST">post</option>
									</select>  
								</div>
								
								<div class="col-sm-2 text-right">
									<input type="button" class="btn btn-info" id="query" value="查询" style="width:100px"> 
								</div>
							</div>
						</form>
            		</div>
            	</div>
            	<br>
            	<div id="table"></div> 
				<jsp:include page="/WEB-INF/jsps/adminjsps/footer.jsp"/>
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
    <script src="../js/admin/table_log.js"></script>
    <script type="text/javascript" src="../js/jquery.datetimepicker.full.min.js"></script>
    
    <script>
    	$(function(){
    		setInterval("curtime.innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt (new Date().getDay());",1000);
    		//时间选择器
			$.datetimepicker.setLocale('ch');
			$("#loperateDate").datetimepicker({
				format: "Y-m-d H:i:s",
			});
			$("#ltimeout").datetimepicker({
				format: "Y-m-d H:i:s",
			});
			$("#query").bind("click", function(){
				$("#table").bootstrapTable('refresh');
			});
    	})
    </script>
</body>

</html>