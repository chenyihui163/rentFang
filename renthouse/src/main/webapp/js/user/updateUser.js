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

	if (!checkUname()) {
		bool = false;
	}

	if (!checkUpasswd()) {
		bool = false;
	}

	//查看是否输入了新密码
	var passwd = $("#newpasswd").val();
	if(passwd != null && $.trim(passwd) != ""){
		bool = checkNewpasswd();
	}
	
	//查看email是否输入了
	var value = $("#uemail").val();
	if(value != null && $.trim(value) != ""){
		bool = checkUemail();
	}

	if (bool) {
		$("#form").submit();
	}
	return bool;
}

// 校验邮箱
function checkUemail() {
	var id = "uemail";
	var value = $("#" + id).val();
	var messId = id + "_error";
	$("#" + messId).css("color", "red");

	if(value != null && $.trim(value).length > 0){
		// 校验email的格式
		if (!/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/
				.test(value)) {
			// 显示提示信息
			$("#" + messId).text("email的格式不正确");
			// 改变输入框的颜色,加上图标
			changeColor("blur", id, "false");

			return false;
		}
	}
	return true;
};

// 校验用户
function checkUname() {

	var id = "uname";
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

	// 用户名的长度再4-20个字符
	if (value.length < 2 || value.length > 20) {
		// 显示提示信息
		$("#" + messId).text("用户名需要再2-20位之间");
		// 改变输入框的颜色,加上图标
		changeColor("blur", id, "false");

		return false;
	}
	
	return true;
};

var oldTele = $("#utele").val();
//校验手机号码
function checkUtele() {
	var id = "utele";
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

	// 校验输入的电话号码是否被注册了
	if(oldTele != value){
		$.ajax({
			url : "/checkUteleIsExist.action",// 要请求的方法
			data : {
				utele : value
			},// 给服务器的参数
			type : "POST",
			dataType : "json",
			async : false,// 是否异步请求，如果是异步，那么不会等服务器返回，我们这个函数就向下运行了。
			cache : false,
			success : function(result) {
				if (result.bool == "false") {
					// 电话号码被注册
					$("#" + messId).text(result.mess);
					changeColor("blur", id, result.bool);
				} else {
					// 电话号码可用
					changeColor("blur", id, result.bool);
				}
			}
		});
	}
	
	return true;
};
// 校验旧密码
function checkUpasswd() {
	var id = "upasswd";
	var value = $("#" + id).val();
	var messId = id + "_error";
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
	
	//校验密码是否输入正确
	$.ajax({
		url : "/checkUpasswd.action",// 要请求的方法
		data : {
			upasswd : value
		},// 给服务器的参数
		type : "POST",
		dataType : "json",
		async : false,// 是否异步请求，如果是异步，那么不会等服务器返回，我们这个函数就向下运行了。
		cache : false,
		success : function(result) {
			if (result.bool == "false") {
				// 密码输入错误
				$("#" + messId).text(result.mess);
				changeColor("blur", id, result.bool);
			} else {
				// 密码输入正确
				changeColor("blur", id, result.bool);
			}
		}
	});

	changeColor("blur", id, true);
	return true;
};

//校验新密码
function checkNewpasswd() {
	var id = "newpasswd";
	var value = $("#" + id).val();
	var messId = id + "_error";
	$("#" + messId).css("color", "red");

	if(value != null && $.trim(value).length > 0){
		// 密码长度必须在6-20位之间
		if (value.length < 6 || value.length > 20) {
			// 显示提示信息
			$("#" + messId).text("密码长度必须在6-20位之间");
			// 改变输入框的颜色,加上图标
			changeColor("blur", id, "false");

			return false;
		}

		//比较新旧密码
		var oldpass = $("#upasswd").val();
		if(value === oldpass){
			// 显示提示信息
			$("#" + messId).text("新密码和旧密码相同");
			// 改变输入框的颜色,加上图标
			changeColor("blur", id, "false");

			return false;
		}
	}
	
	return true;
};