// 对应table标签的id
$("#table").bootstrapTable({
	// 获取表格数据的url
	url : "/admin/queryAllAppointResults.action",
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
			antime : $.trim($("#antime").val()),
			name : $.trim($("#name").val()),
			atele : $.trim($("#atele").val()),
			aname : $.trim($("#aname").val()),
			result : $.trim($("#result").val()),
			state : $.trim($("#state").val()),
			rtype : $.trim($("#rtype").val())
		}
	},
	// 要排序的字段
	sortName : 'ctime',
	// 排序规则
	sortOrder : 'desc',
	columns : [ {
		field : 'name',
		title : '预约人',
		align : 'center',
		valign : 'middle',
		width : 200
	}, {
		field : 'atele',
		title : '联系方式',
		align : 'center',
		valign : 'middle',
		width : 200
	}, {
		field : 'antime',
		title : '预约时间',
		align : 'center',
		valign : 'middle',
		width : 200
	}, {
		field : 'ctime',
		title : '处理时间',
		align : 'center',
		valign : 'middle',
		width : 200
	}, {
		field : 'isConnect',
		title : '是否联系',
		align : 'center',
		valign : 'middle',
		cellStyle : function(value, row, index) {
			if (value === '未联系') {
				return {
					css : {
						"background-color" : "gold"
					}
				};
			} else {
				return {
					css : {

					}
				};
			}
		},
		width : 200
	}, {
		field : 'isSuccess',
		title : '结果',
		align : 'center',
		valign : 'middle',
		cellStyle : function(value, row, index) {
			if (value === '未签约') {
				return {
					css : {
						"background-color" : "red"
					}
				};
			} else {
				return {
					css : {

					}
				};
			}
		},
		width : 200
	}, {
		field : 'admin.aname',
		title : '操作人',
		align : 'center',
		valign : 'middle',
		width : 200
	}, {
		field : 'reason',
		title : '原因',
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