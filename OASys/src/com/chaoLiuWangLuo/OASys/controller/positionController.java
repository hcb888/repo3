package com.chaoLiuWangLuo.OASys.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chaoLiuWangLuo.OASys.entity.AoaDept;
import com.chaoLiuWangLuo.OASys.entity.AoaDeptExample;
import com.chaoLiuWangLuo.OASys.entity.AoaPosition;
import com.chaoLiuWangLuo.OASys.entity.AoaPositionExample;
import com.chaoLiuWangLuo.OASys.entity.queryVo;
import com.chaoLiuWangLuo.OASys.service.deptService;
import com.chaoLiuWangLuo.OASys.service.positionServic;
import com.chaoLiuWangLuo.OASys.service.impl.deptServiceImpl;
import com.chaoLiuWangLuo.OASys.service.impl.positionServiceImpl;

@Controller
@RequestMapping(value="/positionController/")
public class positionController {
	@Autowired
	private positionServic positionServiceImpl;
	@Autowired
	private deptService deptServiceImpl;
	
	//根据部门id查询部门下的职位
	@RequestMapping(value="findByList.action")
	public @ResponseBody queryVo findByList(Long deptId){
		AoaPositionExample example=new AoaPositionExample();
		example.createCriteria().andDeptidEqualTo(deptId);
		List<AoaPosition> list=positionServiceImpl.findByList(example);
		
		queryVo vo=new queryVo();
		vo.setPositions(list);
		return vo;
	}
	
	//查询全部职位
	@RequestMapping(value="findList.action")
	public String findList(Model model){
		AoaPositionExample example=new AoaPositionExample();
		List<AoaPosition> list=positionServiceImpl.findByList(example);
		model.addAttribute("positionList", list);
		return "positionmanage";
	}
	
	//添加职位
	@RequestMapping(value="add.action")
	public String add(AoaPosition position){
		int count=positionServiceImpl.add(position);
		return "redirect:/positionController/findList.action";
	}
	
	//根据id查询position对象
	@RequestMapping(value="findById.action")
	public String findById(Model model,Long id){
		//根据id查询出对象
		AoaPositionExample example=new AoaPositionExample();
		example.createCriteria().andPositionIdEqualTo(id);
		List<AoaPosition> list=positionServiceImpl.findByList(example);
		
		//查询全部部门
		AoaDeptExample example2=new AoaDeptExample();
		List<AoaDept> depts=deptServiceImpl.findList(example2);
		
		
		model.addAttribute("position", list.get(0));
		model.addAttribute("depts", depts);
		return "positionedit";
	}
	
	//修改
	@RequestMapping(value="update.action")
	public String update(AoaPosition position){
		int count=positionServiceImpl.update(position);
		return "redirect:/positionController/findList.action";
	}
	
	                                                
}
