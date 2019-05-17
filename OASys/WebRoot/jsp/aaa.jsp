<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'aaa.jsp' starting page</title>
    
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

</style>

  </head>
  
  <body>
  <input type="button" name="aaa" value="aaaa"  class="reciver">
  
  <input type="button" name="bbb" value="bbb"  class="reciver2">
							
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
												<th class=" col-xs-2 b">a部门</th>
												<th class=" col-xs-2 b">a真实姓名 </th>
												<th class="col-xs-2 b">a用户名</th>
												<th class="col-xs-2 b">a职位</th>
												<th class=" col-xs-2">a电话</th>
											</tr>
										</thead>
										<tbody id="tb">
											
										</tbody>
										</table>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			 
 


 





				
	
	
	    <!-- 接收人弹窗
	    
 
	    -->
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
                      			<a class="btn btn-success glyphicon glyphicon-plus btn-sm"  href="javaScript:void(0)" onclick="addvalue()"> 确定</a>
                      			<!-- <a class="btn btn-success glyphicon glyphicon-plus btn-sm"  href="javaScript:void(0)" onclick="addvalue2()">追加接收人</a> -->
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
												<th class=" col-xs-2 b" style="color: #23527c;">b部门</th>
												<th class=" col-xs-2 b" style="color: #23527c;">b真实姓名 </th>
												<th class="col-xs-2 b" style="color: #23527c;">b用户名</th>
												<th class="col-xs-2 b" style="color: #23527c;">b职位</th>
												<th class=" col-xs-2" style="color: #23527c;">b电话</th>
											</tr>
										</thead>
										<tbody id="tb">
											
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


<script type="text/javascript">
	$(function(){
		$('.reciver').on('click',function(){			 
				$('#myModal').modal("toggle");
				$('.reciver').removeClass("qu");
				$(this).addClass("qu");
				 
		});
		
		$('.reciver2').on('click',function(){			 
				$('#myModal2').modal("toggle");
				$('.reciver2').removeClass("qu");
				$(this).addClass("qu");
				 
		});
	
	});	
</script>				


<td colspan="6"><input class="form-control inpu shen" readonly="readonly" style="background-color:#fff;" name="username" placeholder="璇烽€夎嚜宸辩殑涓婄骇" type="text">
					<div class="reciver">
						<span class="label label-success glyphicon glyphicon-plus" style="padding: 0.4em .6em .3em; line-height: 22px;">閫氳褰�</span>
					</div>
					</td>
					
  </body>
</html>
