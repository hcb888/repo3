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
import com.chaoLiuWangLuo.OASys.entity.AoaEvection;
import com.chaoLiuWangLuo.OASys.entity.AoaHoliday;
import com.chaoLiuWangLuo.OASys.entity.AoaOvertime;
import com.chaoLiuWangLuo.OASys.entity.AoaProcessList;
import com.chaoLiuWangLuo.OASys.entity.AoaReviewed;
import com.chaoLiuWangLuo.OASys.entity.AoaStatusList;
import com.chaoLiuWangLuo.OASys.entity.AoaTypeList;
import com.chaoLiuWangLuo.OASys.entity.AoaTypeListExample;
import com.chaoLiuWangLuo.OASys.entity.AoaUser;
import com.chaoLiuWangLuo.OASys.entity.queryVo;
import com.chaoLiuWangLuo.OASys.service.attachmentService;
import com.chaoLiuWangLuo.OASys.service.detailsburseService;
import com.chaoLiuWangLuo.OASys.service.evectionService;
import com.chaoLiuWangLuo.OASys.service.holidayService;
import com.chaoLiuWangLuo.OASys.service.processService;
import com.chaoLiuWangLuo.OASys.service.reviewedService;
import com.chaoLiuWangLuo.OASys.service.statusService;
import com.chaoLiuWangLuo.OASys.service.typeService;
import com.chaoLiuWangLuo.OASys.service.impl.holidayServiceImpl;

@Controller
@RequestMapping(value="/holidayController/")
public class holidayController {
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
	@Autowired
	private evectionService evectionServiceImpl;
	@Autowired
	private holidayService holidayServiceImpl;
	
	
	@RequestMapping(value="processAndHoliday.action")
	public String processAndHoliday(Model model){
		//紧急程度
		AoaTypeListExample example1=new AoaTypeListExample();
		example1.createCriteria().andTypeModelEqualTo("aoa_process_list");
		List<AoaTypeList> process=typeServiceImpl.findList(example1);
		
		//报销方式
		AoaTypeListExample example2=new AoaTypeListExample();
		example2.createCriteria().andTypeModelEqualTo("aoa_holiday");
		List<AoaTypeList> holiday=typeServiceImpl.findList(example2);
		
		model.addAttribute("process", process);
		model.addAttribute("holiday", holiday);
		return "holiday";
	}
	
	@RequestMapping(value="add.action")
	public String add(MultipartFile imgFile,AoaProcessList process,AoaHoliday holiday, AoaReviewed reviewed,queryVo vo) throws IllegalStateException, IOException, ParseException{
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
				 SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				 if(process!=null && process.getStartDate()!=null){
					 process.setStartTime(new Date(format.parse(process.getStartDate()).getTime()));
				 }
				 if(process!=null && process.getEndDate()!=null){
					 process.setEndTime(new Date(format.parse(process.getEndDate()).getTime()));
				 }
				 //算出相隔时间
				 if(process!=null && process.getStartDate()!=null && process.getEndDate()!=null){
					 	String date1=process.getStartDate();

						String date2=process.getEndDate();

						SimpleDateFormat sdf=new SimpleDateFormat("yyyy-mm-dd");

						java.util.Date d1=sdf.parse(date1);

						java.util.Date  d2=sdf.parse(date2);

						long daysBetween=(d2.getTime()-d1.getTime()+1000000)/(60*60*24*1000);
						process.setProcseeDays(Integer.valueOf(String.valueOf(daysBetween)));
				 }
				 process.setTypeName("请假申请单");
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
				 
				 
				 //----------------------添加请假 信息------------------
				 holiday.setProcess(process);
				 //提交
				 int holidayContext=holidayServiceImpl.add(holiday);
				 
				return "procedure";
				 
		
	}
	
	@RequestMapping(value="findById.action")
	public String findById(Model model,Long id){
		//根据流程表id出差申请表和流程表进行联查
				AoaHoliday holiday=null;
				if(id!=null){
					holiday=holidayServiceImpl.findById(id);
				}
			
				//根据流程id查询审核表
				List<AoaReviewed> reviewedList=null;
				if(id!=null){
					 reviewedList=reviewedServiceImpl.findByList(id);
				}
				
				model.addAttribute("holiday", holiday);
				model.addAttribute("reviewedList", reviewedList);
				return "holiserch";
	}
	 
}
