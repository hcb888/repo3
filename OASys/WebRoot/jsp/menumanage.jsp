<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'menumanage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/common/box.css" />
<link rel="stylesheet" type="text/css" href="css/common/checkbox.css" />
<style type="text/css">
a {
	color: black;
}

a:hover {
	text-decoration: none;
}

.bgc-w {
	background-color: #fff;
}
.table>tbody>tr>td{
    border-top: 1px solid rgba(245, 245, 220, 0.29);
    }

</style>

<div class="row" style="padding-top: 10px;">
	<div class="col-md-2">
		<h1 style="font-size: 24px; margin: 0;" class="">菜单管理</h1>
	</div>
	<div class="col-md-10 text-right">
		<a href="index"><span class="glyphicon glyphicon-home"></span> 首页</a>
		> <a disabled="disabled">菜单管理</a>
	</div>
</div>

<div class="row" style="padding-top: 15px;">
	<div class="col-md-12">
		<!--id="container"-->
		<div class="bgc-w box box-primary">
			<!--盒子头-->
			<div class="box-header">
				<h3 class="box-title">
					<a href="menuadd.html" class="label label-success"
						style="padding: 5px;"> <span class="glyphicon glyphicon-plus"></span>
						新增
					</a>
					<a href="" class="label label-success" style="padding: 5px;margin-left:5px;">
						<span class="glyphicon glyphicon-refresh"></span> 刷新
					</a>
				</h3>
				<div class="box-tools">
					<div class="input-group" style="width: 150px;">
						<input type="text" class="form-control input-sm baseKey"
							placeholder="按名称查找" />
						<div class="input-group-btn">
							<a class="btn btn-sm btn-default baseKeySubmit"><span
								class="glyphicon glyphicon-search"></span></a>
						</div>
					</div>
				</div>
			</div>
			<!--盒子身体-->
			<div class="box-body no-padding thistable">
<div class="table-responsive">
					<table class="table table-hover">
						<tr>
							<th scope="col">名称</th>
							<th scope="col">图标</th>
							<th scope="col">路径</th>
							<th scope="col">类型</th>
							<th scope="col">排序</th>
							<th scope="col">显示</th>
							<th scope="col">操作</th>
						</tr>
												<tr style="background:rgba(255, 235, 59, 0.19);">
							<td>系统管理</td>
							<td><span class="glyphicon glyphicon-cog"></span></td>
							<td><span>##</span></td>
							<td><span>
								父级
							</span></td>
							<td><span>0</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=0&sortid=0&menuid=1&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=0&sortid=0&menuid=1&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html" class="label xiugai"><span
									class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=1" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									<a  href="menuadd.html" class="label xinzeng"><span
									class="glyphicon glyphicon-plus"></span> 新增</a>
									</td>
						</tr>
						<tr>
							<td>类型管理</td>
							<td><span class="glyphicon glyphicon-record"></span></td>
							<td><span>/testsystype</span></td>
							<td><span>子级菜单栏</span></td>
							<td><span>1</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=1&sortid=1&menuid=15&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=1&sortid=1&menuid=15&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html" class="label xiugai"><span
					class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=15" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									</td>
						</tr>
						<tr>
							<td>菜单管理</td>
							<td><span class="glyphicon glyphicon-record"></span></td>
							<td><span>/testsysmenu</span></td>
							<td><span>子级菜单栏</span></td>
							<td><span>2</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=1&sortid=2&menuid=14&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=1&sortid=2&menuid=14&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=14" class="label xiugai"><span
					class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=14" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									</td>
						</tr>
						<tr>
							<td>状态管理</td>
							<td><span class="glyphicon glyphicon-record"></span></td>
							<td><span>/testsysstatus</span></td>
							<td><span>子级菜单栏</span></td>
							<td><span>3</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=1&sortid=3&menuid=16&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=1&sortid=3&menuid=16&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=16" class="label xiugai"><span
					class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=16" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									</td>
						</tr>
						<tr style="background:rgba(255, 235, 59, 0.19);">
							<td>用户管理</td>
							<td><span class="glyphicon glyphicon-education"></span></td>
							<td><span>#</span></td>
							<td><span>
								父级
							</span></td>
							<td><span>2</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=0&sortid=2&menuid=2&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=0&sortid=2&menuid=2&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=2" class="label xiugai"><span
									class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=2" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									<a  href="menuadd.html" class="label xinzeng"><span
									class="glyphicon glyphicon-plus"></span> 新增</a>
									</td>
						</tr>
						<tr>
							<td>部门管理</td>
							<td><span class="glyphicon glyphicon-record"></span></td>
							<td><span>/deptmanage</span></td>
							<td><span>子级菜单栏</span></td>
							<td><span>1</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=2&sortid=1&menuid=17&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=2&sortid=1&menuid=17&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=17" class="label xiugai"><span
					class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=17" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									</td>
						</tr>
						<tr>
							<td>在线用户</td>
							<td><span class="glyphicon glyphicon-record"></span></td>
							<td><span>/morelogrecord</span></td>
							<td><span>子级菜单栏</span></td>
							<td><span>2</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=2&sortid=2&menuid=20&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=2&sortid=2&menuid=20&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=20" class="label xiugai"><span
					class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=20" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									</td>
						</tr>
						<tr>
							<td>职位管理</td>
							<td><span class="glyphicon glyphicon-record"></span></td>
							<td><span>/positionmanage</span></td>
							<td><span>子级菜单栏</span></td>
							<td><span>3</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=2&sortid=3&menuid=18&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=2&sortid=3&menuid=18&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=18" class="label xiugai"><span
					class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=18" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									</td>
						</tr>
						<tr>
							<td>用户管理</td>
							<td><span class="glyphicon glyphicon-record"></span></td>
							<td><span>/usermanage</span></td>
							<td><span>子级菜单栏</span></td>
							<td><span>4</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=2&sortid=4&menuid=19&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=2&sortid=4&menuid=19&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=19" class="label xiugai"><span
					class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=19" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									</td>
						</tr>
						<tr style="background:rgba(255, 235, 59, 0.19);">
							<td>角色列表</td>
							<td><span class="glyphicon glyphicon-user"></span></td>
							<td><span>#</span></td>
							<td><span>
								父级
							</span></td>
							<td><span>3</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=0&sortid=3&menuid=3&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=0&sortid=3&menuid=3&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=3" class="label xiugai"><span
									class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=3" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									<a  href="menuadd.html" class="label xinzeng"><span
									class="glyphicon glyphicon-plus"></span> 新增</a>
									</td>
						</tr>
						<tr>
							<td>角色列表</td>
							<td><span class="glyphicon glyphicon-record"></span></td>
							<td><span>/rolemanage</span></td>
							<td><span>子级菜单栏</span></td>
							<td><span>1</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=3&sortid=1&menuid=21&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=3&sortid=1&menuid=21&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=21" class="label xiugai"><span
					class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=21" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									</td>
						</tr>
						<tr style="background:rgba(255, 235, 59, 0.19);">
							<td>考勤管理</td>
							<td><span class="glyphicon glyphicon-time"></span></td>
							<td><span>#</span></td>
							<td><span>
								父级
							</span></td>
							<td><span>4</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=0&sortid=4&menuid=4&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=0&sortid=4&menuid=4&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=4" class="label xiugai"><span
									class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=4" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									<a  href="menuadd.html" class="label xinzeng"><span
									class="glyphicon glyphicon-plus"></span> 新增</a>
									</td>
						</tr>
						<tr>
							<td>考勤管理</td>
							<td><span class="glyphicon glyphicon-record"></span></td>
							<td><span>/attendceatt</span></td>
							<td><span>子级菜单栏</span></td>
							<td><span>1</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=4&sortid=1&menuid=22&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=4&sortid=1&menuid=22&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=22" class="label xiugai"><span
					class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=22" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									</td>
						</tr>
						<tr>
							<td>考勤周报表</td>
							<td><span class="glyphicon glyphicon-record"></span></td>
							<td><span>/attendceweek</span></td>
							<td><span>子级菜单栏</span></td>
							<td><span>2</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=4&sortid=2&menuid=23&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=4&sortid=2&menuid=23&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=23" class="label xiugai"><span
					class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=23" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									</td>
						</tr>
						<tr>
							<td>考勤月报表</td>
							<td><span class="glyphicon glyphicon-record"></span></td>
							<td><span>/attendcemonth</span></td>
							<td><span>子级菜单栏</span></td>
							<td><span>3</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=4&sortid=3&menuid=24&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=4&sortid=3&menuid=24&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=24" class="label xiugai"><span
					class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=24" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									</td>
						</tr>
						<tr>
							<td>考勤列表</td>
							<td><span class="glyphicon glyphicon-record"></span></td>
							<td><span>/attendcelist</span></td>
							<td><span>子级菜单栏</span></td>
							<td><span>4</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=4&sortid=4&menuid=67&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=4&sortid=4&menuid=67&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=67" class="label xiugai"><span
					class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=67" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									</td>
						</tr>
						<tr style="background:rgba(255, 235, 59, 0.19);">
							<td>流程管理</td>
							<td><span class="glyphicon glyphicon-hourglass"></span></td>
							<td><span>#</span></td>
							<td><span>
								父级
							</span></td>
							<td><span>5</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=0&sortid=5&menuid=5&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=0&sortid=5&menuid=5&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=5" class="label xiugai"><span
									class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=5" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									<a  href="menuadd.html" class="label xinzeng"><span
									class="glyphicon glyphicon-plus"></span> 新增</a>
									</td>
						</tr>
						<tr>
							<td>新建流程</td>
							<td><span class="glyphicon glyphicon-record"></span></td>
							<td><span>/xinxeng</span></td>
							<td><span>子级菜单栏</span></td>
							<td><span>0</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=5&sortid=0&menuid=90&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=5&sortid=0&menuid=90&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=90" class="label xiugai"><span
					class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=90" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									</td>
						</tr>
						<tr>
							<td>我的申请</td>
							<td><span class="glyphicon glyphicon-record"></span></td>
							<td><span>/flowmanage</span></td>
							<td><span>子级菜单栏</span></td>
							<td><span>1</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=5&sortid=1&menuid=25&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=5&sortid=1&menuid=25&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=25" class="label xiugai"><span
					class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=25" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									</td>
						</tr>
						<tr>
							<td>流程审核</td>
							<td><span class="glyphicon glyphicon-record"></span></td>
							<td><span>/audit</span></td>
							<td><span>子级菜单栏</span></td>
							<td><span>2</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=5&sortid=2&menuid=26&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=5&sortid=2&menuid=26&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=26" class="label xiugai"><span
					class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=26" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									</td>
						</tr>
						<tr style="background:rgba(255, 235, 59, 0.19);">
							<td>公告管理</td>
							<td><span class="glyphicon glyphicon-bell"></span></td>
							<td><span>#</span></td>
							<td><span>
								父级
							</span></td>
							<td><span>6</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=0&sortid=6&menuid=6&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=0&sortid=6&menuid=6&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=6" class="label xiugai"><span
									class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=6" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									<a  href="menuadd.html" class="label xinzeng"><span
									class="glyphicon glyphicon-plus"></span> 新增</a>
									</td>
						</tr>
						<tr>
							<td>通知管理</td>
							<td><span class="glyphicon glyphicon-record"></span></td>
							<td><span>/infrommanage</span></td>
							<td><span>子级菜单栏</span></td>
							<td><span>1</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=6&sortid=1&menuid=27&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=6&sortid=1&menuid=27&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=27" class="label xiugai"><span
					class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=27" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									</td>
						</tr>
						<tr>
							<td>通知列表</td>
							<td><span class="glyphicon glyphicon-record"></span></td>
							<td><span>/infromlist</span></td>
							<td><span>子级菜单栏</span></td>
							<td><span>2</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=6&sortid=2&menuid=28&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=6&sortid=2&menuid=28&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=28" class="label xiugai"><span
					class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=28" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									</td>
						</tr>
						<tr style="background:rgba(255, 235, 59, 0.19);">
							<td>邮件管理</td>
							<td><span class="glyphicon glyphicon-envelope"></span></td>
							<td><span>#</span></td>
							<td><span>
								父级
							</span></td>
							<td><span>7</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=0&sortid=7&menuid=7&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=0&sortid=7&menuid=7&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=7" class="label xiugai"><span
									class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=7" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									<a  href="menuadd.html" class="label xinzeng"><span
									class="glyphicon glyphicon-plus"></span> 新增</a>
									</td>
						</tr>
						<tr>
							<td>账号管理</td>
							<td><span class="glyphicon glyphicon-record"></span></td>
							<td><span>/accountmanage</span></td>
							<td><span>子级菜单栏</span></td>
							<td><span>1</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=7&sortid=1&menuid=29&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=7&sortid=1&menuid=29&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=29" class="label xiugai"><span
					class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=29" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									</td>
						</tr>
						<tr>
							<td>邮件管理</td>
							<td><span class="glyphicon glyphicon-record"></span></td>
							<td><span>/mail</span></td>
							<td><span>子级菜单栏</span></td>
							<td><span>2</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=7&sortid=2&menuid=30&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=7&sortid=2&menuid=30&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=30" class="label xiugai"><span
					class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=30" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									</td>
						</tr>
						<tr style="background:rgba(255, 235, 59, 0.19);">
							<td>任务管理</td>
							<td><span class="glyphicon glyphicon-flag"></span></td>
							<td><span>#</span></td>
							<td><span>
								父级
							</span></td>
							<td><span>8</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=0&sortid=8&menuid=8&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=0&sortid=8&menuid=8&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=8" class="label xiugai"><span
									class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=8" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									<a  href="menuadd.html" class="label xinzeng"><span
									class="glyphicon glyphicon-plus"></span> 新增</a>
									</td>
						</tr>
						<tr>
							<td>任务管理</td>
							<td><span class="glyphicon glyphicon-record"></span></td>
							<td><span>/taskmanage</span></td>
							<td><span>子级菜单栏</span></td>
							<td><span>1</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=8&sortid=1&menuid=31&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=8&sortid=1&menuid=31&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=31" class="label xiugai"><span
					class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=31" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									</td>
						</tr>
						<tr>
							<td>我的任务</td>
							<td><span class="glyphicon glyphicon-record"></span></td>
							<td><span>/mytask</span></td>
							<td><span>子级菜单栏</span></td>
							<td><span>2</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=8&sortid=2&menuid=32&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=8&sortid=2&menuid=32&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=32" class="label xiugai"><span
					class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=32" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									</td>
						</tr>
						<tr style="background:rgba(255, 235, 59, 0.19);">
							<td>日程管理</td>
							<td><span class="glyphicon glyphicon-calendar"></span></td>
							<td><span>#</span></td>
							<td><span>
								父级
							</span></td>
							<td><span>9</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=0&sortid=9&menuid=9&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=0&sortid=9&menuid=9&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=9" class="label xiugai"><span
									class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=9" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									<a  href="menuadd.html" class="label xinzeng"><span
									class="glyphicon glyphicon-plus"></span> 新增</a>
									</td>
						</tr>
						<tr>
							<td>日程管理</td>
							<td><span class="glyphicon glyphicon-record"></span></td>
							<td><span>/daymanage</span></td>
							<td><span>子级菜单栏</span></td>
							<td><span>1</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=9&sortid=1&menuid=33&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=9&sortid=1&menuid=33&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=33" class="label xiugai"><span
					class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=33" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									</td>
						</tr>
						<tr>
							<td>我的日历</td>
							<td><span class="glyphicon glyphicon-record"></span></td>
							<td><span>/daycalendar</span></td>
							<td><span>子级菜单栏</span></td>
							<td><span>2</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=9&sortid=2&menuid=34&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=9&sortid=2&menuid=34&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=34" class="label xiugai"><span
					class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=34" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									</td>
						</tr>
						<tr style="background:rgba(255, 235, 59, 0.19);">
							<td>工作计划</td>
							<td><span class="glyphicon glyphicon-plane"></span></td>
							<td><span>#</span></td>
							<td><span>
								父级
							</span></td>
							<td><span>10</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=0&sortid=10&menuid=10&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=0&sortid=10&menuid=10&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=10" class="label xiugai"><span
									class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=10" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									<a  href="menuadd.html" class="label xinzeng"><span
									class="glyphicon glyphicon-plus"></span> 新增</a>
									</td>
						</tr>
						<tr>
							<td>计划管理</td>
							<td><span class="glyphicon glyphicon-record"></span></td>
							<td><span>/planview</span></td>
							<td><span>子级菜单栏</span></td>
							<td><span>1</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=10&sortid=1&menuid=35&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=10&sortid=1&menuid=35&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=35" class="label xiugai"><span
					class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=35" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									</td>
						</tr>
						<tr>
							<td>计划报表</td>
							<td><span class="glyphicon glyphicon-record"></span></td>
							<td><span>/myplan</span></td>
							<td><span>子级菜单栏</span></td>
							<td><span>2</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=10&sortid=2&menuid=36&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=10&sortid=2&menuid=36&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=36" class="label xiugai"><span
					class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=36" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									</td>
						</tr>
						<tr style="background:rgba(255, 235, 59, 0.19);">
							<td>文件管理</td>
							<td><span class="glyphicon glyphicon-folder-open"></span></td>
							<td><span>#</span></td>
							<td><span>
								父级
							</span></td>
							<td><span>11</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=0&sortid=11&menuid=11&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=0&sortid=11&menuid=11&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=11" class="label xiugai"><span
									class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=11" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									<a  href="menuadd.html" class="label xinzeng"><span
									class="glyphicon glyphicon-plus"></span> 新增</a>
									</td>
						</tr>
						<tr>
							<td>文件管理</td>
							<td><span class="glyphicon glyphicon-record"></span></td>
							<td><span>/filemanage</span></td>
							<td><span>子级菜单栏</span></td>
							<td><span>1</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=11&sortid=1&menuid=37&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=11&sortid=1&menuid=37&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=37" class="label xiugai"><span
					class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=37" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									</td>
						</tr>
						<tr style="background:rgba(255, 235, 59, 0.19);">
							<td>笔记管理</td>
							<td><span class="glyphicon glyphicon-edit"></span></td>
							<td><span>#</span></td>
							<td><span>
								父级
							</span></td>
							<td><span>12</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=0&sortid=12&menuid=12&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=0&sortid=12&menuid=12&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=12" class="label xiugai"><span
									class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=12" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									<a  href="menuadd.html" class="label xinzeng"><span
									class="glyphicon glyphicon-plus"></span> 新增</a>
									</td>
						</tr>
						<tr>
							<td>笔记管理</td>
							<td><span class="glyphicon glyphicon-record"></span></td>
							<td><span>/noteview</span></td>
							<td><span>子级菜单栏</span></td>
							<td><span>0</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=12&sortid=0&menuid=38&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=12&sortid=0&menuid=38&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=38" class="label xiugai"><span
					class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=38" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									</td>
						</tr>
						<tr style="background:rgba(255, 235, 59, 0.19);">
							<td>通讯录</td>
							<td><span class="glyphicon glyphicon-earphone"></span></td>
							<td><span>#</span></td>
							<td><span>
								父级
							</span></td>
							<td><span>13</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=0&sortid=13&menuid=39&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=0&sortid=13&menuid=39&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=39" class="label xiugai"><span
									class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=39" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									<a  href="menuadd.html" class="label xinzeng"><span
									class="glyphicon glyphicon-plus"></span> 新增</a>
									</td>
						</tr>
						<tr>
							<td>通讯录</td>
							<td><span class="glyphicon glyphicon-record"></span></td>
							<td><span>/addrmanage</span></td>
							<td><span>子级菜单栏</span></td>
							<td><span>1</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=39&sortid=1&menuid=40&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=39&sortid=1&menuid=40&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=40" class="label xiugai"><span
					class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=40" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									</td>
						</tr>
						<tr style="background:rgba(255, 235, 59, 0.19);">
							<td>讨论区</td>
							<td><span class="glyphicon glyphicon-comment"></span></td>
							<td><span>#</span></td>
							<td><span>
								父级
							</span></td>
							<td><span>14</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=0&sortid=14&menuid=13&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=0&sortid=14&menuid=13&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=13" class="label xiugai"><span
									class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=13" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									<a  href="menuadd.html" class="label xinzeng"><span
									class="glyphicon glyphicon-plus"></span> 新增</a>
									</td>
						</tr>
						<tr>
							<td>超级管理员</td>
							<td><span class="glyphicon glyphicon-record"></span></td>
							<td><span>/adminmanage</span></td>
							<td><span>子级菜单栏</span></td>
							<td><span>0</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=13&sortid=0&menuid=89&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=13&sortid=0&menuid=89&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=89" class="label xiugai"><span
					class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=89" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									</td>
						</tr>
						<tr>
							<td>我的管理</td>
							<td><span class="glyphicon glyphicon-record"></span></td>
							<td><span>/chatmanage</span></td>
							<td><span>子级菜单栏</span></td>
							<td><span>1</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=13&sortid=1&menuid=41&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=13&sortid=1&menuid=41&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=41" class="label xiugai"><span
					class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=41" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									</td>
						</tr>
						<tr>
							<td>讨论区列表</td>
							<td><span class="glyphicon glyphicon-record"></span></td>
							<td><span>/chatlist</span></td>
							<td><span>子级菜单栏</span></td>
							<td><span>2</span></td>
								<td><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
							<td><a  href="changeSortId?parentid=13&sortid=2&menuid=42&num=1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-up"></span> 上移</a> <a
								 href="changeSortId?parentid=13&sortid=2&menuid=42&num=-1" class="label sheding"><span
									class="glyphicon glyphicon-arrow-down"></span> 下移</a> <a 
								href="menuedit.html?id=42" class="label xiugai"><span
					class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="deletethis?id=42" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
									</td>
						</tr>
					</table>
				</div>			</div>
			<!--盒子尾-->
		</div>
	</div>
</div>
<script>
	$('.baseKeySubmit').on('click',function(){
		var name=$('.baseKey').val();
		$('.thistable').load("menutable?name="+name);
	});
</script>
  </body>
</html>
