// 对应table标签的id
$("#table")
		.bootstrapTable(
				{
					// 获取表格数据的url
					url : "/admin/queryAllContract.action",
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
							cstime : $.trim($("#cstime").val()),
							cname : $.trim($("#cname").val()),
							ctele : $.trim($("#ctele").val()),
							uid : $.trim($("#uid").val()),
							hid : $.trim($("#hid").val()),
							cid : $.trim($("#cid").val())
						}
					},
					// 要排序的字段
					sortName : 'cetime',
					// 排序规则
					sortOrder : 'desc',
					columns : [
							{
								field : 'cname',
								title : '客户名',
								align : 'center',
								valign : 'middle',
								width : 200
							},
							{
								field : 'ctele',
								title : '联系电话',
								align : 'center',
								valign : 'middle',
								width : 200
							},
							{
								field : 'cstime',
								title : '入住时间',
								align : 'center',
								valign : 'middle',
								width : 200
							},
							{
								field : 'cetime',
								title : '到期时间',
								align : 'center',
								valign : 'middle',
								width : 200
							},
							{
								field : 'crtime',
								title : '租期',
								align : 'center',
								valign : 'middle',
								width : 200
							},
							{
								field : 'payType',
								title : '付款方式',
								align : 'center',
								valign : 'middle',
								width : 200
							},
							{
								field : 'cpaytime',
								title : '付款时间',
								align : 'center',
								valign : 'middle',
								width : 200
							},
							{
								field : 'cashType',
								title : '押金方式',
								align : 'center',
								valign : 'middle',
								width : 200
							},
							{
								field : 'ccash',
								title : '押金',
								align : 'center',
								valign : 'middle',
								width : 200
							},
							{
								field : 'house.hposition',
								title : '房源位置',
								align : 'center',
								valign : 'middle',
								width : 200
							},
							{
								field : 'house.hprice',
								title : '房价',
								align : 'center',
								valign : 'middle',
								width : 200
							},
							{
								field : 'cmoney',
								title : '租金',
								align : 'center',
								valign : 'middle',
								width : 200
							},
							{
								field : 'admin.aname',
								title : '操作人',
								align : 'center',
								valign : 'middle',
								width : 200
							},
							{
								title : "操作",
								align : 'center',
								valign : 'middle',
								width : 200,
								formatter : function(value, row, index) {
									return '<button class="btn btn-warning btn-sm update glyphicon glyphicon-list" onclick="update(\''
											+ row.cid
											+ ','
											+ row.cname
											+ ','
											+ row.ctele
											+ ','
											+ row.cstime
											+ ','
											+ row.cetime
											+ ','
											+ row.payType
											+ ','
											+ row.cpaytime
											+ ','
											+ row.cashType
											+ ','
											+ row.ccash
											+ ','
											+ row.cmoney
											+ ','
											+ row.crtime
											+ ','
											+ row.uid
											+ '\')"></button>&nbsp;&nbsp;<button class="btn btn-danger btn-sm glyphicon glyphicon-remove del" onclick="del(\''
											+ row.cid
											+ ','
											+ row.uid
											+ '\')"></button>';
								}
							} ],
					onLoadSuccess : function() { // 加载成功时执行
						console.info("加载成功");
					},
					onLoadError : function() { // 加载失败时执行
						console.info("加载数据失败");
					}
				});
// 删除合同
function del(cid) {
	var obj = cid.split(",");
	cid = obj[0];
	var uid = obj[1];
	if(confirm("确定删除该合同嘛？")){
		$.post("/admin/delContractByCid.action", {cid : cid, uid : uid});
	}
}

// 修改合同
function update(row) {
	$(".update").attr("data-toggle", "modal").attr("data-target", "#myModal2");
	var obj = row.split(",");
	$("#conid").val(obj[0]);
	$("#name").val(obj[1]);
	$("#tele").val(obj[2]);
	$("#time").val(obj[3]);
	$("#cetime").val(obj[4]);
	if (obj[5] === '月付') {
		$("#select1 option[value = '" + 0 + "']").attr("selected", "selected");
	} else {
		$("#select1 option[value = '" + 1 + "']").attr("selected", "selected");
	}
	$("#cpaytime").val(obj[6]);
	if (obj[7] === '押一付一') {
		$("#select2 option[value = '" + 0 + "']").attr("selected", "selected");
	} else {
		$("#select2 option[value = '" + 1 + "']").attr("selected", "selected");
	}
	$("#ccash").val(obj[8]);
	$("#cmoney").val(obj[9]);
	$("#crtime").val(obj[10]);
	$("#id").val(obj[11]);
}