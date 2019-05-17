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
    
    <title>My JSP 'attendceedit.jsp' starting page</title>
    
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
<script type="text/javascript" src="easyui/jquery.min.js" ></script>
<script type="text/javascript" src="js/iconfont.js"></script>
<script type="text/javascript" src="plugins/My97DatePicker/WdatePicker.js"></script>
<title>Insert title here</title>
		<meta charset="UTF-8">
<style>

   
.box{
	position: relative;
    border-radius: 3px;
    background: #ffffff;
    border-top: 3px solid #d2d6de;
    margin-bottom: 20px;
    width: 100%;
    box-shadow: 0 1px 1px rgba(0,0,0,0.1);
	padding: 10px 0px 10px 10px;
}

.box-body .form-group{
	margin-bottom: 15px;
}
.box .box-body .text{
	min-height: 114px;
}
.box .box-body .row .ischeck{
	width: 28px;
	height: 28px;
}
	.label-back {
    background-color: #6C7B8B;
    color: white;
    }
    .label-back:hover{
    	color: white !important;
    }
    
   
    .accpet{
    	position:absolute;
    	top:30px;
    	right:20px;
    	background-color: #00a65a;
    	color:white;
    	width: 74px;
    	height:25px;
    	font-size:10px;
    	padding: 0 0 2px;
    	text-align:center;
    	line-height: 25px;
    }
    .accpet:hover{
    	color: white !important;
    }
    
</style>

  </head>
  
 	<body>
		<div class="box increase">
			<form action="attendsController/update.action" method="post">
			<input type="hidden" name="attendsId" value="${attends.attendsId}">
			<div class="box-header">
			
				<a class="btn label-back" href="javascript:void(0);"  onclick="window.history.back();"> 
					<span class="glyphicon glyphicon-chevron-left" ></span>返回</a>
			</div>
			<div class="box-body">
			
				<div class="row">
					<div class="col-md-6 form-group">
						<label class="control-label">
							<span>状态</span>
							
						</label>
						<select class="form-control" name="status.statusId">
								<c:forEach items="${statusLists}" var="status">
									<c:if test="${status.statusId==attends.status.statusId}">
										<option value="${status.statusId}" selected="selected">${status.statusName}</option>
									</c:if>
									<c:if test="${status.statusId!=attends.status.statusId}">
										<option value="${status.statusId}" >${status.statusName}</option>
									</c:if>
								</c:forEach>
						</select>
					</div>
					<div class="col-md-6 form-group">
						<label class="control-label">备注</label>
						<input name="attendsRemark"  class="form-control remark" value="${attends.attendsRemark}"/>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-6 form-group">
						<label class="control-label">
							<span>类型</span>
						</label>
						<select class="form-control"  disabled="disabled">
								<c:forEach items="${aoaTypeLists}" var="type">
									<c:if test="${attends.type.typeId==type.typeId}">
										<option value="${type.typeId}" selected="selected">${type.typeName}</option>
									</c:if>
									<c:if test="${attends.type.typeId!=type.typeId}">
										<option value="${type.typeId}"  >${type.typeName}</option>
									</c:if>
								</c:forEach> 
						</select>
					</div>
				</div>
				
			</div>
			
			<div class="box-footer">
				<input class="btn btn-primary" id="save" type="submit" value="保存"  />
				<input class="btn btn-default active" id="cancel" type="submit" value="取消" onclick="window.history.back();"/>
			</div>
			</form>
		</div>
		
	</body>
</html>
