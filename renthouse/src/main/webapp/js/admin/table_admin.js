// 对应table标签的id
$("#table").bootstrapTable({
	// 获取表格数据的url
	url : "/admin/queryAdmins.action",
	toolbar : '#toolbar',
	// 设置为 false 禁用 AJAX 数据缓存， 默认为true
	cache : false,
	// 表格显示条纹，默认为false
	striped : true,
	showRefresh : true,
    clickToSelect: true,
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
		}
	},
	// 要排序的字段
	sortName : 'aid',
	// 排序规则
	sortOrder : 'desc',
	columns : [ {
		// 显示一个勾选框
		checkbox : true,
		// 居中显示
		align : 'center'
	}, {
		field : 'aname',
		title : '用户名',
		align : 'center',
		valign : 'middle',
		width : 200
	}, {
		field : 'arole',
		title : '角色',
		align : 'center',
		valign : 'middle',
		width : 200
	} ],
	onLoadSuccess : function() { // 加载成功时执行
		console.info("加载成功");
	},
	onLoadError : function() { // 加载失败时执行
		console.info("加载数据失败");
	}
});