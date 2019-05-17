package com.chaoLiuWangLuo.OASys.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chaoLiuWangLuo.OASys.entity.AoaUserLoginRecord;
import com.chaoLiuWangLuo.OASys.entity.queryVo;
import com.chaoLiuWangLuo.OASys.service.loginService;
import com.chaoLiuWangLuo.OASys.utils.Page;

@Controller
@RequestMapping(value="/loginController/")
public class loginController {
	@Autowired
	private loginService loginServiceImpl;
	
	//分页查询
	@RequestMapping(value="queryPage.action")
	public String queryPage(Model model,queryVo vo){
		Page<AoaUserLoginRecord> page=loginServiceImpl.queryPage(vo);
		model.addAttribute("page",page);
		return "userlogrecordmanage";
	}
}
