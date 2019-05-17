<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'chatlist.jsp' starting page</title>
    
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
<style type="text/css">
a {
	color: black;
}

a:hover {
	text-decoration: none;
}

.bgc-w {
	background-color: #fff;
}
.paixu:HOVER {
	cursor: pointer;
	color: #337ab7;
}
</style>

  </head>
  
  <body>
    <div class="row" style="padding-top: 10px;">
	<div class="col-md-2">
		<h1 style="font-size: 24px; margin: 0;" class="">讨论列表</h1>
	</div>
	<div class="col-md-10 text-right">
		<a href="index"><span class="glyphicon glyphicon-home"></span> 首页</a>
		> <a disabled="disabled">讨论列表</a>
	</div>
</div>

<div class="row" style="padding-top: 15px;">
	<div class="col-md-12 thistable">
		<!--id="container"-->
<div class="bgc-w box box-primary">
	<!--盒子头-->
	<div class="box-header">
		<h3 class="box-title">
					<a href="" class="label label-success" style="padding: 5px;margin-left:5px;">
				<span class="glyphicon glyphicon-refresh"></span> 刷新
			</a>
		</h3>
		<div class="box-tools">
			<div class="input-group" style="width: 150px;">
				<input type="text" class="form-control input-sm baseKey"  placeholder="按标题查找" />
				<div class="input-group-btn">
					<a class="btn btn-sm btn-default baseKetsubmit"><span
						class="glyphicon glyphicon-search"></span></a>
				</div>
			</div>
		</div>
	</div>
	<!--盒子身体-->
	<div class="box-body no-padding">
		<div class="table-responsive">
			<table class="table table-hover">
				<tr>
					<th scope="col"><span class="paixu thistype">类型
						</span></th>
					<th scope="col">标题</th>
					<th scope="col"><span class="paixu thistime">发布时间
						</span></th>
					<th scope="col">发布人</th>
					<th scope="col"><span class="paixu thisvisit">访问量
						</span></th>
					<th scope="col">点赞数</th>
					<th scope="col">评论数</th>
					<th scope="col">附件</th>
					<th scope="col">操作</th>
				</tr>
				<tr>
					<td><span class="label label-danger">公告</span></td>
					<td style="max-width:200px;overflow: hidden;text-overflow:ellipsis;white-space: nowrap;"><span>公告-罗密欧</span></td>
					<td><span>2019-01-13 22:54:13</span></td>
					<td><span>罗密欧</span></td>
					<td><span>17</span></td>
					<td><span>2</span></td>
					<td><span>5</span></td>
					<td><span>附件</span></td>
					<td>
						<a href="replaymanage.html?id=44&pageNumber=0" class="label xiugai"> <span
							class="glyphicon glyphicon-search"></span>查看</a>
					</td>
				</tr>
				<tr>
					<td><span class="label label-danger">公告</span></td>
					<td style="max-width:200px;overflow: hidden;text-overflow:ellipsis;white-space: nowrap;"><span>第一天的公告,++小整合</span></td>
					<td><span>2017-10-01 14:25:26</span></td>
					<td><span>罗密欧</span></td>
					<td><span>342</span></td>
					<td><span>2</span></td>
					<td><span>32</span></td>
					<td><span>附件</span></td>
					<td>
						<a href="replaymanage.html?id=13&pageNumber=0" class="label xiugai"> <span
							class="glyphicon glyphicon-search"></span>查看</a>
					</td>
				</tr>
				<tr>
					<td><span class="label label-success">讨论</span></td>
					<td style="max-width:200px;overflow: hidden;text-overflow:ellipsis;white-space: nowrap;"><span>讨论-罗密欧</span></td>
					<td><span>2019-01-13 22:57:07</span></td>
					<td><span>罗密欧</span></td>
					<td><span>9</span></td>
					<td><span>1</span></td>
					<td><span>3</span></td>
					<td><span>附件</span></td>
					<td>
						<a href="replaymanage.html?id=45&pageNumber=0" class="label xiugai"> <span
							class="glyphicon glyphicon-search"></span>查看</a>
					</td>
				</tr>
				<tr>
					<td><span class="label label-success">讨论</span></td>
					<td style="max-width:200px;overflow: hidden;text-overflow:ellipsis;white-space: nowrap;"><span>what????</span></td>
					<td><span>2017-09-29 21:48:28</span></td>
					<td><span>朱丽叶</span></td>
					<td><span>8</span></td>
					<td><span>0</span></td>
					<td><span>1</span></td>
					<td><span>附件</span></td>
					<td>
						<a href="replaymanage.html?id=6&pageNumber=0" class="label xiugai"> <span
							class="glyphicon glyphicon-search"></span>查看</a>
					</td>
				</tr>
				<tr>
					<td><span class="label label-warning">投票</span></td>
					<td style="max-width:200px;overflow: hidden;text-overflow:ellipsis;white-space: nowrap;"><span>哪个语言最受欢迎</span></td>
					<td><span>2019-01-13 23:54:30</span></td>
					<td><span>Jack</span></td>
					<td><span>17</span></td>
					<td><span>0</span></td>
					<td><span>3</span></td>
					<td><span>附件</span></td>
					<td>
						<a href="replaymanage2.html?id=47&pageNumber=0" class="label xiugai"> <span
							class="glyphicon glyphicon-search"></span>查看</a>
					</td>
				</tr>
				<tr>
					<td><span class="label label-warning">投票</span></td>
					<td style="max-width:200px;overflow: hidden;text-overflow:ellipsis;white-space: nowrap;"><span>最美程序媛</span></td>
					<td><span>2019-01-13 22:59:16</span></td>
					<td><span>罗密欧</span></td>
					<td><span>10</span></td>
					<td><span>1</span></td>
					<td><span>4</span></td>
					<td><span>附件</span></td>
					<td>
						<a href="replaymanage2.html?id=46&pageNumber=0" class="label xiugai"> <span
							class="glyphicon glyphicon-search"></span>查看</a>
					</td>
				</tr>
				<tr>
					<td><span class="label label-warning">投票</span></td>
					<td style="max-width:200px;overflow: hidden;text-overflow:ellipsis;white-space: nowrap;"><span>这是一个多选的投票</span></td>
					<td><span>2017-10-04 02:58:16</span></td>
					<td><span>朱丽叶</span></td>
					<td><span>19</span></td>
					<td><span>0</span></td>
					<td><span>0</span></td>
					<td><span>附件</span></td>
					<td>
						<a href="replaymanage2.html?id=34&pageNumber=0" class="label xiugai"> <span
							class="glyphicon glyphicon-search"></span>查看</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<!--盒子尾-->
<div class="box-footer no-padding" style="margin-top: -20px;">
	<div style="padding: 5px;">
		<div id="page"
			style="background: #fff; border: 0px; margin-top: 0px; padding: 2px; height: 25px;">
			<div style="width: 40%; float: left;">
				<div class="pageInfo" style="margin-left: 5px;">
					共<span>7</span>条 | 每页<span>10</span>条
					| 共<span>1</span>页
				</div>
			</div>
			<div style="width: 60%; float: left;">
				<div class="pageOperation">
				<!--判断是否是第一页  -->
					<a class="btn btn-sm btn-default no-padding tablefirst" disabled="disabled"	style="width: 30px; height: 20px;"> <span
						class="glyphicon glyphicon-backward"></span></a> 
					<a class="btn btn-sm btn-default no-padding tableup"  disabled="disabled" 	style="width: 30px; height: 20px;"> <span
						class="glyphicon glyphicon-triangle-left"></span></a> 
				<a disabled="disabled" class="btn btn-default no-padding" style="width: 30px; height: 20px;">
						1
				</a>
				<!--判断是否是最后一页  -->
					<a class="btn btn-sm btn-default no-padding tabledown"  disabled="disabled" style="width: 30px; height: 20px;"> <span
						class="glyphicon glyphicon-triangle-right"></span></a> 
					<a class="btn btn-sm btn-default no-padding tablelast" disabled="disabled" style="width: 30px; height: 20px;"> <span
						class="glyphicon glyphicon-forward"></span></a> 
				</div>
			</div>
		</div>
	</div>
</div>
<script>
		/* 分页插件按钮的点击事件 */
		/* url是从后台接收过来的链接，sort是记录排序规则 */
		$('.tablefirst').on('click',function(){
			 if(true==false){
				 $('.thistable').load('/seetable?page=0');
			 }
		});
		$('.tableup').on('click',function(){
			 if(true==false){
				 $('.thistable').load('/seetable?page=-1');
			 }
		});
		$('.tabledown').on('click',function(){
			if(true==false){
				$('.thistable').load('/seetable?page=1');
			 }
		});
		$('.tablelast').on('click',function(){
			if(true==false){
				$('.thistable').load('/seetable?page=0');
			 }
			
		});
		
		/*类型、状态、时间的排序  */
		$('.thistype').on('click', function() {
			if ($(this).children().hasClass('glyphicon-triangle-bottom')) {
				$('.thistable').load('/seetable?type=0&icon=glyphicon-triangle-top');
			} else {
				$('.thistable').load('/seetable?type=1&icon=glyphicon-triangle-bottom');
			}
		});
		$('.thisstatus').on('click', function() {
			if ($(this).children().hasClass('glyphicon-triangle-bottom')) {
				$('.thistable').load('/seetable?status=0&icon=glyphicon-triangle-top');
			} else {
				$('.thistable').load('/seetable?status=1&icon=glyphicon-triangle-bottom');
			}
		});
		$('.thistime').on('click', function() {
			if ($(this).children().hasClass('glyphicon-triangle-bottom')) {
				$('.thistable').load('/seetable?time=0&icon=glyphicon-triangle-top');
			} else {
				$('.thistable').load('/seetable?time=1&icon=glyphicon-triangle-bottom');
			}
		});
		$('.thisvisit').on('click', function() {
			if ($(this).children().hasClass('glyphicon-triangle-bottom')) {
				$('.thistable').load('/seetable?visitnum=0&icon=glyphicon-triangle-top');
			} else {
				$('.thistable').load('/seetable?visitnum=1&icon=glyphicon-triangle-bottom');
			}
		});
		/* 查找 */
		$('.baseKetsubmit').on('click', function() {
			var baseKey = $('.baseKey').val();
			console.log(baseKey);
			$('.thistable').load('/seetable?baseKey='+baseKey+'');
		});
</script></div>
<script>
/* 显示表格的删除 */
	$('.thistable').on('click','.deletethis',function(){
		console.log($(this).attr('discussId'));
		console.log('讨论列表');
		var name='讨论列表';
		var discussId=$(this).attr('discussId');
		if(confirm("确定删除吗？ 不能恢复哟~")){
		window.location.href="/deletediscuss?discussId="+discussId+"&name="+name+"&page="+0;
		}
	});
</script>	</div>
</div>
  </body>
</html>
