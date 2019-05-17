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
    
    <title>My JSP 'addrmanage.jsp' starting page</title>
    
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
<link rel="stylesheet" type="text/css" href="css/common/iconfont.css" />
<link rel="stylesheet" type="text/css" href="css/common/checkbox.css" />
<link rel="stylesheet" type="text/css" href="css/common/tanchuang.css" />
<style type="text/css">
.icon {
	width: 1em;
	height: 1em;
	vertical-align: -0.15em;
	fill: currentColor;
	overflow: hidden;
}

a {
	color: black;
}

a:hover {
	text-decoration: none;
}

.bgc-w {
	background-color: #fff;
}

.box .nav-stacked>li {
	border-bottom: 1px solid #f4f4f4;
	margin: 0;
}

.nav-stacked>li>a {
	border-radius: 0;
	border-top: 0;
	border-left: 3px solid transparent;
	color: #444;
}

li.activee>a {
	border-left-color: #3c8dbc;
}

.des {
	border: none;
	color: #9e9e9e;
}
#thisul li a{
	padding:10px;
}
.thisbox-header:HOVER{
	background-color: #eee;
	color:#337ab7;
}
#thispills:HOVER{
	cursor: pointer;
}
#thispills li{
	border:1px solid #ccc;
	border-left: none;
}
#thispills li a:HOVER{
	background-color: #337ab7;
	color:#fff;
}
#thispills li a{
	padding:8px;
}
.ulfather .collapsed{
	cursor: pointer;
}
.nav>li>a {
	padding:15px;
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
    <!-- 外通讯分类，当前选择的分类id -->
    <input type="hidden" id="typeId">
	<!-- 点击查看的时候吧搜索的关键字保存下来 -->
	<input type="hidden" id="baseKey">
	
<div class="row" style="padding-top: 10px;">
	<div class="col-md-2">
		<h1 style="font-size: 24px; margin: 0;" class="">通讯录
		<a href="directorController/directorType.action" class="label xinzeng" style="padding: 5px;margin-left:5px;">
						<span class="glyphicon glyphicon-refresh"></span> 刷新
					</a>
		</h1>
	</div>
	<div class="col-md-10 text-right">
		<a href="javaScript:void(0)"><span class="glyphicon glyphicon-home"></span> 首页</a> > <a
			disabled="disabled">通讯录</a>
	</div>
</div>
<div class="row" style="padding-top: 15px;">
	<div class="col-md-3">
		<a class="btn btn-primary addaddress" href="javascript:void(0);"
			style="width: 100%; margin-bottom: 20px;"><span
			class="glyphicon glyphicon-edit"></span> 新建联系人</a>
		<div class="bgc-w box box-solid">
			<div class="box-header">
				<h3 class="box-title">通讯录</h3>
				<span class="btn btn-default pull-right btn-xs des mm"> <i
					class="glyphicon glyphicon-minus"></i>
				</span>
			</div>
			<ul class="nav nav-pills nav-stacked mm" id="navpills">
				<li class="activee notfather">
					<a href="javaScript:void(0)" id="Mynotfather"> <span	class="glyphicon glyphicon-user"> 内部通讯录</span>
					</a>
				</li>
				<li class="ulfather">
					<a href="javaScript:void(0)" id="Mythisul"><span class="glyphicon glyphicon-user"> 外部通讯录</span> 
						<i class="glyphicon pull-right glyphicon-menu-left collapsed" href="#thisul"  data-toggle="collapse" ></i>
					</a>
				</li>
				<ul id="thisul" class="nav nav-pills nav-stacked panel-collapse collapse">
					<c:forEach items="${directorType}" var="type">
						<li ><a href="javascript:void(0);"  name="${type.typeId}" style="padding-left: 60px;"><span class="glyphicon glyphicon-list-alt"> </span> ${type.typeName}
							<span class="pull-right" style="display: none;">
								<span class="glyphicon glyphicon-edit xiugai thisxiugai" style="margin-right:5px;padding: 3px;"></span>
								<span class="glyphicon glyphicon-remove shanchu thisshanchu" style="padding: 3px;"></span>
							</span>
						</a>
					</li>
					</c:forEach>
				</ul>
			</ul>
		</div>

		<div class="bgc-w box box-solid">
			<div class="box-header">
				<h3 class="box-title">分类</h3>
			</div>
			<div class="box-body">
				<div class="input-group">
					<input type="text" class="form-control addtypename" name="" value="" placeholder="新增外部分类" />
					<div class="input-group-btn">
						<input type="submit" class="btn btn-primary addtype" name="" id="" style="padding:6px;" value="新增" />
					</div>
				</div>
			</div>
		</div>

		<div class="bgc-w box box-solid">
			<div class="box-header">
				<h3 class="box-title">共享消息</h3>
				<span class="btn btn-default pull-right btn-xs des mm"> <i
					class="glyphicon glyphicon-minus"></i>
				</span>
			</div>
			<ul class="nav nav-pills nav-stacked mm">
				<li class="activee">
					<a href="javascript:void(0);" class="meshareother"> <span class="glyphicon glyphicon-new-window"> 我共享的</span>
					</a>
				</li>
				<li>
					<a href="javascript:void(0);" class="sharewithme">
					<span class="glyphicon glyphicon-log-in"> 共享与我</span> 
					</a>
				</li>
			</ul>
		</div>
	</div>
	<div class="col-md-9">
		<!--id="container"-->
		<ul class="nav nav-pills nav-justified" id="thispills" style="margin-bottom: 14px;">
		  <li role="presentation" class="active" style="border-left:1px solid #ccc;border-radius: 5px 0px 0px 5px;"><a href="javascript:void(0);">ALL</a></li>
		  <li role="presentation"><a href="javascript:void(0);">A</a></li>
		  <li role="presentation"><a href="javascript:void(0);">B</a></li>
		  <li role="presentation"><a href="javascript:void(0);">C</a></li>
		  <li role="presentation"><a href="javascript:void(0);">D</a></li>
		  <li role="presentation"><a href="javascript:void(0);">E</a></li>
		  <li role="presentation"><a href="javascript:void(0);">F</a></li>
		  <li role="presentation"><a href="javascript:void(0);">G</a></li>
		  <li role="presentation"><a href="javascript:void(0);">H</a></li>
		  <li role="presentation"><a href="javascript:void(0);">I</a></li>
		  <li role="presentation"><a href="javascript:void(0);">J</a></li>
		  <li role="presentation"><a href="javascript:void(0);">K</a></li>
		  <li role="presentation"><a href="javascript:void(0);">L</a></li>
		  <li role="presentation"><a href="javascript:void(0);">M</a></li>
		  <li role="presentation"><a href="javascript:void(0);">N</a></li>
		  <li role="presentation"><a href="javascript:void(0);">O</a></li>
		  <li role="presentation"><a href="javascript:void(0);">P</a></li>
		  <li role="presentation"><a href="javascript:void(0);">Q</a></li>
		  <li role="presentation"><a href="javascript:void(0);">R</a></li>
		  <li role="presentation"><a href="javascript:void(0);">S</a></li>
		  <li role="presentation"><a href="javascript:void(0);">T</a></li>
		  <li role="presentation"><a href="javascript:void(0);">U</a></li>
		  <li role="presentation"><a href="javascript:void(0);">V</a></li>
		  <li role="presentation"><a href="javascript:void(0);">W</a></li>
		  <li role="presentation"><a href="javascript:void(0);">X</a></li>
		  <li role="presentation"><a href="javascript:void(0);">Y</a></li>
		  <li role="presentation" style="border-radius: 0px 5px 5px 0px;"><a href="javascript:void(0);">Z</a></li>
		</ul>
		<div class="bgc-w box box-primary thistable">
		
		</div>
		<input type="hidden" class="sharehidden"/>
		<input type="hidden" id="userName">
	 
	</div>
</div>
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
<!-- 模态框（Modal） -->
<div class="modal fade" id="typenameModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog" style="margin-top: 10%";>
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					<span class="glyphicon glyphicon-remove-circle" style="font-size: 26px;"></span>
				</button>
				<h4 class="modal-title" id="myModalLabel">
					修改分类名称：
				</h4>
			</div>
			<div class="modal-body" >
				<input class="form-control" name="" value="">
				<!-- <textarea rows="8" cols="78" id="comment"></textarea> -->
			</div>
			<input type="hidden" id="commentid"/>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" id="commentsave" data-dismiss="modal">提交	</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="changetypenameModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog" style="margin-top: 10%";>
	<div class="modal-content" style="min-width: 760px;">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
				<span class="glyphicon glyphicon-remove-circle" style="font-size: 26px;"></span>
			</button>
			<h4 class="modal-title" id="myModalLabel">
				移动分类：
			</h4>
		</div>
		<div class="modal-body" >
			<p style="display: inline-block;">将联系人
				<a href="javascript:void(0);" id="thischangetype"
						class="othershow"
						thisdid=""
						title="信息" 
						thistel="" 
						thissex="" 
						thisemail=""
						thiscompany=""  style="color:#337ab7;line-height: 40px;">
					<img class="img-circle" id="thischangetypeimg" src="images/touxiang/timg.jpg" alt="联系人" style="width: 24px;height:24px;"/>
					<span id="thischangetypename"></span>,<span id="thischangetypetel"></span>
				</a>移动到:
			</p>
			<div class="col-md-6 form-group" style="float:right;">
				<select class="form-control" name="catalogName" id="thisselectvalue">
				</select>
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			<button type="button" class="btn btn-primary"  data-dismiss="modal" id="thischangetypesubmit">提交	</button>
		</div>
	</div><!-- /.modal-content -->
</div><!-- /.modal -->
</div>
<script type="text/javascript" src="js/usershow.js"></script><script src="js/common/iconfont.js"></script>
<script type="text/javascript">
		$(function() {
			/* 移动分类的保存事件 */
			$('#thischangetypesubmit').on('click',function(){
			     var did=$("#thischangetype").attr('thisdid');
				var typeId=$('#thisselectvalue').val();
				 
				$.ajax({
					url:'directorController/updateDirectorUser.action',
					type:'post',
					async:false,
					cache:false,
					data:{'directorUsersId':did,'duType.typeId':typeId},
					datatype:'text',
					success:function(run){
						if(run=="loser"){
							$('.modal-error-mess').text("修改失败");
							modalShow(0);
						}
						if(run=="success"){
							location.href="directorController/directorType.action";
						}    		
					}
				})
				
				 alert("移动分类的保存事件");
			})
			
			/* 点击移动的事件 */
			$('.thistable').on('click','.thismove',function(){
		 		var typeId=$(this).attr("thisType");
				//查询类型
				   $.ajax({
					  	type:"post",	
					  	url:"directorController/directorTypeAjax.action",
					  	async:false,
					   	dataType:"json",  
					  	success:function(data){
					  		 
							 var option="";
							 for(var i=0;i<data.length;i++){
							 	if(typeId==data[i].typeId){
							 		option+="<option value='"+data[i].typeId+"' selected>"+data[i].typeName+"</option>";
							 	}
							 	if(typeId!=data[i].typeId){
							 		option+="<option value='"+data[i].typeId+"'  >"+data[i].typeName+"</option>";
							 	}
							 }
							 
							 $("#thisselectvalue").html(option);
						},error:function(aa){
							console.log(aa);
						}
				});  		
						
				
				
				//设置id
				$("#thischangetype").attr('thisdid',$(this).attr("thisdid"));				
				//设置名字
				$("#thischangetype").attr('title',$(this).attr("thisuserName"));
				console.log($("#thischangetype").attr('title'));
				$("#thischangetypename").text($(this).attr("thisuserName"));
				//设置电话号码
				$("#thischangetype").attr('thistel',$(this).attr("thisphoneNumber"));
				$("#thischangetypetel").text($(this).attr("thisphoneNumber"));
				//设置头像
				$("#thischangetypeimg").attr("src",$(this).attr("thisimgpath"));
				//设置性别
				$("#thischangetype").attr('thissex',$(this).attr("thissex"));
				//设置email
				$("#thischangetype").attr('thisemail',$(this).attr("thisemail"));
				//设置公司
				$("#thischangetype").attr('thiscompany',$(this).attr("thiscompany"));
				
				$('#changetypenameModal').modal("toggle");
			})
			
			/* 外部通讯录分点击返回事件 */
			$('.thistable').on('click','.returnoutaddress',function(){
				var alph=$('#thispills .active a').text().trim();	//获取字母表中的值
				if(alph=='ALL'){
					alph='';
				}
				var typeId=$("#typeId").val();
			   var baseKey=$('#baseKey').val().trim();				//获取搜索关键字
				 
				  var typeId=$("#typeId").val();
				$('.thistable').load('directorController/externalCommunicationQueryPage.action?size=8&alph='+alph+"&baseKey="+baseKey+'&tId='+typeId);
			})
			/*内部通讯录返回点击事件  */
			$('.thistable').on('click','.returninaddress',function(){
				var alph=$('#thispills .active a').text().trim();	//获取字母表中的值
				if(alph=='ALL'){
					alph='';
				}
				var baseKey=$('#baseKey').val().trim();				//获取搜索关键字
				//$('.thistable').load('inaddresspaging',{alph:alph});
				$('.thistable').load('directorController/internalCommunicationQueryPage.action?size=8&alph='+alph+"&baseKey="+baseKey);
			})
		 
			/* 查看外部联系人详情 */
			$('.thistable').on('click','.outlookthis',function(){
				var director=$(this).attr('director');
				//$('.thistable').load('outmessshow',{director:director});
				//保存查询的关键字
 				$("#baseKey").val($('.baseKey').val().trim());
				$('.thistable').load('directorController/externalCommunicationFindById.action?id='+director);
			})
			/* 查看内部联系人详情 */
			$('.thistable').on('click','.inlookthis',function(){
				var userId=$(this).attr('userId');
					//保存查询的关键字
 				$("#baseKey").val($('.baseKey').val().trim());
				$('.thistable').load('directorController/internalCommunicationFindById.action?id='+userId);
			})
			/* 我的分享的消息记录 */
			$('.meshareother').on('click',function(){
				console.log("我的分享点击了么？");
				$('.thistable').load('directorController/mySharedContactsQueryPage.action?size=6');
			})
			/* 分享信息按钮的点击事件 */
			$('.sharewithme').on('click',function(){
			 
				$('.thistable').load('directorController/sharedWithMeContactsQueryPage.action?size=6');
			})
			/*模态框关闭的按钮和确定按钮；都要将模态框里面的内容替换成分享时的内容*/
			$('.thistable').on('click','#shareModal .closemodal',function(){
			 	 
				$("#shareModal .modal-1").load("modalshare");
			})
			
			/* 条件查看我共享 */
			$('.thistable').on('click','.searchbaseKeySumbit',function(){
				   var baseKey=$('.searchbaseKey').val().trim();				//获取搜索关键字
				   $('.thistable').load('directorController/mySharedContactsQueryPage.action?size=6&baseKey='+baseKey);  
			})
			
			/* 条件查看共享给我的 */
			$('.thistable').on('click','.sharedWithMeContactsKeySumbit',function(){
					  var baseKey=$('.sharedWithMeContactsKey').val().trim();				//获取搜索关键字
				   $('.thistable').load('directorController/sharedWithMeContactsQueryPage.action?size=6&baseKey='+baseKey);  
				
			})
			//刷新共享给我的 
				$('.thistable').on('click','.sharedWithMeContactsRefresh',function(){
					  var baseKey=$('.sharedWithMeContactsKey').val().trim();				//获取搜索关键字
				   $('.thistable').load('directorController/sharedWithMeContactsQueryPage.action?size=6&baseKey='+baseKey);  
				
			})
			
			
			/* 模态框中的点击 */
			$('.thistable').on('click','.thisshareuser',function(){
			 
				console.log("分享点击了么？");
				var sharedirector=$('.sharehidden').val();
				console.log("分享的通讯录:"+sharedirector);
				var length=$('#shareModal .table-r tbody input[type="checkbox"]:checked').length;
				if(length<1){
					console.log("长度小于1");
					$('#shareModal .alert-dismissable').css("display","block");
					$('.error-mess').text("没有选择要分享的人");
					return false;
				}
				var directors=new Array();
				$('#shareModal .table-r tbody input[type="checkbox"]:checked').each(function(index){
					console.log("下标："+index);
					console.log("用户："+$(this).attr("userId"));
					directors[index]=$(this).attr("userId");
				})
				console.log(directors);
				/*传值给后台：1、要分享的通讯录id；2、要接收的userid的数组；  */
				$("#shareModal .modal-1").load("shareother",{'directors[]':directors,sharedirector:sharedirector});
			})
			
			$('.thistable').on('click','.thisclose', function() {
				$(this).parent().css('display', 'none');
			});
			/*打开分享模态窗。。。*/
			$('.thistable').on('click','.thisshare',function(){
			    
			   $.ajax({
	           		url:"userController/ajaxQueryPage.action",
	           		type:"post",
	           		accepts:"false",
	           		dataType:"json",
	           		success:function(data){
	        			//获取接收人选项框
	           			var userName=$("#userName").val();
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
	        			 
	        			 $("#tb").html(tr);
	           		}
           		});
			    
			    
				var sharedirector=$(this).attr("directorId");
				 
				
				console.log("分享的通讯录:"+sharedirector);
				$('.sharehidden').val(sharedirector);
				 
				$('#shareModal').modal("toggle");
				$("#shareModal .modal-1").load("modalshare");
				
			 
			})
			
			/* 用户删除某个联系人 */
			$('.thistable').on('click','.thisdelete',function(){
				var did=$(this).attr('did');
				console.log(did);
				if(confirm("确定删除吗？")){
					$('.thistable').load('deletedirector',{did:did},function(){
						modalShow(1);
					});
				}
			})
			
			/* 新建外部联系人分类 */
			$('.addtype').on('click',function(){
			  var typename=$('.addtypename').val().trim();
	 
				 if(typename!=null && typename.trim()!=''){
				 	 $.ajax({
					  	type:"post",	
					  	url:"directorController/directorTypeAdd.action",
					  	async:false,
					  	data:{"tName":typename},
					  	dataType:"text",
					  	success:function(run){
							if("loser1"==run){
								$('.modal-error-mess').text("该分类名字已经存在,请重新命名!");
								modalShow(0); 
							}	
							if(run=="loser2"){
								$('.modal-error-mess').text("添加失败");
								modalShow(0);
							}
							if(run=="success"){
								modalShow(1);
								$('.addtypename').val("");   
							}    		
						},error:function(data){
								$('.modal-error-mess').text("添加失败");
								modalShow(0);
						}
					  });
				 }else{
				 	$('.modal-error-mess').text("添加类名不能为空 ");
					modalShow(0);
				 }
			   
			})
			
			/* 新建联系人 */
			$('.addaddress').on('click',function(){
				//$('.thistable').load('addaddress');
				$('.thistable').load('directorController/addDirectorUserEssentialInformation.action');
			})
			/* 修改外部联系人 */
			$('.thistable').on('click','.thischange',function(){
				var did=$(this).attr('did');
				console.log(did);
				//$('.thistable').load('addaddress',{did:did});
				$('.thistable').load('jsp/addressedit.jsp');
			})
			/* 刷新按钮 */
			$('.thistable').on('click','.thisrefresh',function(){
				var alph=$('#thispills .active a').text().trim();	//获取字母表中的值
				if(alph=='ALL'){
					alph='';
				}
				var baseKey=$('.baseKey').val().trim();				//获取搜索关键字
				var type=$('#navpills .activee').text().trim();		//获取内部或外部的类型值
				var outtype=$('#thisul .activee').text().trim();	//获取外部通讯录的分类名称
				var typeId=$("#typeId").val();
				if(type=="内部通讯录"){
					if(alph=='ALL'){
						alph="";
					}
					//$('.thistable').load('inaddresspaging',{alph:alph});
					$('.thistable').load('directorController/internalCommunicationQueryPage.action?size=8&alph='+alph+"&baseKey="+baseKey);
				}else{
					/* 就是进入外部通讯录了， */
					//$('.thistable').load('outaddresspaging',{alph:alph,outtype:outtype});
					if(alph=='ALL'){
						alph="";
					}
					 $('.thistable').load('directorController/externalCommunicationQueryPage.action?size=8&alph='+alph+'&baseKey='+baseKey+'&tId='+typeId);
				}
			})
			
			/* 查找关键字事件， */
			$('.thistable').on('click','.baseKeySumbit',function(){
				var alph=$('#thispills .active a').text().trim();	//获取字母表中的值
				var baseKey=$('.baseKey').val().trim();				//获取搜索关键字
				var type=$('#navpills .activee').text().trim();		//获取内部或外部的类型值
				var outtype=$('#thisul .activee').text().trim();	//获取外部通讯录的分类名称
				var typeId=$("#typeId").val();
				if(type=="内部通讯录"){
					//$('.thistable').load('inaddresspaging',{alph:alph,baseKey:baseKey});
					 if(alph=='ALL'){
						alph="";
					 }
					 $('.thistable').load('directorController/internalCommunicationQueryPage.action?size=8&alph='+alph+"&baseKey="+baseKey);
				}else{
					/* 就是进入外部通讯录了， */
				 
					//$('.thistable').load('outaddresspaging',{alph:alph,outtype:outtype,baseKey:baseKey});
					 if(alph=='ALL'){
						alph="";
					 }
					 $('.thistable').load('directorController/externalCommunicationQueryPage.action?size=8&alph='+alph+'&baseKey='+baseKey+'&tId='+typeId);
				}
			})
			
			/*字母表的字母点击事件  */
			$('#thispills a').on('click',function(){
				/* 这里获取到的是上一次active的那一个， */
				console.log("外部通讯录值："+$('#thisul .activee').text().trim());
				console.log("关键字："+$('.baseKey').val());
				var alph=$(this).text().trim();
				var type=$('#navpills .activee').text().trim();
				var baseKey=$('.baseKey').val().trim();
				var outtype=$('#thisul .activee').text().trim();
				var typeId=$("#typeId").val();
				if(type=="内部通讯录"){
					console.log("是内部通讯录");
					//$('.thistable').load('inaddresspaging',{alph:alph,baseKey:baseKey});
					if(alph=='ALL'){
						alph="";
					}
				 
				  
					$('.thistable').load('directorController/internalCommunicationQueryPage.action?size=8&alph='+alph+"&baseKey="+baseKey);
				}else{
					/*还要进行判断，是否为空；不为空说明是在外部的分类里面进行；为空说明查找所有的外部通讯录  */
					console.log("是外部通讯录");
				  $('.thistable').load('outaddresspaging',{alph:alph,outtype:outtype,baseKey:baseKey});
				 	 if(alph=='ALL'){
						alph="";
					}
					  $('.thistable').load('directorController/externalCommunicationQueryPage.action?size=8&alph='+alph+'&baseKey='+baseKey+'&tId='+typeId);

				}
			})
			
			/* 外部通讯录的点击事件，只需要知道字母表的值就ok了*/
			$('.ulfather').on('click',function(){
				$("#typeId").val("");
				 
				var alph=$('#thispills .active a').text().trim();
				//$('.thistable').load('outaddresspaging',{alph:alph});	
				if(alph=='ALL'){
					alph="";
				}
			 
				 
				$('.thistable').load('directorController/externalCommunicationQueryPage.action?size=8&alph='+alph);
			})
			/* 内部通讯录的点击事件，只需要知道字母表的值就ok了 */
			$('.notfather').on('click',function(){
				var alph=$('#thispills .active a').text().trim();
				//$('.thistable').load('inaddresspaging',{alph:alph});	
				//加载inaddress.jsp	
				if(alph=='ALL'){
					alph="";
				}
				 
				  
				$('.thistable').load('directorController/internalCommunicationQueryPage.action?size=8&alph='+alph);
			})
			
			 
			
			$(".notfather").click();
			/* 外部的分类点击事件 */
			$('#thisul').on('click','li a',function(){
		 		
				var alph=$('#thispills .active a').text().trim();
				var outtype=$(this).text().trim();
				var typeId=this.name;
				var baseKey=$('.baseKey').val().trim();
				$("#typeId").val(typeId);
				 if(alph=='ALL'){
					alph="";
				 }
				
				 $('.thistable').load('directorController/externalCommunicationQueryPage.action?size=8&alph='+alph+'&baseKey='+baseKey+'&tId='+typeId);
			})
			/* 外部通讯录分类的编辑与删除 */
			$('#thisul').on('click','.thisxiugai',function(){
				var typename=$(this).parent().parent('a').text().trim();
				$('#typenameModal').modal("toggle");
				$('#typenameModal .form-control').val(typename);
				$('#typenameModal #commentid').val(typename);
			})
			/* 分类名称的删除 */
			$('#thisul').on('click','.thisshanchu',function(){
				if(confirm("确定删除该分类吗？该分类将被移到外部通讯录哟")){
					var typename=$(this).parent().parent('a').text().trim();
					$('#thisul').load('addtypename',{typename:'',oldtypename:typename});
					$('.thistable').load('deletetypename',{typename:typename});
				}
				
				
			})
			/* 修改分类的保存按钮 */
			$('#commentsave').on('click',function(){
				var typename=$('#typenameModal .form-control').val();
				var oldtypename=$('#typenameModal #commentid').val();
				console.log("typename:"+typename);
				console.log("oldtypename:"+oldtypename);
				$('.thistable').load('changetypename',{typename:typename,oldtypename:oldtypename});
				$('#thisul').load("addtypename",{typename:typename,oldtypename:oldtypename});
			})
			
			/* 外部的分类的鼠标移入事件，显示修改和删除的图标 */
			$('#thisul').on('mouseover','li a',function(){
				$(this).children('.pull-right').css("display","block");
			})
			$('#thisul').on('mouseout','li a',function(){
				$(this).children('.pull-right').css("display","none");
			})
			
			/* 外部通讯录的点击事件，去掉内部通讯录的active，给外部通讯录加active */
			$('#thisul li').on('click',function(){
				
				$('#navpills li').removeClass('activee');
				$('.ulfather').addClass('activee');
			})
			$('.ulfather .collapsed').on('click',function(){
				if($(this).hasClass('glyphicon-menu-down')){
					$(this).removeClass('glyphicon-menu-down').addClass('glyphicon glyphicon-menu-left');
				}else{
					$(this).removeClass('glyphicon-menu-left').addClass('glyphicon glyphicon-menu-down');
				}
			})
			
			/* 内部通讯录的点击事件，去掉外部通讯录的active并同时去掉外部通讯录分类的active */
			$('.notfather').on('click',function(){
				$('#thisul li').removeClass('activee');
			})
			
			$('.ulfather').on('click',function(){
				$('#thisul li').removeClass('activee');
			})
			
			/* 字母表的点击事件，将用来处理load方法  */
			$("#thispills li").on('click',function(){
				$("#thispills li").removeClass('active');
				$(this).addClass('active');
			})
			/*
			 * 收縮
			 */
			$(".des").click(function() {
					
				var $this = $(this).children();

				var $ul = $(this).parents(".box-header").next();

				if($(this).hasClass("mm")) {
					if($this.hasClass("glyphicon-minus")) {
						$this.removeClass("glyphicon-minus").addClass("glyphicon-plus");
					} else {

						$this.removeClass("glyphicon-plus").addClass("glyphicon-minus");
					}
					$ul.slideToggle(1000);
				} else {
					if($this.hasClass("glyphicon-minus")) {
						$this.removeClass("glyphicon-minus").addClass("glyphicon-plus");
					} else {

						$this.removeClass("glyphicon-plus").addClass("glyphicon-minus");
					}
					$ul.slideToggle(1000);
				}
			});

			$(".nav.mm").on("click", "li", function() {
			 
				$(this).parent().children(".activee").removeClass("activee");
				$(this).addClass("activee");
			});
			
			$("[name=items]:checkbox").click(function(){
           		var flag=true;
           		
           		$("[name=items]:checkbox").each(function(){
           			if(!this.checked){
           				flag=false;
           			}
           		});
           		if(flag){
           			    $(".chec span").removeClass("glyphicon-unchecked").addClass("glyphicon-stop");
           		}else{
           			$(".chec span").removeClass("glyphicon-stop").addClass("glyphicon-unchecked");
           		}
           		if ($(this).prop('checked')) {
           			 $(this).attr("checked","checked");
           		} else {
           			$(this).removeAttr("checked");
           		}
           
           	});
           	
           	$(".chec").click(function(e){
           	 
           		e.preventDefault();
           		var $this=$(".chec span");
           		if($this.hasClass("glyphicon-unchecked")){
           			 $(".chec span").removeClass("glyphicon-unchecked").addClass("glyphicon-stop");
           		}else{
           			$(".chec span").removeClass("glyphicon-stop").addClass("glyphicon-unchecked");
           		}
           		$("[name=items]:checkbox").each(function(){
           			
           			if($this.hasClass("glyphicon-stop")){
           				/*$(this).prop("checked","checked");*/
           				$(this).prop("checked",!$(this).attr("checked"));
           			}else{
           				$(this).removeAttr("checked");
           			}
           		});
           	});
		});
		
		
 function addvalue(){
	
 	/* //先清空一下接受人框
	$("#recive_list").val("");
	$("#userId").val(""); */
	
	var userNames=new Array();
	var userIds=new Array();
 
	var directorId=$(".sharehidden").val();
 
	
	var  cc=$("#tb tr td input:checked");
	for(var i=0;i<cc.length;i++){
		userNames.push(cc[i].value);
	}
	
	
	for(var i=0;i<cc.length;i++){
		var td=cc[i].parentNode.childNodes;
		userIds.push(td[0].value);
	} 
	
	console.log(userNames)
	 
	console.log(userIds)	
	
	$("#userName").val(userNames.join(','));
 
	 
	 
	
  
   $(".fade").css("display","none");
	
	 $.ajax({
		type:"post",	
		url:"directorController/shareContactsAjax.action",
		data:{idArray:userIds.join(','),directorId:directorId},
		async:false,
		dataType:"text",  
		success:function(run){
			if(run=="loser"){
				$('.modal-error-mess').text("分享联系人失败");
				modalShow(0);
			}
			if(run=="success"){
				//清空分享人
				$("#userName").val(userNames.join(','));
			}
			
		},error:function(aa){
				$('.modal-error-mess').text("分享联系人失败");
				modalShow(0);
		}
	});  		 
	 
}

//删除外部联系人
	function del(duId){
			
			if(confirm("你确定要删除该联系人吗")){
				 $.ajax({
					type:"post",	
					url:"directorController/directorUsersDeleteAjax.action",
					data:{directorUsersId:duId},
					async:false,
					dataType:"text",  
					success:function(run){
						if(run=="loser"){
							$('.modal-error-mess').text("删除联系人失败");
							modalShow(0);
						}
						if(run=="success"){
							 var alph=$('#thispills .active a').text().trim();	//获取字母表中的值
							if(alph=='ALL'){
								alph='';
							}
							var typeId=$("#typeId").val();
						   var baseKey=$('#baseKey').val().trim();				//获取搜索关键字
							 
							  var typeId=$("#typeId").val();
							$('.thistable').load('directorController/externalCommunicationQueryPage.action?size=8&alph='+alph+"&baseKey="+baseKey+'&tId='+typeId); 
						}
						
					},error:function(aa){
							$('.modal-error-mess').text("删除联系人失败");
							modalShow(0);
					}
				});  		 
			}
		}
		
	//添加联系人
	function saveDu(){
	  var formData = new FormData($( "#addressform" )[0]);  
		 $.ajax({
				type:"post",	
				url:"directorController/externalCommunicationAddAjax.action",
				async:false,
				data:formData,
				processData: false,
				contentType: false,
				dataType:"text",
				success:function(run){
				 
				 		if(run=="loser"){
							$('.modal-error-mess').text("添加失败");
							modalShow(0);
						}
						if(run=="success"){
							 var alph=$('#thispills .active a').text().trim();	//获取字母表中的值
							if(alph=='ALL'){
								alph='';
							}
							var typeId=$("#typeId").val();
						   var baseKey=$('#baseKey').val().trim();				//获取搜索关键字
							 
							  var typeId=$("#typeId").val();
							$('.thistable').load('directorController/externalCommunicationQueryPage.action?size=8&alph='+alph+"&baseKey="+baseKey+'&tId='+typeId); 
						}    		
					},error:function(data){
								$('.modal-error-mess').text("添加失败");
								modalShow(0);
					}
			});
	}
	</script>
  </body>
</html>
