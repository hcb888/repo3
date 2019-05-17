<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'daymanage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/common/box.css" />
<link rel="stylesheet" type="text/css" href="css/common/checkbox.css" />
<link rel="stylesheet" type="text/css" href="css/common/box.css" />

  </head>
  
  <body>
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
</style>
<div class="row" style="padding-top: 10px;">
	<div class="col-md-2">
		<h1 style="font-size: 24px; margin: 0;" class="">日程管理</h1>
	</div>
	<div class="col-md-10 text-right">
		<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a> > <a
			disabled="disabled">日程管理</a>
	</div>
</div>
<div class="row" style="padding-top: 15px;">
	<div class="col-md-12 thistable">
		<!--id="container"-->
<div class="bgc-w box box-primary">
	<!--盒子头-->
	<div class="box-header">
		<h3 class="box-title">
			<a href="dayadd.html" class="label label-success" style="padding: 5px;">
				<span class="glyphicon glyphicon-plus"></span> 新增
			</a>
		</h3>
		<div class="box-tools">
			<div class="input-group" style="width: 150px;">
				<input type="text" class="form-control input-sm"
					placeholder="查找..." />
				<div class="input-group-btn">
					<a class="btn btn-sm btn-default"><span
						class="glyphicon glyphicon-search"></span></a>
				</div>
			</div>
		</div>
	</div>
	<!--盒子身体-->
	<div class="box-body no-padding">
		<div class="table-responsive">
			<table class="table table-hover table-striped">
				<tr>
					
					<th scope="col">类型</th>
					<th scope="col">标题</th>
					<th scope="col">发布时间</th>
					<th scope="col">发布人</th>
					<th scope="col">部门</th>
					<th scope="col">状态</th>
											<th scope="col">操作</th>
				</tr>
					<tr>
						<td><span>
									<span>假日安排 </span>
						</span></td>
						<td><span>去日本旅游</span></td>
						<td><span>2019-01-13 00:28:33</span></td>
						<td><span>罗密欧</span></td>
						<td><span>总经办</span></td>
						<td>
									<div class="label label-danger">紧急</div>
						</td>
							<td>
								<a  href="dayedit.html?rcid=16" class="label xiugai"><span
									class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="dayremove?rcid=16" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
							</td>
					</tr>
					<tr>
						<td><span>
									<span>日程提醒 </span>
						</span></td>
						<td><span>去北京开会</span></td>
						<td><span>2019-01-13 00:13:25</span></td>
						<td><span>罗密欧</span></td>
						<td><span>总经办</span></td>
						<td>
									<div class="label label-warning">重要</div>
						</td>
							<td>
								<a  href="dayedit.html?rcid=15" class="label xiugai"><span
									class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="dayremove?rcid=15" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
							</td>
					</tr>
					<tr>
						<td><span>
									<span>日程提醒 </span>
						</span></td>
						<td><span>测试日程</span></td>
						<td><span>2018-12-25 22:05:38</span></td>
						<td><span>罗密欧</span></td>
						<td><span>总经办</span></td>
						<td>
									<div class="label label-primary">一般</div>
						</td>
							<td>
								<a  href="dayedit.html?rcid=12" class="label xiugai"><span
									class="glyphicon glyphicon-edit"></span> 修改</a> <a
								onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
								href="dayremove?rcid=12" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
							</td>
					</tr>
			</table>
		</div>
	</div>
	<!--盒子尾-->
<div class="box-footer no-padding" style="margin-top: -20px;">
	<div style="padding: 5px;">
		<div id="page"
			style="background: #fff; border: 0px; margin-top: 0px; padding: 2px; height: 25px;">
			<div style="width: 40%; float: left;">
				<div class="pageInfo" style="margin-left: 5px;">
					共<span>3</span>条 | 每页<span>10</span>条
					| 共<span>1</span>页
				</div>
			</div>
			<div style="width: 60%; float: left;">
				<div class="pageOperation">
				<!--判断是否是第一页  -->
					<a class="btn btn-sm btn-default no-padding tablefirst" disabled="disabled"	style="width: 30px; height: 20px;"> <span
						class="glyphicon glyphicon-backward"></span></a> 
					<a class="btn btn-sm btn-default no-padding tableup"  disabled="disabled" 	style="width: 30px; height: 20px;"> <span
						class="glyphicon glyphicon-triangle-left"></span></a> 
				<a disabled="disabled" class="btn btn-default no-padding" style="width: 30px; height: 20px;">
						1
				</a>
				<!--判断是否是最后一页  -->
					<a class="btn btn-sm btn-default no-padding tabledown"  disabled="disabled" style="width: 30px; height: 20px;"> <span
						class="glyphicon glyphicon-triangle-right"></span></a> 
					<a class="btn btn-sm btn-default no-padding tablelast" disabled="disabled" style="width: 30px; height: 20px;"> <span
						class="glyphicon glyphicon-forward"></span></a> 
				</div>
			</div>
		</div>
	</div>
</div>
<script>
		/* 分页插件按钮的点击事件 */
		/* url是从后台接收过来的链接，sort是记录排序规则 */
		$('.tablefirst').on('click',function(){
			 if(true==false){
				 $('.thistable').load('daymanagepaging?page=0');
			 }
		});
		$('.tableup').on('click',function(){
			 if(true==false){
				 $('.thistable').load('daymanagepaging?page=-1');
			 }
		});
		$('.tabledown').on('click',function(){
			if(true==false){
				$('.thistable').load('daymanagepaging?page=1');
			 }
		});
		$('.tablelast').on('click',function(){
			if(true==false){
				$('.thistable').load('daymanagepaging?page=0');
			 }
			
		});
		
		/*类型、状态、时间的排序  */
		$('.thistype').on('click', function() {
			if ($(this).children().hasClass('glyphicon-triangle-bottom')) {
				$('.thistable').load('daymanagepaging?type=0&icon=glyphicon-triangle-top');
			} else {
				$('.thistable').load('daymanagepaging?type=1&icon=glyphicon-triangle-bottom');
			}
		});
		$('.thisstatus').on('click', function() {
			if ($(this).children().hasClass('glyphicon-triangle-bottom')) {
				$('.thistable').load('daymanagepaging?status=0&icon=glyphicon-triangle-top');
			} else {
				$('.thistable').load('daymanagepaging?status=1&icon=glyphicon-triangle-bottom');
			}
		});
		$('.thistime').on('click', function() {
			if ($(this).children().hasClass('glyphicon-triangle-bottom')) {
				$('.thistable').load('daymanagepaging?time=0&icon=glyphicon-triangle-top');
			} else {
				$('.thistable').load('daymanagepaging?time=1&icon=glyphicon-triangle-bottom');
			}
		});
		$('.thisvisit').on('click', function() {
			if ($(this).children().hasClass('glyphicon-triangle-bottom')) {
				$('.thistable').load('daymanagepaging?visitnum=0&icon=glyphicon-triangle-top');
			} else {
				$('.thistable').load('daymanagepaging?visitnum=1&icon=glyphicon-triangle-bottom');
			}
		});
		/* 查找 */
		$('.baseKetsubmit').on('click', function() {
			var baseKey = $('.baseKey').val();
			console.log(baseKey);
			$('.thistable').load('daymanagepaging?baseKey='+baseKey+'');
		});
</script></div>	</div>
</div>
  </body>
</html>
