<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://itcast.cn/common/"  prefix="itcast"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'attendcemonthtable.jsp' starting page</title>
    
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
	<link href="css/common/checkbox.css" rel="stylesheet" />
	<link href="css/common/iconfont.css" rel="stylesheet" />
	<link href="css/attendce/monthtable.css" rel="stylesheet"/>
	<script type="text/javascript" src="js/iconfont.js"></script> 
<!-- 	<script	type="text/javascript" src="plugins/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="js/attendce/monthtable.js"></script> -->
	<script type="text/javascript">
		$(function(){
			$("#s").click(function(){
			 	
	         	 var year=$("#date").html().substring(0,$("#date").html().indexOf("-"));
				 var month=$("#date").html().substring($("#date").html().indexOf("-")+1,$("#date").html().length);
				 var smonth=parseInt(month)-1;
			 	 
			 	 var yearMonth=year+"-"+smonth;
			     
			     
				location.href="attendsController/queryAttendsMonthPage.action?yearMonth="+yearMonth;
			 	 
			});
			
			$("#x").click(function(){
			 	
	         	 var year=$("#date").html().substring(0,$("#date").html().indexOf("-"));
				 var month=$("#date").html().substring($("#date").html().indexOf("-")+1,$("#date").html().length);
				 var smonth=parseInt(month)+1;
			 	 
			 	 var yearMonth=year+"-"+smonth;
			 	 
			    location.href="attendsController/queryAttendsMonthPage.action?yearMonth="+yearMonth;
			});
		});
	</script>
  </head>
  
  <body>
  
	<div class="row" style="padding-top: 10px">
		<div class="col-md-2">
			<h1 style="font-size: 24px; margin: 0;" class="">考勤月报表</h1>
		</div>
		<div class="col-md-10 text-right">
			<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a> >
			<a disabled="disabled">考勤月报表</a>
		</div>
	</div>
	<div class="row">
	<div class="col-md-12">
	<div class="box">
		<div class="box-header ">
			<a class="label  label-back lastmonth" id="s"> <span class="glyphicon glyphicon-chevron-left" >上一月</span> </a> 
			<a class=" label  label-back nextmonth" id="x"> <span class="glyphicon glyphicon-chevron-right">下一月 </span> </a>
			<span id="date">${vo.yearMonth}</span>
			<div class="input-group" style="width:150px;float:right;top:-5px">
				<input type="text" class="form-control input-sm pull-right baseKey" value="" placeholder="查找..." />
				<div class="input-group-btn" style="top:-1px;">
					<a class="btn btn-sm btn-default glyphicon glyphicon-search btn-change baseKetsubmit"></a>
				</div>
			</div>
		<div class="box-body">
			<div id="refresh" class="thistable">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table
				class="table table-striped table-hover table-bordered table-responsive">
			
				<tr>
					<th>部门</th>
					<th>成员</th>
					<th>正常</th>
					<th>迟到</th>
					<th>早退</th>
					<th>请假</th>
					<th>出差</th>
					<th>旷工</th>
				</tr>
				<c:forEach items="${page.rows}" var="month"  varStatus="i">
					<tr>
						<td>${month.deptName}</td>
						<td>${month.userName}</td>
					  	<td>${month.normal}</td>
						<td>${month.beLate}</td>
					    <td>${month.leaveEarly}</td>
						<td>${month.leave}</td>
					    <td>${month.evection}</td>
						<td>${month.absenteeism}</td>
					</tr> 	
				</c:forEach>
			</table>
<div class="box-footer no-padding" style="margin-top: -20px;">
	<div style="padding: 5px;" align="center">
		 <itcast:page url="attendsController/queryAttendsMonthPage.action"></itcast:page>
	</div>
</div>
 
</body>
</html>
