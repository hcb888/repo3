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
    
    <title>My JSP 'informlist.jsp' starting page</title>
    
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

.c {
	font-weight: 600;
}

.paixu:HOVER {
	cursor: pointer;
	color: #337ab7;
}
</style>

<div class="row" style="padding-top: 10px;">
	<div class="col-md-2">
		<h1 style="font-size: 24px; margin: 0;" class="">通知列表</h1>
	</div>
	<div class="col-md-10 text-right">
		<a href="index"><span class="glyphicon glyphicon-home"></span> 首页</a>
		> <a disabled="disabled">通知列表</a>
	</div>
</div>

<div class="row" style="padding-top: 15px;">
	<div class="col-md-12 thistable">
		<!--id="container"-->
<div class="bgc-w box box-primary">
	<!--盒子头-->
	<div class="box-header">
		<h3 class="box-title">
			<a href="noticeController/findInformQueryPage.action" class="label label-success" style="padding: 5px;margin-left:5px;">
				<span class="glyphicon glyphicon-refresh"></span> 刷新
			</a>
		</h3>
		<div class="box-tools">
			<div class="input-group" style="width: 150px;">
				<input type="text" class="form-control input-sm baseKey" placeholder="按标题查找"  value=""/>
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
			<table class="table table-hover">
				<tr>
					<th scope="col"><span class="paixu thistype">类型
						</span></th>
					<th scope="col"><span class="paixu thisstatus">状态
						</span></th>
					<th scope="col">标题</th>
					<th scope="col"><span class="paixu thistime">发布时间
						</span></th>
					<th scope="col">发布人</th>
					<th scope="col">部门</th>
					<th scope="col">置顶</th>
					<th scope="col">链接</th>
					<th scope="col">操作</th>
				</tr>
				<c:forEach items="${page.rows}" var="notice">
					<tr>
						<td>${notice.type.typeName}</td>
						<td>
							<c:if test="${notice.status.statusName=='重要'}">
								<span class="label label-warning">${notice.status.statusName}</span>
							</c:if>
							<c:if test="${notice.status.statusName=='紧急'}">
								<span class="label label-danger">${notice.status.statusName}</span>
							</c:if>
							<c:if test="${notice.status.statusName=='一般'}">
								<span class="label label-primary">${notice.status.statusName}</span>
							</c:if>
						</td>
						<td><span>${notice.title}</span></td>
						<td><span>${notice.noticeDate}</span></td>
						<td><span>${notice.user.userName}</span></td>
						<td><span>${notice.user.dept.deptName}</span></td>
						<td>
							<c:if test="${notice.isTop==1}">
								<span class="labels"><label><input
									type="checkbox" checked disabled><i>✓</i></label></span>
							</c:if>
							<c:if test="${notice.isTop!=1}">
								<span class="labels"><label><input
								type="checkbox" disabled><i>✓</i></label></span>
							</c:if>
						</td>
	
						<td><span class="glyphicon glyphicon-link">${notice.url}</span></td>
	
						<td><a href="noticeController/findInform.action?id=${notice.noticeId}" class="label xiugai "><span
								class="glyphicon glyphicon-search"></span> 查看</a> 
								<a href="forwardother?noticeId=26" onclick="{return confirm('确定转发给自己的下属吗？');};" class="label xinzeng chakan forwardthis"><span class="glyphicon glyphicon-log-out"></span>
									转发</a> </td> 
					</tr>
				</c:forEach>
			 
			</table>
		</div>
	</div>
	<!--盒子尾-->
<div class="box-footer no-padding" style="margin-top: -20px;">
	<div style="padding: 5px;" align="center">
		 <itcast:page url="noticeController/findInformQueryPage.action"></itcast:page>
	</div>
</div>
<script>
		/* 分页插件按钮的点击事件 */
		/* url是从后台接收过来的链接，sort是记录排序规则 */
		$('.tablefirst').on('click',function(){
			if(!true){
				$('.thistable').load('informlistpaging?pageNum=1');
			}
		});
		$('.tableup').on('click',function(){
			if(!true){
				$('.thistable').load('informlistpaging?pageNum=0');
			}
		});
		$('.tabledown').on('click',function(){
			if(!true){
				$('.thistable').load('informlistpaging?pageNum=2');
			}
		});
		$('.tablelast').on('click',function(){
			if(!true){
				$('.thistable').load('informlistpaging?pageNum=1');
			}
			
		});
		
		/*类型、状态、时间的排序  */
		$('.thistype').on('click', function() {
			if ($(this).children().hasClass('glyphicon-triangle-bottom')) {
				$('.thistable').load('informlistpaging?type=0&icon=glyphicon-triangle-top');
			} else {
				$('.thistable').load('informlistpaging?type=1&icon=glyphicon-triangle-bottom');
			}
		});
		$('.thisstatus').on('click', function() {
			if ($(this).children().hasClass('glyphicon-triangle-bottom')) {
				$('.thistable').load('informlistpaging?status=0&icon=glyphicon-triangle-top');
			} else {
				$('.thistable').load('informlistpaging?status=1&icon=glyphicon-triangle-bottom');
			}
		});
		$('.thistime').on('click', function() {
			if ($(this).children().hasClass('glyphicon-triangle-bottom')) {
				$('.thistable').load('informlistpaging?time=0&icon=glyphicon-triangle-top');
			} else {
				$('.thistable').load('informlistpaging?time=1&icon=glyphicon-triangle-bottom');
			}
		});
		/* 查找 */
		$('.baseKetsubmit').on('click', function() {
			var baseKey = $('.baseKey').val();
			console.log(baseKey);
			$('.thistable').load('informlistpaging?baseKey=' + baseKey);
		});
</script></div>
<script>
	$(function(){
		$(".chakan").click(function(){
			var $information=$(this).parents("td").siblings(".c").find("span").text();
			if( $information!=""){
				parent.changeinformation();
			}
		});
	});
</script>	</div>
</div>
  </body>
</html>
