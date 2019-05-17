<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'tasksee.jsp' starting page</title>
    
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
<link rel="stylesheet" href="css/task/seetask.css" />
<style type="text/css">
a {
	color: #fff;
}

a:hover {
	text-decoration: none;
	color: #fff;
}

.text {
	min-height: 114px;
}
</style>
<script>
			$(function(){
				
				
				$(".ddlstatus").each(function(){
					var options=$(".ddlstatus option:selected");
						
					
					if(options.val()=="7"){
						$("#save").prop("disabled",true);
					
					}else{
						$("#save").removeAttr("disabled");
					}
			});
			});
		</script>

  </head>
  
  <body>
    	<div class="outside">
		<div class="row head">
			<div class="col-md-2">
				<h1 style="font-size: 24px; margin: 0;" class="">任务查看</h1>
			</div>
			<div class="col-md-10 text-right right-me">
				<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a> >
				<a disabled="disabled">任务查看</a>
			</div>
		</div>
		<div class="containers">

			<button type="button" class="bs btn btn-xs btn-default out">
				<a href="javascript:history.back();"> <span
					class="glyphicon glyphicon-chevron-left back">返回</span></a>
			</button>
			
			<div class="page-header"></div>
			<form action="taskController/updateStatusAndTicking.action" method="post">
				<div class="row">
					<div class="box-body"
						style="margin-left: 20px; margin-right: 20px;">
						<div class=" mailbox-read-info">
							<h3>
								<span id="ctl00_cphMain_lblTitle">任务主题：${task.title}</span>
							</h3>
								<h5 class="fonts">
								
									<span id="ctl00_cphMain_lblFrom" class="mailbox-read-time">发布人：<i>${task.user.userName}</i> &nbsp;&nbsp;参加人员：<i>${task.reciverlist}</i></span>
								
									<span id="ctl00_cphMain_lblDate" class="mailbox-read-time pull-right">${task.starDate}</span>
								</h5>
							</div>
						<div class="mailbox-read-message">
							<span id="ctl00_cphMain_lblDescription">任务描述：${task.taskDescribe}</span>
							<span id="ctl00_cphMain_lblFeedback">
								<h5 style="margin-top: 20px;">
									任务进度（${task.starDate}至 ${task.endDate}） <small
										class="pull-right">${task.status.sortPrecent}%</small>
								</h5>
								<div class="progress xs" style="margin: 10px 0;">
									<div class="progress-bar progress-bar-aqua"
										style="width:${task.status.sortPrecent}%" role="progressbar"
										aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">
									</div>
								</div> 
								<c:forEach items="${taskLoggerList}" var="task">
									<c:forEach items="${task}" var="t">
										<div>
											${t.username}
												<span style="font-size:8pt; color:#999; margin-left:3px;">${t.createDate}</span>
												<c:if test="${t.status.statusName!=null}">
													：将状态改为【${t.status.statusName}】
												</c:if>
										</div>
									</c:forEach>
								</c:forEach>
									
									 
							</span> <span id="ctl00_cphMain_lblNote"></span>
						</div>
						<div class="page-header page"></div>
						<div class="col-md-6 form-group"
							style="margin-left: -12px; margin-right: 12px;">
							<label> <span id="ctl00_cphMain_Label1">状态</span>
							</label>
							<div class="form-group">
								<select name="status.statusId" id="ctl00_cphMain_ddlStatus"
									class="form-control select2 ddlstatus">
									 <c:forEach items="${statusList}" var="status">
							    	<c:if test="${task.status.statusId==status.statusId}">
							    		<option value="${status.statusId}" selected="selected">${status.statusName}</option>
							    	</c:if>
							    	<c:if test="${task.status.statusId!=status.statusId}">
							    		<option value="${status.statusId}"  >${status.statusName}</option>
							    	</c:if>
							    </c:forEach>
								</select>
							</div>
						</div>
						<div class="col-md-6 form-group">
							<label> <span id="ctl00_cphMain_Label2">反馈</span>
							</label> <input name="ticking" type="text" value="${task.ticking}"  class="form-control" /> 
							<input name="taskId" type="text" id="ctl00_cphMain_txtPowerValue" class="form-control" value="${task.taskId }" style="display: none;" />

						</div>
					</div>


				</div>

				<div class="box-footer foot">
					<input class="btn btn-primary" id="save" type="submit" value="保存" />
					<input class="btn btn-default" id="cancel" type="submit" value="取消"
						onclick="window.history.back();" />
				</div>

			</form>
		</div>
	</div>
  </body>
</html>
