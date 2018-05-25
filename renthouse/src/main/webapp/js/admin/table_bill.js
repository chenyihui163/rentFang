// 对应table标签的id
$("#table")
		.bootstrapTable(
				{
					// 获取表格数据的url
					url : "/admin/queryAllBills.action",
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
							mtime : $.trim($("#btime").val()),
							uname : $.trim($("#uname").val()),
							rname : $.trim($("#rname").val()),
							uid : $.trim($("#uid").val()),
							cid : $.trim($("#cid").val()),
							state : $.trim($("#state").val())
						}
					},
					// 要排序的字段
					sortName : 'btime',
					// 排序规则
					sortOrder : 'desc',
					columns : [
							{
								field : 'user.uname',
								title : '登录名',
								align : 'center',
								valign : 'middle',
								width : 300
							},
							{
								field : 'btime',
								title : '创建时间',
								align : 'center',
								valign : 'middle',
								width : 300
							},
							{
								field : 'bdue',
								title : '收款原因',
								align : 'center',
								valign : 'middle',
								width : 300
							},
							{
								field : 'bprice',
								title : '金额',
								align : 'center',
								valign : 'middle',
								width : 300
							},
							{
								field : 'isPay',
								title : '是否支付',
								align : 'center',
								valign : 'middle',
								cellStyle : function(value, row, index) {
									if (value === '未支付') {
										return {
											css : {
												"background-color" : "red"
											}
										};
									} else {
										return {
											"css" : {
												"background-color" : ""
											}
										};
									}
								},
								width : 300
							},
							{
								field : 'bpaytime',
								title : '支付时间',
								align : 'center',
								valign : 'middle',
								width : 300
							},
							{
								title : "操作",
								align : 'center',
								valign : 'middle',
								width : 200,
								formatter : function(value, row, index) {
									if(row.isPay === '未支付'){
										
										return '<button class="btn btn-warning btn-sm update glyphicon glyphicon-list" onclick="update(\''
												+ row.bid
												+ ','
												+ row.bdue
												+ ','
												+ row.bprice
												+ ','
												+ '\')"></button>&nbsp;&nbsp;<button class="btn btn-danger btn-sm glyphicon glyphicon-remove del" onclick="del(\''
												+ row.bid
												+ ','
												+ row.isPay
												+ ','
												+ '\')"></button>';
									}else{
										return '<button class="btn btn-danger btn-sm glyphicon glyphicon-remove del" onclick="del(\''
										+ row.bid
										+ ','
										+ row.isPay
										+ ','
										+ '\')"></button>';
									}
								}
							} ],
					onLoadSuccess : function() { // 加载成功时执行
						console.info("加载成功");
					},
					onLoadError : function() { // 加载失败时执行
						console.info("加载数据失败");
					}
				});
//修改账单
function update(row){
	$(".update").attr("data-toggle", "modal").attr("data-target", "#myModal1")
	row = row.split(",");
	var bid = row[0];
	var bdue = row[1];
	var bprice = row[2];
	
	$("#bid").val(bid);
	$("#bdue").val(bdue);
	$("#bprice").val(bprice);
}
//删除账单
function del(row){
	row = row.split(",");
	var bid = row[0];
	var isPay = row[1];
	
	if(isPay === '未支付'){
		if(confirm("该账单还未支付，你确认要删除嘛？")){
			$.post("/admin/delBillByBid.action", {"bid":bid});
		}
	}else{
		$.post("/admin/delBillByBid.action", {"bid":bid});
	}
}