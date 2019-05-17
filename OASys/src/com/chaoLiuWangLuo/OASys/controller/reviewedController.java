package com.chaoLiuWangLuo.OASys.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chaoLiuWangLuo.OASys.entity.queryVo;
import com.chaoLiuWangLuo.OASys.service.processService;
import com.chaoLiuWangLuo.OASys.service.reviewedService;
import com.chaoLiuWangLuo.OASys.service.statusService;
import com.chaoLiuWangLuo.OASys.service.impl.processServiceImpl;
import com.chaoLiuWangLuo.OASys.utils.Page;
import com.chaoLiuWangLuo.OASys.entity.*;

@Controller
@RequestMapping(value="/reviewedController/")
public class reviewedController {
	@Autowired
	private reviewedService reviewedServiceImpl;
	@Autowired
	private processService processServiceImpl;
	
	@Autowired
	private statusService statusServiceImpl;
	
	@RequestMapping(value="queryPage.action")
	public String queryPage(Model model,queryVo vo){
		//由于没有写登陆=所以只有静态的了
		vo.setId1(2l);
		Page<AoaReviewed> page=reviewedServiceImpl.queryPage(vo);
		model.addAttribute("page", page);
		return "auditing";
	}
	
	@RequestMapping(value="findById.action")
	public String findById(Model model,Long id){
		//由于没有登陆所以用静态id
		Long userId=2l;
		queryVo vo=new queryVo();
		vo.setId1(userId);
		vo.setId2(id);
		//先查根据流程id查询流程表
		AoaProcessList process=processServiceImpl.findById(id);
		//根据流程id查询审核表
		List<AoaReviewed> reviewedList=reviewedServiceImpl.findByList(id);
		
		//申请状态
		AoaStatusListExample statusListExample=new AoaStatusListExample();
		statusListExample.createCriteria().andStatusModelEqualTo("aoa_process_list");
		List<AoaStatusList> statusList=statusServiceImpl.findList(statusListExample);
		
		
		
		//根据流程id和userid查询
		AoaReviewed reviewed=reviewedServiceImpl.findById(vo);
		model.addAttribute("process", process);
		model.addAttribute("reviewedList", reviewedList);
		model.addAttribute("reviewed", reviewed);
		model.addAttribute("statusList", statusList);
		return "audetail2";
	}
	//审核并转流
	@RequestMapping(value="update1.action")
	public String update1(AoaReviewed reviewed,queryVo vo){
		AoaProcessList  Process=processServiceImpl.findById(vo.getProcessId());
		 
		//判断下一步审核人是否为空不为空添加
		if(vo!=null && vo.getrId()!=null){
			AoaReviewed aoaReviewed=new AoaReviewed();
			
			AoaUser reviewedUser=new AoaUser();
			reviewedUser.setUserId(vo.getrId());
			
			AoaStatusList status=new AoaStatusList();
			status.setStatusId(23l);
			
			
			
			aoaReviewed.setReviewedUser(reviewedUser);
			aoaReviewed.setReviewedStatus(status); 
			aoaReviewed.setDel(0);
			
			aoaReviewed.setReviewedProcess(Process);
			
			//提交
			reviewedServiceImpl.addReviewed(aoaReviewed);
		}
		//修改流程表的状态
		AoaStatusList processStatus=new AoaStatusList();
		processStatus.setStatusId(24l);

		Process.setProcessStatus(processStatus);
		//获取到流程的审核人
		if(Process.getShenuser()!=null){
			String[] names=StringUtils.split(Process.getShenuser(), ',');
			List<String> nameList=new ArrayList<String>();
			for (String name : names) {
				nameList.add(name);
			}
			if(vo.getrName()!=null){
				nameList.add(vo.getrName());
			}
			Process.setShenuser(StringUtils.join(nameList.toArray(), ","));
		}
		
		//流程表提交
		processServiceImpl.update(Process);
		
		//修改reviewed
		reviewed.setReviewedTime(new java.sql.Date(System.currentTimeMillis()));
		reviewedServiceImpl.update(reviewed);
		
 		
		return "redirect:/reviewedController/queryPage.action";
	}
	//审核 并结案
	@RequestMapping(value="update2.action")
	public String update2(AoaReviewed reviewed,queryVo vo){
		//修改reviewed
		reviewed.setReviewedTime(new java.sql.Date(System.currentTimeMillis()));
		reviewedServiceImpl.update(reviewed);
		
		//根据流程id查询reviewed
		List<AoaReviewed>  aoaRevieweds=reviewedServiceImpl.findByList(vo.getProcessId());
		//已批准
		int ypz=0;
		//未通过
		int wtg=0;
		//总数
		int count=aoaRevieweds.size();
		for (AoaReviewed aoaReviewed : aoaRevieweds) {
			if(aoaReviewed.getReviewedStatus().getStatusName().equals("已批准")){
				ypz++;
			}
			if(aoaReviewed.getReviewedStatus().getStatusName().equals("未通过")){
				wtg++;
			}
		}
		
		 
		
		
		 
		
		AoaProcessList  Process=processServiceImpl.findById(vo.getProcessId());
		
		 
		//修改流程表的状态
		AoaStatusList processStatus=new AoaStatusList();
		if(ypz==count){
			//通过
			processStatus.setStatusId(25l);
		}else if(wtg==count || wtg>0){
			//不通过
			processStatus.setStatusId(26l);
		}else{
			//处理中
			processStatus.setStatusId(24l);
		}
		

		Process.setProcessStatus(processStatus);
		 
		
		//流程表提交
		processServiceImpl.update(Process);
		
		
		return "redirect:/reviewedController/queryPage.action";
	}
}
