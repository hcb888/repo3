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
    
    <title>My JSP 'inaddress.jsp' starting page</title>
    
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
  <!-- 内部通讯录 -->
<!--盒子头-->
<div class="box-header">
	<h3 class="box-title">内部通讯录</h3>
	<a class="btn btn-sm btn-default thisrefresh" href="javascript:void(0);" title="刷新" style="padding: 5px;margin-top: -8px;">
		<span class="glyphicon glyphicon-refresh"></span>
	</a>
	<div class="box-tools">
		<div class="input-group" style="width: 150px;">
			<input type="text" class="form-control input-sm baseKey" placeholder="用户名/电话号码" value="${vo.baseKey}" style="width: 220px;">
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
				<th scope="col">部门</th>
				<th scope="col">职位</th>
				<th scope="col">头像</th>
				<th scope="col">姓名</th>
				<th scope="col">性别</th>
				<th scope="col">Tel</th>
				<th scope="col">E-mail</th>
				<th scope="col">操作</th>
			</tr>
			<tbody id="pbody">
			<c:forEach items="${page.rows}" var="user">
				<tr>
					<td><span>${user.dept.deptName}</span></td>
					<td><span>${user.position.name}</span></td>
					<td><a href="#"> <img src="http://localhost:8080/upload/${user.imgPath}" class="img-circle" style="width: 24px; height: 24px;"></a></td>
					<td><span>${user.userName}</span></td>
					<td><span>
						<c:if test="${user.sex=='男'}">
							<img src="images/male.png" alt="男" style="width: 20px;height: 20px">
						</c:if>
						<c:if test="${user.sex=='女'}">
							<img src="images/female.png" alt="女" style="width: 20px;height: 20px">
						</c:if>
					</span></td>
					<td><span>${user.userTel}</span></td>
					<td><span>${user.eamil}</span></td>
					<td>
						<a href="javascript:void(0);" userid="${user.userId}" class="label xiugai inlookthis">
							<span class="glyphicon glyphicon-search"></span> 查看
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
			var alph=$('#thispills .active a').text().trim();	//获取字母表中的值
			var baseKey=$('.baseKey').val().trim();				//获取搜索关键字
			if(alph=="ALL"){
				alph="";
			}
			$.ajax({
				url:"directorController/internalCommunicationQueryPageAjax.action",
				data:{page:page,size:size,alph:alph,baseKey:baseKey},
				type:"post",
				dateType:"json",
				success:function(page){
					var tr="";
					for(var i=0;i<page.rows.length;i++){
						tr+="<tr>"+
								"<td><span>"+page.rows[i].dept.deptName+"</span></td>"+
								"<td><span>"+page.rows[i].position.name+"</span></td>"+
								"<td><a href='#'> <img src='http://localhost:8080/upload/"+page.rows[i].imgPath+"' class='img-circle' style='width: 24px; height: 24px;'></a></td>"+
								"<td><span>"+page.rows[i].userName+"</span></td>"+
								"<td><span>";
									if(page.rows[i].sex=="男"){
										tr+="<img src='images/male.png' alt='男' style='width: 20px;height: 20px'>";
									}
									if(page.rows[i].sex=="女"){
										tr+="<img src='images/female.png' alt='女' style='width: 20px;height: 20px'>";
									}
								tr+="</span></td>"+
								"<td><span>"+page.rows[i].userTel+"</span></td>"+
								"<td><span>"+page.rows[i].eamil+"</span></td>"+
								"<td>"+
									"<a href='javascript:void(0);' userid='"+page.rows[i].userId+"' class='label xiugai inlookthis'>"+
										"<span class='glyphicon glyphicon-search'></span> 查看"+
									"</a> "+
								"</td>"+
							"</tr>";
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
  </body>
</html>
