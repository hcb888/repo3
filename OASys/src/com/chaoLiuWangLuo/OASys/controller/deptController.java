package com.chaoLiuWangLuo.OASys.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import com.chaoLiuWangLuo.OASys.entity.AoaRole;
import com.chaoLiuWangLuo.OASys.entity.AoaRoleExample;
import com.chaoLiuWangLuo.OASys.entity.queryVo;
import com.chaoLiuWangLuo.OASys.service.deptService;
import com.chaoLiuWangLuo.OASys.service.positionServic;
import com.chaoLiuWangLuo.OASys.service.roleService;
import com.chaoLiuWangLuo.OASys.service.impl.deptServiceImpl;
import com.chaoLiuWangLuo.OASys.service.impl.positionServiceImpl;
import com.chaoLiuWangLuo.OASys.service.impl.roleServiceImpl;

@Controller
@RequestMapping(value="/deptController/")
public class deptController {
	@Autowired
	private deptService deptServiceImpl;
	@Autowired
	private positionServic positionServiceImpl;
	@Autowired
	private roleService roleServiceImpl;
	
	//查询全部
	@RequestMapping(value="findList.action")
	public String findList(Model model){
		//创建dept条件对象
		AoaDeptExample example=new AoaDeptExample();
		List<AoaDept> deptList=deptServiceImpl.findList(example);
		
		SimpleDateFormat dateFormat=new SimpleDateFormat("HH:mm:ss");
		for (AoaDept aoaDept : deptList) {
			//判断上班时间是否为空
			if(aoaDept.getStartTime()!=null){
				//上班时间
				java.util.Date startDate=new java.util.Date(aoaDept.getStartTime().getTime());
			    aoaDept.setStartDate(dateFormat.format(startDate));
			}
		    
		  //判断下班时间是否为空
			if(aoaDept.getEndTime()!=null){
				  //下班时间
			    java.util.Date endDate=new java.util.Date(aoaDept.getEndTime().getTime());
			    aoaDept.setEndDate(dateFormat.format(endDate));
			}
		    
			
		}
		
		
		model.addAttribute("deptList",deptList);
		return "deptmanage";
	}
	
	//添加
	@RequestMapping(value="add.action")
	public String add(AoaDept dept) throws ParseException{
		String format="HH:mm:ss";
		
		java.util.Date date1=new SimpleDateFormat(format).parse(dept.getStartDate());
		dept.setStartTime(new Date(date1.getTime()));
		
		java.util.Date date2=new SimpleDateFormat(format).parse(dept.getEndDate());
		dept.setEndTime(new Date(date2.getTime()));
		
		int count=deptServiceImpl.add(dept);
		return "redirect:/deptController/findList.action";
	}
	
	//根据id查询
	@RequestMapping(value="findById.action")
	public String findById(Model model,Long id){
		//创建dept条件对象
		AoaDeptExample example=new AoaDeptExample();
		example.createCriteria().andDeptIdEqualTo(id);
		List<AoaDept> list=deptServiceImpl.findList(example);
		
		SimpleDateFormat dateFormat=new SimpleDateFormat("HH:mm:ss");
		//判断上班时间是否为空
		if(list.get(0).getStartTime()!=null){
			//上班时间
			java.util.Date startDate=new java.util.Date(list.get(0).getStartTime().getTime());
			list.get(0).setStartDate(dateFormat.format(startDate));
		}
	    
	  //判断下班时间是否为空
		if(list.get(0).getEndTime()!=null){
			  //下班时间
		    java.util.Date endDate=new java.util.Date(list.get(0).getEndTime().getTime());
		    list.get(0).setEndDate(dateFormat.format(endDate));
		}
		
		model.addAttribute("dept", list.get(0));
		return "deptedit";
	}
	
	//修改
	@RequestMapping(value="update.action")
	public String update(AoaDept dept) throws ParseException{
		String date="HH:mm:ss";
		
		java.util.Date startDate=new SimpleDateFormat(date).parse(dept.getStartDate());
		dept.setStartTime(startDate);
		
		java.util.Date endDate=new SimpleDateFormat(date).parse(dept.getEndDate());
		dept.setEndTime(endDate);
		
		int count=deptServiceImpl.update(dept);
		
		return "redirect:/deptController/findList.action";
	}
	
	//查询全部部门和部门下的职位
	@RequestMapping(value="deptAndPosition.action")
	public @ResponseBody queryVo deptAndPosition(Long deptId,Long positionId){
		//查询部门
		AoaDeptExample  example=new AoaDeptExample();
		List<AoaDept> depts=deptServiceImpl.findList(example);
		
		//根据部门id查询部门下的职位
		AoaPositionExample positionExample=new AoaPositionExample();
		positionExample.createCriteria().andDeptidEqualTo(deptId);
		List<AoaPosition> positions=positionServiceImpl.findByList(positionExample);
		queryVo vo=new queryVo();
		vo.setDepts(depts);
		vo.setPositions(positions);
		vo.setId1(deptId);
		vo.setId2(positionId);
		return vo;
	}
	
	//查询全部部门并json数据返回
	@RequestMapping(value="jsonFindList.action")
	public @ResponseBody List<AoaDept> jsonFindList(){
		AoaDeptExample example=new AoaDeptExample();
		List<AoaDept> list=deptServiceImpl.findList(example);
		return list;
	}
	
	//查询部门和角色
	@RequestMapping(value="deptAndRole.action")
	public String deptAndRole(Model model){
		//查询全部部门
		AoaDeptExample aoaDeptExample=new AoaDeptExample();
		List<AoaDept> depts=deptServiceImpl.findList(aoaDeptExample);
		
		//查询全部角色
		AoaRoleExample roleExample=new AoaRoleExample();
		List<AoaRole> aoaRoles=roleServiceImpl.findList(roleExample);
		
		model.addAttribute("depts", depts);
		model.addAttribute("aoaRoles", aoaRoles);
		
		return "useradd";
	}
}
