<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://itcast.cn/common/" prefix="itcast" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'mytask.jsp' starting page</title>
    
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
 <script type="text/javascript" src="js/task/taskmanage.js"></script>
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

.block {
	display: inline-block;
	width: 20px;
}

.co {
	color: blue;
}

.bl {
	color: black;
}

.commen {
	cursor: pointer;
}
</style>
<div class="row" style="padding-top: 10px;">
	<div class="col-md-2">
		<h1 style="font-size: 24px; margin: 0;" class="">我的任务</h1>
	</div>
	<div class="col-md-10 text-right">
		<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a> > <a
			disabled="disabled">我的任务</a>
	</div>
</div>
<div class="row" style="padding-top: 15px;">
	<div class="col-md-12 thistable">
		<!--id="container"-->

<div class="bgc-w box box-primary">
	<!--盒子头-->
	<div class="box-header">
		<h3 class="box-title">
			<a href="addtask" class="label " style="padding: 5px;"> <span
				class="glyphicon glyphicon-plus"></span>
			</a>
		</h3>
		<div class="box-tools">
			<div class="input-group" style="width: 150px;">
				<input type="text" class="form-control input-sm cha"
					placeholder="查找..." />
				<div class="input-group-btn chazhao">
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
				<thead>
					<tr>

						<th scope="col">类型</th>
						<th scope="col">标题</th>
						<th scope="col">发布时间</th>
						<th scope="col">发布人</th>
						<th scope="col">部门</th>
						<th scope="col">状态</th>
						<th scope="col">操作</th>
					</tr>
				</thead>
				<tbody >
					<c:forEach  items="${page.rows}" var="tu">
						<tr>
							<td><span>${tu.task.type.typeName}</span></td>
	
							<td><span>${tu.task.title }</span></td>
							<td><span>${tu.task.starDate }</span></td>
	
							<td><span>${tu.task.user.userName }</span></td>
							<td><span>${tu.task.user.dept.deptName }</span></td>
							<td> 
									<c:if test="${tu.status.statusName=='新任务'}">
										<span class="label label-danger">新任务</span>
									</c:if>
									<c:if test="${tu.status.statusName=='已接收'}">
										<span class="label label-info">已接收</span>
									</c:if>
									<c:if test="${tu.status.statusName=='进行中'}">
										<span class="label label-primary">进行中</span>
									</c:if>
									<c:if test="${tu.status.statusName=='已提交'}">
										<span class="label label-default">已提交</span>
									</c:if>
									<c:if test="${tu.status.statusName=='已完成'}">
										<span class="label label-warning">已完成</span>
									</c:if>
							</td>
	
							<td><a href="taskController/myFindByIdTask.action?id=${tu.task.taskId }&tuId=${tu.pkId}"
								class="label xiugai"><span class="glyphicon glyphicon-search"></span>
									查看</a> </td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
		</div>
	</div>
	<!--盒子尾-->
<div class="box-footer no-padding" style="margin-top: -20px;">
	<div style="padding: 5px;" align="center">
		 <itcast:page url="taskController/taskUserQueryPage.action"></itcast:page>
	</div>
</div>
 </div>
 
	</div>
</div>


  </body>
</html>
