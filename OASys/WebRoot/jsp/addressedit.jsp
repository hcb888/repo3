<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/common/box.css">
<link rel="stylesheet" type="text/css" href="css/common/checkbox.css">
<style type="text/css">
a:hover {
	text-decoration: none;
}

.bgc-w {
	background-color: #fff;
}

.red {
	color: #d9534f;
	font-weight: 100;
	font-size: 1px;
}
.file{
	opacity: 0;
    width: 100px;
    height: 34px;
    margin-left: -13px;
    margin-top: -20px;
}
</style>

  </head>
  
  <body>
    <!--盒子头-->
<div class="box-header">
	<h3 class="box-title">
		<a href="javascript:void(0);" class="label label-default returnoutaddress" style="padding: 5px;"> <i class="glyphicon glyphicon-chevron-left"></i> <span>返回</span>
		</a>
	</h3>
</div>
<form action="savaaddress" method="post" id="addressform" enctype="multipart/form-data" onsubmit="return check();">
	<!--盒子身体-->
	<div class="box-body no-padding">
		<div class="box-body">
			<div class="alert alert-danger alert-dismissable" role="alert" style="display: none;">
				错误信息:
				<button class="close thisclose" type="button">×</button>
				<span class="error-mess"></span>
			</div>
			<div class="row">
				<div class="col-md-6 form-group">
					<label class="control-label"><span>分类</span></label> 
					<select class="form-control" name="catalogName">
						<option value="">外部通讯录</option>
						<option value="">外部通讯录</option>
						<option value="大学">大学</option>
						<option value="重要客户">重要客户</option>
					</select>
				</div>
				<div class="col-md-6 form-group">
					<label class="control-label"><span>性别</span></label> 
					<select class="form-control" name="sex">
							<option value="男">男</option>
						<option value="男">男</option>
						<option value="女">女</option>
					</select>
				</div>
				<div class="col-md-6 form-group">
					<label class="control-label"><span>姓名</span></label> 
					<input class="form-control" name="userName" value="宋佳">
				</div>
				<div class="col-md-6 form-group">
					<label class="control-label"><span>电话号码</span></label> <input class="form-control" value="18866554433" name="phoneNumber">
				</div>
				<div class="col-md-6 form-group">
					<label class="control-label"><span>邮箱</span></label> <input class="form-control" value="188@qq.com" name="email">
				</div>
				<div class="col-md-6 form-group">
					<label class="control-label"><span>住址</span></label> <input class="form-control" value="34栋" name="address">
				</div>
				<div class="col-md-6 form-group">
					<label class="control-label"><span>所属公司</span></label> <input class="form-control" value="宋氏集团" name="companyname">
				</div>
				<div class="col-md-6 form-group">
					<label class="control-label"><span>公司号码</span></label> <input class="form-control" value="888666" name="companyNumber">
				</div>
				
				<div class="col-md-6 form-group">
					<label class="control-label"><span>备注</span></label>
					<textarea class="form-control text" rows="5" cols="20" name="remark">宋氏集团总裁</textarea>
				</div>
				<div class="col-md-6 form-group">
					<label class="control-label" style="display: block;"><span>图片</span></label>
					<div class="btn btn-default ">
						<span class="glyphicon glyphicon-paperclip">增加附件</span> 
						<input type="file" name="file" class="file">
					</div>
					<p class="help-block" style="display:inline-block;">5MB以内</p>
				</div>
				
			</div>
		</div>
	</div>

	<!--盒子尾-->
	<div class="box-footer">
		<input class="btn btn-primary" id="save" type="submit" value="保存">
		<input class="btn btn-default returnoutaddress" id="cancel" type="button" value="取消">
	</div>
</form>

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
	<div class="modal-dialog" style="top: 1325px;">
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
<script type="text/javascript" src="js/modalTip.js"></script>


<!-- 这里是执行返回失败的参数，并显示详细的信息； -->
<script type="text/javascript">
	$('.successToUrl').on('click', function() {
		window.location.href = '/infrommanage';
	});
	//表单提交前执行的onsubmit()方法；返回false时，执行相应的提示信息；返回true就提交表单到后台校验与执行
	function check() {
		console.log("开始进入了");
		//提示框可能在提交之前是block状态，所以在这之前要设置成none
		$('.alert-danger').css('display', 'none');
		var isRight = 1;
		$('#addressform .form-control').each(function(index) {
			// 如果在这些input框中，判断是否能够为空
			if ($(this).val() == "") {
				// 排除哪些字段是可以为空的，在这里排除
				if (index == 2 || index == 3|| index == 4) {
				console.log(index);
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
				}
			} else {
				if(index==3){
					if(isPhoneNo($(this).val())==false){
						var errorMess="请输入正确的手机格式";
						$('.error-mess').text(errorMess);
						// 模态框的错误信息显示
						$('.modal-error-mess').text(errorMess);
						isRight = 0;
						return false;
					}
				}
				if(index==4){
					if(isMailNo($(this).val())==false){
						var errorMess="请输入正确的邮箱格式";
						$('.error-mess').text(errorMess);
						// 模态框的错误信息显示
						$('.modal-error-mess').text(errorMess);
						isRight = 0;
						return false;
					}
				}
				// 在这个里面进行其他的判断；不为空的错误信息提醒
				return true;
			}
		});
		if (isRight == 0) {
			modalShow(0);
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
	 
	// 验证手机号
	function isPhoneNo(phone) { 
	 var pattern = /^1[34578]\d{9}$/; 
	 return pattern.test(phone); 
	}
	//验证邮箱
	function isMailNo(mail){
		var pattern = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/; 
		return pattern.test(mail);
	}
</script>
  </body>
</html>
