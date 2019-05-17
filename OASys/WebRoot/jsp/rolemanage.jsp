<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://itcast.cn/common/" prefix="itcast" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'rolemanage.jsp' starting page</title>
    
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
<script type="text/javascript" src="js/task/taskmanage.js"></script>
<style type="text/css">
a {
	color: black;
}

a:hover {
	text-decoration: none;
}

.label-back {
	background-color: #6C7B8B;
	color: white;
}
			
.label-back:hover {
	color: white !important;
	background-color: #5c666b !important;
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
		<h1 style="font-size: 24px; margin: 0;" class="">角色管理</h1>
	</div>
	<div class="col-md-10 text-right">
		<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a> > <a
			disabled="disabled">角色管理</a>
	</div>
</div>
<div class="row" style="padding-top: 15px;">
	<div class="col-md-12 thistable">
		<!--id="container"-->
<div class="bgc-w box box-primary">
			<!--盒子头-->
			<div class="box-header">
				<h3 class="box-title">
					<a href="jsp/roleadd.jsp" class="label label-success" style="padding: 5px;">
						<span class="glyphicon glyphicon-plus"></span> 新增
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
					<table class="table table-hover ">
						<tr>
							
							<th scope="col">名称</th>
							<th scope="col">权限值</th>
							<th scope="col">操作</th>
						</tr>
						<c:forEach items="${page.rows}" var="role">
							<tr>
								<td><span>${role.roleName}</span></td>
									 <td><span>${role.roleValue}</span></td>  
								<td>
								<a href="jsp/roleset.jsp?id=1" class="label sheding">
								  <span class="glyphicon glyphicon-asterisk"></span> 设定</a>
								<a href="roleController/findById.action?id=${role.roleId}" class="label xiugai">
								<span class="glyphicon glyphicon-edit"></span> 修改</a>
								<a href="roleController/delete.action?id=${role.roleId}" onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" class="label shanchu"><span
										class="glyphicon glyphicon-remove"></span> 删除</a></td>
							</tr>
						</c:forEach>
						 
						
					</table>
				</div>
			</div>
			<!--盒子尾-->
<div class="box-footer no-padding" style="margin-top: -20px;">
	<div style="padding: 5px;" align="center">
		<itcast:page url="userController/queryPage.action" />
	</div>
</div>
<script>
		/* 分页插件按钮的点击事件 */
		/* url是从后台接收过来的链接，sort是记录排序规则 */
		$('.tablefirst').on('click',function(){
			 if(true==false){
				 $('.thistable').load('roleser?page=0');
			 }
		});
		$('.tableup').on('click',function(){
			 if(true==false){
				 $('.thistable').load('roleser?page=-1');
			 }
		});
		$('.tabledown').on('click',function(){
			if(true==false){
				$('.thistable').load('roleser?page=1');
			 }
		});
		$('.tablelast').on('click',function(){
			if(true==false){
				$('.thistable').load('roleser?page=0');
			 }
			
		});
		
		/*类型、状态、时间的排序  */
		$('.thistype').on('click', function() {
			if ($(this).children().hasClass('glyphicon-triangle-bottom')) {
				$('.thistable').load('roleser?type=0&icon=glyphicon-triangle-top');
			} else {
				$('.thistable').load('roleser?type=1&icon=glyphicon-triangle-bottom');
			}
		});
		$('.thisstatus').on('click', function() {
			if ($(this).children().hasClass('glyphicon-triangle-bottom')) {
				$('.thistable').load('roleser?status=0&icon=glyphicon-triangle-top');
			} else {
				$('.thistable').load('roleser?status=1&icon=glyphicon-triangle-bottom');
			}
		});
		$('.thistime').on('click', function() {
			if ($(this).children().hasClass('glyphicon-triangle-bottom')) {
				$('.thistable').load('roleser?time=0&icon=glyphicon-triangle-top');
			} else {
				$('.thistable').load('roleser?time=1&icon=glyphicon-triangle-bottom');
			}
		});
		$('.thisvisit').on('click', function() {
			if ($(this).children().hasClass('glyphicon-triangle-bottom')) {
				$('.thistable').load('roleser?visitnum=0&icon=glyphicon-triangle-top');
			} else {
				$('.thistable').load('roleser?visitnum=1&icon=glyphicon-triangle-bottom');
			}
		});
		/* 查找 */
		$('.baseKetsubmit').on('click', function() {
			var baseKey = $('.baseKey').val();
			console.log(baseKey);
			$('.thistable').load('roleser?baseKey='+baseKey+'');
		});
</script>		</div>
		
		<script>
		 $(function(){

				$('.baseKetsubmit').on('click',function(){
					var baseKey=$('.baseKey').val();
					$('.thistable').load('roleser?baseKey=baseKey');
				});
				
				   $(".chazhao").click(function(){
					   var con=$(".cha").val();
					   $(".thistable").load("roleser",{val:con});
				   });
				   
			  });
		</script>	</div>
</div>



  </body>
</html>
