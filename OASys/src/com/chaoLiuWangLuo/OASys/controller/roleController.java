package com.chaoLiuWangLuo.OASys.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.WeakReferenceMonitor.ReleaseListener;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chaoLiuWangLuo.OASys.entity.AoaRole;
import com.chaoLiuWangLuo.OASys.entity.AoaRoleExample;
import com.chaoLiuWangLuo.OASys.entity.queryVo;
import com.chaoLiuWangLuo.OASys.service.roleService;
import com.chaoLiuWangLuo.OASys.utils.Page;

@Controller
@RequestMapping(value="/roleController/")
public class roleController {
	@Autowired
	private roleService roleServiceImpl;
	
	//分页查询
	@RequestMapping(value="queryPage.action")
	public String queryPage(Model model,queryVo vo){
		Page<AoaRole> page=roleServiceImpl.queryPage(vo);
		model.addAttribute("page", page);
		return "rolemanage";
	}
	
	//添加
	@RequestMapping(value="add.action")
	public String add(AoaRole role){
		int count=roleServiceImpl.add(role);
		return "redirect:/roleController/queryPage.action";
	}
	
	//根据id查询
	@RequestMapping(value="findById.action")
	public String findById(Model model,Long id){
		AoaRoleExample example=new AoaRoleExample();
		example.createCriteria().andRoleIdEqualTo(id);
		List<AoaRole> role=roleServiceImpl.findList(example);
		model.addAttribute("role", role.get(0));
		return "roleedit";
	}
	
	//修改
	@RequestMapping(value="update.action")
	public String update(AoaRole role){
		int count =roleServiceImpl.update(role);
		return "redirect:/roleController/queryPage.action";
	}
	
	//删除
	@RequestMapping(value="delete.action")
	public String delete(Long id){
		int count=roleServiceImpl.delete(id);
		return "redirect:/roleController/queryPage.action";
	}
	
	
}
