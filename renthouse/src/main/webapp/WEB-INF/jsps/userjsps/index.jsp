<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>CWH直租 | 首页</title>

    <!--导入bootstrap css-->
    <link href="../js/bootstrap/dist/css/bootstrap.css" rel="stylesheet">
    <!--自定义样式-->
    <link href="../css/user/common.css" rel="stylesheet">
    <link href="../css/user/index.css" rel="stylesheet">
    
    <link rel="icon" href="../img/songzi.png" type="image/x-icon"/>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>


<jsp:include page="/WEB-INF/jsps/userjsps/ttop.jsp"/>
<!--头部-->
<jsp:include page="/WEB-INF/jsps/userjsps/top.jsp"/>

<div class="container">
    <div class="row">
        <!--轮播图片-->
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>
            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active slide_div">
                    <img class="img_slide" src="../img/user/slide/slide_1.png" alt="...">
                    <div class="carousel-caption">
                    </div>
                </div>
                <div class="item slide_div">
                    <img class="img_slide" src="../img/user/slide/slide_2.png" alt="...">
                    <div class="carousel-caption">
                    </div>
                </div>
                <div class="item slide_div">
                    <img class="img_slide" src="../img/user/slide/slide_3.png" alt="...">
                    <div class="carousel-caption">
                    </div>
                </div>
                <div class="item slide_div">
                    <img class="img_slide" src="../img/user/slide/slide_4.png" alt="...">
                    <div class="carousel-caption">
                    </div>
                </div>
            </div>
            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

    </div>
    <br>
    <!--搜索框-->
    <div class="container-fluid">
        <div class="row ">
            <div class="col-sm-3"></div>
            <div class="col-sm-6">
                <div class="input-group">
                    <input type="text" style="height: 46px" class="searchVal form-control btn-lg" placeholder="输入小区、公交路线等">
                    <span class="input-group-addon" id="basic-addon2" style="background-color: #3dbcc6;">
                        <a class="search btn-lg"
                           style="text-decoration: none;color: white">搜索</a>
                    </span>
                </div>
            </div>
            <div class="col-sm-3"></div>
        </div>
    </div>
    <br>
    <!--承诺与服务-->
    <div class="container-fluid" style="margin-left: 60px">
        <div class="row">
            <div class="col-sm-2 col-xs-4">
                <img src="../img/user/propimg/adv_1.jpg">
                <h4>原创设计</h4>
            </div>
            <div class="col-sm-2 col-xs-4">
                <img src="../img/user/propimg/adv_2.jpg">
                <h4>高档家具</h4>
            </div>
            <div class="col-sm-2 col-xs-4">
                <img src="../img/user/propimg/adv_3.jpg">
                <h4>环保装修</h4>
            </div>
            <div class="col-sm-2 col-xs-4">
                <img src="../img/user/propimg/adv_4.jpg">
                <h4>极速Wi-Fi</h4>
            </div>
            <div class="col-sm-2 col-xs-4">
                <img src="../img/user/propimg/adv_5.jpg">
                <h4>维修服务</h4>
            </div>
            <div class="col-sm-2 col-xs-4">
                <img src="../img/user/propimg/adv_6.jpg">
                <h4>保洁服务</h4>
            </div>
        </div>
    </div>

    <!--好房推荐-->
    <div class="container-fluid" style="background-color:#f8f8f8">
        <div class="row">
            <div class="col-sm-1 col-xs-1"></div>
            <div class="col-sm-10" style="border-bottom: 1px solid">
                <div class="col-sm-10 col-xs-10">
                    <br>
                    <h2><span style="font-weight: bold">精选房源</span>为你而选</h2>
                    <h4>CWH直租致力于为租户创造高品质生活而努力</h4>
                    <br>
                </div>
                <div class="col-sm-2 col-xs-2 text-right">
                    <br>
                    <br>
                    <br>
                    <span><a href="/skipHousesPage.action" style="color: black;font-size: 20px">更多</a></span>
                </div>
            </div>
            <div class="col-sm-1 col-xs-1"></div>
        </div>
        <br>
        <br>
        <div class="row">
            <div class="col-sm-1 col-xs-1"></div>
            <div class="col-sm-10 col-xs-10">
                <c:forEach var="h" items="${hs }">
	                <div class="col-sm-4 col-xs-6 img_div">
	                    <a href="/skipHouseDetailPage.action?hid=${h.hid }"><img class="h_img" src="${h.himg }" style="width:100%"></a>
	                    <br>
	                    <br>
	                    <span class="h_price"><span class="price">￥${h.hprice }</span>元/月</span>
	                    <br>
	                    <span class="h_position"><span>${h.hposition }</span>&nbsp;&nbsp;<span>${h.hmodel }</span></span>
	                    <br>
	                    <span class="h_tran"><span>${h.hsubway}</span>/<span>${h.harea }</span>/<span style="color:red">
	                    <c:if test="${h.hpaytype eq 0}">月付</c:if>
	                    <c:if test="${h.hpaytype eq 1}">年付</c:if>
	                    </span></span>
	                </div>
                </c:forEach> 
            </div>
            <div class="col-sm-1 col-xs-1"></div>
        </div>
        </div>
</div>

<!--底部-->
<jsp:include page="/WEB-INF/jsps/userjsps/bottom.jsp"/>
</body>

<!--导入jQuery-->
<script src="../js/jquery-1.8.3.min.js"></script>
<!-- 导入bootstrap js支持-->
<script src="../js/bootstrap/dist/js/bootstrap.min.js"></script>
<script>
	$(function(){
		//给搜索框绑定单击时间
		$(".search").bind("click", function(){
			//得到输入框的值
			var searchVal = $(".searchVal").val();
			
			if(searchVal === null || $.trim(searchVal).length == 0){
				$(".searchVal").focus();
				$(".searchVal").css("border-color", "red");
			}else{
				$(".search").attr("href", "/skipHousesPage.action?searchVal=" + searchVal);
			}
		});
	});
</script>

</html>