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
    
    <title>My JSP 'holiday.jsp' starting page</title>
    
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
    overflow: auto;
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
.text {
	min-height: 100px;
}
.shuoming{
min-height: 120px;
}
.reciver1{
	position: relative;
    float: right;
    margin-top: -28px;
    right: 5px;
    cursor: pointer;
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
			<form action="holidayController/add.action" enctype="multipart/form-data" method="post" onsubmit="return check();" >
			<div class="box-header">
				<table class="bo table ">
			
				<tr >
					<td colspan="14" class="title"><h2>请假申请单</h2></td>
			
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
					<td class="title"><label class="control-label">请假说明</label></td>
					<td  colspan="13">
						<textarea class="form-control shuoming" readonly="readonly" style="background-color:#fff;">
员工因临时或突发情况无法到岗，未能提前请病假或事假的，则应用电话通知直接上级批准后，短信通知人事行政部，说明请假事由，并在上班后第一时间补办请假手续，如在2个工作日内未提交请假流程，超过2个工作日补流程无效，均视为旷工，扣除当日双倍工资。  
1、年假：工作满一年以上每年可享受带薪年假，当年的年假使用期至次年3月1日止；未经用人单位批准，员工不得自行休假。
2、事假：按照平均工作日扣发薪资（包含工资及各类补贴福利）；单次事假原则上不应超过3天，当年累计事假超过15天的视为主动放弃继续履行岗位职责的权利，特殊情况除外。  
3、病假：两天及以上病假必须持工作地二级甲等以上医院相关病假证明单或就医记录证明，否则无法享受病假工资；单次病假超过5天，应当持有工作所在地三级甲等医院提供的病假证明单。原则上当年累计病假超过15天应视为不具备继续履行岗位职责身体条件，特殊情况除外。  
5、产假及哺乳假：按国家及地方法律法规执行，包含休息日与法定节假日；  
6、陪产假：泛微正式男性员工在工作期间配偶生育的，可凭子女出生证明，享受十个自然日陪产假。  
7、丧假：直系亲属：配偶、子女、父母可享受三天，岳父母、祖父母、外祖父母可享受一天
						</textarea>
					</td>
				</tr>
				<tr >
					<td class="title"><label class="control-label">标题</label></td>
					<td  colspan="6"><input type="text" class="form-control inpu" name="proId.processName"/></td>
					
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
					<!-- <td class="title" ><label class="control-label">申请人</label></td>
					<td  colspan="6"><input type="text" class="form-control inpu"
					readonly="readonly" style="background-color:#fff;" value="罗密欧"/></td> -->
					<td class="title" ><label class="control-label">请假类型</label></td>
					<td colspan="6">
						<select class="form-control inpu" name="holidayType.typeId">
							 <c:forEach items="${holiday}" var="holiday">
							 	<option value="${holiday.typeId}">${holiday.typeName}</option>
							 </c:forEach>
						</select>
						</select>
					</td>
				</tr>
				
				<tr >
					<td class="title" ><label class="control-label">开始日期</label></td>
					<td  colspan="6"><input type="text" class="form-control inpu holistart"  name="startDate"/></td>
					<td class="title" ><label class="control-label">结束日期</label></td>
					<td  colspan="6"><input type="text" class="form-control inpu holiend" name="endDate"/></td>
				</tr>
					<tr >
					<td class="title" ><label class="control-label">请假天数</label></td>
					<td  colspan="6"><input type="text" class="form-control inpu days" name="leaveDays"
					readonly="readonly" style="background-color:#fff;"/></td>
					<td class="title" ><label class="control-label">审核人员</label></td>
					<td  colspan="6">
					<input type="hidden" name="reviewedUser.userId" id="userId">
					<input  type="text" id="recive_list" name="shenuser" value="${task.reciverlist}" placeholder="请选自己的上级" class="form-control " readonly="readonly" style="background-color:#fff;"/>
					<div class="reciver1">
						<span class="label label-success glyphicon glyphicon-plus">通讯录</span>
					</div>
					</td>
				</tr>
				
				<tr >
					<td class="title" ><label class="control-label">相关资料</label></td>
					<td  colspan="6">
						<div class="btn btn-default"style="position: relative; overflow: hidden;width: 100%;
    							margin-top: -6px;">
							<i class="glyphicon glyphicon-open"></i> 上传资料
							<input type="file" name="imgFile" style="opacity: 0; position: absolute;
								 top: 12px; right: 0; " class='inpu'>
						</div>
					</td>
					<td class="title" ><label class="control-label">请假原因</label></td>
					<td  colspan="6"><textarea class="form-control text"  name="processDes"></textarea></td>
				</tr>
				<tr >

					<td colspan="14" style="text-align: right;" >
					<input   type="text" class="day" name="proId.procseeDays" hidden="hidden"/>
					<input   type="text" value="请假申请" name="val" hidden="hidden"/>
						<input class="btn btn-primary" id="save" type="submit" value="保存" />
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
		
		$(".days").focus(function(){
			var $star=new Date($(".holistart").val());
			var $end=new Date($(".holiend").val());
			tt=$end.getTime()-$star.getTime();
			$(".days").val(Math.ceil(tt/ (24*60*60*1000)));
			$(".day").val(Math.ceil(tt/ (24*60*60*1000)));
		});
	})

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
 
function addvalue1(){
	//先清空一下接受人框
	$("#recive_list").val("");
	$("#userId").val("");
	
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
</script><script type="text/javascript" src="js/common/data.js"></script>
<script type="text/javascript" src="plugins/My97DatePicker/WdatePicker.js"></script>
  </body>
</html>
