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
<link href="../css/admin/bootstrap-table.min.css" rel="stylesheet" />
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
					<li><a href="/admin/skipAdminIndexPage.action" class="active">首页</a></li>
				</ol>

			</div>
			<div id="page-inner">
			<div class="row">
					<div class="col-sm-12">
						<h4>本月未交租客户统计</h4>
						<div id="table_index_bill"></div>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-sm-12">
						<h4>本月到期合同统计</h4>
						<div id="table_index_contract"></div>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-sm-6">
						<div id="echart_house" style="height:380px;"></div>
					</div>
					<div class="col-sm-6">
						<div id="echart_contract" style="height:380px;"></div>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-sm-12">
						<h4>本月预约趋势图</h4>
						<div id="AppointTrend" style="height:380px;"></div>
					</div>
				</div>
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
		
		<!-- echarts js -->
		<script src="../js/admin/echarts.min.js"></script>
		<script src="../js/admin/bootstrap-table.min.js"></script>
	    <script src="../js/admin/bootstrap-table-zh-CN.min.js"></script>
	    <script src="../js/admin/table_contractIndex.js"></script>
		<script src="../js/admin/table_billIndex.js"></script>
		
		<script>
			$(function() {
				setInterval(
						"curtime.innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt (new Date().getDay());",
						1000);
				// 基于准备好的dom，初始化echarts实例
		        var houseChart = echarts.init(document.getElementById("echart_house"));
		        var contractChart = echarts.init(document.getElementById("echart_contract"));
		        var appointChart = echarts.init(document.getElementById("AppointTrend"));
		        optionHouse = {
		        	    title: {
		        	        text: '房屋出租情况比例图',
		        	        left: 'center',
		        	        top: 40,
		        	        textStyle: {
		        	            color: 'black'
		        	        }
		        	    },

		        	    tooltip : {
		        	        trigger: 'item',
		        	        formatter: "{a} <br/>{b} : {c} ({d}%)"
		        	    },

		        	    visualMap: {
		        	        show: false,
		        	        min: 80,
		        	        max: 600,
		        	        inRange: {
		        	            colorLightness: [0, 1]
		        	        }
		        	    },
		        	    series : [
		        	        {
		        	            name:'房源出租',
		        	            type:'pie',
		        	            radius : '55%',
		        	            center: ['50%', '50%'],
		        	            data:[
		        	                {value:35, name:'未出租房源'},
		        	                {value:310, name:'已出租房源'},
		        	            ].sort(function (a, b) { return a.value - b.value; }),
		        	            label: {
		        	                normal: {
		        	                    textStyle: {
		        	                        color: 'black'
		        	                    }
		        	                }
		        	            },
		        	            labelLine: {
		        	                normal: {
		        	                    lineStyle: {
		        	                        color: 'blue'
		        	                    },
		        	                    smooth: 0.2,
		        	                    length: 10,
		        	                    length2: 20
		        	                }
		        	            },
		        	            itemStyle: {
		        	                normal: {
		        	                    color: '#c23531',
		        	                }
		        	            }
		        	        }
		        	    ]
		        	};
		        var optionContract = {
		        		title : {
		        			text : '本年每月入住客户统计图',
		        			left : 'center'
		        		},
		        	    legend: {},
		        	    tooltip: {},
		        	    xAxis: {
		        	    	name : '月',
		        	    	data: ["1月","2月","3月","4月","5月","6月", "7月", "8月", "9月", "10月", "11月", "12月"]
		        	    },
		        	    yAxis: {},
		        	    
		        	    series: [
		        	        {
		        	            type: 'bar',
		        	            smooth : true,
		        	            data : [12, 14, 1, 0, 43, 67, 21, 4, 5, 6, 32, 53]
		        	        }
		        	    ]
		        	};
		        var optionAppoint = {
		        	    legend: {},
		        	    tooltip: {
		        	    	
		        	    },
		        	    xAxis: {
		        	    	name : '号',
		        	        data: ["01","02","03","04","05","06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"]
		        	    },
		        	    yAxis: {},
		        	    
		        	    series: [
		        	        {
		        	        	name : '看房预约',
		        	            type: 'line',
		        	            smooth : true,
		        	            data:[1,2,1,4,12,14,15,1,2,1,,12,14,12,14,15,1,2,1,4,15,1,2,1,61,2,14,2,1,2,1,4,12,14,15]
		        	        },
		        	        {
		        	        	name : '业主加盟',
		        	            type: 'line',
		        	            smooth : true,
		        	            data:[4,2,5,6,7,0,34,1,2,1,4,12,14,15,1,4,1,4,12,14,15,1,2,1,5,12,6,7,0,34,1,2,1,4,12,14,21]
		        	        },
		        	    ]
		        	};
		     	// 使用刚指定的配置项和数据显示图表。
		        houseChart.setOption(optionHouse);
		        contractChart.setOption(optionContract);
		        appointChart.setOption(optionAppoint);
			})
		</script>
</body>

</html>