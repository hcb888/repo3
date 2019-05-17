<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'informshow.jsp' starting page</title>
    
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
<style type="text/css">
a {
	color: black;
	
}
ul li a{
	font-size:13px;
}
a:hover {
	text-decoration: none;
}

.bgc-w {
	background-color: #fff;
}
/*下面是主题回复*/
.chat-box .chat-title {
	padding: 10px;
	border-bottom: 1px solid #ddd;
}

.chat-box .big-img {
	border-radius: 50%;
	border: 2px solid #ddd;
	float: left;
	width: 40px;
	height: 40px;
}

.chat-box .username {
	display: block;
	margin-left: 50px;
}

.chat-box .right-time {
	margin-left: 50px;
	display: block;
}

.chat-box .comment-td {
	padding: 0;
	width: 40px;
}

.chat-box .raply-name {
	color: #54a0ea;
}
</style>


  </head>
  
  <body>
    <div class="row" style="padding-top: 10px;">
	<div class="col-md-2">
		<h1 style="font-size: 24px; margin: 0;">通知查看</h1>
	</div>
	<div class="col-md-10 text-right">
		<a href="index"><span class="glyphicon glyphicon-home"></span> 首页</a>
		> <a disabled="disabled">通知查看</a>
	</div>
</div>

<div class="row" style="padding-top: 15px;">
	<div class="col-md-12">
		<!--id="container"-->
		<div class="bgc-w box box-primary"
			style="border-top: 3px solid #d2d6de; color: #5f5f5f;">
			<!--盒子头-->
			<div class="box-header">
				<h3 class="box-title">
					<a href="javascript:history.back();" class="label label-default" style="padding: 6px;">
						<span class="glyphicon glyphicon-chevron-left">返回</span>
					</a> 
				</h3>

			</div>
			<!--盒子身体-->
			<div class="box-body no-padding chat-box">
				<div class="chat-title">
					<h4>
						<span>${notice.user.dept.deptName}公告-${notice.user.userName}</span>
					</h4>
					<h5>
						<small> <span>发布：${notice.user.userName}</span> <span class="pull-right">${notice.noticeDate}</span>
						</small>
					</h5>
				</div>
				<div class="chat-content" style="padding: 10px 40px 12px 16px;">
					<p>${notice.user.dept.deptName}公告-${notice.user.userName}
					</p>
						<kbd><a href="${notice.url}" style="color: #fff;font-size:12px;"><i class="glyphicon glyphicon-link"></i>打开连接</a></kbd>
				</div>
			</div>
			<!--盒子尾-->
		</div>
	</div>
</div>

  </body>
</html>
