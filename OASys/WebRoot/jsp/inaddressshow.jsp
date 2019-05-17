<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'inaddressshow.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	 <style type="text/css">
	.table>tbody>tr>td{
		padding: 15px;
	}
	.table{
		border: 0;
	}
</style>
  </head>
  
  <body>
  
<fieldset id="">
	<legend style="padding-left:5%;">基本信息</legend>
	<table class="table" border="" style="width: 90%;margin: auto;margin-bottom: 20px;">
		<tbody><tr>
			<td class="text-right">姓名:</td>
			<td>${user.userName}</td>
			<td rowspan="3" colspan="2">
				<div id="">
					<img src="http://localhost:8080/upload/${user.imgPath}" style="width: 120px;height: 120px;border-radius: 50%;margin-left: 15%;">
				</div>
			</td>
		</tr>
		<tr>
			<td class="text-right">性别:</td>
			<td>${user.sex}</td>
		</tr>
		<tr>
			<td class="text-right">电话:</td>
			<td>${user.userTel}</td>
		</tr>	
		<tr>
			<td class="text-right" width="15%">邮箱:</td>
			<td width="35%">${user.eamil}</td>
			<td class="text-right" width="15%">真实姓名:</td>
			<td class="text-left" width="35%">${user.realName}</td>
		</tr>
		<tr>
			<td class="text-right">部门:</td>
			<td>${user.dept.deptName}</td>
			<td class="text-right">职位:</td>
			<td class="text-left">${user.position.name}</td>
		</tr>
		<tr>
			<td class="text-right">角色:</td>
			<td>${user.role.roleName}</td>
			<td class="text-right">毕业学校:</td>
			<td class="text-left">${user.userSchool}</td>
		</tr>
		<tr>
			<td class="text-right">住址:</td>
			<td colspan="3">${user.address}</td>
		</tr>
	</tbody></table>
	<div class="box-footer" style="padding-left:5%;">
		<a href="javascript:void(0);" class="label label-default returninaddress" style="padding: 5px;"> <i class="glyphicon glyphicon-chevron-left"></i> <span>返回</span>
		</a>
	</div>
</fieldset>
  </body>
</html>
