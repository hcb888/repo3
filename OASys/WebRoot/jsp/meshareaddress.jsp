<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'meshareaddress.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 <link rel="stylesheet" type="text/css" href="css/sharemess.css">
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
  </head>
  
  <body>
   
<div class="box-header">
	<h3 class="box-title">我共享的</h3>
	<a class="btn btn-sm btn-default  " href="javascript:void(0);" id="gxsx" title="刷新" style="padding: 5px;margin-top: -8px;">
		<span class="glyphicon glyphicon-refresh"></span>
	</a>
	<div class="box-tools">
		<div class="input-group" style="width: 150px;">
			<input type="text" class="form-control input-sm searchbaseKey" placeholder="联系人电话/联系人姓名" value="${vo.baseKey}">
			<div class="input-group-btn">
				<a class="btn btn-sm btn-default searchbaseKeySumbit"> 
					<span class="glyphicon glyphicon-search"></span>
				</a>
			</div>
		</div>
	</div>
</div>
<div style="margin-bottom:20px;" id="pbody">
	<c:forEach items="${page.rows}" var="fx">
		<div class="sharemess">
			<div class="sharecontent">
				<div>
					<div class="sharecontent-left" style="height: 30px;">
						你将联系人:
						<a href="javascript:void(0);" class="othershow" title="" thistel="${fx.director.phoneNumber}" thissex="${fx.director.sex}" thisemail="${fx.director.email}" thiscompany="${fx.director.companyname}" data-original-title="${fx.director.userName}">
							<img src="http://localhost:8080/upload/${fx.director.image.attachmentPath}" class="img-circle" style="width:24px;height:24px">
							<span> ${fx.director.userName}</span>
						</a>
						共享给了:
							<a href="javascript:void(0);" class="usershow" title="" title="" thisdept="${fx.user.dept.deptName}" thisrole="${fx.user.role.roleName}" thistel="${fx.user.userTel}" thisemail="${fx.user.eamil}" data-original-title="${fx.user.userName}">
								<img src="http://localhost:8080/upload/${fx.user.imgPath}" class="img-circle" style="width:24px;height:24px">${fx.user.userName}
							</a>
					</div>
					<div class="share-right" style="height:30px;">
						<div style="display: inline-block;">
							<span>状态:</span>
								<c:if test="${fx.isHandle==0}">
									<span class="label label-default">未处理</span>
								</c:if>
								<c:if test="${fx.isHandle==1}">
									<span class="label label-success">已处理</span>
								</c:if>
								
						</div>
						<p style="float: right;margin:0;">${fx.shareDate}</p>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	 
	 
</div>
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
					<a class="btn btn-sm btn-default no-padding tablefirst"   style="width: 30px; height: 20px;"> <span class="glyphicon glyphicon-backward"></span></a> 
					<a class="btn btn-sm btn-default no-padding tableup"  style="width: 30px; height: 20px;"> <span class="glyphicon glyphicon-triangle-left"></span></a> 
				<a disabled="disabled" class="btn btn-default no-padding" style="width: 30px; height: 20px;" id="mypage">
						1
				</a>
				<!--判断是否是最后一页  -->
					<a class="btn btn-sm btn-default no-padding tabledown" style="width: 30px; height: 20px;"> <span class="glyphicon glyphicon-triangle-right"></span></a> 
					<a class="btn btn-sm btn-default no-padding tablelast"  style="width: 30px; height: 20px;"> <span class="glyphicon glyphicon-forward"></span></a> 
				</div>
			</div>
		</div>
	</div>
</div>
 
<script>
	 $(function(){
	 	$("#gxsx").click(function(){
	 		  var baseKey=$('.searchbaseKey').val().trim();				//获取搜索关键字
			 $('.thistable').load('directorController/mySharedContactsQueryPage.action?size=6&baseKey='+baseKey);  
	 	});
	 });
		/* 分页插件按钮的点击事件 */
		/* url是从后台接收过来的链接，sort是记录排序规则 */
		$('.tablefirst').on('click',function(){
			 aqueryPage(1);
		});
		$('.tableup').on('click',function(){
		 	  var page=parseInt($("#mypage").html())-1;
		 	  
		 	  if(page>0){
		 	  	 aqueryPage(page);
		 	  }
		});
		$('.tabledown').on('click',function(){
			 var page=parseInt($("#mypage").html())+1;
		 	 var countPage=parseInt($("#ppage").html());  
		 	 
		 	  if(page<=countPage){
		 	  	 aqueryPage(page);
		 	  }
		});
		$('.tablelast').on('click',function(){
			var page=$("#ppage").html(); 
			 aqueryPage(page);
			 
		});
	 
		
		
		
		function aqueryPage(page){
			var size=6;
		 
			 var baseKey=$('.searchbaseKey').val().trim();				//获取搜索关键字
		 
		 
			
			 
			$.ajax({
				url:"directorController/mySharedContactsQueryPageAjax.action",
				data:{page:page,size:size,baseKey:baseKey},
				type:"post",
				dateType:"json",
				success:function(page){
					console.log(page.rows);
					var tr="";
					for(var i=0;i<page.rows.length;i++){
						
						if(page.rows[i].director!=null){
							tr+="<div class='sharemess'>"+
									"<div class='sharecontent'>"+
										"<div>"+
											"<div class='sharecontent-left' style='height: 30px;'>"+
												"你将联系人:"+
												"<a href='javascript:void(0);' class='othershow' title='' thistel='"+page.rows[i].director.phoneNumber+"' thissex='"+page.rows[i].director.sex+"' thisemail='"+page.rows[i].director.email+"' thiscompany='"+page.rows[i].director.companyname+"' data-original-title='"+page.rows[i].director.userName+"'>"+
													"<img src='http://localhost:8080/upload/"+page.rows[i].director.image.attachmentPath+"' class='img-circle' style='width:24px;height:24px'>"+
													"<span>"+page.rows[i].director.userName+"</span>"+
												"</a>"+
												"共享给了:"+
													"<a href='javascript:void(0);' class='usershow'  title='' thisdept='"+page.rows[i].user.dept.deptName+"' thisrole='"+page.rows[i].user.role.roleName+"' thistel='"+page.rows[i].user.userTel+"' thisemail='"+page.rows[i].user.eamil+"' data-original-title='"+page.rows[i].user.userName+"'>"+
														"<img src='http://localhost:8080/upload/"+page.rows[i].user.imgPath+"' class='img-circle' style='width:24px;height:24px'>"+page.rows[i].user.userName+
													"</a>"+
											"</div>"+
											"<div class='share-right' style='height:30px;'>"+
												"<div style='display: inline-block;'>"+
													"<span>状态:</span>";
													if(page.rows[i].isHandle==0){
														tr+="<span class='label label-default'>未处理</span>";
													}
													if(page.rows[i].isHandle==1){
														tr+="<span class='label label-success'>已处理</span>";
													}
														 
														
												tr+="</div>"+
												"<p style='float: right;margin:0;'>"+page.rows[i].shareDate+"</p>"+
											"</div>"+
										"</div>"+
									"</div>"+
								"</div>";
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
</script> 
<script type="text/javascript" src="js/usershow.js"></script>
  </body>
</html>
