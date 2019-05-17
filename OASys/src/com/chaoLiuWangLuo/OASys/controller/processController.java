package com.chaoLiuWangLuo.OASys.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chaoLiuWangLuo.OASys.service.processService;
import com.chaoLiuWangLuo.OASys.utils.Page;
import com.chaoLiuWangLuo.OASys.entity.*;

@Controller
@RequestMapping(value="/processController/")
public class processController {
	@Autowired
	private processService processServiceImpl;
	
	@RequestMapping(value="queryPage.action")
	public String queryPage(Model model,queryVo vo){
		//由于没有id所以职只有静态
		Long userId=1l;
		vo.setId1(userId);
		
		Page<AoaProcessList> page=processServiceImpl.queryPage(vo);
		model.addAttribute("page",page);
		return "flowmanage";
	}
	
}
