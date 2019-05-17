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
    
    <title>My JSP 'usermanage.jsp' starting page</title>
    
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
#thismodal .modal-dialog {
	width: 500px;
	top:20%;
}

#thismodal .modal-body .icon {
	height: 80px;
	width: 80px;
	margin: 20px auto;
	border-radius: 50%;
	color: #aad6aa;
	border: 3px solid #d9ead9;
	text-align: center;
	font-size: 44px;
}

#thismodal .modal-body .icon .glyphicon {
	font-size: 46px;
	top: 14px;
}

#thismodal .modal-p {
	margin: 20px auto;
}

#thismodal .modal-body .modal-p h2 {
	text-align: center;
}

#thismodal .modal-body .modal-p p {
	text-align: center;
	color: #666;
	font-size: 16px;
	padding-top: 8px;
	font-weight: 300;
}

#thismodal .modal-p .btn {
	margin-left: 40%;
	width: 100px;
	height: 40px;
}

#thismodal .modal-error .icon {
	color: #f27474;
	border: 3px solid #f27474;
}
</style>

<div class="modal fade in" id="thismodal" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body modal-success" style="display: none;">
				<div class="icon">
					<span class="glyphicon glyphicon-ok"></span>
				</div>
				<div class="modal-p">
					<h2>操作成功</h2>
					<!--<p style="">已回复</p>-->
					<div class="modal-p">
						<button type="button" class="btn btn-primary successToUrl" data-dismiss="modal">确定</button>
					</div>
				</div>
			</div>
			<div class="modal-body modal-error" style="display: none;">
				<div class="icon">
					<span class="glyphicon glyphicon-remove"></span>
				</div>
				<div class="modal-p">
					<h2 style="text-align: center;">错误信息</h2>
					<p class="modal-error-mess">此处将显示弹出框的错误提示信息</p>
					<div class="modal-p">
						<button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
					</div>
				</div>
			</div>

		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>

<!-- /.modal -->
<script type="text/javascript" src="js/modalTip.js" ></script>


<!-- 这里是执行返回失败的参数，并显示详细的信息； -->
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
			<h1 style="font-size: 24px; margin: 0;" class="">用户管理</h1>
		</div>
		<div class="col-md-10 text-right">
			<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a> >
			<a disabled="disabled">用户管理</a>
		</div>
	</div>

	<div class="row" style="padding-top: 15px;">
		<div class="col-md-12 thistable">
			<!--id="container"-->
<div class="bgc-w box box-primary">
	<!--盒子头--> 
	<div class="box-header">
		<h3 class="box-title">
			<a href="deptController/deptAndRole.action" class="label label-success" style="padding: 5px;">
				<span class="glyphicon glyphicon-plus"></span> 新增
			</a> 
			<!-- <a href="daycalendar" class="label label-primary"
				style="padding: 5px; margin-left: 5px;"> <span
				class="glyphicon glyphicon-gift"></span> 生日
			</a> -->
		</h3>
		<div class="box-tools">
			<div class="input-group" style="width: 150px;">
				<input type="text" class="form-control input-sm usersearch"
					placeholder="查找..." />
				<div class="input-group-btn">
					<a class="btn btn-sm btn-default"><span
						class="glyphicon glyphicon-search usersearchgo"></span></a>
				</div>
			</div>
		</div>
	</div>
	<!--盒子身体-->
	<div class="box-body no-padding">
		<div class="table-responsive">
			<table class="table table-hover table-striped">
				<tr>
					
					<th scope="col">&nbsp;</th>
					<th scope="col">部门</th>
					<th scope="col">真实姓名</th>
					<th scope="col">用户名</th>
					<th scope="col">角色</th>
					<th scope="col">电话</th>
					<th scope="col">工资</th>
					<th scope="col">操作</th>
				</tr>
				<c:forEach items="${page.rows}" var="user">
					<tr>
						<td>
						<!-- <img src="images/handsome.jpg" class="img-circle"
							style="width: 25px; height: 25px;" /> -->
								<img style="width: 25px;height: 25px;"
									class="profile-user-img img-responsive img-circle"
									src="http://localhost:8080/upload/${user.imgPath}" />
						</td>
						<td><span>${user.dept.deptName}</span></td>
						<td><span>${user.realName}</span></td>
						<td><span>${user.userName}</span></td>
						<td><span>${user.role.roleName}</span></td>
						<td><span>${user.userTel}</span></td>
						<td><span>${user.salary}</span></td>
						<td><a  href="userController/findById.action?id=${user.userId}" class="label xiugai"><span
								class="glyphicon glyphicon-edit"></span> 修改</a> <a
							onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
							href="userController/delete.action?id=${user.userId}" class="label shanchu"><span
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
	/* 	$('.tablefirst').on('click',function(){
			 if(true==false){
				 $('.thistable').load('usermanagepaging?page=0');
			 }
		});
		$('.tableup').on('click',function(){
			 if(true==false){
				 $('.thistable').load('usermanagepaging?page=-1');
			 }
		});
		$('.tabledown').on('click',function(){
			if(false==false){
				$('.thistable').load('usermanagepaging?page=1');
			 }
		});
		$('.tablelast').on('click',function(){
			if(false==false){
				$('.thistable').load('usermanagepaging?page=3');
			 }
			
		}); */
		
		/*类型、状态、时间的排序  */
		$('.thistype').on('click', function() {
			if ($(this).children().hasClass('glyphicon-triangle-bottom')) {
				$('.thistable').load('usermanagepaging?type=0&icon=glyphicon-triangle-top');
			} else {
				$('.thistable').load('usermanagepaging?type=1&icon=glyphicon-triangle-bottom');
			}
		});
		$('.thisstatus').on('click', function() {
			if ($(this).children().hasClass('glyphicon-triangle-bottom')) {
				$('.thistable').load('usermanagepaging?status=0&icon=glyphicon-triangle-top');
			} else {
				$('.thistable').load('usermanagepaging?status=1&icon=glyphicon-triangle-bottom');
			}
		});
		$('.thistime').on('click', function() {
			if ($(this).children().hasClass('glyphicon-triangle-bottom')) {
				$('.thistable').load('usermanagepaging?time=0&icon=glyphicon-triangle-top');
			} else {
				$('.thistable').load('usermanagepaging?time=1&icon=glyphicon-triangle-bottom');
			}
		});
		$('.thisvisit').on('click', function() {
			if ($(this).children().hasClass('glyphicon-triangle-bottom')) {
				$('.thistable').load('usermanagepaging?visitnum=0&icon=glyphicon-triangle-top');
			} else {
				$('.thistable').load('usermanagepaging?visitnum=1&icon=glyphicon-triangle-bottom');
			}
		});
		/* 查找 */
		$('.baseKetsubmit').on('click', function() {
			var baseKey = $('.baseKey').val();
			console.log(baseKey);
			$('.thistable').load('usermanagepaging?baseKey='+baseKey+'');
		});
</script></div>
		</div>
	</div>
<script type="text/javascript">
	$(".thistable").on("click",".usersearchgo",function(){
		var usersearch = $(".thistable .usersearch").val();
		console.log(usersearch);
		$(".thistable").load("usermanagepaging",{usersearch:usersearch});
	});
</script>
  </body>
</html>
