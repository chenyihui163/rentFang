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
<title>CWH直租 | 房源详细</title>

<link href="../js/jquery.datetimepicker.css" rel="stylesheet">
<!--bootstrap css-->
<link href="../js/bootstrap/dist/css/bootstrap.css" rel="stylesheet">
	
<!--自定义样式-->
<link href="../css/user/common.css" rel="stylesheet">
<link href="../css/user/houseDetail.css" rel="stylesheet">
<link rel="icon" href="../img/songzi.png" type="image/x-icon" />

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

	<div class="container">

		<br>
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="/skipIndexPage.action">CWH直租</a></li>
				<li><a href="/skipHousesPage.action">我要找房</a></li>
				<li class="">${h.hname }</li>
			</ol>
		</div>
		<div class="row">
			<div class="col-sm-6 col-xs-12">
				<div id="carousel-example-generic" class="carousel slide"
					data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0"
							class="active"></li>

						<c:if test="${len > 1 }">
							<c:set var="index" value="1" />
							<c:forEach begin="${index }" end="${len-1 }" var="i">
								<li data-target="#carousel-example-generic"
									data-slide-to="${i }"></li>
							</c:forEach>
						</c:if>
					</ol>
					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active slide_div">
							<img src="${h.himg}" alt="..." style="width: 110%;">
							${h.himg}
							<div class="carousel-caption"></div>
						</div>
						<c:forEach var="img" items="${imgs }">
							<div class="item slide_div">
								<img style="width: 100%;" class="img_slide" src="${h.himg}"
									alt="...">
								<div class="carousel-caption"></div>
							</div>
						</c:forEach>
					</div>
					<!-- Controls -->
					<a class="left carousel-control" href="#carousel-example-generic"
						role="button" data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#carousel-example-generic"
						role="button" data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<div class="col-sm-6 col-xs-12">
				<span id="hname">${h.hname } ${h.hmodel }</span><span id="subway">${h.hsubway }</span>
				<br>
				<br> <span id="type"> <c:choose>
						<c:when test="${h.hmethod eq 0 }">合租</c:when>
						<c:when test="${h.hmethod eq 1 }">整租</c:when>
					</c:choose>
				</span> <span>&nbsp;</span> <span id="type"> <c:choose>
						<c:when test="${h.htype eq 0 }">日租房</c:when>
						<c:when test="${h.htype eq 1 }">月租房</c:when>
						<c:when test="${h.htype eq 2 }">长租房</c:when>
					</c:choose>
				</span> <br>
				<br>
				<br>
				<div class="month-money">
					<span id="month">月租<span id="money">${h.hprice }<span
							id="yuan">元/月</span></span></span>
				</div>
				<br>
				<address id="address">
					<p>
						<span id="hid">编号：${h.hid }</span>
					</p>
					<p>
						<span id="harea">面积：${h.harea }（以现场勘察为准）</span>
					</p>
					<p>
						<span id="hmodel">户型：${h.hmodel }</span><span id="hpaytype">付款方式：<c:if test="${h.hpaytype eq 0}">月付</c:if><c:if test="${h.hpaytype eq 1}">年付</c:if>[不收中介费]</span><span
							id="hfloor">楼层：${h.hfloor }</span>
					</p>
					<p>
						<span id="htoward">朝向：${h.htoward }</span><span id="hposition">区域：${h.hposition }</span><span
							id="hsubway">公交路线：${h.hsubway }</span>
					</p>
				</address>
				<div class="col-sm-6 col-xs-12">
					<div class="tele-app">
						<br>
						<p>
							<span>电话预约</span>
						</p>
						<p>
							<span>400-809-2223</span>
						</p>
						<p>
							<span>服务时间：9:00 - 21:00</span>
						</p>
						<br>
					</div>
				</div>
				<div class="col-sm-6 col-xs-12">
					<div class="see-house">
						<br> <span class="glyphicon glyphicon-search"></span><a
							href="#" data-toggle="modal" data-target="#myModal1" class="see">
							我要看房</a> <br>
						<br>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--底部-->
	<jsp:include page="/WEB-INF/jsps/userjsps/bottom.jsp" />
	<!-- 提示框 -->
	<jsp:include page="/WEB-INF/jsps/modal.jsp" />

	<!--弹出框-->
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">预约看房</h4>
				</div>
				<br>
				<div class="row">
					<div class="col-sm-2"></div>
					<div class="col-sm-8">

						<form method="get" action="/user/addAppoint.action" id="form">
							<%-- <input type="hidden" name="uid" value="${user.uid }"> --%>
							<input type="hidden" name="hid" value="${h.hid }">
							<div class="form-group" id="aname_form">
								<div class="input-group">
									<span class="input-group-addon">您的名字:</span> <input
										style="height: 50px" type="text" name="aname"
										class="form-control" id="aname" value="${appoint.aname }"
										aria-describedby="helpBlock1" placeholder="请输入您名字">
								</div>
								<span style="top: 8px" class="" id="aname_span"
									aria-hidden="true"></span> <span id="aname_error"
									style="color: red"></span>
							</div>
							<div class="form-group" id="atele_form">
								<div class="input-group">
									<span class="input-group-addon">联系方式:</span> <input
										style="height: 50px" type="text" name="atele"
										class="form-control" id="atele" value="${appoint.atele }"
										aria-describedby="helpBlock1" placeholder="请输入您的常用手机号码">
								</div>
								<span style="top: 8px" class="" id="atele_span"
									aria-hidden="true"></span> <span id="atele_error"
									style="color: red"></span>
							</div>
							<div class="form-group" id="atime_form">
								<div class="input-group">
									<span class="input-group-addon">看房时间:</span> 
									<input
										style="height: 50px" type="text" name="atime"
										class="form-control" id="atime" value="${appoint.atime }"
										aria-describedby="helpBlock1"
										>
								</div>
								<span style="top: 8px" class="" id="atime_span"
									aria-hidden="true"></span> <span id="atime_error"
									style="color: red"></span>
							</div>
							<div class="modal-footer">
								<input type="button" class="btn btn-danger" data-dismiss="modal"
									value="关闭"> <input onclick="postForm()" type="button"
									class="btn btn-warning" value="免费预约" />
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
</body>

<!--jQuery-->
<script src="../js/jquery-1.8.3.min.js"></script>
<!-- bootstrap js-->
<script src="../js/bootstrap/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/jquery.datetimepicker.full.min.js"></script>
<script type="text/javascript" src="../js/modalMsg.js"></script>
<script src="../js/user/appoint.js"></script>
<script>
	$(function(){
		$("#aname").val("");
		$("#atele").val("");
		$("#atime").val("");
		
		$.datetimepicker.setLocale('ch');
		$("#atime").datetimepicker({
			format: "Y-m-d H:i",
		});
	})
</script>
</html>