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
    
    <title>My JSP 'taskadd.jsp' starting page</title>
    
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
<link rel="stylesheet" type="text/css" href="css/common/tanchuang.css" />
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
    top: -24px;
    float: right;
    right: 4px;
    cursor: pointer;
}
</style>

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
			<form action="taskController/add.action" method="post" onsubmit="return check();">
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
									<option value="${type.typeId}">${type.typeName}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-md-6 form-group">
							<label class="control-label">状态</label> 
							<select class="form-control" name="status.statusId">
							    <c:forEach items="${statusList}" var="status">
							    	<option value="${status.statusId}">${status.statusName}</option>
							    </c:forEach>
							</select>
						</div>
						<div class="col-md-6 form-group">
							<label class="control-label">开始日期</label> <input id="starTime" name="starDate"
								class="form-control"  />
						</div>
						<div class="col-md-6 form-group">
							<label class="control-label">结束日期</label> <input id="endTime" name="endDate"
								class="form-control"  />
						</div>
						<div class="col-md-6 form-group">

							<label class="control-label">标题</label> <input name="title"
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
							<textarea class="form-control text" name="taskDescribe"></textarea>
						</div>
						<div class="col-md-6 form-group">
							<label class="control-label">评价</label>
							<textarea class="form-control text" name="comment"></textarea>
						</div>
						<div class="col-md-6 form-group ">
							<label class="control-label">置顶</label> <br /> 
							<span class="labels"><label><input type="checkbox" name="isTop" class="val" value="1" ><i>✓</i></label></span>
						</div>

						<div class="col-md-6  form-group"> 
							<label class="control-label">取消</label> <br /> <span
								class="labels"><label><input type="checkbox" name="cancel" class="val" value="1"><i>✓</i></label></span>
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
                      			<!-- <a class="btn btn-success glyphicon glyphicon-plus btn-sm"  href="javaScript:void(0)" onclick="addvalue2()">追加接收人</a> -->
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
		<div id="page"
			style="background: #fff; border: 0px; margin-top: 0px; padding: 2px; height: 25px;">
			<div style="width: 40%; float: left;">
				<div class="pageInfo" style="margin-left: 5px;">
					共<span>31</span>条 | 每页<span>10</span>条
					| 共<span>4</span>页
				</div>
			</div>
			<div style="width: 60%; float: left;">
				<div class="pageOperation">
				<!--判断是否是第一页  -->
					<a class="btn btn-sm btn-default no-padding tablefirst" disabled="disabled"	style="width: 30px; height: 20px;"> <span
						class="glyphicon glyphicon-backward"></span></a> 
					<a class="btn btn-sm btn-default no-padding tableup"  disabled="disabled" 	style="width: 30px; height: 20px;"> <span
						class="glyphicon glyphicon-triangle-left"></span></a> 
				<a disabled="disabled" class="btn btn-default no-padding" style="width: 30px; height: 20px;">
						1
				</a>
				<!--判断是否是最后一页  -->
					<a class="btn btn-sm btn-default no-padding tabledown" style="width: 30px; height: 20px;"> <span
						class="glyphicon glyphicon-triangle-right"></span></a> 
					<a class="btn btn-sm btn-default no-padding tablelast" style="width: 30px; height: 20px;"> <span
						class="glyphicon glyphicon-forward"></span></a> 
				</div>
			</div>
		</div>
	</div>
</div>
<script>
		 
		 
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
		idstr=id_array.join(';');
	})
	
	var org=$("#recive_list").val();
	$("#recive_list").val(org+';'+idstr);	
	$(".fade").css("display","none");
	
}


</script>			
<!--校验模态框 -->

<style type="text/css">
#thismodal .modal-dialog {
	width: 500px;
	top:20%;
}

#thismodal .modal-body .icon {
	height: 80px;
	width: 80px;
	margin: 20px auto;
	border-radius: 50%;
	color: #aad6aa;
	border: 3px solid #d9ead9;
	text-align: center;
	font-size: 44px;
}

#thismodal .modal-body .icon .glyphicon {
	font-size: 46px;
	top: 14px;
}

#thismodal .modal-p {
	margin: 20px auto;
}

#thismodal .modal-body .modal-p h2 {
	text-align: center;
}

#thismodal .modal-body .modal-p p {
	text-align: center;
	color: #666;
	font-size: 16px;
	padding-top: 8px;
	font-weight: 300;
}

#thismodal .modal-p .btn {
	margin-left: 40%;
	width: 100px;
	height: 40px;
}

#thismodal .modal-error .icon {
	color: #f27474;
	border: 3px solid #f27474;
}
</style>

<div class="modal fade in" id="thismodal" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body modal-success" style="display: none;">
				<div class="icon">
					<span class="glyphicon glyphicon-ok"></span>
				</div>
				<div class="modal-p">
					<h2>操作成功</h2>
					<!--<p style="">已回复</p>-->
					<div class="modal-p">
						<button type="button" class="btn btn-primary successToUrl" data-dismiss="modal">确定</button>
					</div>
				</div>
			</div>
			<div class="modal-body modal-error" style="display: none;">
				<div class="icon">
					<span class="glyphicon glyphicon-remove"></span>
				</div>
				<div class="modal-p">
					<h2 style="text-align: center;">错误信息</h2>
					<p class="modal-error-mess">此处将显示弹出框的错误提示信息</p>
					<div class="modal-p">
						<button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
					</div>
				</div>
			</div>

		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>

<!-- /.modal -->
<script type="text/javascript" src="js/modalTip.js" ></script>


<!-- 这里是执行返回失败的参数，并显示详细的信息； -->
<script type="text/javascript">
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
//表单提交前执行的onsubmit()方法；返回false时，执行相应的提示信息；返回true就提交表单到后台校验与执行
function check() {
	console.log("开始进入了");
	//提示框可能在提交之前是block状态，所以在这之前要设置成none
	$('.alert-danger').css('display', 'none');
	var isRight = 1;
	$('.form-control').each(function(index) {
		// 如果在这些input框中，判断是否能够为空
		if ($(this).val() == "") {
			// 排除哪些字段是可以为空的，在这里排除
			if (index == 7 ||index == 8||index == 9) {
				return true;
			}
			
			// 获取到input框的兄弟的文本信息，并对应提醒；
			  var brother = $(this).siblings('.control-label').text();
			var errorMess = "[" + brother + "输入框信息不能为空]";
			// 对齐设置错误信息提醒；红色边框
			$(this).parent().addClass("has-error has-feedback");
			$('.alert-danger').css('display', 'block');
			// 提示框的错误信息显示
			$('.error-mess').text(errorMess);
			// 模态框的错误信息显示
			$('.modal-error-mess').text(errorMess);
			isRight = 0;
			return false;
		} else {
			// 在这个里面进行其他的判断；不为空的错误信息提醒
			return true;
		}
	});
	if (isRight == 0) {
		//modalShow(0);
		 return false;
	} else if (isRight == 1) {
		//modalShow(1);
		 return true;
	}
//	return false;
}
</script>
<script type="text/javascript" src="js/common/data.js"></script>
<script type="text/javascript" src="plugins/My97DatePicker/WdatePicker.js"></script>
  </body>
</html>
