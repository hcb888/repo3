<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'roleset.jsp' starting page</title>
    
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
<link rel="stylesheet" href="css/common/checkbox.css" />
<link rel="stylesheet" href="css/role/roleset.css" />

<script>
	$(function() {
		
			$(".widths").each(
					function() {
						var $val = $(this).text();

						if ($val == "#") {
							var $this = $(this).parents("tr");
							$this.css("background-color",
									"rgba(255, 235, 59, 0.19)");
							$this.hover(function() {
								$this.css("background-color",
										"rgba(158, 158, 158, 0.09)");
							}, function() {
								$this.css("background-color",
										"rgba(255, 235, 59, 0.19)");
							})
						}
					})

			$(".menus").each(function() {
				var $val = $(this).text();
				if ($val == "菜单") {
					$(this).css("color", "#4caf50");
				} else {
					$(this).css("color", "#9e9e9e");
				}
			})
			
			 $("[name=show]:checkbox").click(function(){
				var $roleid=1
				var menu;
				var content;
				 if(this.checked){
					menu=$(this).parents("td").siblings(".menuid").text();
					content="选中"
				}else{
					 menu=$(this).parents("td").siblings(".menuid").text();
					 content="未选中"
				}
				 console.log(menu); console.log(content);
				 $.post("powerss",{roleid:$roleid,content:content,menuid:menu},function(){
					 
				 }) 
			 })
			
		});
	
</script>
<style>
.table>tbody>tr>td{
    border-top: 1px solid rgba(245, 245, 220, 0.29);
    }
</style>

  </head>
  
  <body>
    <div class="">
		<div class=" ">
			<div class="row">
				<div class="col-md-2">
					<h1 style="font-size: 24px; margin: 0;" class="">超级管理员</h1>
				</div>
				<div class="col-md-10 text-right">
					<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a>
					> <a disabled="disabled">超级管理员</a>
				</div>
			</div>
			<div class="row" style="padding-top: 15px;">
				<div class="col-md-12">
					<div class="bgc-w box box-primary">
						<!--盒子头-->
						<div class="box-header">
							<a class="btn btn-sm label-back"
								href="javascript:history.back();"> <span
								class="glyphicon glyphicon-chevron-left"></span> 返回
							</a>
						</div>
						<!--盒子身体-->
						<div class="box-body no-padding">
							<div>
								<table class="table table-hover ">
									<tr>
										<th scope="col">ID</th>
										<th scope="col">名称</th>
										<th scope="col" class="widths">路径</th>
										<th scope="col">类型</th>
										<th scope="col">开启权限</th>
										

									</tr>
									<tr style="background-color:rgba(255, 235, 59, 0.19);" >
										<td class="menuid">1</td>
										<td><span>系统管理</span></td>
										<td><span class="widths">##</span></td>
										<td><span class="menus">菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr >
										<td class="menuid">15</td>
										<td><span>类型管理</span></td>
										<td><span class="widths">/testsystype</span></td>
										<td><span class="menus" >菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr >
										<td class="menuid">14</td>
										<td><span>菜单管理</span></td>
										<td><span class="widths">/testsysmenu</span></td>
										<td><span class="menus" >菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr >
										<td class="menuid">16</td>
										<td><span>状态管理</span></td>
										<td><span class="widths">/testsysstatus</span></td>
										<td><span class="menus" >菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr style="background-color:rgba(255, 235, 59, 0.19);" >
										<td class="menuid">2</td>
										<td><span>用户管理</span></td>
										<td><span class="widths">#</span></td>
										<td><span class="menus">菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr >
										<td class="menuid">17</td>
										<td><span>部门管理</span></td>
										<td><span class="widths">/deptmanage</span></td>
										<td><span class="menus" >菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr >
										<td class="menuid">20</td>
										<td><span>在线用户</span></td>
										<td><span class="widths">/morelogrecord</span></td>
										<td><span class="menus" >菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr >
										<td class="menuid">18</td>
										<td><span>职位管理</span></td>
										<td><span class="widths">/positionmanage</span></td>
										<td><span class="menus" >菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr >
										<td class="menuid">19</td>
										<td><span>用户管理</span></td>
										<td><span class="widths">/usermanage</span></td>
										<td><span class="menus" >菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr style="background-color:rgba(255, 235, 59, 0.19);" >
										<td class="menuid">3</td>
										<td><span>角色列表</span></td>
										<td><span class="widths">#</span></td>
										<td><span class="menus">菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr >
										<td class="menuid">21</td>
										<td><span>角色列表</span></td>
										<td><span class="widths">/rolemanage</span></td>
										<td><span class="menus" >菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr style="background-color:rgba(255, 235, 59, 0.19);" >
										<td class="menuid">4</td>
										<td><span>考勤管理</span></td>
										<td><span class="widths">#</span></td>
										<td><span class="menus">菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr >
										<td class="menuid">22</td>
										<td><span>考勤管理</span></td>
										<td><span class="widths">/attendceatt</span></td>
										<td><span class="menus" >菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr >
										<td class="menuid">23</td>
										<td><span>考勤周报表</span></td>
										<td><span class="widths">/attendceweek</span></td>
										<td><span class="menus" >菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr >
										<td class="menuid">24</td>
										<td><span>考勤月报表</span></td>
										<td><span class="widths">/attendcemonth</span></td>
										<td><span class="menus" >菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr >
										<td class="menuid">67</td>
										<td><span>考勤列表</span></td>
										<td><span class="widths">/attendcelist</span></td>
										<td><span class="menus" >菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr style="background-color:rgba(255, 235, 59, 0.19);" >
										<td class="menuid">5</td>
										<td><span>流程管理</span></td>
										<td><span class="widths">#</span></td>
										<td><span class="menus">菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr >
										<td class="menuid">90</td>
										<td><span>新建流程</span></td>
										<td><span class="widths">/xinxeng</span></td>
										<td><span class="menus" >菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr >
										<td class="menuid">25</td>
										<td><span>我的申请</span></td>
										<td><span class="widths">/flowmanage</span></td>
										<td><span class="menus" >菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr >
										<td class="menuid">26</td>
										<td><span>流程审核</span></td>
										<td><span class="widths">/audit</span></td>
										<td><span class="menus" >菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr style="background-color:rgba(255, 235, 59, 0.19);" >
										<td class="menuid">6</td>
										<td><span>公告管理</span></td>
										<td><span class="widths">#</span></td>
										<td><span class="menus">菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr >
										<td class="menuid">27</td>
										<td><span>通知管理</span></td>
										<td><span class="widths">/infrommanage</span></td>
										<td><span class="menus" >菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr >
										<td class="menuid">28</td>
										<td><span>通知列表</span></td>
										<td><span class="widths">/infromlist</span></td>
										<td><span class="menus" >菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr style="background-color:rgba(255, 235, 59, 0.19);" >
										<td class="menuid">7</td>
										<td><span>邮件管理</span></td>
										<td><span class="widths">#</span></td>
										<td><span class="menus">菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr >
										<td class="menuid">29</td>
										<td><span>账号管理</span></td>
										<td><span class="widths">/accountmanage</span></td>
										<td><span class="menus" >菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr >
										<td class="menuid">30</td>
										<td><span>邮件管理</span></td>
										<td><span class="widths">/mail</span></td>
										<td><span class="menus" >菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr style="background-color:rgba(255, 235, 59, 0.19);" >
										<td class="menuid">8</td>
										<td><span>任务管理</span></td>
										<td><span class="widths">#</span></td>
										<td><span class="menus">菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr >
										<td class="menuid">31</td>
										<td><span>任务管理</span></td>
										<td><span class="widths">/taskmanage</span></td>
										<td><span class="menus" >菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr >
										<td class="menuid">32</td>
										<td><span>我的任务</span></td>
										<td><span class="widths">/mytask</span></td>
										<td><span class="menus" >菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr style="background-color:rgba(255, 235, 59, 0.19);" >
										<td class="menuid">9</td>
										<td><span>日程管理</span></td>
										<td><span class="widths">#</span></td>
										<td><span class="menus">菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr >
										<td class="menuid">33</td>
										<td><span>日程管理</span></td>
										<td><span class="widths">/daymanage</span></td>
										<td><span class="menus" >菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr >
										<td class="menuid">34</td>
										<td><span>我的日历</span></td>
										<td><span class="widths">/daycalendar</span></td>
										<td><span class="menus" >菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr style="background-color:rgba(255, 235, 59, 0.19);" >
										<td class="menuid">10</td>
										<td><span>工作计划</span></td>
										<td><span class="widths">#</span></td>
										<td><span class="menus">菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr >
										<td class="menuid">35</td>
										<td><span>计划管理</span></td>
										<td><span class="widths">/planview</span></td>
										<td><span class="menus" >菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr >
										<td class="menuid">36</td>
										<td><span>计划报表</span></td>
										<td><span class="widths">/myplan</span></td>
										<td><span class="menus" >菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr style="background-color:rgba(255, 235, 59, 0.19);" >
										<td class="menuid">11</td>
										<td><span>文件管理</span></td>
										<td><span class="widths">#</span></td>
										<td><span class="menus">菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr >
										<td class="menuid">37</td>
										<td><span>文件管理</span></td>
										<td><span class="widths">/filemanage</span></td>
										<td><span class="menus" >菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr style="background-color:rgba(255, 235, 59, 0.19);" >
										<td class="menuid">12</td>
										<td><span>笔记管理</span></td>
										<td><span class="widths">#</span></td>
										<td><span class="menus">菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr >
										<td class="menuid">38</td>
										<td><span>笔记管理</span></td>
										<td><span class="widths">/noteview</span></td>
										<td><span class="menus" >菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr style="background-color:rgba(255, 235, 59, 0.19);" >
										<td class="menuid">39</td>
										<td><span>通讯录</span></td>
										<td><span class="widths">#</span></td>
										<td><span class="menus">菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr >
										<td class="menuid">40</td>
										<td><span>通讯录</span></td>
										<td><span class="widths">/addrmanage</span></td>
										<td><span class="menus" >菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr style="background-color:rgba(255, 235, 59, 0.19);" >
										<td class="menuid">13</td>
										<td><span>讨论区</span></td>
										<td><span class="widths">#</span></td>
										<td><span class="menus">菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr >
										<td class="menuid">89</td>
										<td><span>超级管理员</span></td>
										<td><span class="widths">/adminmanage</span></td>
										<td><span class="menus" >菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr >
										<td class="menuid">41</td>
										<td><span>我的管理</span></td>
										<td><span class="widths">/chatmanage</span></td>
										<td><span class="menus" >菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									<tr >
										<td class="menuid">42</td>
										<td><span>讨论区列表</span></td>
										<td><span class="widths">/chatlist</span></td>
										<td><span class="menus" >菜单</span></td>
										<td>
											<span class="labels">
												<label><input type="checkbox" name="show" class="val" checked><i>✓</i></label></span>
</td>
										

									</tr>
									
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
  </body>
</html>
