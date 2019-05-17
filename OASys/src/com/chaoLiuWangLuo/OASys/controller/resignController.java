package com.chaoLiuWangLuo.OASys.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.chaoLiuWangLuo.OASys.entity.AoaAttachmentList;
import com.chaoLiuWangLuo.OASys.entity.AoaBursement;
import com.chaoLiuWangLuo.OASys.entity.AoaDetailsburse;
import com.chaoLiuWangLuo.OASys.entity.AoaOvertime;
import com.chaoLiuWangLuo.OASys.entity.AoaProcessList;
import com.chaoLiuWangLuo.OASys.entity.AoaResign;
import com.chaoLiuWangLuo.OASys.entity.AoaReviewed;
import com.chaoLiuWangLuo.OASys.entity.AoaStatusList;
import com.chaoLiuWangLuo.OASys.entity.AoaTypeList;
import com.chaoLiuWangLuo.OASys.entity.AoaTypeListExample;
import com.chaoLiuWangLuo.OASys.entity.AoaUser;
import com.chaoLiuWangLuo.OASys.entity.queryVo;
import com.chaoLiuWangLuo.OASys.service.attachmentService;
import com.chaoLiuWangLuo.OASys.service.bursementService;
import com.chaoLiuWangLuo.OASys.service.detailsburseService;
import com.chaoLiuWangLuo.OASys.service.processService;
import com.chaoLiuWangLuo.OASys.service.resignService;
import com.chaoLiuWangLuo.OASys.service.reviewedService;
import com.chaoLiuWangLuo.OASys.service.statusService;
import com.chaoLiuWangLuo.OASys.service.typeService;

@Controller
@RequestMapping(value="/resignController/")
public class resignController {
	@Autowired
	private resignService resignServiceImpl;
	@Autowired
	private bursementService bursementServiceImpl;
	@Autowired
	private typeService typeServiceImpl;
	@Autowired
	private statusService statusServiceImpl; 
	@Autowired
	private attachmentService attachmentServiceImpl;
	@Autowired
	private reviewedService reviewedServiceImpl;
	@Autowired
	private detailsburseService detailsburseServiceImpl;
	@Autowired
	private processService processServiceImpl;
	
	@RequestMapping(value="add.action")
	private String add(AoaResign resign,AoaProcessList process, AoaReviewed reviewed,queryVo vo) throws IllegalStateException, IOException, ParseException{
		//由于没有登陆只有死数据
		AoaUser user=new AoaUser();
		user.setUserId(1l);
		

		 //-----------------添加流程-----------------
		 process.setApplyTime(new Date(System.currentTimeMillis()));
		 AoaStatusList processStatus=new AoaStatusList();
		 processStatus.setStatusId(23l);
		 process.setProcessStatus(processStatus);
		 process.setTypeName("离职申请单");
		  
		 process.setProcessUser(user);
		 //提交
		int processCount= processServiceImpl.addProcess(process);
		 
		//-----------------添加审核-----------------
		 reviewed.setReviewedStatus(processStatus);
		 reviewed.setReviewedProcess(process);
		 reviewed.setDel(0);
		 //提交
		 int reviewedCount=reviewedServiceImpl.addReviewed(reviewed);
		 
		
		 //-----------------添加离职信息-----------------
		resign.setProcess(process);
		int resignCount=resignServiceImpl.resignAdd(resign);
		  
		  
		  
		return "procedure";
	}
	
	@RequestMapping(value="process.action")
	public String process(Model model){
		//紧急程度
		AoaTypeListExample example1=new AoaTypeListExample();
		example1.createCriteria().andTypeModelEqualTo("aoa_process_list");
		List<AoaTypeList> process=typeServiceImpl.findList(example1);

		model.addAttribute("process", process);
		return "resign";
	}
	
	@RequestMapping(value="findById.action")
	public String findById(Model model,Long id){
		//根据流程表id出差申请表和流程表进行联查
				AoaResign resign=null;
				if(id!=null){
					resign=resignServiceImpl.findById(id);
				}
			
				//根据流程id查询审核表
				List<AoaReviewed> reviewedList=null;
				if(id!=null){
					 reviewedList=reviewedServiceImpl.findByList(id);
				}
				
				model.addAttribute("resign", resign);
				model.addAttribute("reviewedList", reviewedList);
				return "resserch";
	}
}
