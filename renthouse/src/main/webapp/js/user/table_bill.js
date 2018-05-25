// 对应table标签的id
$("#table_bill")
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
					toolbarAlign : "right",
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
							uid : $.trim($("#uid").val()),
							state : $("#bstate").val()
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
								width : 300
							},
							{
								field : 'bpaytime',
								title : '支付时间',
								align : 'center',
								valign : 'middle',
								width : 300
							},{
								title : "操作",
								align : 'center',
								valign : 'middle',
								width : 200,
								formatter : function(value, row, index) {
									if(row.isPay === '未支付'){
										
										return '<button class="btn btn-danger btn-sm pay" onclick="pay(\''
												+ row.bid
												+ '\')">立即支付</button>';
									}else{
									}
								}
							}
							],
					onLoadSuccess : function() { // 加载成功时执行
						console.info("加载成功");
					},
					onLoadError : function() { // 加载失败时执行
						console.info("加载数据失败");
					}
				});
function pay(bid){
	$(".pay").attr("data-toggle", "modal").attr("data-target", "#myModal2");
	$("#bid").val(bid);
}