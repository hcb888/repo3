<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://itcast.cn/common/"  prefix="itcast" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'flowmanage.jsp' starting page</title>
    
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
			<h1 style="font-size: 24px; margin: 0;" class="">流程管理</h1>
		</div>
		<div class="col-md-10 text-right">
			<a href="index"><span class="glyphicon glyphicon-home"></span> 首页</a> >
			<a disabled="disabled">流程管理</a>
		</div>
	</div>

	<div class="row" style="padding-top: 15px;">
		<div class="col-md-12 thistable">
			<!--id="container"-->
	<div class="bgc-w box box-primary">
				<!--盒子头-->
				<div class="box-header">
					<h3 class="box-title">
						<a href="processController/queryPage.action" class="label label-success" style="padding: 5px;">
							<span class="glyphicon glyphicon-refresh"></span> 刷新
						</a> 
					</h3>
					<div class="box-tools">
						<div class="input-group" style="width: 220px;">
							<input type="text" class="form-control input-sm cha"
								placeholder="审核人，类型，标题，状态查询" />
							<div class="input-group-btn chazhao">
								<a class="btn btn-sm btn-default"><span
									class="glyphicon glyphicon-search"></span></a>
							</div>
						</div>
					</div>
				</div>
				<div class="box-body no-padding">
					<div class="table-responsive">
						<table class="table table-hover">
						<tr>
							
							<th scope="col">类型</th>
							<th scope="col">标题</th>
							<th scope="col">申请时间</th>
							<th scope="col">审核人</th>
							<th scope="col">紧急程度</th>
							<th scope="col">状态</th>
							<th scope="col">操作</th>
						</tr>
						<c:forEach items="${page.rows}" var="process">
							<tr>
								<td>${process.typeName}</td>
								<td><span>${process.processName}</span></td>
								<td><span>${process.applyDate}</span></td>
								<td><span>${process.shenuser}</span></td>
									<td><span>${process.processType.typeName}</span></td>
									<td>
										<c:if test="${process.processStatus.statusName=='未处理'}">
											<span class="label label-primary">未处理</span>
										</c:if>
										<c:if test="${process.processStatus.statusName=='处理中'}">
											<span class="label label-info">处理中</span>
										</c:if>
										<c:if test="${process.processStatus.statusName=='已批准'}">
											<span class="label label-warning">已批准</span>
										</c:if>
										<c:if test="${process.processStatus.statusName=='未通过'}">
											<span class="label label-danger">未通过</span>
										</c:if>
								<td> 
									<c:if test="${process.typeName=='离职申请单'}">
										<a href="resignController/findById.action?id=${process.processId}" class="label xiugai">
									</c:if>
									 <c:if test="${process.typeName=='请假申请单'}">
										<a href="holidayController/findById.action?id=${process.processId}" class="label xiugai">
									</c:if>
									<c:if test="${process.typeName=='加班申请单'}">
										<a href="overtimeController/findById.action?id=${process.processId}" class="label xiugai">
									</c:if>
									<c:if test="${process.typeName=='出差费用单'}">
										<a href="evectionmoneyController/findById.action?id=${process.processId}" class="label xiugai">
									</c:if>
									<c:if test="${process.typeName=='费用报销单'}">
										<a href="bursementController/findById.action?id=${process.processId}" class="label xiugai">
									</c:if>
									<c:if test="${process.typeName=='出差申请单'}">
										<a href="evectionController/findById.action?id=${process.processId}" class="label xiugai">
									</c:if>
									<c:if test="${process.typeName=='转正申请单'}">
										<a href="regularController/findById.action?id=${process.processId}" class="label xiugai">
									</c:if>
									
									<span class="glyphicon glyphicon-search"></span> 查看</a> 
								</td>
							</tr>
						</c:forEach>
						 
					</table>
					</div>
				
				<!--盒子尾-->
<div class="box-footer no-padding" style="margin-top: -20px;">
	<div style="padding: 5px;" align="center">
		 <itcast:page url="processController/queryPage.action"></itcast:page>
	</div>
</div>
 				</div>
			</div>
 		</div>
	</div>

  </body>
</html>
