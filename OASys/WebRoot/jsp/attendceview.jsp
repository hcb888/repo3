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
    
    <title>My JSP 'attendceview.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/common/box.css" />
<link rel="stylesheet" type="text/css" href="css/common/checkbox.css" />
<link href="css/common/checkbox.css" rel="stylesheet" />
<style type="text/css">
/* .{
			width:1100px;
			
			} */
a {
	color: black;
}

a:hover {
	text-decoration: none;
}

.box-body {
	cursor: pointer;
}

.table {
	padding: 0 0 0 0 !important;
}

.table tr {
	background-color: white !important;
	border-bottom: 1px solid dashed !important;
}

.table .table-header {
	border-bottom: 1px solid dashed !important;
}

.box-header b:hover {
	background-color: #E7E7E7;
}

.box-header a {
	padding: 5px;
}

.box-body {
	padding: 0 0 0 0 !important;
}

.active {
	color: #000000;
}

.box-body .table-header .status {
	color: #72afd2;
}

.box-body  .table-header  .type {
	color: #72afd2;
}

.box-body .table-header span {
	width: 2px !important;
	height: 2px !important;
}

.paixu :hover{
color:blue;
}

.box {
	margin-top: 10px !important;
}
</style>
<script>
	/* $(
			function() {
				$(".commen")
						.on(
								"click",
								function() {
									var $e1 = $(this).addClass("mm").siblings(
											".commen").removeClass("mm");
									var $e2 = $(this).addClass("bl")
											.removeClass("co").siblings(
													".commen").addClass("co")
											.removeClass("bl");
									$(".mm span")
											.addClass(
													"glyphicon glyphicon-triangle-bottom")
											.siblings(".co span")
											.removeClass(
													"glyphicon glyphicon-triangle-bottom");
								})
			}) */
</script>
  </head>
  
  <body style="background-color: #ecf0f5;">
	<div class="row" style="padding-top:10px">
		<div class="col-md-2">
			<h1 style="font-size: 24px; margin: 0;" class="">考勤管理</h1>
		</div>
		<div class="col-md-10 text-right">
			<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a> >
			<a disabled="disabled">考勤管理</a>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12 thistable">
			<!--id="container"-->
<div class="bgc-w box box-primary">
	<div class="box-header" style="padding-bottom: 20px">
		<a class="label label-success" href="attendsController/queryPage.action"><span
			class="glyphicon glyphicon-refresh"></span>  刷新 </a>

		<div class="input-group" style="width:150px;float:right;top:-5px">
											<input type="text" class="form-control input-sm pull-right baseKey" value="" placeholder="查找..." />
											<div class="input-group-btn" style="top:-1px;">
												<a class="btn btn-sm btn-default glyphicon glyphicon-search btn-change baseKetsubmit"></a>
											</div>
										</div>
		
		

	</div>
	<div class="box-body">
		<div class="table" style="padding-top: 15px;">
			<div class="">
				<table class="table table-hover table-striped">
					<tr class="table-header">
						<th scope="col">用户名</th>
						<th scope="col" class="paixu thistype" style="color:blue;">类型
									</th>
						<th scope="col"><span class="paixu thistime" style="color:blue;">时间
						</span></th>
						<th scope="col">ip</th>
						<th scope="col ">备注</th>
						<th scope="col"><span class="paixu thisstatus" style="color:blue;">状态
						</span></th>
						<th scope="col">操作</th>
					</tr>
					<c:forEach items="${page.rows}" var="attend">
						<tr>
							<td ><span>${attend.user.userName}</span></td>
							<td><span>${attend.type.typeName}</span></td>
							<td ><span>${attend.attendsDate}</span></td>
							<td><span>${attend.attendsIp}</span></td>
							<td>${attend.attendsRemark}</td>
							<td>
								<c:if test="${attend.status.statusName=='早退'}">
									<span class="label label-danger">早退</span>
								</c:if>
								<c:if test="${attend.status.statusName=='迟到'}">
									<span class="label label-warning">迟到</span>
								</c:if>
								<c:if test="${attend.status.statusName=='正常'}">
									<span class="label label-info">正常</span>
								</c:if>
							</td>
							<td><a  href="attendsController/findById.action?id=${attend.attendsId}" class="label xiugai"><span
										   class="glyphicon glyphicon-edit"></span> 修改</a> <a
										    onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
											 href="attendsController/delete.action?id=${attend.attendsId}" class="label shanchu"><span
												class="glyphicon glyphicon-remove"></span> 删除</a>
							</td>
						</tr>
					</c:forEach>			
			    </table>
			</div>
		</div>
	</div>


	<!--盒子尾-->
<div class="box-footer no-padding" style="margin-top: -20px;">
	<div style="padding: 5px;" align="center">
		 <itcast:page url="attendsController/queryPage.action" />
	</div>
</div>
<script>
		/* 分页插件按钮的点击事件 */
		/* url是从后台接收过来的链接，sort是记录排序规则 */
		$('.tablefirst').on('click',function(){
			 if(true==false){
				 $('.thistable').load('attendcetable?page=0');
			 }
		});
		$('.tableup').on('click',function(){
			 if(true==false){
				 $('.thistable').load('attendcetable?page=-1');
			 }
		});
		$('.tabledown').on('click',function(){
			if(false==false){
				$('.thistable').load('attendcetable?page=1');
			 }
		});
		$('.tablelast').on('click',function(){
			if(false==false){
				$('.thistable').load('attendcetable?page=1');
			 }
			
		});
		
		/*类型、状态、时间的排序  */
		$('.thistype').on('click', function() {
			if ($(this).children().hasClass('glyphicon-triangle-bottom')) {
				$('.thistable').load('attendcetable?type=0&icon=glyphicon-triangle-top');
			} else {
				$('.thistable').load('attendcetable?type=1&icon=glyphicon-triangle-bottom');
			}
		});
		$('.thisstatus').on('click', function() {
			if ($(this).children().hasClass('glyphicon-triangle-bottom')) {
				$('.thistable').load('attendcetable?status=0&icon=glyphicon-triangle-top');
			} else {
				$('.thistable').load('attendcetable?status=1&icon=glyphicon-triangle-bottom');
			}
		});
		$('.thistime').on('click', function() {
			if ($(this).children().hasClass('glyphicon-triangle-bottom')) {
				$('.thistable').load('attendcetable?time=0&icon=glyphicon-triangle-top');
			} else {
				$('.thistable').load('attendcetable?time=1&icon=glyphicon-triangle-bottom');
			}
		});
		$('.thisvisit').on('click', function() {
			if ($(this).children().hasClass('glyphicon-triangle-bottom')) {
				$('.thistable').load('attendcetable?visitnum=0&icon=glyphicon-triangle-top');
			} else {
				$('.thistable').load('attendcetable?visitnum=1&icon=glyphicon-triangle-bottom');
			}
		});
		/* 查找 */
		$('.baseKetsubmit').on('click', function() {
			var baseKey = $('.baseKey').val();
			console.log(baseKey);
			$('.thistable').load('attendcetable?baseKey='+baseKey+'');
		});
</script></div>		</div>
	</div>
</body>
</html>
