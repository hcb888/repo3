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
    
    <title>My JSP 'audetail2.jsp' starting page</title>
    
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
<link rel="stylesheet" href="css/common/tanchuang.css" />
<style>
a {
	color: black;
}

a:hover {
	text-decoration: none;
}



.text {
	min-height: 114px;
}
.reciver1{
	position: relative;
    top: -23px;
    float: right;
    right: 4px;
    cursor: pointer;
}
.text{
	height:114px;
}
.page{
	margin-bottom: 25px;
    margin-top: 15px;
    margin-left: -10px;
    margin-right: -10px;
}
.shuxian{
	height: 30px;
    border-left: 1px solid #eee;
    margin-left: 35px;
    margin-bottom: 8px;
    margin-top: 8px;
}
.shen{
	min-height:50px;
	border:0px solid red;
	margin-left: 13px;
    margin-right: 17px;
    position: relative;
}
.content{
	display: inline-block;
    background-color: #eee;
    width: 95%;
    min-height: 80px;
    border-radius: 5px;
    margin-left: 54px;
}
.pa{
	padding-left: 13px;
    
}
</style>

  </head>
  
  <body>
    

<div class="row" style="padding-top: 10px;">
	<div class="col-md-2">
		<h1 style="font-size: 24px; margin: 0;" class="">请假申请</h1>
	</div>
	<div class="col-md-10 text-right">
		<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a> > <a
			disabled="disabled">请假申请</a>
	</div>
</div>
<div class="row" style="padding-top: 15px;">
	<div class="col-md-12">
		
		<div class="bgc-w box">
			
			<div class="box-header">
				<h3 class="box-title">
					<a href="javascript:history.back();" class="label label-default"
						style="padding: 5px;">
						 <i class="glyphicon glyphicon-chevron-left"></i> <span>返回</span>
					</a>
				</h3>
			</div>
		
			<form action="reviewedController/update2.action" method="post" id="myForm">
			<div class="box-body">
				<c:if test="${process.processStatus.statusName=='已批准'}">
					<div>
						<i class="glyphicon glyphicon-record" style="color:#9E9E9E;padding-left: 13px;"></i> 结束审核
					</div>
					<div class="shuxian"></div>
				</c:if>
				<c:if test="${process.processStatus.statusName=='未通过'}">
					<div>
						<i class="glyphicon glyphicon-record" style="color:#9E9E9E;padding-left: 13px;"></i> 结束审核
					</div>
					<div class="shuxian"></div>
				</c:if>
				
				<c:forEach items="${reviewedList}" var="reviewed">
					<div class="shen">
					<p>${reviewed.reviewedUser.position.name}：${reviewed.reviewedUser.userName}<span class="pull-right">${reviewed.reviewedDate}</span></p>
					<div >
					<div style="display:inline-block;position:absolute;">
						<img style="width: 50px;height: 50px;border-radius: 72px; position: relative;bottom:0px;right:0px;"
							src="http://localhost:8080/upload/${reviewed.reviewedProcess.processUser.imgPath}" />
					</div>
					<div class="content">
						<p class="pa" style="padding-top: 9px;">审核状态:
						 <c:if test="${reviewed.reviewedStatus.statusName=='未处理'}">
								<i  class="label label-primary">未处理</i></p>
						</c:if>
						<c:if test="${reviewed.reviewedStatus.statusName=='处理中'}">
								<i  class="label label-info">处理中</i></p>
						</c:if>
						<c:if test="${reviewed.reviewedStatus.statusName=='已批准'}">
								<i  class="label label-warning">已批准</i></p>
						</c:if>
						<c:if test="${reviewed.reviewedStatus.statusName=='未通过'}">
								<i  class="label label-danger">未通过</i></p>
						</c:if>
 
						<p class="pa" >审核意见：${reviewed.advice}</p>
					</div>
					</div>
					</div>
					<div class="shuxian"></div>
				</c:forEach>
				
				<div class="shen">
					<p>申请人：${process.processUser.userName}<span class="pull-right">${process.applyDate}</span></p>
					<div >
					<div style="display:inline-block;position:absolute;">
						<img style="width: 50px;height: 50px;border-radius: 72px; position: relative;bottom:0px;right:0px;"
							src="http://localhost:8080/upload/${process.processUser.imgPath}" />
					</div>
					<div class="content">
					<p class="pa" style="padding-top: 9px;">开始时间：${process.startDate}</p>
					<p class="pa" >结束时间：${process.endDate}</p>
					<p class="pa" >申请理由：${process.processDes}</p>
					</div>
					</div>
				</div>
				<div class="shuxian"></div>
				<div>
					<i class="glyphicon glyphicon-record" style="color:#9E9E9E;padding-left: 13px;"></i> 开始申请
				</div>
				<div class="page-header page"></div>
				
				 
					 <div class="col-md-6 form-group" style="z-index: 1;">
					<label class="control-label">审核状态</label>
						<c:if test="${reviewed.reviewedStatus.statusName=='已批准' || reviewed.reviewedStatus.statusName=='未通过'}">
							<select class="form-control" name="reviewedStatus.statusId" class="sele"  disabled="disabled">
							 <c:forEach items="${statusList}" var="status">
							 	<c:if test="${status.statusId==reviewed.reviewedStatus.statusId}">
							 		<option value="${status.statusId}" selected="selected">${status.statusName}</option>
							 	</c:if>
							 	<c:if test="${status.statusId!=reviewed.reviewedStatus.statusId}">
							 		<option value="${status.statusId}" >${status.statusName}</option>
							 	</c:if>
							 </c:forEach>
						  </select>
						</c:if>
						 <c:if test="${reviewed.reviewedStatus.statusName!='已批准' && reviewed.reviewedStatus.statusName!='未通过'}">
							<select class="form-control" name="reviewedStatus.statusId" id="reviewedStatusstatusId" class="sele"   >
							 <c:forEach items="${statusList}" var="status">
							 	<c:if test="${status.statusId==reviewed.reviewedStatus.statusId}">
							 		<option value="${status.statusId}" selected="selected">${status.statusName}</option>
							 	</c:if>
							 	<c:if test="${status.statusId!=reviewed.reviewedStatus.statusId}">
							 		<option value="${status.statusId}" >${status.statusName}</option>
							 	</c:if>
							 </c:forEach>
						  </select>
						</c:if>
					</div>
					<div class="col-md-6 form-group" style="position: relative;">
						<label class="control-label" data-toggle="modal" data-target="#myModal">下一步审核人</label>
							<input type="hidden" name="rId" id="userId">
							<input type="hidden" id="rn">
							<input  type="text" id="recive_list"  name="rName"  placeholder="请选自己的上级" class="form-control " readonly="readonly" style="background-color:#fff;"/>
							<div class="reciver1"  disabled="disabled">
								<span class="label label-success glyphicon glyphicon-plus">通讯录</span>
							</div>
					</div>
					 <div class="col-md-6 form-group" style="float: none;">
						<label class="control-label">审核理由</label>
						<c:if test="${reviewed.reviewedStatus.statusName!='已批准' && reviewed.reviewedStatus.statusName!='未通过'}">
							<textarea class="form-control text" name="advice"   id="advice" >${reviewed.advice}</textarea>
						</c:if>
						 <c:if test="${reviewed.reviewedStatus.statusName=='已批准' || reviewed.reviewedStatus.statusName=='未通过'}">
							<textarea class="form-control text" name="advice"    disabled="disabled">${reviewed.advice}</textarea>
						</c:if>
					</div> 
				 
				 
				
				
				
				
			</div>
			
			<div class="box-footer" style="padding-left: 26px;">
 			 <!--流程id  -->
			  <input type="hidden"  name="processId" id="processId" value="${reviewed.reviewedProcess.processId}"/>
			   <!--审核id  -->          
			  <input type="hidden" name="reviewedId" id="reviewedId" value="${reviewed.reviewedId}"/>
  
			  <c:if test="${reviewed.reviewedStatus.statusName!='已批准' && reviewed.reviewedStatus.statusName!='未通过'}">
					<input class="btn btn-info liu" id="submit2" type="button" value="审核并转流"  />
			  	 	<input class="btn btn-success jie" id="save" type="submit" value="审核并结案"   />  
			  </c:if>
			</div>
			</form>
			
		</div>
	</div>
</div>
<script>
	$(function(){
		$(".text").click(function(){
			var se=$("select").find("option:selected").text();
			if(se=="未通过" && (4!=5 || 4!=7)){
				$(".liu").css("display","none");
				$(".jie").css("display","inline-block");
			}
		});
		
		$("select").each(function(){
			console.log("ss");
			var se=$("select").find("option:selected").text();
			console.log(se);
		});
		
		$("#submit2").click(function(){
 
		 	alert($("#userId").val())
			if($("#userId").val()!=null &&  $("#userId").val()!=undefined &&  $("#userId").val()!='' ){
				 var processId=$("#processId").val();
				 var reviewedId=$("#reviewedId").val();
				 var reviewedStatusstatusId=$("#reviewedStatusstatusId").val();
				 var rId=$("#userId").val();
				 var rName=$("#recive_list").val();
				 var advice=$("#advice").val();
				 
				  location.href="reviewedController/update1.action?processId="+processId+"&reviewedId="+reviewedId+"&reviewedStatus.statusId="+reviewedStatusstatusId+"&rId="+rId+"&rName="+rName+"&advice="+advice;
				 
			}else{
				confirm("请选择下一步审核人");
				return false;
			}
		});
		
	})
</script>

<style>
 .table-r{
 overflow: scroll;
 height:245px;
 }
</style>
<!-- 接收人弹窗-->
 
	  <div class="modal fade " id="myModal1" tabindex="-1">

					<!--第二步，窗口声明-->
					<div class="modal-dialog modal-lg" style="margin-top: 150px">
						<!--第三步、内容区的声明-->
						<div class="modal-content" style="background: #F8F8F8;">
							<div class="modal-1" style="margin: 20px;padding: 20px;background: #ECF0F5;">

								<div class="modal-2" style="background: white;border-top: 3px solid #D2D6DE;">

									<div class="modal-header" style="margin:10px;margin-top: -20px;">
										<button class="close" data-dismiss="modal" style="display: block;margin: -52px -78px 0 0;border-radius: 60%;">
											<span class="glyphicon glyphicon-remove-circle"style="color:white;font-size: 30px;" ></span>
										</button>
										<div class="row" style="margin-top: 15px">
											<div class="col-xs-12" style="height:30px;margin:10px 0px;">
												<h4 style="float:left;margin-top:0px">
                      								<a class="btn btn-success glyphicon glyphicon-plus btn-sm"  href="javaScript:void(0)" onclick="addvalue1()"> 确定</a>
                  								</h4>
												<div class="input-group">
													<input type="text" class="form-control input-sm pull-right cha" style="width: 150px"  placeholder="查找..." />
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
												<th class=" col-xs-2 b" style="color: #23527c;">部门</th>
												<th class=" col-xs-2 b" style="color: #23527c;">真实姓名 </th>
												<th class="col-xs-2 b" style="color: #23527c;">用户名</th>
												<th class="col-xs-2 b" style="color: #23527c;">职位</th>
												<th class=" col-xs-2" style="color: #23527c;">电话</th>
											</tr>
										</thead>
										<tbody id="tb1">
											
										</tbody>
										</table>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
<script>
		 $(function(){
			 	$('.reciver1').on('click',function(){
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
														"<input  name='radio2' value='"+data.rows[i].userName+"' type='radio'";
													 		for(var j=0;j<userArray.length;j++){
														 		if(userArray[j]==data.rows[i].userName){
														 			tr+="checked";
														 		}
													 		}
													tr+="> </label></span></td>"+
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
		        			 $("#tb1").empty();
		        			 $("#tb1").append(tr);
		        			 
		           		}
	           		});
				 
				$('#myModal1').modal("toggle");
				$('.reciver1').removeClass("qu");
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
				<h2 class="mi" style="display:none;"></h2>
<script>
  function addvalue1(){
	//先清空一下接受人框
	$("#recive_list").val("");
	$("#userId").val("");
	$("#rn").val("");
	
	var userNames=new Array();
	var userIds=new Array();
	
	
	var  cc=$("#tb1 tr td input:checked");
	for(var i=0;i<cc.length;i++){
		userNames.push(cc[i].value);
	}
	
	
	for(var i=0;i<cc.length;i++){
		var td=cc[i].parentNode.childNodes;
		userIds.push(td[0].value);
	} 
	
		  console.log(userNames);
	 console.log(userIds);
	
	//添加到接收人框并且关闭窗口	 
	$("#recive_list").val(userNames.join(','));
	$("#userId").val(userIds.join(','));
	
 	/* $(".recive_list").change(); */
	$(".fade").css("display","none");
	
}
</script>
  </body>
</html>
