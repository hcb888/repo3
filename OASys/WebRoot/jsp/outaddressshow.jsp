<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'outaddressshow.jsp' starting page</title>
    
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
    <style type="text/css">
	.table>tbody>tr>td{
		padding: 15px;
	}
	.table{
		border: 0;
	}
</style>
<fieldset id="">
	<legend style="padding-left:5%;">基本信息</legend>
	<table class="table" border="" style="width: 90%;margin: auto;margin-bottom: 20px;">
		<tbody><tr>
			<td class="text-right">姓名:</td>
			<td>${directorUsers.director.userName}</td>
			<td rowspan="3" colspan="2">
				<div id="">
					<img src="http://localhost:8080/upload/${directorUsers.director.image.attachmentPath}" style="width: 120px;height: 120px;border-radius: 50%;margin-left: 15%;">
				</div>
			</td>
		</tr>
		<tr>
			<td class="text-right">性别:</td>
			<td>${directorUsers.director.sex}</td>
		</tr>
		<tr>
			<td class="text-right">电话:</td>
			<td>${directorUsers.director.phoneNumber}</td>
		</tr>	
		<tr>
			<td class="text-right" width="15%">邮箱:</td>
			<td width="35%">${directorUsers.director.email}</td>
			<td class="text-right" width="15%">创建人:</td>
			<td class="text-left" width="35%">
				<a style="color: #337ab7;" href="javascript:void(0);" class="usershow" title="" thisdept="${directorUsers.director.directorUser.dept.deptName}" thisrole="${directorUsers.director.directorUser.role.roleName}" thistel="${directorUsers.director.directorUser.userTel}" thisemail="${directorUsers.director.directorUser.eamil}" data-original-title="${directorUsers.director.directorUser.userName}">${directorUsers.director.directorUser.userName}</a>
			</td>
		</tr>
		<tr>
			<td class="text-right">公司:</td>
			<td>${directorUsers.director.companyname}</td>
			<td class="text-right">公司号码:</td>
			<td class="text-left">${directorUsers.director.phoneNumber}</td>
		</tr>
		<tr>
			<td class="text-right">住址:</td>
			<td colspan="3">${directorUsers.director.address}</td>
		</tr>
		<tr>
			<td class="text-right">备注:</td>
			<td colspan="3">${directorUsers.director.remark}</td>
		</tr>
	</tbody></table>
	<div class="box-footer" style="padding-left:5%;">
		<a href="javaScript:void(0)" class="label label-default returnoutaddress"  id="wtxFh"  style="padding: 5px;"> <i class="glyphicon glyphicon-chevron-left"></i> <span>返回</span>
		</a>
	</div>
</fieldset>
<script type="text/javascript" src="js/usershow.js"></script>
  </body>
</html>
