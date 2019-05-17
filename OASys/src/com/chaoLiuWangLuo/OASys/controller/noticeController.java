package com.chaoLiuWangLuo.OASys.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chaoLiuWangLuo.OASys.entity.AoaNoticeList;
import com.chaoLiuWangLuo.OASys.entity.AoaStatusList;
import com.chaoLiuWangLuo.OASys.entity.AoaStatusListExample;
import com.chaoLiuWangLuo.OASys.entity.AoaTypeList;
import com.chaoLiuWangLuo.OASys.entity.AoaTypeListExample;
import com.chaoLiuWangLuo.OASys.entity.queryVo;
import com.chaoLiuWangLuo.OASys.service.noticeService;
import com.chaoLiuWangLuo.OASys.service.statusService;
import com.chaoLiuWangLuo.OASys.service.typeService;
import com.chaoLiuWangLuo.OASys.service.impl.statusServiceImpl;
import com.chaoLiuWangLuo.OASys.service.impl.typeServiceImpl;
import com.chaoLiuWangLuo.OASys.utils.Page;

@Controller
@RequestMapping(value="/noticeController/")
public class noticeController {
	@Autowired
	private noticeService noticeServiceImpl;
	@Autowired
	private statusService statusServiceImpl;
	@Autowired
	private typeService typeServiceImpl;
	
	//通知管理分页查询
	@RequestMapping(value="queryPage.action")
	public String queryPage(Model model,queryVo vo){
		Page<AoaNoticeList> page=noticeServiceImpl.queryPage(vo);
		
		queryVo queryVo=new queryVo();
		SimpleDateFormat  format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 for (AoaNoticeList noticeList : page.getRows()) {
			 System.out.println(noticeList.getNoticeTime());
			if(noticeList.getNoticeTime()!=null){
				noticeList.setNoticeDate(format.format(new java.util.Date(noticeList.getNoticeTime().getTime())));
			}
		 }
		model.addAttribute("page", page);
		return "informmanage";
	}
	
	//查询状态和类型
	@RequestMapping(value="typeAndStatus.action")
	public String typeAndStatus(Model model){
		AoaTypeListExample typeListExample=new AoaTypeListExample();
		typeListExample.createCriteria().andTypeModelEqualTo("inform");
		List<AoaTypeList> typeLists=typeServiceImpl.findList(typeListExample);
		
		AoaStatusListExample statusListExample=new AoaStatusListExample();
		statusListExample.createCriteria().andStatusModelEqualTo("inform");
		List<AoaStatusList> statusLists=statusServiceImpl.findList(statusListExample);
		
		model.addAttribute("typeList", typeLists);
		model.addAttribute("statusList", statusLists);
		
		return "informadd";
	}
	
	
	//添加
	@RequestMapping(value="add.action")
	public String add(AoaNoticeList noticeList){
		//发布时间
		noticeList.setNoticeTime(new Date(System.currentTimeMillis()));
		int count =noticeServiceImpl.add(noticeList);
		
		return "redirect:/noticeController/queryPage.action";
	}
	
	//根据id查询
	@RequestMapping(value="findById.action")
	public String findById(Model model,Long id){
		AoaTypeListExample typeListExample=new AoaTypeListExample();
		typeListExample.createCriteria().andTypeModelEqualTo("inform");
		List<AoaTypeList> typeLists=typeServiceImpl.findList(typeListExample);
		
		AoaStatusListExample statusListExample=new AoaStatusListExample();
		statusListExample.createCriteria().andStatusModelEqualTo("inform");
		List<AoaStatusList> statusLists=statusServiceImpl.findList(statusListExample);
		
		AoaNoticeList noticeList=noticeServiceImpl.findById(id);
		
		model.addAttribute("typeList", typeLists);
		model.addAttribute("statusList", statusLists);
		model.addAttribute("notice", noticeList);
		return "informedit";
	}
	
	//修改
	@RequestMapping(value="update.action")
	public String update(AoaNoticeList aoaNoticeList){
		aoaNoticeList.setModifyTime(new Date(System.currentTimeMillis()));
		int count=noticeServiceImpl.update(aoaNoticeList);
		return "redirect:/noticeController/queryPage.action";
	}
	
	//删除
	@RequestMapping(value="delete.action")
	public String delete(Long id){
		 noticeServiceImpl.delete(id);
		return "redirect:/noticeController/queryPage.action";
	}
	
	//通知查看
	@RequestMapping(value="findInform.action")
	public String findInform(Model model,Long id){
		AoaNoticeList noticeList=noticeServiceImpl.findById(id);
		SimpleDateFormat  format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		noticeList.setNoticeDate(format.format(new java.util.Date(noticeList.getNoticeTime().getTime())));
		model.addAttribute("notice", noticeList);
		return "informshow";
	}
	
	//通知列表分页查询
		@RequestMapping(value="findInformQueryPage.action")
		public String findInformQueryPage(Model model,queryVo vo){
			Page<AoaNoticeList> page=noticeServiceImpl.queryPage(vo);
			
			queryVo queryVo=new queryVo();
			SimpleDateFormat  format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			 for (AoaNoticeList noticeList : page.getRows()) {
				 System.out.println(noticeList.getNoticeTime());
				if(noticeList.getNoticeTime()!=null){
					noticeList.setNoticeDate(format.format(new java.util.Date(noticeList.getNoticeTime().getTime())));
				}
			 }
			model.addAttribute("page", page);
			return "informlist";
		}
}
