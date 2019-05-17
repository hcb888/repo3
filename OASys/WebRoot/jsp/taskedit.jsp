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
    
    <title>My JSP 'taskedit.jsp' starting page</title>
    
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
<link rel="stylesheet" type="text/css" href="css/common/checkbox.css" />
<link rel="stylesheet" href="css/common/tanchuang.css" />
<script type="text/javascript" src="js/task/task.js" ></script>
<style type="text/css">
a {
	color: black;
}

a:hover {
	text-decoration: none;
}



.text {
	min-height: 114px;
}
.reciver{
	position: relative;
    top: -27px;
    float: right;
    right: 4px;
    cursor: pointer;
}
</style>
<script>
	$(function(){
	
	})

</script>

  </head>
  
  <body>
    <div class="row" style="padding-top: 10px;">
	<div class="col-md-2">
		<h1 style="font-size: 24px; margin: 0;" class="">任务管理</h1>
	</div>
	<div class="col-md-10 text-right">
		<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a> > <a
			disabled="disabled">任务管理</a>
	</div>
</div>
<div class="row" style="padding-top: 15px;">
	<div class="col-md-12">
		<!--id="container"-->
		<div class="bgc-w box">
			<!--盒子头-->
			<div class="box-header">
				<h3 class="box-title">
					<a href="javascript:history.back();" class="label label-default"
						style="padding: 5px;">
						 <i class="glyphicon glyphicon-chevron-left"></i> <span>返回</span>
					</a>
				</h3>
			</div>
			<!--盒子身体-->
			<form action="taskController/update.action" method="post" onsubmit="return check();">
			<input type="hidden" name="taskId" value="${task.taskId}">
			<div class="box-body no-padding">
				<div class="box-body">
						<!--錯誤信息提示  -->
					<div class="alert alert-danger alert-dismissable" role="alert"style="display: none;">
						错误信息:<button class="thisclose close" type="button">&times;</button>
						<span class="error-mess"></span>
					</div>
					<div class="row">
					
						<div class="col-md-6 form-group">
							<label class="control-label"> <span>类型</span></label>
							 <select class="form-control" name="type.typeId">
								<c:forEach items="${typeList}" var="type">
									<c:if test="${type.typeId==task.type.typeId}">
										<option value="${type.typeId}" selected="selected">${type.typeName}</option>
									</c:if>
									<c:if test="${type.typeId!=task.type.typeId}">
										<option value="${type.typeId}">${type.typeName}</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
						<div class="col-md-6 form-group">
							<label class="control-label">状态</label> 
							<select class="form-control" name="status.statusId">
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
						<div class="col-md-6 form-group">
							<label class="control-label">开始日期</label> <input id="starTime" name="starDate" value="${task.starDate}"
								class="form-control"  />
						</div>
						<div class="col-md-6 form-group">
							<label class="control-label">结束日期</label> <input id="endTime" name="endDate" value="${task.endDate}"
								class="form-control"  />
						</div>
						<div class="col-md-6 form-group">

							<label class="control-label">标题</label> <input name="title" value="${task.title}"
								type="text" id="title_Name" class="form-control" />
						</div>
						<div class="col-md-6 form-group" style="position: relative;">
							<label class="control-label" data-toggle="modal" data-target="#myModal">接收人</label>
							<input type="hidden" name="reciverArray" id="userId">
							 <input name="nameArray" type="text" id="recive_list" value="${task.reciverlist}" class="form-control " readonly="readonly" style="background-color:#fff;"/>
							<div class="reciver">
								<span class="label label-success glyphicon glyphicon-plus">通讯录</span>
							</div>
						</div>
						<div class="col-md-6 form-group">
							<label class="control-label">描述</label>
							<textarea class="form-control text" name="taskDescribe" >${task.taskDescribe}</textarea>
						</div>
						<div class="col-md-6 form-group">
							<label class="control-label">评价</label>
							<textarea class="form-control text" name="comment">${task.comment}</textarea>
						</div>
						<div class="col-md-6 form-group ">
							<label class="control-label">置顶</label> <br /> 
							<c:if test="task.isTop==1">
								<span class="labels"><label><input type="checkbox" name="isTop" class="val" value="1" checked="checked"  ><i>✓</i></label></span>
							</c:if>
							<c:if test="task.isTop!=1">
								<span class="labels"><label><input type="checkbox" name="isTop" class="val" value="1"    ><i>✓</i></label></span>
							</c:if>
						</div>

						<div class="col-md-6  form-group"> 
							<c:if test="task.isTop==1">
								<label class="control-label">取消</label> <br /> <span class="labels"><label><input type="checkbox" name="isTop" class="val" value="1" checked="checked"><i>✓</i></label></span>
							</c:if>
							<c:if test="task.isTop!=1">
									<label class="control-label">取消</label> <br /> <span class="labels"><label><input type="checkbox" name="isTop" class="val" value="1"  ><i>✓</i></label></span>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			<!--盒子尾-->
			<div class="box-footer">
				<input class="btn btn-primary" id="save" type="submit" value="保存" />
				<input class="btn btn-default" id="cancel" type="submit" value="取消"
					onclick="window.history.back();" />
			</div>
			</form>
		</div>
	</div>
</div>

<!-- 接收人弹窗-->
<style>
 .table-r{
 overflow: scroll;
 height:245px;
 }
</style>
<!-- 接收人弹窗-->
				<div class="modal fade " id="myModal" tabindex="-1">

					<!--第二步，窗口声明-->
					<div class="modal-dialog modal-lg ">
						<!--第三步、内容区的声明-->
						<div class="modal-content" style="background: #F9F9F9;">
							<div class="modal-1">

								<div class="modal-2">

									<div class="modal-header" style="margin:10px;margin-top: -20px;">
										<button class="close" data-dismiss="modal" style="display: block;margin: -52px -78px 0 0;;border-radius: 60%;">
											<span class="glyphicon glyphicon-remove-circle"style="color:white;font-size: 30px;" ></span>
										</button>
										<div class="row">
											<div class="col-xs-12" style="height:30px;margin:10px 0px;">

												<h4 style="float:left;">
                      			<a class="btn btn-success glyphicon glyphicon-plus btn-sm"  href="javaScript:void(0)" onclick="addvalue()"> 确定</a>
                      			<!--  <a class="btn btn-success glyphicon glyphicon-plus btn-sm"  href="javaScript:void(0)" onclick="addvalue2()">追加接收人</a>   -->
                  			</h4>

												<div class="input-group">
													<input type="text" class="form-control input-sm pull-right cha" placeholder="查找..." />
													<div class="input-group-btn chazhao" style="top:-1px;">
														<a class="btn btn-sm btn-default glyphicon glyphicon-search" style="height: 30px;" href="##"></a>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="modal-body thistable" style="margin:10px;">
									
									<div class="table-r">
										<table class="table  table-hover  container-fluid ">
										<thead>
											<tr class="row">
												<th class=" col-xs-1">
													<span class="labels"  style="display:none;"><label><input id="checkedAll" type="checkbox"><i>✓</i></label></span>
												</th>
												<th class=" col-xs-1">
													<span class="labels"  style="display:block;"></span>
													 
												</th>
												<th class=" col-xs-2 b">部门</th>
												<th class=" col-xs-2 b">真实姓名 </th>
												<th class="col-xs-2 b">用户名</th>
												<th class="col-xs-2 b">职位</th>
												<th class=" col-xs-2">电话</th>
											</tr>
										</thead>
										<tbody id="tb">
											
										</tbody>
										</table>
										</div>

<div class="box-footer no-padding" style="margin-top: -20px;">
	<div style="padding: 5px;">
 
	</div>
</div>
<script>
$(function(){
	$('.reciver').on('click',function(){
			 
			  	$.ajax({
	           		url:"userController/ajaxQueryPage.action",
	           		type:"post",
	           		accepts:"false",
	           		dataType:"json",
	           		success:function(data){
	           			//获取接收人选项框
	           			var userName=$("#recive_list").val();
	           			var array=userName.split(',');
	           			var userArray=new Array();
	           			for(var i=0;i<array.length;i++){
	           				if(array[i]!=null && array[i]!=''){
	           					userArray.push(array[i]);
	           				}
	           			}
	           			
	           			 
	           		
	        			 var tr="";
	        			 for(var i=0;i<data.rows.length;i++){
	        			 			 tr+="<tr class='row'>"+
												"<td class='col-xs-1'>"+
													"<span class='labels'><label>"+
													"<input name='id' type='hidden' value='"+data.rows[i].userId+"'>"+
													"<input   value='"+data.rows[i].userName+"' type='checkbox'";
												 		for(var j=0;j<userArray.length;j++){
													 		if(userArray[j]==data.rows[i].userName){
													 			tr+="checked";
													 		}
												 		}
												tr+="><i>✓</i></label></span></td>"+
												"<td class='col-xs-1'>"+
													"<span class='imgs center-block'>"+
														"<img style='width: 30px;height: 30px;' class='profile-user-img img-responsive img-circle' src='http://localhost:8080/upload/"+data.rows[i].imgPath+"' />"+
													"</span>"+
												"</td>"+
												"<td class='col-xs-2'>"+data.rows[i].dept.deptName+"</td>"+
												"<td class='col-xs-2'>"+data.rows[i].realName+" </td>"+
												"<td class='col-xs-2 na'>"+data.rows[i].userName+"</td>"+
												"<td class='col-xs-2'>"+data.rows[i].position.name+"</td>"+
												"<td class='col-xs-2'>"+data.rows[i].userTel+"</td>"+
											"</tr>";
										
	        			 }
	        			 //添加前先清空一下
	        			 $("#tb").empty();
	        			 $("#tb").append(tr);
	        			 
	           		}
           		});
			 
			$('#myModal').modal("toggle");
			$('.reciver').removeClass("qu");
			$(this).addClass("qu");
			 
		});
});
</script>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
				<h2 class="mi" style="display:none;">任务</h2>
<script>
function addvalue(){
	
 	//先清空一下接受人框
	$("#recive_list").val("");
	$("#userId").val("");
	
	var userNames=new Array();
	var userIds=new Array();
	
	
	var  cc=$("#tb tr td input:checked");
	for(var i=0;i<cc.length;i++){
		userNames.push(cc[i].value);
	}
	
	
	for(var i=0;i<cc.length;i++){
		var td=cc[i].parentNode.childNodes;
		userIds.push(td[0].value);
	} 
	
		  
	 
	
	//添加到接收人框并且关闭窗口	 
	$("#recive_list").val(userNames.join(','));
	$("#userId").val(userIds.join(','));
	
 	$(".recive_list").change();
	$(".fade").css("display","none");
	
}
/*追加到联系人*/
function addvalue2(){
	
	var id_array=new Array();
	
	var  idstr=null;

	$('input[name="id"]:checked').each(function(){
		var $name=$(this).parents(".col-xs-1").siblings(".na").text();
		id_array.push($name);
		idstr=id_array.join(',');
	})
	
	var org=$("#recive_list").val();
	$("#recive_list").val(org+';'+idstr);	
	$(".fade").css("display","none");
	
}
</script>			
<script type="text/javascript" src="js/common/data.js"></script>
<script type="text/javascript" src="plugins/My97DatePicker/WdatePicker.js"></script>
  </body>
</html>
	