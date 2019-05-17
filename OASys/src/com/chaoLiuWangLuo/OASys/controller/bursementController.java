package com.chaoLiuWangLuo.OASys.controller;

import static org.hamcrest.CoreMatchers.instanceOf;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Date;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;
import java.math.BigDecimal;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.chaoLiuWangLuo.OASys.entity.AoaAttachmentList;
import com.chaoLiuWangLuo.OASys.entity.AoaBursement;
import com.chaoLiuWangLuo.OASys.entity.AoaDetailsburse;
import com.chaoLiuWangLuo.OASys.entity.AoaProcessList;
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
import com.chaoLiuWangLuo.OASys.service.reviewedService;
import com.chaoLiuWangLuo.OASys.service.statusService;
import com.chaoLiuWangLuo.OASys.service.typeService;
import com.chaoLiuWangLuo.OASys.service.impl.attachmentServiceImpl;
import com.chaoLiuWangLuo.OASys.service.impl.detailsburseServiceImpl;
import com.chaoLiuWangLuo.OASys.service.impl.processServiceImpl;
import com.chaoLiuWangLuo.OASys.service.impl.reviewedServiceImpl;
import com.chaoLiuWangLuo.OASys.service.impl.statusServiceImpl;
import com.chaoLiuWangLuo.OASys.service.impl.typeServiceImpl;
import com.chaoLiuWangLuo.OASys.utils.positiveIntegerToHanStringUtils;

@Controller
@RequestMapping(value="/bursementController/")
public class bursementController {
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
	private String add(MultipartFile imgFile,AoaBursement bursement,AoaProcessList process, AoaReviewed reviewed,queryVo vo) throws IllegalStateException, IOException, ParseException{
		//由于没有登陆只有死数据
		AoaUser user=new AoaUser();
		user.setUserId(1l);
		
		 //-----------------添加图片---------------------
		 AoaAttachmentList attachmentList=new AoaAttachmentList();
			//判读图片是否为空
			if(imgFile!=null && imgFile.getOriginalFilename()!=null){
				//uuid作为图片名
				String imgName=UUID.randomUUID().toString().replace("-","");
				//获取上传图片名
				String oriName=imgFile.getOriginalFilename();
				//获取图片后缀
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
		
		
		 
		 
		 //-----------------添加流程-----------------
		 process.setApplyTime(new Date(System.currentTimeMillis()));
		 AoaStatusList processStatus=new AoaStatusList();
		 processStatus.setStatusId(23l);
		 process.setProcessStatus(processStatus);
		 process.setTypeName("费用报销单");
		 if(attachmentList!=null && attachmentList.getAttachmentId()!=null){
			 process.setProFile(attachmentList);
		 }
		 process.setProcessUser(user);
		 //提交
		int processCount= processServiceImpl.addProcess(process);
		 
		//-----------------添加审核-----------------
		 reviewed.setReviewedStatus(processStatus);
		 reviewed.setReviewedProcess(process);
		 reviewed.setDel(0);
		 //提交
		 int reviewedCount=reviewedServiceImpl.addReviewed(reviewed);
		 
		
		 //-----------------添加费用报销-----------------
		  bursement.setBurseTime(new Date(System.currentTimeMillis()));
		  //循环Details获取总金额
		  Double money=0.0;
		  for (AoaDetailsburse d : bursement.getDetails()) {
			money+=d.getDetailmoney();
		  }
		  bursement.setAllMoney(money);
		  bursement.setOperationUser(user);
		  bursement.setProcess(process);
		  //提交
		  int  bursementCount=bursementServiceImpl.addBursement(bursement);
		  
		  
		//-----------------添加费用明细-----------------
		  for (AoaDetailsburse detailsburse : bursement.getDetails()) {
				 detailsburse.setBursment(bursement);
				 detailsburse.setProduceTime(new Date(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(detailsburse.getProduceDate()).getTime()));
				 //提交
				 int detailsburseCount=detailsburseServiceImpl.addDetailsburse(detailsburse);
		  }
		return "procedure";
	}
	
	@RequestMapping(value="processAndbursement.action")
	public String processAndbursement(Model model){
		//紧急程度
		AoaTypeListExample example1=new AoaTypeListExample();
		example1.createCriteria().andTypeModelEqualTo("aoa_process_list");
		List<AoaTypeList> process=typeServiceImpl.findList(example1);
		
		//报销方式
		AoaTypeListExample example2=new AoaTypeListExample();
		example2.createCriteria().andTypeModelEqualTo("aoa_bursement");
		List<AoaTypeList> bursement=typeServiceImpl.findList(example2);
		
		model.addAttribute("process", process);
		model.addAttribute("bursement", bursement);
		return "bursement";
	}
	
	@RequestMapping(value="findById.action")
	public String findById(Model model,Long id){
		//费用报销表和流程表连接 查询
		AoaBursement bursement=bursementServiceImpl.findById(id); 
		
		if(bursement!=null && bursement.getProcess()!=null && bursement.getProcess().getApplyTime()!=null){
			bursement.getProcess().setApplyDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date(bursement.getProcess().getApplyTime().getTime())));
		}
		
		if(bursement!=null && bursement.getProcess()!=null && bursement.getProcess().getEndTime()!=null){
			bursement.getProcess().setEndDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date(bursement.getProcess().getEndTime().getTime())));
		}
		//根据查询出来的费用报销id查询费用明细表
		List<AoaDetailsburse> detailsburseList=null;
		if(bursement!=null && bursement.getBursementId()!=null){
			 detailsburseList=detailsburseServiceImpl.findList(bursement.getBursementId());
			if(detailsburseList!=null){
				 for (AoaDetailsburse aoaDetailsburse : detailsburseList) {
						if(aoaDetailsburse!=null && aoaDetailsburse.getProduceTime()!=null){
							aoaDetailsburse.setProduceDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date(aoaDetailsburse.getProduceTime().getTime())));
						}
				}
			}
		}
		
		//根据查询出来的流程id查询审核表
		List<AoaReviewed> reviewedList=null;
		if(bursement!=null && bursement.getBursementId()!=null){
			  reviewedList=reviewedServiceImpl.findByList(bursement.getBursementId());
		}
		
		queryVo vo=new queryVo();
		if(detailsburseList!=null){
			vo.setSize(detailsburseList.size());
			Double countMoney=0.0;
			for (AoaDetailsburse deta : detailsburseList) {
				countMoney+=deta.getDetailmoney();
			}
			vo.setCountMoney(countMoney);
			positiveIntegerToHanStringUtils hanStringUtils=new positiveIntegerToHanStringUtils();
			vo.setAmountInTotal(hanStringUtils.positiveIntegerToHanString(countMoney));
		}
		
		model.addAttribute("bursement", bursement);
		model.addAttribute("detailsburseList", detailsburseList);
		model.addAttribute("reviewedList", reviewedList);
		model.addAttribute("vo", vo);
		return "serch";
	}
	
	 
	

 
	 

}
