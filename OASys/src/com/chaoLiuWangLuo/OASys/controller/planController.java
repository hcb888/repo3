package com.chaoLiuWangLuo.OASys.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.chaoLiuWangLuo.OASys.entity.AoaAttachmentList;
import com.chaoLiuWangLuo.OASys.entity.AoaBursement;
import com.chaoLiuWangLuo.OASys.entity.AoaPlanList;
import com.chaoLiuWangLuo.OASys.entity.AoaProcessList;
import com.chaoLiuWangLuo.OASys.entity.AoaReviewed;
import com.chaoLiuWangLuo.OASys.entity.AoaStatusList;
import com.chaoLiuWangLuo.OASys.entity.AoaStatusListExample;
import com.chaoLiuWangLuo.OASys.entity.AoaTypeList;
import com.chaoLiuWangLuo.OASys.entity.AoaTypeListExample;
import com.chaoLiuWangLuo.OASys.entity.AoaUser;
import com.chaoLiuWangLuo.OASys.entity.queryVo;
import com.chaoLiuWangLuo.OASys.service.attachmentService;
import com.chaoLiuWangLuo.OASys.service.planService;
import com.chaoLiuWangLuo.OASys.service.statusService;
import com.chaoLiuWangLuo.OASys.service.typeService;
import com.chaoLiuWangLuo.OASys.service.impl.attachmentServiceImpl;
import com.chaoLiuWangLuo.OASys.service.impl.statusServiceImpl;
import com.chaoLiuWangLuo.OASys.service.impl.typeServiceImpl;
import com.chaoLiuWangLuo.OASys.utils.Page;

@Controller
@RequestMapping(value="/planController/")
public class planController {
	@Autowired
	private planService planServiceImpl;
	@Autowired
	private statusService statusServiceImpl;
	@Autowired
	private typeService typeServiceImpl;
	@Autowired
	private attachmentService attachmentServiceImpl;
	
	
	//分页查询
	@RequestMapping(value="queryPage.action")
	public String queryPage(Model model,queryVo vo){
		Page<AoaPlanList> page=planServiceImpl.queryPage(vo);
		model.addAttribute("page", page);
		
		return  "planmanage";
	}
	
	//查询计划类型和计划状态
	@RequestMapping(value="planTypeAndStatus.action")
	public String planTypeAndStatus(Model model){
		//计划类型
		AoaTypeListExample example1=new AoaTypeListExample();
		example1.createCriteria().andTypeModelEqualTo("aoa_plan_list");
		List<AoaTypeList> planType=typeServiceImpl.findList(example1);
				
		//计划状态
		AoaStatusListExample example2=new AoaStatusListExample();
		example2.createCriteria().andStatusModelEqualTo("aoa_plan_list");
		List<AoaStatusList> planStatus=statusServiceImpl.findList(example2);
					
		model.addAttribute("planType", planType);
		model.addAttribute("planStatus", planStatus);
		return "planadd";
	}
	
	
	@RequestMapping(value="add.action")
	private String add(MultipartFile imgFile,AoaPlanList plan) throws IllegalStateException, IOException, ParseException{
		//由于没有登陆只有死数据
		AoaUser user=new AoaUser();
		user.setUserId(1l);
		
		 //-----------------添加文件---------------------
		 AoaAttachmentList attachmentList=new AoaAttachmentList();
			//判读图片是否为空
			if(imgFile!=null && imgFile.getOriginalFilename()!=null){
				//uuid作为文件名
				String imgName=UUID.randomUUID().toString().replace("-","");
				//获取上传文件名
				String oriName=imgFile.getOriginalFilename();
				//获取文件后缀
				String extName=oriName.substring(oriName.lastIndexOf("."));
							
				//开始上传
				imgFile.transferTo(new File("F:/upload/"+imgName+extName));
					
				//数据单
			 
				attachmentList.setAttachmentName(imgName);
				attachmentList.setAttachmentPath(imgName+extName);
				attachmentList.setAttachmentShuffix(extName);
				attachmentList.setAttachmentSize(String.valueOf(imgFile.getSize()));
				attachmentList.setAttachmentType(imgFile.getContentType());
				attachmentList.setAttachmentUser(user);
				attachmentList.setModel("aoa_bursement");
				attachmentList.setUploadTime(new Date(System.currentTimeMillis()));
				
				//提交
				int attachmentCount=attachmentServiceImpl.addAttachment(attachmentList);
			}
			
			//判断上传的开始时间和结束时间是否为空,不为空将他转换成date类型
			SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			if(plan.getStartDate()!=null){
				plan.setStartTime(dateFormat.parse(plan.getStartDate()));
			}
			
			if(plan.getEndDate()!=null){
				plan.setEndTime(dateFormat.parse(plan.getEndDate()));
			}
			
			if(attachmentList!=null && attachmentList.getAttachmentId()!=null){
				plan.setPlanAoaAttachment(attachmentList);
			}
			
			plan.setCreateTime(new java.util.Date(System.currentTimeMillis()));
			plan.setPlanUser(user);
			int planCount=planServiceImpl.add(plan);
			
			return "redirect:/planController/queryPage.action";
		
	}
	
	//根据id查询
	@RequestMapping(value="findById.action")
	public String findById(Model model,Long id){
		AoaPlanList plan=planServiceImpl.findById(id);
		
		//计划类型
		AoaTypeListExample example1=new AoaTypeListExample();
		example1.createCriteria().andTypeModelEqualTo("aoa_plan_list");
		List<AoaTypeList> planType=typeServiceImpl.findList(example1);
						
		//计划状态
		AoaStatusListExample example2=new AoaStatusListExample();
		example2.createCriteria().andStatusModelEqualTo("aoa_plan_list");
		List<AoaStatusList> planStatus=statusServiceImpl.findList(example2);
			
		model.addAttribute("plan", plan);
		model.addAttribute("planType", planType);
		model.addAttribute("planStatus", planStatus);
		
		return "planedit";
	}
	
	//修改
	@RequestMapping(value="update.action")
	public String update(MultipartFile imgFile,AoaPlanList plan) throws IllegalStateException, IOException, ParseException{
		//由于没有登陆只有死数据
				AoaUser user=new AoaUser();
				user.setUserId(1l);
				
				 //-----------------添加文件---------------------
				 AoaAttachmentList attachmentList=new AoaAttachmentList();
					//判读图片是否为空
					if(imgFile!=null && imgFile.getOriginalFilename()!=null && imgFile.getSize()!=0){
						//uuid作为文件名
						String imgName=UUID.randomUUID().toString().replace("-","");
						//获取上传文件名
						String oriName=imgFile.getOriginalFilename();
						//获取文件后缀
						String extName=oriName.substring(oriName.lastIndexOf("."));
									
						//开始上传
						imgFile.transferTo(new File("F:/upload/"+imgName+extName));
							
						//数据单
					 
						attachmentList.setAttachmentName(imgName);
						attachmentList.setAttachmentPath(imgName+extName);
						attachmentList.setAttachmentShuffix(extName);
						attachmentList.setAttachmentSize(String.valueOf(imgFile.getSize()));
						attachmentList.setAttachmentType(imgFile.getContentType());
						attachmentList.setAttachmentUser(user);
						attachmentList.setModel("aoa_bursement");
						attachmentList.setUploadTime(new Date(System.currentTimeMillis()));
						
						//提交
						int attachmentCount=attachmentServiceImpl.addAttachment(attachmentList);
					}
					
					//判断上传的开始时间和结束时间是否为空,不为空将他转换成date类型
					SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					if(plan.getStartDate()!=null){
						plan.setStartTime(dateFormat.parse(plan.getStartDate()));
					}
					
					if(plan.getEndDate()!=null){
						plan.setEndTime(dateFormat.parse(plan.getEndDate()));
					}
					
					if(attachmentList!=null && attachmentList.getAttachmentId()!=null){
						plan.setPlanAoaAttachment(attachmentList);
					}
					
					int countPlan=planServiceImpl.update(plan);
					
					return "redirect:/planController/queryPage.action";	
					
	}
	
	//删除
	@RequestMapping(value="delete.action")
	public String delete(long id){
		int countPlan=planServiceImpl.delete(id);
		return "redirect:/planController/queryPage.action";	
	}
	
	
	//根据日周月分页查询
	@RequestMapping(value="dayWeekMonthPlanQueryPage.action")
	public String dayWeekMonthPlanQueryPage(Model model,queryVo vo) throws ParseException{
		Page<AoaPlanList> page=planServiceImpl.dayWeekMonthPlanQueryPage(vo);
		
		
		//回显隐藏部分数据
		model.addAttribute("start",vo.getStartDate());
		model.addAttribute("end",vo.getEndDate());
		
		
		//回显显示部分数据
		java.util.Date date=new SimpleDateFormat("yyyy-MM-dd").parse(vo.getEndDate());
		Calendar calendar=Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.DATE,-1);
		String endDate=new SimpleDateFormat("yyyy-MM-dd").format(calendar.getTime());
		model.addAttribute("planStart",vo.getStartDate());
		model.addAttribute("planEnd",endDate);
		model.addAttribute("page",page);
		model.addAttribute("jh",vo.getJh());
		return "plantable";
	}
	
	//修改评论
	@RequestMapping(value="updatePlanComment.action")
	public String updatePlanComment(AoaPlanList plan){
		
		int count=planServiceImpl.updatePlanComment(plan);
		return "redirect:/planController/dayWeekMonthPlanQueryPage.action";	
	}
	
}