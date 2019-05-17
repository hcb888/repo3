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
    
    <title>My JSP 'bursement.jsp' starting page</title>
    
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
.modal-open {
    overflow:auto;
}
.box-header{
  text-align: center;
  border-bottom: 0px solid #f4f4f4;
}
.title{
	text-align: center;
}

.inpu{
 margin-top: -6px;

}

.control-label{
	display:inline-block;
	font-weight: 400;
}
.bo{
	margin: 0px auto;
	width: 80%;
}


.table th,.chebox,.table>tbody>tr>td{
font-weight: 400;
 text-align: center;
}
.inside{
width: 100%;
}
.inside thead{
background-color: rgba(76, 175, 95, 0.06);
}
.inside>tbody>tr>td{
 border-top: 0px solid #ddd;
}
.inside>tbody>tr>td{
border-bottom: 1px solid #ddd;
border-left: 1px solid #ddd;
}
.tdrig{
border-right: 1px solid #ddd;
}
.bo>tbody>tr>td,.inside>thead>tr>th {
    border-top: 0px solid #ddd;
    border-bottom: 0px solid #ddd;
    border-left: 0px solid #ddd;
}
.food{
	padding-left:10px
}
.zeng,.jian{
cursor: pointer;
}
.reciver1{
	position: relative;
    float: right;
    margin-top: -28px;
    right: 5px;
    cursor: pointer;
}

.reciver2{
	position: relative;
    float: right;
    margin-top: -28px;
    right: 5px;
    cursor: pointer;
}
.sub{
	position: relative;
    float: right;
    margin-top: -24px;
    right: 9px;
    cursor: pointer;
}
.text{
	min-height:100px;
}
</style>

  </head>
  
  <body>

   

<div class="row" style="padding-top: 10px;">
	<div class="col-md-2">
		<h1 style="font-size: 24px; margin: 0;" class="">费用报销</h1>
	</div>
	<div class="col-md-10 text-right">
		<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a> > <a
			disabled="disabled">费用报销</a>
	</div>
</div>
<div class="row" style="padding-top: 15px;">
	<div class="col-md-12">
		
		<div class="bgc-w box">
			<form action="bursementController/add.action"   enctype="multipart/form-data" method="post" onsubmit="return check();" >
			<div class="box-header">
				<table class="bo table ">
			
				<tr >
					<td colspan="14" class="title"><h2>费用报销单</h2></td>
			
				</tr>
				<tr style="opacity: 0;">
					<td colspan="14">11</td>
				</tr>
				<tr >
					<td colspan="14" style="text-align: left;">
						<!--錯誤信息提示  -->
					<div class="alert alert-danger alert-dismissable" style="display:none;" role="alert">
						错误信息:<button class="thisclose close" type="button">&times;</button>
						<span class="error-mess"></span>
					</div>
					</td>
				</tr>
				<tr >
					<td class="title"><label class="control-label">标题</label></td>
					<td  colspan="6"><input type="text" class="form-control inpu" name="processName"/></td>
					
					<td class="title"><span >紧急程度</span></td>
					<td colspan="6">
						<select class="form-control inpu" name="processType.typeId">
							 <c:forEach items="${process}" var="process">
							 	<option value="${process.typeId}">${process.typeName}</option>
							 </c:forEach>
						</select>
					</td>
					
				</tr>
				<tr >
					<!-- <td class="title" ><label class="control-label">提单人员</label></td>
					<td  colspan="6"><input type="text" class="form-control inpu" 
					readonly="readonly" style="background-color:#fff;" value="罗密欧"/></td> -->
					<td class="title" ><label class="control-label">证明人</label></td>
					<td  colspan="6">
					<input type="hidden" name="bursementUser.userId" id="bursementUserId">
					<input type="text" class="form-control inpu cheng" 
					readonly="readonly" style="background-color:#fff;"  id="namemoney"/>
						<div class="reciver1">
						<span class="label label-success glyphicon glyphicon-plus"
					>通讯录</span>
					</div>
					</td>
				</tr>
				
				<tr >
					<td class="title" ><label class="control-label">相关客户</label></td>
					<td  colspan="6"><input type="text" class="form-control inpu" name="name"/></td>
					<td class="title" ><label class="control-label">报销方式</label></td>
					<td colspan="6">
					<select class="form-control inpu" name="bursementType.typeId">
							 <c:forEach items="${bursement}" var="bursement">
							 	<option value="${bursement.typeId}">${bursement.typeName}</option>
							 </c:forEach>
					</select>
					</td>
				</tr>
				<tr >
				<td class="title" ><label class="control-label">审核人员</label></td>
					<td  colspan="6">
					<input type="hidden" name="reviewedUser.userId" id="userId">
					<input  type="text" id="recive_list" name="shenuser" value="${task.reciverlist}" placeholder="请选自己的上级" class="form-control " readonly="readonly" style="background-color:#fff;"/>
					<div class="reciver2">
						<span class="label label-success glyphicon glyphicon-plus">通讯录</span>
					</div>
					</td>
					<td class="title" ><label class="control-label">相关票据</label></td>
					<td  colspan="6">
						<div class="btn btn-default"style="position: relative; overflow: hidden;width: 100%;margin-top: -6px;">
							<i class="glyphicon glyphicon-open"></i> 上传票据
							<input type="file" name="imgFile" style="opacity: 0; position: absolute;
								 top: 12px; right: 0; " class='inpu'>
						</div>
					</td>
				</tr>
				<tr >
					<td class="title" ><label class="control-label">报销事由</label></td>
					<td  colspan="6"><textarea class="form-control text" name="processDes"></textarea></td>
				</tr>
				<tr >
					<td class="title"><label class="control-label">报销明细</label></td>
					<td colspan="13" style="text-align: right;" ><i class="glyphicon glyphicon-plus zeng"></i>&nbsp;&nbsp;&nbsp;<i class="glyphicon glyphicon-minus jian"></i></td>
					
				</tr>
				
				<tr >
					<td colspan="14" >
					<div class="food">
						<table class="table inside">
							<thead>
								<tr>
									 <th colspan="2" style="width: 77px;">选择</th>
									 <th colspan="2">费用日期</th>
									 <th colspan="2">费用科目</th>
									 <th colspan="2">费用说明</th>
									 <th colspan="2">票据张数</th>
									 <th colspan="2">报销金额</th>
								</tr>
							</thead>
							<tbody class="tbody">
							<tr class="tr">
									<td class="chebox" colspan="2"><span class="labels"><label><input type="checkbox" name="items" class="val" ><i>✓</i></label></span></td>
									<td colspan="2"><input type="text" class="form-control inpu shijian" name="details[0].produceDate" /></td>
									<td colspan="2">
										<input type="text" class="form-control inpu" name="details[0].subject"
										readonly="readonly" style="background-color:#fff;"/>
										<div class="sub">
											<i class="glyphicon glyphicon-search"></i>
										</div>
									</td>
									<td colspan="2"><input type="text" class="form-control inpu" name="details[0].descript"/></td>
									<td colspan="2"><input type="text" class="form-control inpu" name="details[0].invoices"/></td>
									<td colspan="2" class="tdrig"><input type="text" class="form-control inpu"	name="details[0].detailmoney"/></td>
									
								</tr>
								
							</tbody> 
						</table>
					</div>
					</td>
				</tr>
				<tr >

					<td colspan="14" style="text-align: right;" >
						<input   type="text" value="费用报销" name="val" hidden="hidden"/>
						<input class="btn btn-primary" id="save" type="submit" value="保存"  />
						<input class="btn btn-default" id="cancel" type="button" value="取消"
						onclick="window.history.back();" />
					</td>
					
				</tr>
				</table>
			</div>
			
			
			</form>
			
		</div>
	</div>
</div>
<input type="text" class="recive_list" style="display:none;">
<input type="text" class="ject" style="display:none;">
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
			 
				
				
				
				
				
	
	
	
	  <div class="modal fade " id="myModal2" tabindex="-1">

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
                      								<a class="btn btn-success glyphicon glyphicon-plus btn-sm"  href="javaScript:void(0)" onclick="addvalue2()"> 确定</a>
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
										<tbody id="tb2">
											
										</tbody>
										</table>
										</div>
									</div>
								</div>
 
							</div>
						</div>
					</div>
				</div>
 
<!-- /.modal -->
<script type="text/javascript" src="js/modalTip.js" ></script>

<!-- 这里是执行返回失败的参数，并显示详细的信息； -->
<script>
//表单提交前执行的onsubmit()方法；返回false时，执行相应的提示信息；返回true就提交表单到后台校验与执行
function check() {
	console.log("开始进入了");
	//提示框可能在提交之前是block状态，所以在这之前要设置成none
	$('.alert-danger').css('display', 'none');
	var isRight = 1;
	$('.form-control').each(function(index) {
		// 如果在这些input框中，判断是否能够为空
		if ($(this).val() == "") {
			if($(this).hasClass("cha")){
				return true;
			}
			// 排除哪些字段是可以为空的，在这里排除
			/* if (index == 5||index == 6) {
				return true;
			}  */
			
			// 获取到input框的兄弟的文本信息，并对应提醒；
			console.log(index);
			var errorMess = "红色提示框不能为空!";
			// 对齐设置错误信息提醒；红色边框
			$(this).parent().addClass("has-error has-feedback");
			$('.alert-danger').css('display', 'block');
			// 提示框的错误信息显示
			$('.error-mess').text(errorMess);
			
			isRight = 0;
			return false;
			
		} else {
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




	$(function(){
	 
 
	
	
	
		$('.reciver1').on('click',function(){
			//
			$.ajax({
	           		url:"userController/ajaxQueryPage.action",
	           		type:"post",
	           		accepts:"false",
	           		dataType:"json",
	           		success:function(data){
	           		
	           			//获取接收人选项框
	           			var userName=$("#namemoney").val();
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
												"<td class='col-xs-1' >"+
													"<span class='labels'><label id='ckd'>"+
													"<input name='id' type='hidden' value='"+data.rows[i].userId+"'>"+
													"<input  name='radio1'  value='"+data.rows[i].userName+"' type='radio'";
												 		for(var j=0;j<userArray.length;j++){
													 		if(userArray[j]==data.rows[i].userName){
													 			tr+="checked";
													 		}
												 		}
												tr+="></label></span></td>"+ /* <i>✓</i> */
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
			 
			$('.reciver').removeClass("qu");
			$(this).addClass("qu");
		});
		
		$('.reciver2').on('click',function(){
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
	        			 $("#tb2").empty();
	        			 $("#tb2").append(tr);
	        			 
	           		}
           		});
			 
			$('#myModal2').modal("toggle");
			$('.reciver2').removeClass("qu");
			$(this).addClass("qu");
		});
		$(".recive_list").change(function(){
			var	$val=$(this).val();
			$(".qu").siblings("input").val($val);
		
		});
		
		$(".tbody").on("click",".sub",function(){
			$('#subject').modal("toggle");
			$(this).siblings("input").val("");
			$('.sub').removeClass("je");
			$(this).addClass("je");
		});
		$(".ject").change(function(){
			var	$val=$(this).val();
			$(".je").siblings("input").val($val);
			console.log("jinlai");
		
		});
		var i=1;
		//增加一行
		$(".zeng").click(function(){
			var date=new Date();
			var nowDate=date.Format('yyyy-MM-dd hh:mm:ss');
			var star=addDate(nowDate,0);
			var td1 = $('<td class="chebox" colspan="2"></td>').append($('<span class="labels"></span>').append($('<label></label>').append($('<input type="checkbox" name="items"  class="val" >')).append($('<i></i>').text('✓'))));
			var td2 = $('<td  colspan="2"></td>').append($('<input type="text" class="form-control inpu incar" name="details['+i+'].produceDate"/>').val(star));
			var td3 = $('<td colspan="2"></td>').append($('<input type="text" class="form-control inpu" name="details['+i+'].subject" readonly="readonly" style="background-color:#fff;"/>'))
												 .append($('<div class="sub"></div>').append($('<i class="glyphicon glyphicon-search"></i>')));
			var td4 = $('<td colspan="2"></td>').append($('<input type="text" class="form-control inpu" name="details['+i+'].descript"/>'));
			var td5 = $('<td colspan="2"></td>').append($('<input type="text" class="form-control inpu" name="details['+i+'].invoices"/>'));
			var td6 = $('<td colspan="2" class="tdrig"></td>').append($('<input type="text" class="form-control inpu" name="details['+i+'].detailmoney"/>'));
			var tr = $('<tr class="tr"></tr>').append(td1).append(td2).append(td3).append(td4).append(td5).append(td6);
			$('.tbody').append(tr);
			i=i+1;
		});
		
		
	
		//把tr置空
		$(".jian").click(function(){
			
			 $("[name=items]:checkbox").each(function(){
				 if(this.checked){
	    			//获取被选中了的行
	    			var $tr=$(this).parents(".tr");
					$tr.html("");
	    					
	    			}
			 })
		});
		
		
		
	});
	
	
</script>
				 
<script>
 
function addvalue1(){
	
 	//先清空一下接受人框 
	$("#namemoney").val("");
	$("#bursementUserId").val("");
 
	
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
	
		  
	 
	
	//添加到接收人框并且关闭窗口	 
	$("#namemoney").val(userNames.join(','));
	$("#bursementUserId").val(userIds.join(','));
	
 	$(".namemoney").change();
	$(".fade").css("display","none");
	
}
/*追加到联系人*/
function addvalue2(){
	
	//先清空一下接受人框
	$("#recive_list").val("");
	$("#userId").val("");
	
	var userNames=new Array();
	var userIds=new Array();
	
	
	var  cc=$("#tb2 tr td input:checked");
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
				
				
				
				
 <style>
.modal-body li{
list-style-type:none;
}
.cur{
cursor: pointer;
}
/* .cur:hover{
color:blue;
} */
.panel {
    margin-bottom: 0px;
    background-color: #fff; 
     border: 0px solid transparent; 
     border-radius: 0px;
    -webkit-box-shadow: 0 0px 0px rgba(0,0,0,.05);
     box-shadow: 0 0px 0px rgba(0,0,0,.05);
}
</style>

<div class="modal fade" id="subject" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="modalclose close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">选择科目</h4>
			</div>
			
			<div class="modal-body panel-group" id="thisshow">
			
			<p class="cur subjec"><i><img src="images/Lminus.png" class="ones"/>
			
			</i><i><img src="images/subject.gif"/></i> 费用科目</p>
			<div class="one panel" >
						<p class="cur two" href="#one2" data-toggle="collapse" data-parent="#thisshow">
				<i><img class="qie" src="images/Tplus.png" /></i><i><img src="images/subject.gif"/></i>办公室费用
			</p>
				<ul id="one2" class="panel-collapse collapse">
					<li class="cur" style="margin-bottom: 5px;padding-left: 54px; margin-left: -40px;"><i><img src="images/fangzi.gif" /></i>差旅费</li>

				</ul>
			<p class="cur two" href="#one3" data-toggle="collapse" data-parent="#thisshow">
				<i><img class="qie" src="images/Tplus.png" /></i><i><img src="images/subject.gif"/></i>第三方采购费
			</p>
				<ul id="one3" class="panel-collapse collapse">
					<li class="cur" style="margin-bottom: 5px;padding-left: 54px; margin-left: -40px;"><i><img src="images/fangzi.gif" /></i>采购费</li>
					<li class="cur" style="margin-bottom: 5px;padding-left: 54px; margin-left: -40px;"><i><img src="images/fangzi.gif" /></i>外包费用</li>
					<li class="cur" style="margin-bottom: 5px;padding-left: 54px; margin-left: -40px;"><i><img src="images/fangzi.gif" /></i>外包服务费</li>

				</ul>
			<p class="cur two" href="#one4" data-toggle="collapse" data-parent="#thisshow">
				<i><img class="qie" src="images/Tplus.png" /></i><i><img src="images/subject.gif"/></i>管理费用
			</p>
				<ul id="one4" class="panel-collapse collapse">
					<li class="cur" style="margin-bottom: 5px;padding-left: 54px; margin-left: -40px;"><i><img src="images/fangzi.gif" /></i>房租</li>
					<li class="cur" style="margin-bottom: 5px;padding-left: 54px; margin-left: -40px;"><i><img src="images/fangzi.gif" /></i>工资</li>
					<li class="cur" style="margin-bottom: 5px;padding-left: 54px; margin-left: -40px;"><i><img src="images/fangzi.gif" /></i>公积金</li>
					<li class="cur" style="margin-bottom: 5px;padding-left: 54px; margin-left: -40px;"><i><img src="images/fangzi.gif" /></i>固定电话费</li>
					<li class="cur" style="margin-bottom: 5px;padding-left: 54px; margin-left: -40px;"><i><img src="images/fangzi.gif" /></i>社保金</li>
					<li class="cur" style="margin-bottom: 5px;padding-left: 54px; margin-left: -40px;"><i><img src="images/fangzi.gif" /></i>水费</li>
					<li class="cur" style="margin-bottom: 5px;padding-left: 54px; margin-left: -40px;"><i><img src="images/fangzi.gif" /></i>印刷费</li>
					<li class="cur" style="margin-bottom: 5px;padding-left: 54px; margin-left: -40px;"><i><img src="images/fangzi.gif" /></i>电费</li>

				</ul>
			<p class="cur two" href="#one5" data-toggle="collapse" data-parent="#thisshow">
				<i><img class="qie" src="images/Tplus.png" /></i><i><img src="images/subject.gif"/></i>投标保证金
			</p>
				<ul id="one5" class="panel-collapse collapse">
					<li class="cur" style="margin-bottom: 5px;padding-left: 54px; margin-left: -40px;"><i><img src="images/fangzi.gif" /></i>投标保证金</li>

				</ul>
			<p class="cur two" href="#one6" data-toggle="collapse" data-parent="#thisshow">
				<i><img class="qie" src="images/Tplus.png" /></i><i><img src="images/subject.gif"/></i>销售费用
			</p>
				<ul id="one6" class="panel-collapse collapse">
					<li class="cur" style="margin-bottom: 5px;padding-left: 54px; margin-left: -40px;"><i><img src="images/fangzi.gif" /></i>车辆油费</li>
					<li class="cur" style="margin-bottom: 5px;padding-left: 54px; margin-left: -40px;"><i><img src="images/fangzi.gif" /></i>市场推广费</li>
					<li class="cur" style="margin-bottom: 5px;padding-left: 54px; margin-left: -40px;"><i><img src="images/fangzi.gif" /></i>市内交通费</li>
					<li class="cur" style="margin-bottom: 5px;padding-left: 54px; margin-left: -40px;"><i><img src="images/fangzi.gif" /></i>招待费</li>

				</ul>
			<p class="cur two" href="#one7" data-toggle="collapse" data-parent="#thisshow">
				<i><img class="qie" src="images/Tplus.png" /></i><i><img src="images/subject.gif"/></i>预付款
			</p>
				<ul id="one7" class="panel-collapse collapse">
					<li class="cur" style="margin-bottom: 5px;padding-left: 54px; margin-left: -40px;"><i><img src="images/fangzi.gif" /></i>预付款</li>

				</ul>
			</div>
			</div>
			<div class="modal-footer">
			
				<button class="btn btn-primary save" id="save" type="button" >确定</button>
			</div>
		
		</div>
	</div>
</div>

<script>
	$(function(){
		

		$(".subjec").click(function(){
			if($(".ones").attr("src")=="images/Lminus.png"){
				
			$(".ones").prop("src","images/Tplus.png");
			}else{
				$(".ones").prop("src","images/Lminus.png");
				
			}
			$(".one").slideToggle(1000);
		});
		
		$(".two").click(function(){
			var $img=$(this).children("i:first").children()
			if($img.attr("src")=="images/Tplus.png"){
				
				$img.prop("src","images/Lminus.png");
			}else{
				
				$img.prop("src","images/Tplus.png");
				
			}
			
		});
		$(".cur").click(function(){
			var $text=$(this).text();
			$(".ject").val($text);
			$(".cur").css("background-color","#fff");
			console.log('sssssssssss');
			$(this).css("background-color","rgba(0, 188, 212, 0.06)");
			
		});
		$(".save").click(function(){
			$('#subject').modal("toggle");
			$(".ject").change();
		});
	})
</script><script type="text/javascript" src="js/common/data.js"></script>
<script type="text/javascript" src="plugins/My97DatePicker/WdatePicker.js"></script>
  </body>
</html>
