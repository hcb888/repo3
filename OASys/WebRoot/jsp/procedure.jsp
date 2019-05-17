<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'procedure.jsp' starting page</title>
    
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
	cursor: pointer;
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
.col-md-3 h4,.col-md-3 h5{
	display:inline-block;
	margin-left: 10px;
}
.col-md-3 h4{
	margin-top: 40px;
	margin-bottom: 1px;
	
}
.col-md-3{  
   -webkit-box-shadow: #666 0px 0px 10px;  
   -moz-box-shadow: #666 0px 0px 10px;  
   box-shadow: #666 0px 0px 10px;  
   border-radius:5px; 
   margin-right: 48px;
   margin-left: 27px;
    padding-top: 20px;
    padding-bottom: 20px;
    padding-left: 20px;
}
.me .form-group{
margin-bottom: 48px;
}
.me img{
    border-radius: 15px;
    cursor: pointer;
}
</style>
<div class="row" style="padding-top: 10px;">
	<div class="col-md-2">
		<h1 style="font-size: 24px; margin: 0;" class="">新建流程</h1>
	</div>
	<div class="col-md-10 text-right">
		<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a> > <a
			disabled="disabled">新建流程</a>
	</div>
</div>
<div class="row" style="padding-top: 15px;">
	<div class="col-md-12">
		<div class="bgc-w box">
		
			
			<!--盒子身体-->
			
			<div class="box-body no-padding">
				<div class="box-body">
				<div class="row me" style="padding-top: 40px;padding-left: 40px;">
				<a href="bursementController/processAndbursement.action">
					<div class="col-md-3 form-group">
					<label class="control-label" style="float:left;"><img src="images/money.jpg" style="width:100px;height:100px;"></label>
						<div>
						<h4>费用报销单</h4><br>
						<h5>指报销申请单据</h5>
						</div>
					</div>
					</a>
					<!-- <a href="evemoney">
					<div class="col-md-3 form-group">
					<label class="control-label" style="float:left;"><img src="images/chuchaimoney.jpg" style="width:100px;height:100px;"></label>
						<div>
						<h4>出差费用单</h4><br>
						<h5>指出差费用单据</h5>
						</div>
					</div>
					</a> -->
					<a href="evectionController/processAndEvection.action">
					<div class="col-md-3 form-group">
					<label class="control-label" style="float:left;"><img src="images/chuchai.jpg" style="width:100px;height:100px;"></label>
						<div>
						<h4>出差申请单</h4><br>
						<h5>指出差申请单</h5>
						</div>
					</div>
					</a>
					<a href="overtimeController/processAndOvertime.action">
					<div class="col-md-3 form-group">
					<label class="control-label" style="float:left;"><img src="images/jiaban.jpg" style="width:100px;height:100px;"></label>
						<div>
						<h4>加班申请单</h4><br>
						<h5>指加班申请单</h5>
						</div>
					</div>
					</a>
					<a href="regularController/process.action">
					<div class="col-md-3 form-group">
					<label class="control-label" style="float:left;"><img src="images/zhuanzhneg.jpg" style="width:100px;height:100px;"></label>
						<div>
						<h4>转正申请单</h4><br>
						<h5>指转正申请单</h5>
						</div>
					</div>
					</a>
					<a href="holidayController/processAndHoliday.action">
					<div class="col-md-3 form-group">
					<label class="control-label" style="float:left;"><img src="images/qingjia.jpg" style="width:100px;height:100px;"></label>
						<div>
						<h4>请假申请单</h4><br>
						<h5>指请假申请单</h5>
						</div>
					</div>
					</a>
					<a href="resignController/process.action">
					<div class="col-md-3 form-group">
					<label class="control-label" style="float:left;"><img src="images/lizhi.jpg" style="width:100px;height:100px;"></label>
						<div>
						<h4>离职申请单</h4><br>
						<h5>指离职申请单</h5>
						</div>
					</div>
					</a>
				</div>
			</div>
		</div>
			
		</div>
	</div>
</div>
  </body>
</html>
