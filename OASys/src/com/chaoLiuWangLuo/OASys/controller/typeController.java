package com.chaoLiuWangLuo.OASys.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chaoLiuWangLuo.OASys.entity.AoaTypeList;
import com.chaoLiuWangLuo.OASys.entity.AoaTypeListExample;
import com.chaoLiuWangLuo.OASys.entity.queryVo;
import com.chaoLiuWangLuo.OASys.service.typeService;
import com.chaoLiuWangLuo.OASys.utils.Page;

@Controller
@RequestMapping(value="/typeController/")
public class typeController {
	@Autowired
	private typeService typeServiceImpl;
	
	//分页查询
	@RequestMapping(value="queryPage.action")
	public String queryPage(Model model,queryVo vo){
		Page<AoaTypeList> page=typeServiceImpl.queryPage(vo);
		model.addAttribute("page", page);
		return "typemanage";
	}
	
	//添加
	@RequestMapping(value="add.action")
	public String add(AoaTypeList type){
		int count =typeServiceImpl.add(type);
		return "redirect:/typeController/queryPage.action";
	}
	
	//根据id查询
	@RequestMapping(value="findById.action")
	public String findById(Model  model,Long id){
		AoaTypeListExample example=new AoaTypeListExample();
		example.createCriteria().andTypeIdEqualTo(id);
		List<AoaTypeList> list=typeServiceImpl.findList(example);
		model.addAttribute("type", list.get(0));
		return "typeedit";
	}
	
	//修改
	@RequestMapping(value="update.action")
	public String update(AoaTypeList type){
		int count =typeServiceImpl.update(type);
		return "redirect:/typeController/queryPage.action";
	}
	
	//删除
	@RequestMapping(value="delete.action")
	public String delete(Long id){
		int count =typeServiceImpl.delete(id);
		return "redirect:/typeController/queryPage.action";
	}
	
}
