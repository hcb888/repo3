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
    
    <title>My JSP 'sharemeaddress.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
 <link rel="stylesheet" type="text/css" href="css/sharemess.css">
  </head>
  
  <body>
   
<div class="box-header">
	<h3 class="box-title">共享与我</h3>
	<a class="btn btn-sm btn-default sharedWithMeContactsRefresh" href="javascript:void(0);" title="刷新" style="padding: 5px;margin-top: -8px;">
		<span class="glyphicon glyphicon-refresh"></span>
	</a>
	<div class="box-tools">
		<div class="input-group" style="width: 150px;">
			<input type="text" class="form-control input-sm sharedWithMeContactsKey" placeholder="查找..." value="${vo.baseKey}">
			<div class="input-group-btn">
				<a class="btn btn-sm btn-default sharedWithMeContactsKeySumbit"> 
					<span class="glyphicon glyphicon-search"></span> 
				</a>
			</div>
		</div>
	</div>
</div>
<div class="thissharemess" style="margin-bottom:20px;" id="pbody">
	<c:forEach items="${page.rows}" var="gx">
		<div class="sharemess">
			<p>${gx.shareDate}</p>
			<div class="sharecontent">
				<div>
					<div class="sharecontent-left">
						<div class="share-top">
							<a href="javascript:void(0);" class="usershow" title="" thisdept="${gx.shareUser.dept.deptName}" thisrole="${gx.shareUser.role.roleName}" thistel="${gx.shareUser.userTel}" thisemail="${gx.shareUser.eamil}" data-original-title="${gx.shareUser.userName}"> <img src="http://localhost:8080/upload/${gx.shareUser.imgPath}" class="img-circle">
								<span> ${gx.shareUser.userName} </span></a>共享了以下联系人给你:
						</div>
						<div class="share-bottom">
							<a href="javascript:void(0);" class="othershow" title="" thistel="${gx.director.phoneNumber}" thissex="${gx.director.sex}" thisemail="${gx.director.email}" thiscompany="${gx.director.companyname}" style="margin-left: 100px;" data-original-title="${gx.director.userName}"> <img src="http://localhost:8080/upload/${gx.director.image.attachmentPath}" class="img-circle">${gx.director.userName}
							</a> 
						</div>
					</div>
					<div class="share-right"><div class="share-choose"><div class="pull-right"><span> 选择分类： </span><c:if test="${gx.isHandle==0}"><select name="" class="form-control thishandleselect" id="sel"><c:forEach items="${duType}" var="dt"><option value="${dt.typeId}">${dt.typeName}</option></c:forEach></select></c:if><c:if test="${gx.isHandle==1}"><select name="" class="form-control thishandleselect"    disabled=""><option value="${gx.duType.typeId}">${gx.duType.typeName}</option></select></c:if></div></div><div class="share-button"><c:if test="${gx.isHandle==0}"><button class="btn btn-primary nothandle"  id="${gx.directorUsersId}"  onclick="nothandle(${gx.directorUsersId})">确定</button></c:if><c:if test="${gx.isHandle==1}"><button class="btn btn-primary" style="background: #ccc;border:none;" disabled="">已处理</button></c:if>	</div></div>
				</div>
			</div>
		</div>
	</c:forEach>
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
			var size=6;
			var baseKey=$('.sharedWithMeContactsKey').val().trim();				//获取搜索关键字
			var duType;
				 
			$.ajax({
				url:"directorController/directorTypeAjax.action",
				type:"post",
				dateType:"json",
				success:function(date){
					console.log(date);
					duType=date;
				},error:function(err){
					console.log(err);
				}
				
			});
				
			$.ajax({
				url:"directorController/sharedWithMeContactsQueryPageAjax.action",
				data:{page:page,size:size,baseKey:baseKey},
				type:"post",
				dateType:"json",
				success:function(page){
				console.log(page.rows);
					var tr="";
					for(var i=0;i<page.rows.length;i++){
						 
							tr+="<div class='sharemess'>"+
									"<p>"+page.rows[i].shareDate+"</p>"+
									"<div class='sharecontent'>"+
										"<div>"+
											"<div class='sharecontent-left'>"+
												"<div class='share-top'>"+
													"<a href='javascript:void(0);' class='usershow' title='' thisdept='"+page.rows[i].shareUser.dept.deptName+"' thisrole='"+page.rows[i].shareUser.role.roleName+"' thistel='"+page.rows[i].shareUser.userTel+"' thisemail='"+page.rows[i].shareUser.eamil+"' data-original-title='"+page.rows[i].shareUser.userName+"'> <img src='http://localhost:8080/upload/"+page.rows[i].shareUser.imgPath+"' class='img-circle'>"+
														"<span> "+page.rows[i].shareUser.userName+"</span></a>共享了以下联系人给你: "+
												"</div> "+
												"<div class='share-bottom'> "+
													"<a href='javascript:void(0);' class='othershow' title='' thistel='"+page.rows[i].director.phoneNumber+"' thissex='"+page.rows[i].director.sex+"' thisemail='"+page.rows[i].director.email+"' thiscompany='"+page.rows[i].director.companyname+"' style='margin-left: 100px;' data-original-title='"+page.rows[i].director.userName+"'> <img src='http://localhost:8080/upload/"+page.rows[i].director.image.attachmentPath+"' class='img-circle'>"+page.rows[i].director.userName+
													"</a> "+
												"</div>"+
											"</div>"+
											"<div class='share-right'>"+
												"<div class='share-choose'>"+
													"<div class='pull-right'>"+
														"<span> 选择分类： </span>";
															if(page.rows[i].isHandle==0){
																tr+="<select name='' class='form-control thishandleselect'>";
																for(var j=0;j<duType.length;j++){
																	tr+="<option value='"+duType[j].typeId+"'>"+duType[j].typeName+"</option>";
																}
																tr+="</select>";
															}
															if(page.rows[i].isHandle==1){
																tr+="<select name=''class='form-control thishandleselect'    disabled=''>";
																tr+="<option value='"+page.rows[i].duType.typeId+"'>"+page.rows[i].duType.typeName+"</option>";
																tr+="</select>";
															}
														 
													tr+="</div>"+
												"</div>"+
												"<div class='share-button'>";
													if(page.rows[i].isHandle==0){
														tr+="<button class='btn btn-primary nothandle'  id='"+page.rows[i].directorUsersId+"'  onclick='nothandle("+page.rows[i].directorUsersId+")'>确定</button>";
													}
													if(page.rows[i].isHandle==1){
														tr+="<button class='btn btn-primary' style='background: #ccc;border:none;' disabled=''>已处理</button>";
													}
						
												tr+="</div>"+
											"</div>"+
									 	"</div>"+
									"</div>"+
								"</div>";
						 
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
	 
	 	function nothandle(id){
	  
	 	 
	 	  var div=$("#"+id)[0].parentNode.parentNode.childNodes[0].childNodes[0].childNodes[1];
	 		 
	 		 console.log(div) ;  
	 	}
</script>
<script type="text/javascript" src="js/usershow.js"></script>
  </body>
</html>
 