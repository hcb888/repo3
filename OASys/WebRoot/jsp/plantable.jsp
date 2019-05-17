<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://itcast.cn/common/" prefix="itcast"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'plantable.jsp' starting page</title>
    
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
<link href="css/common/checkbox.css" rel="stylesheet"/>
<link href="css/common/iconfont.css"  rel="stylesheet"/>
<link href="css/plan/plantable.css" rel="stylesheet"/>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js" ></script>
<script type="text/javascript" src="js/iconfont.js"></script>
<script type="text/javascript" src="js/plan/plantable.js"></script>
<script type="text/javascript">
	$(function(){
		$("#day").click(function(){
			var date=new Date(); 
			var dayStart=date.toLocaleDateString().replace("/", "-").replace("/", "-");
			date.setDate(date.getDate()+1);
			var dayEnd=date.toLocaleDateString().replace("/", "-").replace("/", "-");
			
			//隐藏的
			$("#start").val(dayStart);
			$("#end").val(dayEnd);
			
			location.href="planController/dayWeekMonthPlanQueryPage.action?startDate="+dayStart+"&endDate="+dayEnd+"&jh=日计划";
			
			//显示的
			$("#planStart").html(dayStart);
			date.setDate(date.getDate()-1);
			$("#planEnd").html(date.toLocaleDateString().replace("/", "-").replace("/", "-"));
			
			//将计划修改成日计划
			$("#jh").html("日计划");
			
			
		});
		
		$("#week").click(function(){
			var date=new Date(); 
			date.setDate(date.getDate()-date.getDay()+1);
			var weekStart=date.toLocaleDateString().replace("/", "-").replace("/", "-");
			
		 
			date.setDate(date.getDate()+7);
			var weekEnd=date.toLocaleDateString().replace("/", "-").replace("/", "-");
			//隐藏的
			$("#start").val(weekStart);
			$("#end").val(weekEnd);
			
			location.href="planController/dayWeekMonthPlanQueryPage.action?startDate="+weekStart+"&endDate="+weekEnd+"&jh=周计划";
			
			//显示的
			$("#planStart").html(weekStart);
			date.setDate(date.getDate()-1);
			$("#planEnd").html(date.toLocaleDateString().replace("/", "-").replace("/", "-"));
					
			//将计划修改成周计划
			$("#jh").html("周计划");
		});
		
		$("#month").click(function(){
			var date=new Date(); 
			date.setDate(1);
			
		    var monthStart=date.toLocaleDateString().replace("/", "-").replace("/", "-");
		    date.setMonth(date.getMonth()+1);
			var monthEnd=date.toLocaleDateString().replace("/", "-").replace("/", "-"); 
			//隐藏的
		    $("#start").val(monthStart);
			$("#end").val(monthEnd); 
			
			location.href="planController/dayWeekMonthPlanQueryPage.action?startDate="+monthStart+"&endDate="+monthEnd+"&jh=月计划";
			
			//显示的
			 $("#planStart").html(monthStart);
			date.setDate(date.getDate()-1);
			$("#planEnd").html(date.toLocaleDateString().replace("/", "-").replace("/", "-")); 
			
			//将计划修改成月计划
			$("#jh").html("月计划");
				
		});
		
		$("#s").click(function(){
			var start=$("#start").val();
			var end=$("#end").val();
			var startDate=new Date(start.replace("-", "-").replace("-", "-"));
			var endDate=new Date(end.replace("-", "-").replace("-", "-"));
			var jh="";
			
			//获取当前执行的什么计划
			var jh=$("#jh").html();
			//日计划
			if(jh=="日计划"){
				startDate.setDate(startDate.getDate()-1);
				endDate.setDate(endDate.getDate()-1);
				
				jh="日计划";
			}
			
			//周计划
			if(jh=="周计划"){
				startDate.setDate(startDate.getDate()-7);
				endDate.setDate(endDate.getDate()-7);
				jh="周计划";
			}
			
			//月计划
			if(jh=="月计划"){
					startDate.setMonth(startDate.getMonth()-1);
					
					endDate.setMonth(endDate.getMonth()-1);
					
					jh="月计划";

			}
			
			location.href="planController/dayWeekMonthPlanQueryPage.action?startDate="+startDate.toLocaleDateString().replace("/", "-").replace("/", "-")+"&endDate="+endDate.toLocaleDateString().replace("/", "-").replace("/", "-")+"&jh="+jh;
			
		 	//隐藏的
		    $("#start").val(startDate.toLocaleDateString().replace("/", "-").replace("/", "-"));
			$("#end").val(endDate.toLocaleDateString().replace("/", "-").replace("/", "-")); 
			//显示的
			 $("#planStart").html(startDate.toLocaleDateString().replace("/", "-").replace("/", "-"));
			 endDate.setDate(endDate.getDate()-1);
			$("#planEnd").html(endDate.toLocaleDateString().replace("/", "-").replace("/", "-"));
		});
		
		$("#x").click(function(){
			var start=$("#start").val();
			var end=$("#end").val();
			var startDate=new Date(start.replace("-", "-").replace("-", "-"));
			var endDate=new Date(end.replace("-", "-").replace("-", "-"));
			
			//获取当前执行的什么计划
			var jh=$("#jh").html();
			//日计划
			if(jh=="日计划"){
				startDate.setDate(startDate.getDate()+1);
				endDate.setDate(endDate.getDate()+1);
			}
			
			//周计划
			if(jh=="周计划"){
				startDate.setDate(startDate.getDate()+7);
				endDate.setDate(endDate.getDate()+7);
			}
			
			//月计划
			if(jh=="月计划"){
					startDate.setMonth(startDate.getMonth()+1);
					
					endDate.setMonth(endDate.getMonth()+1);

			}
			
			
			location.href="planController/dayWeekMonthPlanQueryPage.action?startDate="+startDate.toLocaleDateString().replace("/", "-").replace("/", "-")+"&endDate="+endDate.toLocaleDateString().replace("/", "-").replace("/", "-")+"&jh="+jh;
		
			
		 	//隐藏的
		    $("#start").val(startDate.toLocaleDateString().replace("/", "-").replace("/", "-"));
			$("#end").val(endDate.toLocaleDateString().replace("/", "-").replace("/", "-")); 
			//显示的
			 $("#planStart").html(startDate.toLocaleDateString().replace("/", "-").replace("/", "-"));
			 endDate.setDate(endDate.getDate()-1);
			$("#planEnd").html(endDate.toLocaleDateString().replace("/", "-").replace("/", "-"));
		});
	});
</script>

  </head>
  
  <body>
	
	
	<input type="hidden"  id="start" value="${start}">
	<input type="hidden" id="end"  value="${end}">
	
				<div class="row" style="padding-top:10px">
					<div class="col-md-10">
						<h1 >计划报表(<span id="jh" style="font-size: 24px;">${jh}</span>)</h1>
					</div>
					<div class="col-md-2 text-right">
						<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a>
						>
						<a disabled="disabled">计划报表</a>
					</div>
				</div>
		<div class="col-md-12">
		<div class="box">
			<div class="box-header ">
				<a class="  label  label-back last" id="s">
					<span class="glyphicon glyphicon-chevron-left"></span>
					上一个
				</a>
				
				<a class=" label  label-back next" id="x">
					<span class="glyphicon glyphicon-chevron-right"></span>
					下一个
				</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span id="planStart" style="font-size: 16px;">${planStart}</span>
				 至 
				<span id="planEnd" style="font-size: 16px;">${planEnd}</span>
				
				<div class="time" >
					<input type="button" value="日" id="day">
	<input type="button" value="周" id="week">
	<input type="button" value="月" id="month">
				</div>
				
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
<table class="table table-striped table-hover table-bordered table-responsive">
					<tr>
						<th>部门</th>
						<th>成员</th>
						<th>计划</th>
						<th>状态</th>
						<th>总结</th>
						<th>评价</th>
					</tr>	
					 <c:forEach items="${page.rows}" var="plan">
					 	<tr>
							<td>${plan.planUser.dept.deptName}</td>
							<td>${plan.planUser.userName}</td>
					     	<td><textarea rows="5" cols="78" readonly="readonly"  style="border:0;overflow:hidden">${plan.planContent}</textarea></td>
							<td>
								<c:if test="${plan.planStatus.statusName=='未完成'}"><span class="label label-warning">未完成</span></c:if>
								<c:if test="${plan.planStatus.statusName=='已完成'}"><span class="label label-success">已完成</span></c:if>
								<c:if test="${plan.planStatus.statusName=='已取消'}"><span class="label label-danger">已取消</span></c:if>				
							</td>
							<td><textarea rows="5" cols="78" readonly="readonly"  style="border:0;overflow:hidden">${plan.planSummary}</textarea></td>
							<td>
								<c:if test="${plan.planComment!=null}">
									${plan.planComment}
								</c:if>
								<c:if test="${plan.planComment==null}">
									<!-- 模态框按钮 -->
									<a class="btn thisa" id="${plan.planId}"  >
										<span class="label label-success ">
											<i class="glyphicon glyphicon-commenting">评论</i>
										</span>
									</a>
								</c:if>
							</td>
						</tr> 	
					 </c:forEach>
					
			 
				</table>
<div class="box-footer no-padding" style="margin-top: -20px;">
	<div style="padding: 5px;">
		<itcast:page url="planController/dayWeekMonthPlanQueryPage.action"></itcast:page>
	</div>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog" style="margin-top: 10%";>
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					<span class="glyphicon glyphicon-remove-circle" style="font-size: 26px;"></span>
				</button>
				<h4 class="modal-title" id="myModalLabel">
					评论
				</h4>
			</div>
			<div class="modal-body" >
				 
				<textarea rows="8" cols="78" id="comment"></textarea>
			</div>
			<input type="text" id="commentid"/>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" id="commentsave" data-dismiss="modal">提交	</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<script>
$('.thisa').on('click',function(){
 
	$("#myModal").modal("toggle");
	$("#commentid").val($(this).attr("id"))
});

var start=$("#start").text();
var end=$("#end").text();

//评论提交
$("#commentsave").click(function(){
	 var comment=$("#comment").val();
	 var commentid=$("#commentid").val();
	 location.href="planController/updatePlanComment.action?planId="+commentid+"&planComment="+comment;
	 
})


</script>
</body>
</html>
