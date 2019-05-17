package com.chaoLiuWangLuo.OASys.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.management.relation.RoleResult;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.chaoLiuWangLuo.OASys.entity.AoaDept;
import com.chaoLiuWangLuo.OASys.entity.AoaDeptExample;
import com.chaoLiuWangLuo.OASys.entity.AoaPosition;
import com.chaoLiuWangLuo.OASys.entity.AoaPositionExample;
import com.chaoLiuWangLuo.OASys.entity.AoaRole;
import com.chaoLiuWangLuo.OASys.entity.AoaRoleExample;
import com.chaoLiuWangLuo.OASys.entity.AoaUser;
import com.chaoLiuWangLuo.OASys.entity.AoaUserExample;
import com.chaoLiuWangLuo.OASys.entity.queryVo;
import com.chaoLiuWangLuo.OASys.service.deptService;
import com.chaoLiuWangLuo.OASys.service.positionServic;
import com.chaoLiuWangLuo.OASys.service.roleService;
import com.chaoLiuWangLuo.OASys.service.userService;
import com.chaoLiuWangLuo.OASys.service.impl.deptServiceImpl;
import com.chaoLiuWangLuo.OASys.service.impl.positionServiceImpl;
import com.chaoLiuWangLuo.OASys.service.impl.roleServiceImpl;
import com.chaoLiuWangLuo.OASys.utils.Page;

@Controller
@RequestMapping(value="/userController/")
public class userController {
	@Autowired
	private userService userServiceImpl;
	@Autowired 
	private positionServic positionServicImpl;
	@Autowired
	private deptService deptServiceImpl;
	@Autowired
	private roleService roleServiceImpl;
 
	
	//根据部门id查询
	@RequestMapping(value="findByIdList.action")
	public String findByIdList(Model model,Long id,Long manager,String name){
		//根据经理id查询经理对象
		if(manager!=null){
			//创建aoauser条件对象
			AoaUserExample example=new AoaUserExample();
			example.createCriteria().andUserIdEqualTo(manager);
			List<AoaUser> users=userServiceImpl.findByList(example);
			model.addAttribute("user", users.get(0));
		}
		//根据部门id查询该部门下的员工
		List<AoaUser> list=userServiceImpl.findByIdList(id);
		model.addAttribute("userList",list);
		model.addAttribute("deptName",name);
		return "deptread";
	}
	
	//根据id删除
	@RequestMapping(value="deleteById.action")
	public String deleteById(Model model,Long id,Long deptId,Long manager){
		
		int count=userServiceImpl.deleteById(id);
		model.addAttribute("id", deptId);
		model.addAttribute("manager",manager);
		return "forward:/userController/findByIdList.action";
	}
	
	//根据id修改部门和职位
	@RequestMapping(value="updateById")
	public String updateById(Long uId,Long changedeptid,Long positionid){
		queryVo vo=new queryVo();
		vo.setId1(uId);
		vo.setId2(changedeptid);
		vo.setId3(positionid);
		userServiceImpl.updateById(vo);
		return "redirect:/deptController/findList.action";
	}
	
	//查询全部用户
	@RequestMapping(value="queryPage.action")
	public String queryPage(Model model,queryVo vo){
		 
		
		Page<AoaUser> page=userServiceImpl.queryPage(vo);
		model.addAttribute("page", page);
		return "usermanage";
	}
	
	@RequestMapping(value="add.action")
	public  String add(MultipartFile imgFile,AoaUser user,queryVo vo) throws IllegalStateException, IOException, ParseException{
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
			
			//头像名
			user.setImgPath(imgName+extName);
		}
		
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		
		//生日
		//判断生日日期是否为空
		if(vo!=null && vo.getBirthDate()!=null && vo.getBirthDate()!=""){
			Date BirthDate=format.parse(vo.getBirthDate());
			user.setBirth(new java.sql.Date(BirthDate.getTime()));
		}
		
		
		
		//入职日期
		//判断入职日期是否为空
		if(vo!=null && vo.getHireDate()!=null && vo.getHireDate()!=""){
			Date hireDate=format.parse(vo.getHireDate());
			user.setHireTime(new java.sql.Date(hireDate.getTime()));
		}
		
		//是否是超级管理员(1:是 0:不是)
		user.setSuperman(0);
		
		
		
		int count=userServiceImpl.add(user);

		return "redirect:/userController/queryPage.action";
	}
	
	@RequestMapping(value="findById.action")
	public String findById(Model model,Long id){
		 AoaUser aoaUser=userServiceImpl.findById(id);
		 
		 
		 //生日和入职日期转换为string类型
		 SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		 queryVo vo=new queryVo();
		//判断生日日期是否为空
		 if(aoaUser!=null && aoaUser.getHireTime()!=null){
			 vo.setHireDate(format.format(new Date(aoaUser.getHireTime().getTime())));
		 }	 
		 //判断入职日期是否为空
		 if(aoaUser!=null && aoaUser.getBirth()!=null){
			 vo.setBirthDate(format.format(new Date(aoaUser.getBirth().getTime())));
		 }
		 
		 
		 //根据部门Id查询出部门下的全部职位
		 AoaPositionExample example=new AoaPositionExample();
		 example.createCriteria().andDeptidEqualTo(aoaUser.getDept().getDeptId());
		 List<AoaPosition> positions=positionServicImpl.findByList(example);
		 
		//查询全部部门
		 AoaDeptExample aoaDeptExample=new AoaDeptExample();
		List<AoaDept> depts=deptServiceImpl.findList(aoaDeptExample);
			
		//查询全部角色
		AoaRoleExample roleExample=new AoaRoleExample();
		List<AoaRole> aoaRoles=roleServiceImpl.findList(roleExample);
			
			
		 
		 model.addAttribute("user", aoaUser);
		 model.addAttribute("vo",vo);
		 model.addAttribute("positions", positions);
		 model.addAttribute("depts", depts);
		model.addAttribute("aoaRoles", aoaRoles);
		 return "useredit";
	}
	
	
	//修改
	@RequestMapping(value="update.action")
	public String update(MultipartFile imgFile,AoaUser user,queryVo vo) throws IllegalStateException, IOException, ParseException{
				//判读图片是否为空
				if(imgFile!=null && imgFile.getSize()!=0 && imgFile.getOriginalFilename()!=null){
					//uuid作为图片名
					String imgName=UUID.randomUUID().toString().replace("-","");
					//获取上传图片名
					String oriName=imgFile.getOriginalFilename();
					//获取图片后缀
					String extName=oriName.substring(oriName.lastIndexOf("."));
							
					//开始上传
					imgFile.transferTo(new File("F:/upload/"+imgName+extName));
					
					//头像名
					user.setImgPath(imgName+extName);
				}
				
				SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
				
				//生日
				//判断生日日期是否为空
				if(vo!=null && vo.getBirthDate()!=null && vo.getBirthDate()!=""){
					Date BirthDate=format.parse(vo.getBirthDate());
					user.setBirth(new java.sql.Date(BirthDate.getTime()));
				}
				
				
				
				//入职日期
				//判断入职日期是否为空
				if(vo!=null && vo.getHireDate()!=null && vo.getHireDate()!=""){
					Date hireDate=format.parse(vo.getHireDate());
					user.setHireTime(new java.sql.Date(hireDate.getTime()));
				}
				
				System.out.println(user.getImgPath());
				int count =userServiceImpl.update(user);
		
		        return "redirect:/userController/queryPage.action";
	}
	
	//删除
	@RequestMapping(value="delete.action")
	public String delete(Long id){
		int count =userServiceImpl.delete(id);
	   return "redirect:/userController/queryPage.action";
	}
	
	
	//ajax版的分页查询
	@RequestMapping(value="ajaxQueryPage.action")
	public @ResponseBody Page<AoaUser> ajaxQueryPage(queryVo vo){
		Page<AoaUser> page=userServiceImpl.queryPage(vo);
		return page;
	}
	
	//登陆
	@RequestMapping(value="login.action")
	public String login(Model model,AoaUser user,HttpServletRequest request,HttpServletResponse response,String code) throws IOException, ServletException{
		//从session中取出验证码
		String trueCode=  (String) request.getSession().getAttribute("randCheckCode");
		//判断验证码是否正确
		if(trueCode!=null && code!=null){
			if(trueCode.equalsIgnoreCase(code)){
				
				//查询
				AoaUserExample  example=new AoaUserExample();
				example.createCriteria().andUserNameEqualTo(user.getUserName());
				example.createCriteria().andPasswordEqualTo(user.getPassword());
				List<AoaUser> userList=userServiceImpl.findByList(example); 
				if(userList!=null && userList.size()!=0 && userList.get(0)!=null){
					request.getSession().setAttribute("user",userList.get(0));
					return "redirect:/jsp/index.jsp";
				}
			}
		}
		model.addAttribute("u", user);
		return "forward:/jsp/login.jsp";
	}
	
}

