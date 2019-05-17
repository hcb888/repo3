<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="C" %>
<%@taglib uri="http://itcast.cn/common/" prefix="itcast" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'statusmanage.jsp' starting page</title>
    
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
</style>

	<div class="row" style="padding-top: 10px;">
		<div class="col-md-2">
			<h1 style="font-size: 24px; margin: 0;" class="">状态管理</h1>
		</div>
		<div class="col-md-10 text-right">
			<a href="index"><span class="glyphicon glyphicon-home"></span> 首页</a> >
			<a disabled="disabled">状态管理</a>
		</div>
	</div>

	<div class="row" style="padding-top: 15px;">
		<div class="col-md-12">
			<!--id="container"-->
			<div class="bgc-w box box-primary">
				<!--盒子头-->
				<div class="box-header">
					<h3 class="box-title">
						<a href="jsp/statusadd.jsp" class="label label-success" style="padding: 5px;">
							<span class="glyphicon glyphicon-plus"></span> 新增
						</a>
						<a href="statusController/queryPage.action" class="label label-success" style="padding: 5px;margin-left:5px;">
							<span class="glyphicon glyphicon-refresh"></span> 刷新
						</a>
					</h3>
					<div class="box-tools">
						<div class="input-group" style="width: 150px;">
							<input type="text" class="form-control input-sm baseKey"
								placeholder="按名称/模块查找" />
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
			<th scope="col">模块</th>
			<th scope="col">状态</th>
			<th scope="col">排序值</th>
			<th scope="col">颜色</th>
			<th scope="col">操作</th>
		</tr>
		<C:forEach items="${page.rows}" var="status">
			<tr>
				<td><span>${status.statusModel}</span></td>
				<td><span>${status.statusName}</span></td>
				<td><span>${status.sortValue}</span></td>
				<td><span>${status.statusColor}</span></td>
				<td><a href="statusController/findById.action?id=${status.statusId}"
					class="label xiugai"><span class="glyphicon glyphicon-edit"></span>
						修改</a> <!-- <a href="##" class="label xiugai"><span
						class="glyphicon glyphicon-search"></span> 查看</a> --> <a
					onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};"
					href="statusController/delete.action?id=${status.statusId}" class="label shanchu"><span
						class="glyphicon glyphicon-remove"></span> 删除</a></td>
			</tr>
		</C:forEach>
		
	</table>
</div>
				</div>	
				<!--盒子尾-->
			<div class="box-footer no-padding" style="margin-top: -20px;">
				<div style="padding: 5px;" align="center">
					<itcast:page url="statusController/queryPage.action" />
				</div>
			</div>
			</div>
		</div>
	</div>
<script>
	$('.baseKeySubmit').on('click',function(){
		var name=$('.baseKey').val();
		$('.thistable').load("statustable?name="+name);
	});
</script>
  </body>
</html>
