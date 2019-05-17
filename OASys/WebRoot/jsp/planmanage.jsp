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
    
    <title>My JSP 'planmanage.jsp' starting page</title>
    
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
	<link href="css/common/box.css" rel="stylesheet" />
	<link href="css/common/iconfont.css"  rel="stylesheet"/>
	
	<script type="text/javascript" src="easyui/jquery.min.js" ></script>
	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js" ></script>
	<script type="text/javascript" src="js/iconfont.js"></script>
<script type="text/javascript" src="plugins/My97DatePicker/WdatePicker.js"></script>
	
	<style type="text/css">
			a {
				color: black;
			}
			
			a:hover {
				text-decoration: none;
			}
			.box-body{
				cursor: pointer;
			}
			.table{
			padding: 0 0 0 0 !important;
			}
			.table tr{
				background-color: white !important;
				border-bottom: 1px solid dashed !important;
			}
			.table .table-header{
				border-bottom: 1px solid dashed !important;
			}
			.box-header b:hover{
				background-color: #E7E7E7;
			}
			.box-header{
				border-bottom: 1px solid dashed !important;
			}
			 .box-header a{
			 	padding: 5px;
			 }
			 .box-body{
				padding: 0 0 0 0 !important;
				cursor: pointer;
			}
			.active{
				color: #000000;
				
			}
			.box{
      margin-top: 10px !important;
  }
		</style>

  </head>
  
  <body style="background-color: #ecf0f5;">
			<div class="">
				<div class="row" style="padding-top:10px">
					<div class="col-md-2">
						<h1 style="font-size:24px;margin: 0;" class="">计划管理</h1>
					</div>
					<div class="col-md-10 text-right">
						<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a>
						>
						<a disabled="disabled">计划管理</a>
					</div>
				</div>
				
				<div class="row">
			<div class="col-md-12 thistable">
<div class="bgc-w box box-primary">
					<div class="box-header">
						<a class="label label-success" href="planController/planTypeAndStatus.action"><span class="glyphicon glyphicon-plus"></span>
							新增
						</a>
						
						<div class="input-group" style="width:150px;float:right;top:-5px">
											<input type="text" class="form-control input-sm pull-right baseKey" value="" placeholder="查找..." />
											<div class="input-group-btn" style="top:-1px;">
												<a class="btn btn-sm btn-default glyphicon glyphicon-search btn-change baseKetsubmit"></a>
											</div>
										</div>

					</div>
					<div class="box-body">
				<div class="table" style="padding-top: 15px;">
						<div class="table-responsive">
										<table class="table table-hover table-striped">
											<tr class="table-header">
												<th scope="col" class="paixu thistype" style="color:blue;">类型
									</th>
												<th scope="col">标题</th>
												<th scope="col"><span class="paixu thistime" style="color:blue;">发布时间
						</span></th>
												<th scope="col">发布人</th>
												<th scope="col">部门</th>
												<th scope="col"><span class="paixu thisstatus" style="color:blue;">状态
						</span></th>
												<th scope="col">附件</th>
												<th scope="col">操作</th>
											</tr>
											
											<c:forEach items="${page.rows}" var="plan">
												<tr>
														<td>${plan.palnType.typeName}</td>
														<td>${plan.title}</td>
														<td>${plan.createDate}</td>
														<td>${plan.planUser.userName}</td>
														<td>${plan.planUser.dept.deptName}</td>
														<td>
															<c:if test="${plan.planStatus.statusName=='未完成'}"><span class="label label-warning">未完成</span></c:if>
															<c:if test="${plan.planStatus.statusName=='已完成'}"><span class="label label-success">已完成</span></c:if>
															<c:if test="${plan.planStatus.statusName=='已取消'}"><span class="label label-danger">已取消</span></c:if>																
														</td>
														<td>
															<c:if test="${plan.planAoaAttachment.attachmentPath!=null}">
																<a style="color:#337ab7;"href="http://localhost:8080/upload/${plan.planAoaAttachment.attachmentPath}">
																	<span class="glyphicon glyphicon-paperclip"></span>
																</a>
															</c:if>
															
														</td>
														<td>
															<a  href="planController/findById.action?id=${plan.planId}" class="label xiugai"><span class="glyphicon glyphicon-edit"></span> 修改</a>
															<a onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" href="planController/delete.action?id=59" class="label shanchu"><span class="glyphicon glyphicon-remove"></span> 删除</a>
														</td>
											       </tr>
											</c:forEach>
													 
										</table>
									</div>
								</div>
								</div>
				
								
<div class="box-footer no-padding" style="margin-top: -20px;">
	<div style="padding: 5px;" align="center">
		 <itcast:page url="planController/queryPage.action"></itcast:page>
	</div>
</div>
 
							</div>			</div>
								</div>
							</div>
					
	</body>
</html>
