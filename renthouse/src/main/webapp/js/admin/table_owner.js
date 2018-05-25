// 对应table标签的id
$("#table").bootstrapTable({
	// 获取表格数据的url
	url : "/admin/queryAllOwners.action",
	toolbar : '#toolbar',
	// 设置为 false 禁用 AJAX 数据缓存， 默认为true
	cache : false,
	// 表格显示条纹，默认为false
	striped : true,
	showRefresh : true,
	// 在表格底部显示分页组件，默认false
	pagination : true,
	// 设置页面可以显示的数据条数
	pageList : [ 5, 10, 20 ],
	// 页面数据条数
	pageSize : 20,
	// 首页页码
	pageNumber : 1,
	// 设置为服务器端分页
	// 后台页面需要进行分页，返回total（总数）和rows（条件下的记录数）
	sidePagination : 'server',
	// 请求服务器数据时发送的参数，可以在这里添加额外的查询参数，返回false则终止请求
	queryParams : function(params) {

		return {
			// 每页要显示的数据条数
			ps : params.limit,
			// 每页显示数据的开始行号
			offset : params.offset,
			// 要排序的字段
			sort : params.sort,
			// 排序规则
			sortOrder : params.order,

			cname : $.trim($("#oname").val()),
			ctele : $.trim($("#otele").val()),
		}
	},
	// 要排序的字段
	sortName : 'oid',
	// 排序规则
	sortOrder : 'desc',
	columns : [ {
		field : 'oname',
		title : '房东名',
		align : 'center',
		valign : 'middle',
		width : 500
	}, {
		field : 'otele',
		title : '联系方式',
		align : 'center',
		valign : 'middle',
		width : 500
	}, {
		field : 'hid',
		title : '房源编码',
		align : 'center',
		valign : 'middle',
		width : 500
	}, {
		field : 'cid',
		title : '合同编码',
		align : 'center',
		valign : 'middle',
		width : 500
	}, {
		title : "操作",
		align : 'center',
		valign : 'middle',
		width : 200,
		formatter : function(value, row, index) {
			if(row.cid === null || row.cid === ''){
				return '<button class="btn btn-warning btn-sm sign" onclick="sign(\''
				+ row.oid
				+ ","
				+ row.oname
				+ ","
				+ row.otele
				+ ","
				+ row.hid
				+ '\')">生成合同</button>';
			}else{
				return "";
			}
		}
	}],
	onLoadSuccess : function() { // 加载成功时执行
		console.info("加载成功");
	},
	onLoadError : function() { // 加载失败时执行
		console.info("加载数据失败");
	}
});
//生成合同
function sign(row){
	$(".sign").attr("data-toggle", "modal").attr("data-target", "#myModal1");
	row = row.split(",");
	$("#form1 #oid").val(row[0]);
	$("#form1 #cname").val(row[1]);
	$("#form1 #ctele").val(row[2]);
	$("#form1 #hid").val(row[3]);
}