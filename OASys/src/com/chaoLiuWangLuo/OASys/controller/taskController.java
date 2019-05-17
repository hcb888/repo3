package com.chaoLiuWangLuo.OASys.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chaoLiuWangLuo.OASys.entity.AoaStatusList;
import com.chaoLiuWangLuo.OASys.entity.AoaStatusListExample;
import com.chaoLiuWangLuo.OASys.entity.AoaTaskList;
import com.chaoLiuWangLuo.OASys.entity.AoaTaskLogger;
import com.chaoLiuWangLuo.OASys.entity.AoaTaskUser;
import com.chaoLiuWangLuo.OASys.entity.AoaTypeList;
import com.chaoLiuWangLuo.OASys.entity.AoaTypeListExample;
import com.chaoLiuWangLuo.OASys.entity.AoaUser;
import com.chaoLiuWangLuo.OASys.entity.queryVo;
import com.chaoLiuWangLuo.OASys.service.statusService;
import com.chaoLiuWangLuo.OASys.service.taskService;
import com.chaoLiuWangLuo.OASys.service.typeService;
import com.chaoLiuWangLuo.OASys.service.impl.statusServiceImpl;
import com.chaoLiuWangLuo.OASys.service.impl.typeServiceImpl;
import com.chaoLiuWangLuo.OASys.utils.Page;

@Controller
@RequestMapping(value="/taskController/")
public class taskController {
	@Autowired
	private taskService taskServiceImpl;
	@Autowired
	private typeService typeServiceImpl;
	@Autowired
	private statusService statusServiceImpl;
	
	//分页查询
	@RequestMapping(value="queryPage.action")
	public String queryPage(Model model,queryVo vo){
		Page<AoaTaskList> page=taskServiceImpl.queryPage(vo);
		for (AoaTaskList task : page.getRows()) {
			SimpleDateFormat  format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			task.setStarDate(format.format(new Date(task.getStarTime().getTime())));
		}
		model.addAttribute("page", page);
		return "taskmanage";
	}
	
	//查询task的类型和状态
	@RequestMapping(value="typeAndStatus.action")
	public String typeAndStatus(Model model){
		AoaTypeListExample typeExample=new AoaTypeListExample();
		typeExample.createCriteria().andTypeModelEqualTo("aoa_task_list");
		List<AoaTypeList> typeLists=typeServiceImpl.findList(typeExample);
		
		AoaStatusListExample statusListExample=new AoaStatusListExample();
		statusListExample.createCriteria().andStatusModelEqualTo("aoa_task_list");
		List<AoaStatusList> statusLists=statusServiceImpl.findList(statusListExample);
		
		model.addAttribute("typeList", typeLists);
		model.addAttribute("statusList", statusLists);
		return "taskadd";
	}
	
	//添加
	@RequestMapping(value="add.action")
	public String add(AoaTaskList task,queryVo vo) throws ParseException{
		//由于现在没写登陆就用过死的数据
		AoaUser user=new AoaUser();
		user.setUserId(1l);
		task.setUser(user);
		
		
		//将时间的string类型转换成date类型
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(task!=null && task.getStarDate()!=null){
			task.setStarTime(new java.sql.Date(format.parse(task.getStarDate()).getTime()));
		}
		
		if(task!=null && task.getEndDate()!=null){
			task.setEndTime(new java.sql.Date(format.parse(task.getEndDate()).getTime()));
		}
		
		//接收人姓名
		task.setReciverlist( org.apache.commons.lang3.StringUtils.join(vo.getNameArray(),","));
		//接收人id
		task.setReciverlistId(org.apache.commons.lang3.StringUtils.join(vo.getReciverArray(), ","));
	 
		//保存任务
		Long count=taskServiceImpl.add(task);
		
		//获取id数据并且转换为long类型，加入数据库中的用户表和任务表的关系表中
		for (String userId : vo.getReciverArray()) {
			Long id=Long.valueOf(userId);
			//创建用户表和任务表的关系表对象
			AoaTaskUser taskUser=new AoaTaskUser();
				//创建状态对象
				AoaStatusList status=new AoaStatusList();
				status.setStatusId(3l);
				//创建用户对象
				AoaUser aoaUser=new AoaUser();
				aoaUser.setUserId(id);
				
				taskUser.setStatus(status);
				taskUser.setTask(task);
				taskUser.setUser(aoaUser);
			
			//保存
			int tucount =taskServiceImpl.taskUserAdd(taskUser);
		}

		return "redirect:/taskController/queryPage.action";
	}
	
	//根据id查询
	@RequestMapping(value="findById.action")
	public String findById(Model model ,Long id){
		AoaTypeListExample typeExample=new AoaTypeListExample();
		typeExample.createCriteria().andTypeModelEqualTo("aoa_task_list");
		List<AoaTypeList> typeLists=typeServiceImpl.findList(typeExample);
		
		AoaStatusListExample statusListExample=new AoaStatusListExample();
		statusListExample.createCriteria().andStatusModelEqualTo("aoa_task_list");
		List<AoaStatusList> statusLists=statusServiceImpl.findList(statusListExample);
		
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		AoaTaskList task=taskServiceImpl.findById(id);
		
		if(task!=null && task.getStarTime()!=null){
			task.setStarDate(format.format(new Date(task.getStarTime().getTime())));
		}
		if(task!=null && task.getEndTime()!=null){
			task.setEndDate(format.format(new Date(task.getEndTime().getTime())));
		}
		
		model.addAttribute("typeList", typeLists);
		model.addAttribute("statusList", statusLists);
		model.addAttribute("task", task);
		return "taskedit";
	}
	
	
	//修改
	@RequestMapping(value="update.action")
	public String update(AoaTaskList task,queryVo vo) throws ParseException{
			//判断传上来的task对象id是否为空
			if(task!=null && task.getTaskId()!=null){
				//不管提交的任务接收人如何先把以前的删除，在添加
				//根据id查询AoaTaskList表
				AoaTaskList aoaTaskList=taskServiceImpl.findById(task.getTaskId());
				//拿出任务指派人员的id转换为数组
				String[] ids=org.apache.commons.lang3.StringUtils.split(aoaTaskList.getReciverlistId(),",");
				
				
				//提交上来的指派人和查询出来的指派人相同部分的id
				//数据库id
				List<String> list1=new ArrayList<String>();
				for (String id : ids) {
					list1.add(id);
				}
				//提交上来的id
				List<String> list2=new ArrayList<String>();
				for (String id : vo.getReciverArray()) {
					list2.add(id);
				}
				
				//去掉数据库查询出来的id和提交上来id的相同部分
				list1.removeAll(list2);
				list2.removeAll(Arrays.asList(ids));
				
				
				//删除
				//循环list1拿出指派人员id
				for (String id : list1) {
					//根据任务表id和用户id，查询出用户表和任务表的关系表的id
					AoaTaskUser taskUser=taskServiceImpl.taskUserFindById(id,task.getTaskId());
					//根据id删除
					int dcount=taskServiceImpl.taskUserDelete(taskUser.getPkId());
				}
				
				//添加
				//获取id数据并且转换为long类型，加入数据库中的用户表和任务表的关系表中
				for (String userId : list2) {
					Long id=Long.valueOf(userId);
					//创建用户表和任务表的关系表对象
					AoaTaskUser taskUser=new AoaTaskUser();
						//创建状态对象
						AoaStatusList status=new AoaStatusList();
						status.setStatusId(3l);
						//创建用户对象
						AoaUser aoaUser=new AoaUser();
						aoaUser.setUserId(id);
						
						taskUser.setStatus(status);
						taskUser.setTask(task);
						taskUser.setUser(aoaUser);
					
					//保存
					int tucount =taskServiceImpl.taskUserAdd(taskUser);
				}
			}

		 	SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			if(task!=null && task.getStarDate()!=null){
				task.setStarTime(new java.sql.Date(format.parse(task.getStarDate()).getTime()));
			}
					
			if(task!=null && task.getEndDate()!=null){
				task.setEndTime(new java.sql.Date(format.parse(task.getEndDate()).getTime()));
			}
			
			//接收人姓名
			task.setReciverlist( org.apache.commons.lang3.StringUtils.join(vo.getNameArray(),","));
			//接收人id
			task.setReciverlistId(org.apache.commons.lang3.StringUtils.join(vo.getReciverArray(), ","));
			
			//修改时间
			task.setModifyTime(new java.sql.Date(System.currentTimeMillis()));
			int count =taskServiceImpl.update(task); 
	 
 
		
			return "redirect:/taskController/queryPage.action";
	}
	
	//根据id查询
	@RequestMapping(value="findByIdTask.action")
	public String findByIdTask(Model model, Long  id){
		AoaStatusListExample statusListExample=new AoaStatusListExample();
		statusListExample.createCriteria().andStatusModelEqualTo("aoa_task_list");
		List<AoaStatusList> statusLists=statusServiceImpl.findList(statusListExample);
		
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		AoaTaskList task=taskServiceImpl.findById(id);
		
		if(task!=null && task.getStarTime()!=null){
			task.setStarDate(format.format(new Date(task.getStarTime().getTime())));
		}
		if(task!=null && task.getEndTime()!=null){
			task.setEndDate(format.format(new Date(task.getEndTime().getTime())));
		}
		
		//将查询出来指派人转换成数组
		String [] array=org.apache.commons.lang3.StringUtils.split(task.getReciverlist(),",");
		
		List<List<AoaTaskLogger>> aoaTaskLoggers=new ArrayList();
		if(array!=null && array.length!=0){
			for (String name : array) {
				queryVo vo=new queryVo();
				vo.setId1(task.getTaskId());
				vo.setName(name);
				List<AoaTaskLogger> taskLogger=taskServiceImpl.findBytask(vo);
				if(taskLogger!=null && taskLogger.size()!=0){
					for (AoaTaskLogger t : taskLogger) {
						if(t!=null &&  t.getCreateTime()!=null){
							t.setCreateDate(format.format(new Date(t.getCreateTime().getTime())));
						}
					}
				}
				 
				
				if(taskLogger!=null && taskLogger.size()!=0){
					aoaTaskLoggers.add(taskLogger);
				} 
			
			}
		}
		
		
		model.addAttribute("statusList", statusLists);
		model.addAttribute("task", task);
		model.addAttribute("taskLoggerList", aoaTaskLoggers);
		
		return "tasksee";
	}
	
	//查询当前登陆用户的任务
	@RequestMapping(value="taskUserQueryPage.action")
	public String taskUserQueryPage(Model model,queryVo vo){
		//由于现在没写登陆就用过死的数据
		 Long userId=1l;
		 vo.setId1(userId);
		 
		 Page<AoaTaskUser> page=taskServiceImpl.taskUserQueryPage(vo);
		 model.addAttribute("page", page);
				
		return "mytask";
	}
	
	//根据id查询
		@RequestMapping(value="myFindByIdTask.action")
		public String myFindByIdTask(Model model, Long  id,Long tuId){
			AoaStatusListExample statusListExample=new AoaStatusListExample();
			statusListExample.createCriteria().andStatusModelEqualTo("aoa_task_list");
			List<AoaStatusList> statusLists=statusServiceImpl.findList(statusListExample);
			
			SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			
			AoaTaskList task=taskServiceImpl.findById(id);
			
			if(task!=null && task.getStarTime()!=null){
				task.setStarDate(format.format(new Date(task.getStarTime().getTime())));
			}
			if(task!=null && task.getEndTime()!=null){
				task.setEndDate(format.format(new Date(task.getEndTime().getTime())));
			}
			
			//将查询出来指派人转换成数组
			String [] array=org.apache.commons.lang3.StringUtils.split(task.getReciverlist(),",");
			
			List<List<AoaTaskLogger>> aoaTaskLoggers=new ArrayList();
			if(array!=null && array.length!=0){
				for (String name : array) {
					queryVo vo=new queryVo();
					vo.setId1(task.getTaskId());
					vo.setName(name);
					List<AoaTaskLogger> taskLogger=taskServiceImpl.findBytask(vo);
					if(taskLogger!=null && taskLogger.size()!=0){
						for (AoaTaskLogger t : taskLogger) {
							if(t!=null &&  t.getCreateTime()!=null){
								t.setCreateDate(format.format(new Date(t.getCreateTime().getTime())));
							}
						}
					}
					 
					
					if(taskLogger!=null && taskLogger.size()!=0){
						aoaTaskLoggers.add(taskLogger);
					} 
				
				}
			}
			
			
			model.addAttribute("statusList", statusLists);
			model.addAttribute("task", task);
			model.addAttribute("taskLoggerList", aoaTaskLoggers);
			model.addAttribute("tuId", tuId);
			
			return "mytasksee";
		}
	
	//修改状态和反馈
	@RequestMapping(value="updateStatusAndTicking.action")
	public String updateStatusAndTicking(AoaTaskList task){
		int count =taskServiceImpl.updateStatusAndTicking(task);
		return "redirect:/taskController/queryPage.action";
	}
	
	//修改当前用户状态和反馈
	@RequestMapping(value="myUpdateStatusAndTicking.action")
	public String myUpdateStatusAndTicking(AoaTaskLogger task, AoaTaskUser taskUser){
		//由于现在没写登陆就用过死的数据
		AoaUser user=new AoaUser();
		user.setUserId(1l);
		String username="罗密欧";
		 task.setUsername(username);
		
		 
		//修改任务状态
		taskUser.setUser(user);
		taskUser.setStatus(task.getStatus());
		int taskUserCount=taskServiceImpl.updateTaskUser(taskUser);
		
		//添加日志
		task.setCreateTime(new Date(System.currentTimeMillis()));
		int count =taskServiceImpl.AddTaskLogger(task);
		
		
		return "redirect:/taskController/taskUserQueryPage.action";
	}
	//删除
	@RequestMapping(value="delete.action")
	public String delete(Long id){
		int count=taskServiceImpl.delete(id);
		return "redirect:/taskController/queryPage.action";
	}
	
	
	 
 
}
