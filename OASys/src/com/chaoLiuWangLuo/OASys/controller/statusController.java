package com.chaoLiuWangLuo.OASys.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chaoLiuWangLuo.OASys.entity.AoaStatusList;
import com.chaoLiuWangLuo.OASys.entity.AoaStatusListExample;
import com.chaoLiuWangLuo.OASys.entity.queryVo;
import com.chaoLiuWangLuo.OASys.service.statusService;
import com.chaoLiuWangLuo.OASys.utils.Page;
import com.fasterxml.jackson.databind.ser.std.InetAddressSerializer;

@Controller
@RequestMapping(value="/statusController/")
public class statusController {
	@Autowired
	private statusService statusServiceImpl;
	
	//分页查询
	@RequestMapping(value="queryPage.action")
	public String queryPage(Model model,queryVo vo){
		Page<AoaStatusList> page=statusServiceImpl.queryPage(vo);
		model.addAttribute("page", page);
		return "statusmanage";
	}
	
	//添加
	@RequestMapping(value="add.action")
	public String add(AoaStatusList statusList){
		int count=statusServiceImpl.add(statusList);
		return  "redirect:/statusController/queryPage.action";
	}
	
	//根据id查询对象
	@RequestMapping(value="findById.action")
	public String findById(Model model,Long id){
		AoaStatusListExample example=new AoaStatusListExample();
		example.createCriteria().andStatusIdEqualTo(id);
		List<AoaStatusList> list=statusServiceImpl.findList(example);
		model.addAttribute("status", list.get(0));
		return "statusedit";
	}
	
	//修改
	@RequestMapping(value="update.action")
	public String update(AoaStatusList statusList){
		int count =statusServiceImpl.update(statusList);
		return  "redirect:/statusController/queryPage.action";
	}
	
	//删除
	@RequestMapping(value="delete.action")
	public String delete(Long id){
		int count=statusServiceImpl.delete(id);
		return  "redirect:/statusController/queryPage.action";
	}
	
	 
}
