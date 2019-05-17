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
    
    <title>My JSP 'serch.jsp' starting page</title>
    
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
.box-header{
	  text-align: center;
	  border-bottom: 0px solid #f4f4f4;
}
.title{
	text-align: center;
}
.control-label{
	display:inline-block;
	font-weight: 400;
}
.bo{
	margin: 0px auto;
	width: 80%;
}


.title{
	font-weight: 400;
	text-align: center;
	color:#2196F3;
}
.inside{
	width: 100%;
}
.inside th,.inside td{
	text-align: center;
}
.inside thead,.inside tfoot,.bac{
	background-color:#6d9eeb;
	color:#fff;
}
.inside>tbody>tr>td{
 	border-top: 0px solid #ddd;
}
.inside>tbody>tr>td{
	border-bottom: 1px solid #ddd;
	border-left: 1px solid #ddd;
}

.bo>tbody>tr>td,.inside>thead>tr>th{
    border-top: 0px solid #ddd;
    border-bottom: 0px solid #ddd;
    border-left: 0px solid #ddd;
}
.food{
	padding-left:10px
}
.bottom{
	border-bottom:1px solid rgba(0, 0, 0, 0.31);
	height: 19px;
}
.wi{
	color:#2196F3;
}
.rile{
    border-left: 1px solid #2196F3;
    border-right: 1px solid #2196F3;
}
.top{
	border-left: 1px solid #2196F3;
    border-right: 1px solid #2196F3;
}
.ss{
border-top: 1px solid #2196F3;
}
.bo tr{
	height:50px;
}
.top td{
	height:30px;
}
 .top label{
	padding-top:16px;
	border-bottom: 2px solid #2196F3;
}
.top div{
	border-bottom:1px solid rgba(0, 0, 0, 0.31);
	height: 40px;
}
 .two label{
	padding-top:15px;
}
.two div{
	margin-top: 15px;
}
.font{
	font-size:16px;
}
.inside tr{
	height:0px;
}

.inside thead th,.inside tfoot td{
	border-right: 1px solid #fff;
	font-weight: 400;
}
.mm{
	border-right: 0px solid #fff
}
.mon{
	margin-left: -8.5px;
    margin-top: -8.5px;
    height: 75px;
    color:#fff;
}
.out{
	border-left: 1px solid #eee;
	border-right: 1px solid #eee;
	border-bottom: 1px solid #eee;
	height:167px;
}
.fo{
	border-top: 1px solid #2196F3;
   
}
</style>

  </head>
  
  <body>
    
<div class="row" style="padding-top: 10px;">
	<div class="col-md-2">
		<h1 style="font-size: 24px; margin: 0;" class="">费用报销</h1>
	</div>
	<div class="col-md-10 text-right">
		<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a> > <a
			disabled="disabled">费用报销</a>
	</div>
</div>
<div class="row" style="padding-top: 15px;">
	<div class="col-md-12">
		
		<div class="bgc-w box">
			
			<div class="box-header">
				<table class="bo table ">
			
				<tr >
					<td colspan="14" class="title"><h2>费用报销单</h2></td>
			
				</tr>
				<tr style="opacity: 0;">
					<td colspan="14">11</td>
				</tr>
				<tr >
					<td class="wi" style="width: 100px;" ><label class="control-label">标题</label></td>
					<td colspan="7" class="underline" style="width:160px;"><div class="bottom" ><label class="control-label">${bursement.process.processName}</label></div></td>
					<td class="css" style="width:30px;"></td>
					
					<td class="wi" style="width: 72px;"><label class="control-label">紧急程度</label></td>
					<td colspan="4" class="underline" style="width: 60px;"><div class="bottom">${bursement.process.processType.typeName}</div></td>
					
				</tr>
				<tr >
					<td class="wi"  style="width: 100px;"><label class="control-label">提单人员</label></td>
					<td  style="width:140px;"><div class="bottom">${bursement.operationUser.userName}</div></td>
					<td class="css"style="width:30px;"></td>
					<td class="wi" style="width:90px;"><label class="control-label">提单部门</label></td>
					<td colspan="4" style="width:44px;"><div class="bottom">${bursement.operationUser.dept.deptName}</div></td>
					<td class="css" style="width:30px;"></td>
					<td class="wi"><label class="control-label">提单日期</label></td>
					<td colspan="4" ><div class="bottom">${bursement.process.applyDate}</div></td>
					
				</tr>
				
				<tr class="top ss">
					<td colspan="14" class="wi "><div class="bottom" ><label class="control-label font">报销信息</label></div></td>
				</tr>
				
				<tr class="rile two">
					<td class="wi" style="width:100px;"><label class="control-label">证明人</label></td>
					<td  style="width:140px;"><div class="bottom">${bursement.bursementUser.userName}</div></td>
					<td class="css"style="width:30px;"></td>
					<td class="wi" style="width:90px;"><label class="control-label">相关客户</label></td>
					<td colspan="4" style="width:44px;"><div class="bottom">${bursement.name}</div></td>
					<td class="css" style="width:30px;"></td>
					<td class="wi"><label class="control-label">报销方式</label></td>
					<td colspan="4" ><div class="bottom">${bursement.bursementType.typeName}</div></td>
				</tr>
				
				<tr class="rile">
					<td class="wi" style="width:100px;"><label class="control-label">报销人员</label></td>
					<td  style="width:140px;"><div class="bottom">${bursement.operationUser.userName}</div></td>
					<td class="css"style="width:30px;"></td>
					<td class="wi" style="width:90px;"><label class="control-label">报销日期</label></td>
					<td colspan="4" style="width:44px;"><div class="bottom">${bursement.process.endDate}</div></td>
					<td class="css" style="width:30px;"></td>
					<td class="wi"><label class="control-label">票据总数</label></td>
					<td colspan="4" ><div class="bottom">${vo.size}</div></td>
				</tr>
				
				<tr class="rile">
					<td class="wi" style="width:100px;"><label class="control-label">相关票据</label></td>
					<td  style="width:140px;"><div class="bottom">
							<a href="http://localhost:8080/upload/${bursement.process.proFile.attachmentPath}" class="label xiugai yulan" title="图片预览">
							<span class="glyphicon glyphicon-search"></span> 预览</a>
							<a href="http://localhost:8080/upload/${bursement.process.proFile.attachmentPath}" class="label xiugai">
							<span class="glyphicon glyphicon-download-alt"></span> 下载</a>
						</div>
					</td>
					<td class="css" colspan="12" ></td>
					
				</tr>
				
				
				<tr class="top">
					<td colspan="14" class="wi "><div class="bottom" ><label class="control-label font">报销明细</label></div></td>
				</tr>
				<tr class="rile">
					<td colspan="14" >
					<div >
						<table class="table inside">
							<thead>
								<tr>
									 <th colspan="2" >序号</th>
									 <th colspan="2">费用日期</th>
									 <th colspan="2">费用科目</th>
									 <th colspan="2">费用说明</th>
									 <th colspan="2">票据张数</th>
									 <th colspan="2" class="mm">报销金额</th>
								</tr>
							</thead>
							<tbody class="tbody">
							<c:forEach items="${detailsburseList}" var="deta" varStatus="i">
								<tr class="tr">
									<td style="border-left: 0px ;" colspan="2"><span>${i.index+1}</span></td>
									<td colspan="2"><span>${deta.produceDate}</span></td>
									<td colspan="2"><span>${deta.subject}</span></td>
									<td colspan="2"><span>${deta.descript}</span></td>
									<td colspan="2"><span>${deta.invoices}</span></td>
									<td colspan="2"><span>${deta.detailmoney}</span></td>
									
								</tr>
							</c:forEach>
						   </tbody> 
						   <tfoot>
						   	<tr>
						   			<td colspan="2"><span>合计</span></td>
									<td colspan="2"><span></span></td>
									<td colspan="2"><span></span></td>
									<td colspan="2"><span></span></td>
									<td colspan="2"><span>${vo.size}</span></td>
									<td colspan="2" class="mm"><span>${vo.countMoney}</span></td>
						   	</tr>
						   </tfoot>
						</table>
					</div>
					</td>
				</tr>
				<tr class="rile" style="height:70px;">
					<td colspan="14"  >
						<div  class="out">
							<table class="table ob ">
								<tr>
									<td style="width:130px;text-align:center;background-color:#6d9eeb;">
										<div class="mon">
											<p style="height:10px;"></p>
											<span>合计金额</span>
											<br>
											<span>(大写)</span>
										</div>
									</td>
									<td colspan="13"><p style="margin-top: 20px;font-size:16px;">${vo.amountInTotal}</p></td>
								</tr>
								
								<tr>
									<td style="width:130px;text-align:center;background-color:#6d9eeb;">
										<div class="mon">
											<p style="height:20px;"></p>
											<span>报销事由</span>
											
										</div>
									</td>
									<td colspan="13"><p style="margin-top: 20px;font-size:16px;">${bursement.process.processDes}</p></td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
				<tr class="top">
					<td colspan="14" class="wi "><div class="bottom" ><label class="control-label font">审批意见</label></div></td>
				</tr>
				<tr class="rile" style="height:70px;">
					<td colspan="14"  >
						<div  class="out">
							<table class="table ob ">
								<c:forEach items="${reviewedList}" var="reviewed">
										<tr>
											<td style="width:130px;text-align:center;background-color:#6d9eeb;">
												<div class="mon">
													<p style="height:20px;"></p>
													<span>${reviewed.reviewedUser.position.name}意见</span>
												</div>
											</td>
											<td colspan="13"><p style="margin-top: 20px;font-size:16px;">${reviewed.advice}</p></td>
										</tr>
								</c:forEach>
							</table>
						</div>
					</td>
				</tr>
				<tr class="fo">

					<td colspan="14" style="text-align: right;" >
						<div class="pull-right foot">
							<a class="btn btn-default fault fa-back" href="javascript:" onclick="history.back(); ">
								 <span class="glyphicon glyphicon-chevron-left"></span> 返回</a>
							<a class="btn btn-default fault" onclick="javascript:window.print();">
			   					<span class="glyphicon glyphicon glyphicon-print"></span> 打印</a>
						</div>
				 </td>
				</tr>
				</table>
			</div>
		</div>
	</div>
</div>
<script>
	$(function(){
	
		$('.yulan').popover({
    		html:true,
    		placement:'auto right',
				trigger: 'hover click',
    		template:'<div class="popover" role="tooltip"><div class="arrow"></div>'
    		+'<h3 class="popover-title"></h3><div><img src="show//2019/01/Jack/cc7b1cfa-792a-4803-98fc-e2df52d6ec04.jpg"style="max-width: 200px;"/></div><div class="popover-content"></div></div>'
    	})
	});
</script>
  </body>
</html>
