$(function(){
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
							$("#form1").submit();
						}
					});
});