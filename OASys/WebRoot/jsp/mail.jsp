<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'mail.jsp' starting page</title>
    
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
<script type="text/javascript" src="js/common/iconfont.js"></script> 
<script charset="utf-8" src="plugins/kindeditor/kindeditor-min.js"></script>
<script charset="utf-8" src="plugins/kindeditor/lang/zh_CN.js"></script>
<script type="text/javascript" src="js/mail/mail.js" ></script>
<link rel="stylesheet" href="plugins/kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="css/mail/mail.css" />
<link rel="stylesheet" href="css/common/iconfont.css" />


  </head>
  
  <body>
   <div class="row" style="padding-top: 10px;">
	<div class="col-md-2">
		<h1 style="font-size: 24px; margin: 0;" class="">邮件管理</h1>
	</div>
	<div class="col-md-10 text-right">
		<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a> > <a
			disabled="disabled">邮件管理</a>
	</div>
</div>
<div class="row" style="padding-top: 15px;">
	<div class="col-md-3">
		
		<a class="btn btn-primary write"
			style="width: 100%; margin-bottom: 20px;"> <span
			class="glyphicon glyphicon-pencil"></span> 写信
		</a>
		<div class="bgc-w box box-solid">
			<div class="box-header">
				<h3 class="box-title">文件夹</h3>
				<span class="btn btn-xs btn-default pull-right des mm"> <i
					class="glyphicon glyphicon-minus"></i>
				</span>
			</div>
			<ul class="nav nav-pills nav-stacked files ">
				<li style="border-left: 3px solid blue;" class="getmail"><span
					class="glyphicon glyphicon-inbox le"> 收件箱</span>
					 <span class="pull-right uncheck"><i class="btn btn-xs btn-primary">1</i></span>
				</li>
				<li class="setmail"><span class="glyphicon glyphicon-envelope le"> 发件箱</span>
					<span class="pull-right uncheck"><i class="btn btn-xs btn-primary">27</i></span>
				
				</li>
				<li class="caogao"><span class="glyphicon glyphicon-list-alt le"> 草稿箱</span> 
					<span class="pull-right uncheck"><i class="btn btn-xs btn-primary">1</i></span>
				</li >	
				<li class=" rubbish"><span class="glyphicon glyphicon-trash le"> 垃圾箱</span>
					<span class="pull-right uncheck"><i class="btn btn-xs btn-primary">1</i></span>
				</li>
			</ul>
		</div>

		<div class="bgc-w box box-solid">
			<div class="box-header">
				<h3 class="box-title">类型</h3>
				<span class="btn btn-xs btn-default pull-right des"> <i
					class="glyphicon glyphicon-minus"></i>
				</span>
			</div>
			<ul class="nav nav-pills nav-stacked fff">
				<li class="mail"><svg class="icon le " aria-hidden="true">
								<use xlink:href="#icon-kongxinquan"></use>
							</svg>&nbsp;&nbsp;&nbsp;邮件</li>
				<li class="tongzhi"><svg class="icon le " aria-hidden="true">
								<use xlink:href="#icon-kongxinquan"></use>
							</svg>&nbsp;&nbsp;&nbsp;通知</li>
				<li class="gonggao"><svg class="icon le " aria-hidden="true" style="color: red;">
								<use xlink:href="#icon-kongxinquan"></use>
							</svg>&nbsp;&nbsp;&nbsp;公告</li>
			</ul>
		</div>
	</div>
	<div class="col-md-9 set ">

</div>
<script>
	$(function(){
		$('.getmail').on('click',function(){
			//$('.set').load('amail',{title:"收件箱"});
			$('.set').load('mailinbox.html');
		});	
		$('.getmail').click();
		$('.setmail').on('click',function(){
			//$('.set').load('amail',{title:"发件箱"});
			$('.set').load('mailoutbox.html');
		});
		$('.caogao').on('click',function(){
			//$('.set').load('amail',{title:"草稿箱"});
			$('.set').load('maildraftbox.html');
		});
		$('.rubbish').on('click',function(){
			//$('.set').load('amail',{title:"垃圾箱"});
			$('.set').load('mailrubbishbox.html');
		});
		$('.write').on('click',function(){
			$('.set').load('mailwrite.html');
		});
		 $(".mail").click(function(){
				var title=$(".titles").text();
			   $(".thistable").load("mailtitle",{val:"邮件",title:title});
		   });
		 $(".tongzhi").click(function(){
			   var title=$(".titles").text();
			  $(".thistable").load("mailtitle",{val:"通知",title:title});
		   });
		 $(".gonggao").click(function(){
			 	var title=$(".titles").text();
			  $(".thistable").load("mailtitle",{val:"公告",title:title});
		   });
		
		
	});
</script>

  </body>
</html>
