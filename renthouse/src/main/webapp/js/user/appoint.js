$(function() {

	// 输入框得到焦点时，清空提示信息
	$(".form-control").focus(function() {

		// 得到输入框的值
		oldvalue = $(this).val();
		// 得到获取焦点的输入框对用的提示信息的id
		var id = $(this).attr("id");
		var errorid = id + "_error";
		// 得到提示框id
		var messid = id + "_mess";
		// 清空获得焦点的提示信息
		$("#" + errorid).text("");
		$("#" + messid).text("");
		// 改变输入框的颜色
		changeColor("focus", id, "");
	})

	// 输入框失去焦点时，进行数据的校验
	$(".form-control").blur(
			function() {
				// 得到获取焦点的输入框id
				var inpuutblur = $(this).attr("id");
				// 执行数据校验函数
				var checkfunname = "check"
						+ inpuutblur.substring(0, 1).toUpperCase()
						+ inpuutblur.substring(1) + "()";
				eval("(" + checkfunname + ")");
			})
});

// 改变输入框的颜色
function changeColor(state, id, bool) {

	var divid = id + "_form";
	var spanid = id + "_span";

	if (state == "focus") {
		$("#" + divid).removeClass("has-feedback").removeClass("has-error")
				.removeClass("has-success");
		$("#" + spanid).removeClass("glyphicon").removeClass(
				"form-control-feedback").removeClass("glyphicon-ok")
				.removeClass("glyphicon-remove");
	} else if (state == "blur") {

		$("#" + divid).addClass("has-feedback");
		$("#" + spanid).addClass("glyphicon").addClass("form-control-feedback");

		if (bool == "false") {
			$("#" + divid).addClass("has-error");
			$("#" + spanid).addClass("glyphicon-remove");
		} else {
			$("#" + divid).addClass("has-success");
			$("#" + spanid).addClass("glyphicon-ok");
		}
	}
};

function postForm() {

	var bool = true;

	if (!checkAname()) {
		bool = false;
	}

	if (!checkAtele()) {
		bool = false;
	}
	
	if (!checkAtime()) {
		bool = false;
	}
	
	if (bool) {
		$("#form").submit();
	}
	return bool;
}

// 校验用户
function checkAname() {

	var id = "aname";
	var value = $("#" + id).val();
	var messId = id + "_error";
	$("#" + messId).css("color", "red");

	// 用户名不能为空
	if (value == "" || $.trim(value) == "") {
		// 显示提示信息
		$("#" + messId).text("用户名不能为空");
		// 改变输入框的颜色,加上图标
		changeColor("blur", id, "false");

		return false;
	}

	// 用户名的长度再2-20个字符
	if (value.length < 2 || value.length > 20) {
		// 显示提示信息
		$("#" + messId).text("用户名需要再2-20位之间");
		// 改变输入框的颜色,加上图标
		changeColor("blur", id, "false");

		return false;
	}
	
	changeColor("blur", id, true);
	return true;
};

//校验手机号码
function checkAtele() {
	var id = "atele";
	var value = $("#" + id).val();
	var messId = id + "_error";
	$("#" + messId).css("color", "red");

	// 电话号码不能为空
	if (!value) {
		// 显示提示信息
		$("#" + messId).text("电话号码不能为空");
		// 改变输入框的颜色,加上图标
		changeColor("blur", id, "false");

		return false;
	}

	// 电话号码的长度必须是11个字符
	if (value.length != 11) {
		// 显示提示信息
		$("#" + messId).text("用电话号码的长度必须是11位");
		// 改变输入框的颜色,加上图标
		changeColor("blur", id, "false");

		return false;
	}

	// 电话号码必须全都数字
	if (!(/^[0-9]*[1-9][0-9]*$/.test(value))) {
		// 显示提示信息
		$("#" + messId).text("电话号码必须全都数字");
		// 改变输入框的颜色,加上图标
		changeColor("blur", id, "false");

		return false;
	}
	
	changeColor("blur", id, true);
	return true;
};

//校验预约时间
function checkAtime() {
	var id = "atime";
	var value = $("#" + id).val();
	var messId = id + "_error";
	$("#" + messId).css("color", "red");

	if(value === "" || value === null){
		// 显示提示信息
		$("#" + messId).text("请填写看房时间");
		// 改变输入框的颜色,加上图标
		changeColor("blur", id, "false");

		return false;
	}
	
	changeColor("blur", id, true);
	return true;
};