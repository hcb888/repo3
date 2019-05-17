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
    
    <title>My JSP 'userlogrecordmanage.jsp' starting page</title>
    
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
		<h1 style="font-size: 24px; margin: 0;" class="">用户登陆记录</h1>
	</div>
	<div class="col-md-10 text-right">
		<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a> > <a
			disabled="disabled">用户登陆记录</a>
	</div>
</div>
<div class="row" style="padding-top: 15px;">
	<div class="col-md-12 thistable">
		<div class="bgc-w box box-primary">
			<!--盒子头-->
			<div class="box-header">
				<h3 class="box-title">
					<a onclick="javascript:window.print();" class="label label-primary" style="padding: 5px;">
						<i class="glyphicon glyphicon-print"></i> <span>打印</span>
					</a>
				</h3>
				<div class="box-tools">
				
					<div class="input-group" style="width: 150px;">
						<input type="text" class="form-control input-sm baseKey"
							value=""  placeholder="查找..." />
						<div class="input-group-btn">
							<a class="btn btn-sm btn-default baseKetsubmit"><span
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
							
							<th scope="col">用户</th>
							<th scope="col"><span class="paixu thistime">登陆时间
							</span></th>
							<th scope="col">IP</th>
							<th scope="col">使用浏览器</th>
						</tr>
						<c:forEach items="${page.rows}" var="login">
							<tr>
								<td><span>${login.user.userName}</span></td>
								<td><span>${login.loginTime}</span></td>
								<td><span>${login.ipAddr }</span></td>
								<td><span>${login.browser}</span></td>
							</tr>
						</c:forEach>
							
							 
					</table>
				</div>
			</div>
			
<div class="box-footer no-padding" style="margin-top: -20px;">
	<div style="padding: 5px;" align="center">
		 <itcast:page url="loginController/queryPage.action" />
	</div>
</div>
<script>
		/* 分页插件按钮的点击事件 */
		/* url是从后台接收过来的链接，sort是记录排序规则 */
		$('.tablefirst').on('click',function(){
			 if(true==false){
				 $('.thistable').load('morelogrecordtable?page=0');
			 }
		});
		$('.tableup').on('click',function(){
			 if(true==false){
				 $('.thistable').load('morelogrecordtable?page=-1');
			 }
		});
		$('.tabledown').on('click',function(){
			if(false==false){
				$('.thistable').load('morelogrecordtable?page=1');
			 }
		});
		$('.tablelast').on('click',function(){
			if(false==false){
				$('.thistable').load('morelogrecordtable?page=7');
			 }
			
		});
		
		/*类型、状态、时间的排序  */
		$('.thistype').on('click', function() {
			if ($(this).children().hasClass('glyphicon-triangle-bottom')) {
				$('.thistable').load('morelogrecordtable?type=0&icon=glyphicon-triangle-top');
			} else {
				$('.thistable').load('morelogrecordtable?type=1&icon=glyphicon-triangle-bottom');
			}
		});
		$('.thisstatus').on('click', function() {
			if ($(this).children().hasClass('glyphicon-triangle-bottom')) {
				$('.thistable').load('morelogrecordtable?status=0&icon=glyphicon-triangle-top');
			} else {
				$('.thistable').load('morelogrecordtable?status=1&icon=glyphicon-triangle-bottom');
			}
		});
		$('.thistime').on('click', function() {
			if ($(this).children().hasClass('glyphicon-triangle-bottom')) {
				$('.thistable').load('morelogrecordtable?time=0&icon=glyphicon-triangle-top');
			} else {
				$('.thistable').load('morelogrecordtable?time=1&icon=glyphicon-triangle-bottom');
			}
		});
		$('.thisvisit').on('click', function() {
			if ($(this).children().hasClass('glyphicon-triangle-bottom')) {
				$('.thistable').load('morelogrecordtable?visitnum=0&icon=glyphicon-triangle-top');
			} else {
				$('.thistable').load('morelogrecordtable?visitnum=1&icon=glyphicon-triangle-bottom');
			}
		});
		/* 查找 */
		$('.baseKetsubmit').on('click', function() {
			var baseKey = $('.baseKey').val();
			console.log(baseKey);
			$('.thistable').load('morelogrecordtable?baseKey='+baseKey+'');
		});
</script>		</div>
	</div>
</div>

  </body>
</html>
