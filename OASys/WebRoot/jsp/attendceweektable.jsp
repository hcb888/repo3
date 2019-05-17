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
    
    <title>My JSP 'attendceweektable.jsp' starting page</title>
    
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
	<link href="css/attendce/weektable.css" rel="stylesheet"/>
	<script type="text/javascript" src="js/iconfont.js"></script> 
	<script	type="text/javascript" src="plugins/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="js/attendce/weektable.js"></script>  
	<script src="res/jqPaginator.min.js" type="text/javascript"></script>
    <link href="res/myPage.css" rel="stylesheet" type="text/css" />
   	<script type="text/javascript">
   		
        
        $(function(){
        	$("#s").click(function(){
        		//获取开始时间并转换成date类型
	        	var start=new Date($("#wstart").html().replace("-", "/").replace("-", "/"));
	        	//开始时间减7天
	             start.setDate(start.getDate()-7);
 				//将date类型转换成字符串	
	        	var startDate=start.toLocaleDateString().replace("/", "-").replace("/", "-");
	        	
	        	//获取结束时间
	        	var end=new Date($("#wend").html().replace("-","/").replace("-","/"));
	        	//结束时间减7
	        	end.setDate(end.getDate()-6);
	        	//将date类型转换成字符串
	        	var endDate=end.toLocaleDateString().replace("/","-").replace("/", "-");
	        	console.log(startDate);
	        	location.href="attendsController/queryAttendsWeekPage.action?startDate="+startDate+"&endDate="+endDate;
	        	 
			 	 
        	});
        	
        	$("#x").click(function(){
        		//获取开始时间并转换成date类型
	        	var start=new Date($("#wstart").html().replace("-", "/").replace("-", "/"));
	        	//开始时间减7天
	             start.setDate(start.getDate()+7);
 				//将date类型转换成字符串	
	        	var startDate=start.toLocaleDateString().replace("/", "-").replace("/", "-");
	        	
	        	//获取结束时间
	        	var end=new Date($("#wend").html().replace("-","/").replace("-","/"));
	        	//结束时间减7
	        	end.setDate(end.getDate()+8);
	        	//将date类型转换成字符串
	        	var endDate=end.toLocaleDateString().replace("/","-").replace("/", "-");
	        	
	        	
	        	location.href="attendsController/queryAttendsWeekPage.action?startDate="+startDate+"&endDate="+endDate;
        	});
        });
        
       
    </script>
  </head>
  
  <body>

	<div class="row" style="padding-top:10px" >
					<div class="col-md-2">
						<h1 style="font-size:24px;margin: 0;" class="">考勤周报表</h1>
					</div>
					<div class="col-md-10 text-right">
						<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a>
						>
						<a disabled="disabled">考勤周报表</a>
					</div>
				</div>
		<div class="row">
	<div class="col-md-12">
		<div class="box">
			<div class="box-header ">
				<a id="s" class="label  label-back lastweek">
					<span class="glyphicon glyphicon-chevron-left"></span>
					上一周
				</a>
				
				<a id="x" class="label  label-back nextweek" >
					<span class="glyphicon glyphicon-chevron-right"></span>
					下一周
				</a>
				<span  id="wstart">${startDate}</span>
				至
				<span id="wend">${endDate}</span>
				<div class="input-group" style="width:150px;float:right;top:-5px">
											<input type="text" class="form-control input-sm pull-right baseKey" value="" placeholder="查找..." />
											<div class="input-group-btn" style="top:-1px;">
												<a class="btn btn-sm btn-default glyphicon glyphicon-search btn-change baseKetsubmit"></a>
											</div>
		    </div>
			<div class="box-body">
			<div id="refresh" class="thistable">

<table class="table table-striped table-hover table-bordered table-responsive" id="tab">
	<tr><th>部门</th><th>成员</th><th>星期一</th><th>星期二</th><th>星期三</th><th>星期四</th><th>星期五</th><th>星期六</th><th>星期日</th></tr>
	<c:forEach items="${page.rows}" var="week">
			
			<tr> 
				<td> ${week.deptName} </td> 
				<td> ${week.userName} </td> 
				<td class='report'> <div align='center'><c:if test="${week.monday[0].officeHours!=null}"><span class="label label-primary">上班：&nbsp;&nbsp;</span></c:if>  ${week.monday[0].officeHours} <br/> <c:if test="${week.monday[0].closingTime!=null}"><span class="label label-warning">下班：&nbsp;&nbsp;   </span></c:if> ${week.monday[0].closingTime} </div> </td>
				<td class='report'> <div align='center'><c:if test="${week.tuesday[0].officeHours!=null}"><span class="label label-primary">上班：&nbsp;&nbsp;</span></c:if> ${week.tuesday[0].officeHours}  <br/> <c:if test="${week.tuesday[0].closingTime!=null}"><span class="label label-warning">下班：&nbsp;&nbsp;</span></c:if>  ${week.tuesday[0].closingTime} </div> </td>
				<td class='report'> <div align='center'><c:if test="${week.wednesday[0].officeHours!=null}"><span class="label label-primary">上班：&nbsp;&nbsp;</span></c:if> ${week.wednesday[0].officeHours}  <br/> <c:if test="${week.wednesday[0].closingTime!=null}"><span class="label label-warning">下班：&nbsp;&nbsp;</span></c:if>  ${week.wednesday[0].closingTime} </div> </td>
				<td class='report'> <div align='center'><c:if test="${week.thursday[0].officeHours!=null}"><span class="label label-primary">上班：&nbsp;&nbsp;</span></c:if> ${week.thursday[0].officeHours}  <br/> <c:if test="${week.thursday[0].closingTime!=null}"><span class="label label-warning">下班：&nbsp;&nbsp;</span></c:if> ${week.thursday[0].closingTime} </div> </td>
				<td class='report'> <div align='center'><c:if test="${week.friday[0].officeHours!=null}"><span class="label label-primary">上班：&nbsp;&nbsp;</span></c:if> ${week.friday[0].officeHours}  <br/> <c:if test="${week.friday[0].closingTime!=null}"><span class="label label-warning">下班：&nbsp;&nbsp;</span></c:if>  ${week.friday[0].closingTime} </div> </td>
				<td class='report'> <div align='center'><c:if test="${week.saturday[0].officeHours!=null}"><span class="label label-primary">上班：&nbsp;&nbsp;</span></c:if> ${week.saturday[0].officeHours}  <br/> <c:if test="${week.saturday[0].closingTime!=null}"><span class="label label-warning">下班：&nbsp;&nbsp;</span></c:if> ${week.saturday[0].closingTime} </div> </td>
				<td class='report'> <div align='center'><c:if test="${week.sunday[0].officeHours!=null}"><span class="label label-primary">上班：&nbsp;&nbsp;</span></c:if> ${week.sunday[0].officeHours}  <br/> <c:if test="${week.sunday[0].closingTime!=null}"><span class="label label-warning">下班：&nbsp;&nbsp;</span></c:if>   ${week.sunday[0].closingTime} </div> </td>
			<tr>
	</c:forEach>
</table>
 
<div class="box-footer no-padding" style="margin-top: -20px;">
	<div style="padding: 5px;">

		 <div style="padding: 5px;" align="center">
		 	<itcast:page url="attendsController/queryAttendsWeekPage.action"></itcast:page>
		</div>
	</div>
	</div>
</div>
</div>
</div>
			</div>
			</div>
		</div>
		
		 
		
		
</body>
</html>
