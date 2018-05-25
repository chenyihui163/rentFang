$(function() {

	// 输入框得到焦点时，清空提示信息
	$(".form-control").focus(function() {
		//将顶部的提示信息清空
		$("#alert_msg").html("");
		$("#alert").addClass("sr-only");
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

	// 给提交按钮改变颜色
	$("#submitBtn").hover(function() {
		$(this).css("background-color", "#f60");
	}, function() {
		$(this).css("background-color", "#3dbcc6");
	})

	// 提交表单时进行校验
	$("#form").submit(function() {

		var bool = true;

		if (!checkUtele()) {
			bool = false;
		}

		if (!checkUpasswd()) {
			bool = false;
		}

		if(!checkVcode()){
			bool = false;
		}
		return bool;
	});
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

//校验验证码
function checkVcode(){
	var id = "vcode";
	var value = $("#" + id).val();
	var messId = id + "_mess";
	$("#" + messId).css("color", "red");
	
	if (!value) {
		// 显示提示信息
		$("#" + messId).text("验证码不能为空");
		// 改变输入框的颜色,加上图标
		changeColor("blur", id, "false");

		return false;
	}
	
	if(value.length != 4){
		// 显示提示信息
		$("#" + messId).text("验证码必须为4位数字");
		// 改变输入框的颜色,加上图标
		changeColor("blur", id, "false");

		return false;
	}
	
	//校验验证码是否输入正确
	$.ajax({
		url : "/checkVcode.action",// 要请求的方法
		data : {
			vcode : value
		},// 给服务器的参数
		type : "POST",
		dataType : "json",
		async : false,// 是否异步请求，如果是异步，那么不会等服务器返回，我们这个函数就向下运行了。
		cache : false,
		success : function(result) {
			if (result.bool == "false") {
				// 验证码错误
				changeColor("blur", id, result.bool);
				$("#" + messId).text(result.mess);
			}else{
				changeColor("blur", id, result.bool);
			}
		}
	})
	return true;
}
// 校验密码
function checkUpasswd() {
	var id = "upasswd";
	var value = $("#" + id).val();
	var messId = id + "_mess";
	$("#" + messId).css("color", "red");

	// 密码不能为空
	if (!value) {
		// 显示提示信息
		$("#" + messId).text("密码不能为空");
		// 改变输入框的颜色,加上图标
		changeColor("blur", id, "false");

		return false;
	}

	// 密码长度必须在6-20位之间
	if (value.length < 6 || value.length > 20) {
		// 显示提示信息
		$("#" + messId).text("密码长度必须在6-20位之间");
		// 改变输入框的颜色,加上图标
		changeColor("blur", id, "false");

		return false;
	}

	changeColor("blur", id, true);
	return true;
};
// 校验手机号码
function checkUtele() {
	var id = "utele";
	var value = $("#" + id).val();
	var messId = id + "_mess";
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

	// 校验电话号码是已经被注册
	$.ajax({
		url : "/checkTelephoneIsExist.action",// 要请求的方法
		data : {
			utele : value
		},// 给服务器的参数
		type : "POST",
		dataType : "json",
		async : false,// 是否异步请求，如果是异步，那么不会等服务器返回，我们这个函数就向下运行了。
		cache : false,
		success : function(result) {
			if (result.bool == "true") {
				// 电话号码被注册
				changeColor("blur", id, result.bool);
			} else {
				// 电话号码未被注册
				$("#" + messId).text(result.mess);
				changeColor("blur", id, result.bool);
			}
		}
	})
	return true;
};