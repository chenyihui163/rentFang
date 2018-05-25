$(function(){
	
	//关闭弹出框，清空提示信息
	$('#myModal').on('hidden.bs.modal', function () {
		$("#tips").text("");
	})
	
	// 如果tips有值，弹出提示框
	if ($("#tips").text() != "") {
		$("#myModal").modal({
			"show" : true
		});
	}
})