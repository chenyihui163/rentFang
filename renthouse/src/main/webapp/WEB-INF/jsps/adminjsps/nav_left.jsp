<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar-default navbar-side" role="navigation">
	<div class="sidebar-collapse">
		<ul class="nav" id="main-menu">

			<li><a class="active-menu"
				href="/admin/skipAdminIndexPage.action"><i
					class="fa fa-dashboard"></i> 仪表盘</a></li>
			<li>
			<li><a href=""><i class="glyphicon glyphicon-yen"></i> 财务管理<span
					class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
					<li><a href="/admin/skipRMoneyPage.action">租金管理</a></li>
					<li><a href="/admin/skipBillManagePage.action">账单管理</a></li>
				</ul>
			</li>
			<li><a href="#"><i class="glyphicon glyphicon-leaf"></i> 人员管理<span
					class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
					<li><a href="/admin/skipRenterManagePage.action">租客管理</a></li>
					<li><a href="/admin/skipOwnerManagePage.action">房东管理</a></li>
				</ul>
			</li>
			<li><a href=""><i class="glyphicon glyphicon-list-alt"></i> 合同管理<span
					class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
					<li><a href="/admin/skipRenterContractPage.action">租客合同</a></li>
					<li><a href="/admin/skipOwnerContractPage.action">房东合同</a></li>
				</ul>
			</li>
			<li><a href="#"><i class="glyphicon glyphicon-tag"></i> 预约管理<span
					class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
					<li><a href="/admin/skipJoinAppointPage.action">业主加盟</a></li>
					<li><a href="/admin/skipAppointPage.action">看房预约</a></li>
					<li><a href="/admin/skipAppointResultPage.action">预约结果</a></li>
				</ul>
			</li>
			<li><a href="/admin/skipHouseManagePage.action"><i
					class="glyphicon glyphicon-home"></i> 房源管理</a></li>
			<li><a href=""><i class="glyphicon glyphicon-cog"></i> 系统设置<span
					class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
					<li><a href="/admin/skipSysLogPage.action">日志管理</a></li>
					<li><a href="/admin/skipUserManagePage.action">用户管理</a></li>
					<li><a href="/admin/skipAdminManagePage.action">管理员管理</a></li>
				</ul>
			</li>
		</ul>
	</div>
</nav>