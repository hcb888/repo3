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
    
    <title>My JSP 'deptread.jsp' starting page</title>
    
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
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/common/box.css" />
<style type="text/css">
a {
	color: black;
}

a:hover {
	text-decoration: none;
}

.bgc-w {
	background-color: #fff;
}
</style>

  </head>
  
  <body style="background-color: #ecf0f5;">
	<div class="row" style="padding-top: 10px;">
		<div class="col-md-2">
			<h1 style="font-size: 24px; margin: 0;" class="">部门管理</h1>
		</div>
		<div class="col-md-10 text-right">
			<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a> >
			<a disabled="disabled">部门管理</a>
		</div>
	</div>
	<div class="row" style="padding-top: 15px;">
		<div class="col-md-12">
			<!--id="container"-->
			<div class="bgc-w box">
				<form action="deptedit" method="post" onsubmit="return check();">
					<!--盒子头-->
					<div class="box-header">
						<h3 class="box-title" style="font-size: 12px;">
							部门详细信息
						</h3>
					</div>
					<!--盒子身体-->
					<div class="box-body no-padding">
						<div class="box-body">
							<div class="row">
								<div class="col-md-12 form-group">
									${deptName}
										<a class="label sheding" href="javascript:void(0);">删除</a>
								</div>
								<div class="col-md-12 form-group">
									部门经理：${user.realName} 
									
										<a class="changemanage label xiugai">更换</a>
								</div>
								<input type="hidden" name="deptid" value="2">
							</div>
								<table class="table table-hover table-striped">
									<tr>
										
										<th scope="col">&nbsp;</th>
										<th scope="col">真实姓名</th>
										<th scope="col">用户名</th>
										<th scope="col">职位</th>
										<th scope="col">操作</th>
									</tr>
									<c:forEach items="${userList}" var="user">
										<tr>
											<td><img src="images/handsome.jpg" class="img-circle"
												style="width: 25px; height: 25px;" /></td>
											<td><span>${user.realName}</span></td>
											<td><span>${user.userName}</span></td>
											<td><span>${user.position.name}</span></td>
											<td>
												<a class="usermanagechange label xiugai" onclick="deptAndPosition(${user.dept.deptId},${user.position.positionId},${user.userId})">
													<span class="glyphicon glyphicon-edit"></span> 人事调动
												</a>
												<input class="deptuserid" type="hidden" value="8"/>
												<input class="realname" type="hidden" value="小费"/>
											</td>
										</tr>
									</c:forEach>
								</table>
						</div>
						
					</div>
					<!--盒子尾-->
					<div class="box-footer">
							<input class="btn btn-default" id="cancel" type="button" value="返回"
							onclick="window.history.back();" />
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="modal fade in userchange" id="thismodal" data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body box no-padding" style="display: none;">
					<form action="userController/updateById.action" method="post">
						<div class="box-header">
							<h3 class="box-title mc-title" style="font-size:15px;">人事变动</h3>
						</div>
						<div class="box-body no-padding">
							<div class="row">
								<div class="changeuser"> 
										<input    type="hidden"    name="userid" value=""/>
									<input type="hidden" name="deptid" value="2">
								</div> 
								<div class="col-md-6">
									<label class="control-label"> <span>部门</span></label>
									<input    type="hidden" id="uId"  name="uId" value=""/>
									<select class="deptselect form-control" name="changedeptid" id="dept">
											
									</select>
								</div>
								<div class="col-md-6">
									<label class="control-label"> <span>职位</span></label>
									<select class="positionselect form-control" name="positionid" id="position">
									</select>
								</div>
							</div>
							
						</div>
						<div class="box-footer" style="text-align:right;">
							<button type="submit" class="btn btn-primary"
								>确定</button>
							<button type="button" class="btn btn-default mcmodalcancle"
								data-dismiss="modal">取消</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade in managechangemodel" id="thismodal" data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body box no-padding" style="display: none;">
					<form action="deptmanagerchange" method="post">
						<div class="box-header">
							<h3 class="box-title mc-title" style="font-size:15px;">人事变动</h3>
						</div>
						<div class="box-body no-padding">
							<div class="row">
								
									<div class="col-md-12">
										<label class="control-label" style="margin-top: 5px"> <span>当前经理去向：</span></label> 
										<input type="hidden" name="deptid" value="2">
										<input type="hidden" name="oldmanageid" value="4" />
									</div> 
									<div class="col-md-6">
										<label class="control-label"> <span>部门</span></label>
										<select class="deptselect form-control" name="changedeptid">
												<option value="1">总经办</option>
												<option value="2">研发部</option>
												<option value="3">财务部</option>
												<option value="4">市场部</option>
												<option value="5">人事部</option>
												<option value="20">测试部</option>
										</select>
									</div>
									<div class="col-md-6">
										<label class="control-label"> <span>职位</span></label>
										<select class="positionselect form-control" name="positionid">
												<option value="1">超级管理员</option>
												<option value="2">CEO</option>
										</select>
									</div>
									<div class="col-md-6">
											<label class="control-label" style="margin-top: 5px"> <span>新任部门经理：</span></label>
											<select class="form-control" name="newmanageid">
													<option value="8">小费</option>
													<option value="9">小花</option>
													<option value="10">花红</option>
													<option value="11">兰瑞</option>
													<option value="12">雨果</option>
													<option value="13">毛羽</option>
													<option value="28">薛之谦</option>
													<option value="36">杰克</option>
													<option value="37">张三</option>
											</select>
									</div>
								
							</div>
						</div>
						<div class="box-footer" style="text-align:right;">
							<button type="submit" class="btn btn-primary"
								>确定</button>
							<button type="button" class="btn btn-default mcmodalcancle"
								data-dismiss="modal">取消</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
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

$(".deptselect").on("change",function(){
	//alert("部门选择变化");
	var selectdeptid = $(this).val();
	
	$.post("selectdept",{selectdeptid:selectdeptid},function(data){
		$(".positionselect").empty();
		
		//console.log(data);
		$.each(data,function(i,item){
			var potion = $("<option value="+item.id+">"+item.name+"</option>");
			$(".positionselect").append(potion);
		});
	});
	
});

 


$(".changemanage").click(function(){
	$("#thismodal.managechangemodel").modal("toggle");
	$('#thismodal.managechangemodel .modal-body').css('display', 'block');
});




/*  $('.successToUrl').on('click',function(){
	window.location.href='/testsysmenu';
}); */

function alertCheck(errorMess){
	
	$('.alert-danger').css('display', 'block');
	// 提示框的错误信息显示
	$('.error-mess').text(errorMess);
	
}
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
			if (index == 2 || index == 3 || index == 4 || index == 5 || index == 6) {
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
			
			if(index == 0){
				var $name=$(this).val();
 				
 				if(isChinaName($name) == false){
 					$(this).parent().addClass("has-error has-feedback");
 					alertCheck("请输入中文名称");
 					isRight = 0;
 		 			return false;
 				}
			} 
			
			if(index == 3){
				var $mail=$(this).val();
 				
 				if(isMailNo($mail) == false){
 					$(this).parent().addClass("has-error has-feedback");
 					alertCheck("邮箱格式错误");
 					isRight = 0;
 		 			return false;
 				}
			}
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


//验证中文名称
function isChinaName(name) {
 var pattern = /^[\u4E00-\u9FA5]{1,6}$/;
 return pattern.test(name);
}

//验证邮箱
function isMailNo(mail){
	var pattern = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/; 
	return pattern.test(mail);
}

function deptAndPosition(deptId,positionId,userId){
	$.ajax({
		url:"deptController/deptAndPosition.action",
		type:"post",
		async:false,
		data:{"deptId":deptId,"positionId":positionId},
		dataType:"json",
		success:function(data){
			var deptSelect="<option value='0'>请选择</option>";
			for(var i=0;i<data.depts.length;i++){
				if(data.depts[i].deptId==data.id1){
					deptSelect+="<option value='"+data.depts[i].deptId+"' selected>"+data.depts[i].deptName+"</option>";
				}else{
					deptSelect+="<option value='"+data.depts[i].deptId+"'>"+data.depts[i].deptName+"</option>";
				}
			}
			
			var positionSelect="<option value='0'>请选择</option>";
			for(var i=0;i<data.positions.length;i++){
				if(data.positions[i].positionId==data.id2){
					positionSelect+="<option value='"+data.positions[i].positionId+"'  selected>"+data.positions[i].name+"</option>";
				}else{
					positionSelect+="<option value='"+data.positions[i].positionId+"'  >"+data.positions[i].name+"</option>";
				}
			}
			
			//先清空一下
			$("#dept").empty();
			$("#position").empty();
			
			//添加数据
			$("#dept").append(deptSelect); 
			$("#position").append(positionSelect); 
			
			
			
		}	
	});
	
	 
	$("#uId").val(userId);
	
	alert(userId);
	
	var userid = $(this).siblings(".deptuserid").val();
	console.log(userid);
	$("#thismodal.userchange").modal("toggle");
	$('#thismodal.userchange .modal-body').css('display', 'block');
	$("#thismodal .changeuser .changeuserid").val(userid);
}
</script>

<script type="text/javascript">
	$(function(){
		 $("#dept").change(function(){
		 	 var deptId=this.value;
		 	 $.ajax({
				url:"positionController/findByList.action",
				type:"post",
				async:false,
				data:{"deptId":deptId},
				dataType:"json",
				success:function(data){
					var positionSelect="<option value='0'>请选择</option>";
					for(var i=0;i<data.positions.length;i++){
						if(data.positions[i].positionId==data.id2){
							positionSelect+="<option value='"+data.positions[i].positionId+"'  selected>"+data.positions[i].name+"</option>";
						}else{
							positionSelect+="<option value='"+data.positions[i].positionId+"'  >"+data.positions[i].name+"</option>";
						}
					}
					
					//先清空一下
					$("#position").empty();
					
					//添加数据
					$("#position").append(positionSelect); 
				}	
			});
		 });
		 
	});
</script>
 
</html>