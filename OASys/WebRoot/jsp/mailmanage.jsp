<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'mailmanage.jsp' starting page</title>
    
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
.block{
	display: inline-block;
	width: 20px;
}
.co{
				color: blue;
			}
			.bl{
				color: black;
			}
			.commen{
				cursor: pointer;
			}
</style>
<div class="row" style="padding-top: 10px;">
	<div class="col-md-2">
		<h1 style="font-size: 24px; margin: 0;" class="">账号管理</h1>
	</div>
	<div class="col-md-10 text-right">
		<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a> > <a
			disabled="disabled">账号管理</a>
	</div>
</div>
<div class="row" style="padding-top: 15px;">
	<div class="col-md-12">
		
		<div class="bgc-w box box-primary thistable">
<!--盒子头-->
			<div class="box-header">
				<h3 class="box-title">
					<a href="mailaccountadd.html" class="label label-success" style="padding: 5px;">
						<span class="glyphicon glyphicon-plus"></span> 新增
					</a>
				</h3>
				<div class="box-tools">
					<div class="input-group" style="width: 150px;">
						<input type="text" class="form-control input-sm cha"
							placeholder="账号名查询" />
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
					<th scope="col" class="commen co">类型<span class="block"></span></th>
					<th scope="col">账号名</th>
					<th scope="col" class="co commen">创建时间<span class="block"></span></th>
					<th scope="col" class="co commen">状态<span class="block"></span></th>
					<th scope="col">操作</th>
				</tr>
			</thead>
			<tbody class="update">
						<tr>
			<td><span>系统邮件</span></td>
			<td><span>系统邮件-罗密欧</span></td>
			<td><span>2019-1-9 11:32:41</span></td>
			<td><span class="label label-success">有效</span>
			</td>
			<td><a  href="mailaccountedit.html" class="label xiugai">
					<span class="glyphicon glyphicon-edit"></span> 修改</a>
				<a onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
				   href="dele?id=14" class="label shanchu">
				   <span class="glyphicon glyphicon-remove"></span> 删除</a></td>
		</tr>
		<tr>
			<td><span>公司邮件</span></td>
			<td><span>罗密欧-公司邮件</span></td>
			<td><span>2017-9-24 12:23:26</span></td>
			<td><span class="label label-success">有效</span>
			</td>
			<td><a  href="mailaccountedit.html" class="label xiugai">
					<span class="glyphicon glyphicon-edit"></span> 修改</a>
				<a onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" 
				   href="dele?id=1" class="label shanchu">
				   <span class="glyphicon glyphicon-remove"></span> 删除</a></td>
		</tr>
						</tbody>
		</table>
	</div>
</div>
<!--盒子尾-->
<div class="box-footer no-padding" style="margin-top: -20px;">
	<div style="padding: 5px;">
		<div id="page"
			style="background: #fff; border: 0px; margin-top: 0px; padding: 2px; height: 25px;">
			<div style="width: 40%; float: left;">
				<div class="pageInfo" style="margin-left: 5px;">
					共<span>2</span>条 | 每页<span>10</span>条
					| 共<span>1</span>页
				</div>
			</div>
			<div style="width: 60%; float: left;">
				<div class="pageOperation">
				<!--判断是否是第一页  -->
					<a class="btn btn-sm btn-default no-padding tablefirst" disabled="disabled"	style="width: 30px; height: 20px;"> <span
						class="glyphicon glyphicon-backward"></span></a> 
					<a class="btn btn-sm btn-default no-padding tableup"  disabled="disabled" 	style="width: 30px; height: 20px;"> <span
						class="glyphicon glyphicon-triangle-left"></span></a> 
				<a disabled="disabled" class="btn btn-default no-padding" style="width: 30px; height: 20px;">
						1
				</a>
				<!--判断是否是最后一页  -->
					<a class="btn btn-sm btn-default no-padding tabledown"  disabled="disabled" style="width: 30px; height: 20px;"> <span
						class="glyphicon glyphicon-triangle-right"></span></a> 
					<a class="btn btn-sm btn-default no-padding tablelast" disabled="disabled" style="width: 30px; height: 20px;"> <span
						class="glyphicon glyphicon-forward"></span></a> 
				</div>
			</div>
		</div>
	</div>
</div>
<script>
		/* 分页插件按钮的点击事件 */
		/* url是从后台接收过来的链接，sort是记录排序规则 */
		$('.tablefirst').on('click',function(){
			 if(true==false){
				 $('.thistable').load('mailpaixu?page=0');
			 }
		});
		$('.tableup').on('click',function(){
			 if(true==false){
				 $('.thistable').load('mailpaixu?page=-1');
			 }
		});
		$('.tabledown').on('click',function(){
			if(true==false){
				$('.thistable').load('mailpaixu?page=1');
			 }
		});
		$('.tablelast').on('click',function(){
			if(true==false){
				$('.thistable').load('mailpaixu?page=0');
			 }
			
		});
		
		/*类型、状态、时间的排序  */
		$('.thistype').on('click', function() {
			if ($(this).children().hasClass('glyphicon-triangle-bottom')) {
				$('.thistable').load('mailpaixu?type=0&icon=glyphicon-triangle-top');
			} else {
				$('.thistable').load('mailpaixu?type=1&icon=glyphicon-triangle-bottom');
			}
		});
		$('.thisstatus').on('click', function() {
			if ($(this).children().hasClass('glyphicon-triangle-bottom')) {
				$('.thistable').load('mailpaixu?status=0&icon=glyphicon-triangle-top');
			} else {
				$('.thistable').load('mailpaixu?status=1&icon=glyphicon-triangle-bottom');
			}
		});
		$('.thistime').on('click', function() {
			if ($(this).children().hasClass('glyphicon-triangle-bottom')) {
				$('.thistable').load('mailpaixu?time=0&icon=glyphicon-triangle-top');
			} else {
				$('.thistable').load('mailpaixu?time=1&icon=glyphicon-triangle-bottom');
			}
		});
		$('.thisvisit').on('click', function() {
			if ($(this).children().hasClass('glyphicon-triangle-bottom')) {
				$('.thistable').load('mailpaixu?visitnum=0&icon=glyphicon-triangle-top');
			} else {
				$('.thistable').load('mailpaixu?visitnum=1&icon=glyphicon-triangle-bottom');
			}
		});
		/* 查找 */
		$('.baseKetsubmit').on('click', function() {
			var baseKey = $('.baseKey').val();
			console.log(baseKey);
			$('.thistable').load('mailpaixu?baseKey='+baseKey+'');
		});
</script>
<script>

$(function(){
	$(".commen").click(function(){
		var $val=$(this).text();
		$(".thistable").load("mailpaixu",{val:$val});
	
	});
	
	$(".chazhao").click(function(){
		   var con=$(".cha").val();
		   $(".thistable").load("mailpaixu",{val:con});
	   });
	
})
</script>		</div>
	</div>
</div>



  </body>
</html>
