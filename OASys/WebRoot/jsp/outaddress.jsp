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
    
    <title>My JSP 'outaddress.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <!-- 外部通讯录 -->
<!--盒子头-->
<div class="box-header">
	<h3 class="box-title">外部通讯录</h3>
	<a class="btn btn-sm btn-default thisrefresh" href="javascript:void(0);" title="刷新" style="padding: 5px;margin-top: -8px;"><span class="glyphicon glyphicon-refresh"></span></a>
	<div class="box-tools">
		<div class="input-group" style="width: 150px;">
			<input type="text" class="form-control input-sm baseKey" placeholder="用户名/电话号码" value="${vo.baseKey}">
			<div class="input-group-btn">
				<a class="btn btn-sm btn-default baseKeySumbit"> 
					<span class="glyphicon glyphicon-search"></span>
				</a>
			</div>
		</div>
	</div>
</div>
<!--盒子身体-->
<div class="box-body no-padding">
	<div class="table-responsive">
		<table class="table table-hover table-striped">
			<tr>
				<th scope="col">分类</th>
				<th scope="col">所属公司</th>
				<th scope="col">头像</th>
				<th scope="col">姓名</th>
				<th scope="col">性别</th>
				<th scope="col">Tel</th>
				<th scope="col">E-mail</th>
				<th scope="col">操作</th>
			</tr>
			<tbody id="pbody">
			<c:forEach items="${page.rows}" var="p">
					<tr>
						<td><span>${p.duType.typeName}</span></td>
						<td><span>${p.director.companyname}</span></td>
						<td><a href="#"> <img src="http://localhost:8080/upload/${p.director.image.attachmentPath}" class="img-circle" style="width: 25px; height: 25px;"></a></td>
						<td><span>${p.director.userName}</span></td>
						<td><span>
							<c:if test="${p.director.sex=='男'}">
							<img src="images/male.png" alt="男" style="width: 20px;height: 20px">
						</c:if>
						<c:if test="${p.director.sex=='女'}">
							<img src="images/female.png" alt="女" style="width: 20px;height: 20px">
						</c:if>
						</span></td>
						<td><span>${p.director.phoneNumber}</span></td>
						<td><span>${p.director.email}</span></td>
						<td style="width: 252px;">
							<a href="javascript:void(0);" class="label xinzeng thisshare" directorid="${p.director.directorId}"  >  
								<span class="glyphicon glyphicon-new-window"></span> 分享
							</a> 
							<a href="javascript:void(0);" director="${p.directorUsersId}" class="label xiugai outlookthis">
								<span class="glyphicon glyphicon-search"></span> 查看
							</a> 
							<a did="5" href="javascript:void(0);" onclick="del(${p.directorUsersId})" class="label shanchu  ">
								<span class="glyphicon glyphicon-remove"></span> 删除
							</a>
							<a title="移动" thisdid="${p.directorUsersId}" thisusername="${p.director.userName}" thisType="${p.duType.typeId}" thisimgpath="http://localhost:8080/upload/${p.director.image.attachmentPath}" thisphonenumber="${p.director.phoneNumber}" thissex="${p.director.sex}" thisemail="${p.director.email}" thiscompany="${p.director.companyname}" href="javascript:void(0);" class="label sheding thismove">
								<span class="glyphicon glyphicon-retweet"></span> 移动
							</a>
						</td>
					</tr>
			</c:forEach>
			 </tbody>
		</table>
	</div>
</div>

<!--盒子尾-->
<div class="box-footer no-padding" style="margin-top: -20px;">
	<div style="padding: 5px;">
		<div id="page" style="background: #fff; border: 0px; margin-top: 0px; padding: 2px; height: 25px;">
			<div style="width: 40%; float: left;">
				<div class="pageInfo" style="margin-left: 5px;">
					共<span id="ptotal">${page.total}</span>条 | 每页<span id="psize">${page.size}</span>条
					| 共<span id="ppage">${page.countPage}</span>页
				</div>
			</div>
			<div style="width: 60%; float: left;">
				<div class="pageOperation">
				<!--判断是否是第一页  -->
					<a class="btn btn-sm btn-default no-padding tablefirst"  style="width: 30px; height: 20px;"> <span class="glyphicon glyphicon-backward"></span></a> 
					<a class="btn btn-sm btn-default no-padding tableup"  style="width: 30px; height: 20px;"> <span class="glyphicon glyphicon-triangle-left"></span></a> 
				<a disabled="disabled" class="btn btn-default no-padding" style="width: 30px; height: 20px;" id="mypage">
						1
				</a>
				<!--判断是否是最后一页  -->
					<a class="btn btn-sm btn-default no-padding tabledown" style="width: 30px; height: 20px;"> <span class="glyphicon glyphicon-triangle-right"></span></a> 
					<a class="btn btn-sm btn-default no-padding tablelast" style="width: 30px; height: 20px;"> <span class="glyphicon glyphicon-forward"></span></a> 
				</div>
			</div>
		</div>
	</div>
</div>
 <script>
		/* 分页插件按钮的点击事件 */
		/* url是从后台接收过来的链接，sort是记录排序规则 */
		$('.tablefirst').on('click',function(){
			 queryPage(1);
		});
		$('.tableup').on('click',function(){
		 	  var page=parseInt($("#mypage").html())-1;
		 	  
		 	  if(page>0){
		 	  	 queryPage(page);
		 	  }
		});
		$('.tabledown').on('click',function(){
			 var page=parseInt($("#mypage").html())+1;
		 	 var countPage=parseInt($("#ppage").html());  
		 	  if(page<=countPage){
		 	  	 queryPage(page);
		 	  }
		});
		$('.tablelast').on('click',function(){
			var page=$("#ppage").html(); 
			 queryPage(page);
			 
		});
		
		
		function queryPage(page){
			var size=8;
			var alph=$('#thispills .active a').text().trim();
			var baseKey=$('.baseKey').val().trim();				//获取搜索关键字
			var typeId=$('#typeId').val();
			 
			if(alph=="ALL"){
				alph="";
			}
			$.ajax({
				url:"directorController/externalCommunicationQueryPageAjax.action",
				data:{page:page,size:size,alph:alph,baseKey:baseKey,tId:typeId},
				type:"post",
				dateType:"json",
				success:function(page){
				
					var tr="";
					for(var i=0;i<page.rows.length;i++){
						if(page.rows[i].director!=null){
							tr+="<tr>"+
								"<td><span>"+page.rows[i].duType.typeName+"</span></td>"+
								"<td><span>"+page.rows[i].director.companyname+"</span></td>"+
								"<td><a href='#'> <img src='http://localhost:8080/upload/"+page.rows[i].director.image.attachmentPath+"' class='img-circle' style='width: 25px; height: 25px;'></a></td>"+
								"<td><span>"+page.rows[i].director.userName+"</span></td>"+
								"<td><span>";
								if(page.rows[i].director.sex=="男"){
									tr+="<img src='images/male.png' alt='男' style='width: 20px;height: 20px'>";
								}
								if(page.rows[i].director.sex=="女"){
									tr+="<img src='images/female.png' alt='女' style='width: 20px;height: 20px'>";
								}
								tr+="</span>"+
								"</td>"+
								"<td><span>"+page.rows[i].director.phoneNumber+"</span></td>"+
								"<td><span>"+page.rows[i].director.email+"</span></td>"+
								"<td style='width: 252px;'>"+
									"<a href='javascript:void(0);' class='label xinzeng thisshare' directorid='"+page.rows[i].director.directorId+"'> "+
										"<span class='glyphicon glyphicon-new-window'></span> 分享"+
									"</a> "+
									"<a href='javascript:void(0);' director='5' class='label xiugai outlookthis'>"+
										"<span class='glyphicon glyphicon-search'></span> 查看"+
									"</a> "+
									"<a did='5' href='javascript:void(0);' class='label shanchu  ' onclick='del("+page.rows[i].directorUsersId+")'>"+
										"<span class='glyphicon glyphicon-remove'></span> 删除"+
									"</a>"+
									"<a title='移动' thisdid='"+page.rows[i].directorUsersId+"' thisusername='"+page.rows[i].director.userName+"' thisimgpath='http://localhost:8080/upload/"+page.rows[i].director.image.attachmentPath+"' thisphonenumber='"+page.rows[i].director.phoneNumber+"' thissex='"+page.rows[i].director.sex+"' thisemail='"+page.rows[i].director.email+"' thiscompany='"+page.rows[i].director.companyname+"' href='javascript:void(0);' class='label sheding thismove'>"+
										"<span class='glyphicon glyphicon-retweet'></span> 移动"+
									"</a>"+
								"</td>"+
							"</tr>";
						}
					}
					
					
				 
					
					//总条数
					$("#ptotal").html(page.total);
					//每页条数
					$("#psize").html(page.size);
					//总页数
					$("#ppage").html(page.countPage);
					//当前页数
					$("#mypage").html(page.page);
					//显示数据
					$("#pbody").html(tr);
				}
				
			});
		}
		/* 查找 */
		$('.baseKetsubmit').on('click', function() {
			var baseKey = $('.baseKey').val();
			console.log(baseKey);
			$('.thistable').load('inaddresspaging?baseKey='+baseKey+'');
		});
</script>
 
<!-- 接收人弹窗-->
 
 <div class="modal fade " id="shareModal" tabindex="-1" > 

					<!--第二步，窗口声明-->
					<div class="modal-dialog modal-lg" style="margin-top: 150px">
						<!--第三步、内容区的声明-->
						<div class="modal-content" style="background: #F8F8F8;"  >
							<div class="modal-1" style="margin: 20px;padding: 20px;background: #ECF0F5;">

								<div class="modal-2" style="background: white;border-top: 3px solid #D2D6DE;">

									<div class="modal-header" style="margin:10px;margin-top: -20px;">
										<button class="close" data-dismiss="modal" style="display: block;margin: -52px -78px 0 0;border-radius: 60%;">
											<span class="glyphicon glyphicon-remove-circle"style="color:white;font-size: 30px;" ></span>
										</button>
										<div class="row" style="margin-top: 15px">
											<div class="col-xs-12" style="height:30px;margin:10px 0px;">
													<h4 style="float: left;">
														<a class="btn btn-success glyphicon glyphicon-new-window btn-md thisshareuser" onclick="addvalue()" href="javascript:void(0);"> 分享联系人</a> 
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
									
									<div class="table-r" style="height:400px;overflow:scroll;">
										<table class="table  table-hover  container-fluid " >
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
<script>
		
</script>	</div>
</div>
 
			</div>
		</div>
	</div>
</div>
  </body>
</html>
