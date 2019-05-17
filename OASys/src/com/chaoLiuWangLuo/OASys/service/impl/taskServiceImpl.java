package com.chaoLiuWangLuo.OASys.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chaoLiuWangLuo.OASys.entity.AoaStatusList;
import com.chaoLiuWangLuo.OASys.entity.AoaTaskList;
import com.chaoLiuWangLuo.OASys.entity.AoaTaskLogger;
import com.chaoLiuWangLuo.OASys.entity.AoaTaskUser;
import com.chaoLiuWangLuo.OASys.entity.AoaTypeList;
import com.chaoLiuWangLuo.OASys.entity.queryVo;
import com.chaoLiuWangLuo.OASys.mapper.AoaTaskListMapper;
import com.chaoLiuWangLuo.OASys.mapper.AoaTaskLoggerMapper;
import com.chaoLiuWangLuo.OASys.mapper.AoaTaskUserMapper;
import com.chaoLiuWangLuo.OASys.service.taskService;
import com.chaoLiuWangLuo.OASys.utils.Page;

@Service
@Transactional
public class taskServiceImpl implements taskService {
	@Autowired
	private AoaTaskListMapper mapper;
	@Autowired
	private AoaTaskUserMapper taskUserMapper;
	@Autowired
	private AoaTaskLoggerMapper loggerMapper;

	public Page<AoaTaskList> queryPage(queryVo vo) {
		Page<AoaTaskList> page=new Page<AoaTaskList>();
		//判断当前页数是否为空
		if(vo.getPage()==null){
			vo.setPage(1);
		} 
		
		//判断当前显示页数是否为空
		if(vo.getSize()==null){
			vo.setSize(10);
		}
		
		//算出开始条数
		vo.setStartRow((vo.getPage()-1)*vo.getSize());
		
		//查询总条数
		int count=mapper.taskFindCount(vo);
		//查询数据
		List<AoaTaskList> list=mapper.taskQueryPage(vo);
		
		page.setPage(vo.getPage());
		page.setSize(vo.getSize());
		page.setTotal(count);
		page.setRows(list);
 
		return page;
	}

	public Long add(AoaTaskList task) {
		 Long count=mapper.add(task);
		return count;
	}

	public AoaTaskList findById(Long id) {
		 AoaTaskList task=mapper.findById(id);
		return task;
	}

	public int update(AoaTaskList task) {
		int count=mapper.updateByPrimaryKeySelective(task);
		return count;
	}

	public int delete(Long id) {
		 int count=mapper.deleteByPrimaryKey(id);
		return count;
	}

	public int taskUserAdd(AoaTaskUser taskUser) {
		int count=taskUserMapper.insert(taskUser);
		
		return count;
	}

	public AoaTaskUser taskUserFindById(String id, Long taskId) {
		queryVo vo=new queryVo();
		vo.setId1(Long.valueOf(id));
		vo.setId2(taskId);
		AoaTaskUser taskUser =taskUserMapper.findById(vo);
		return taskUser;
	}

	public int taskUserDelete(Long pkId) {
		 
		return  taskUserMapper.deleteByPrimaryKey(pkId);
	}

	public List<AoaTaskLogger> findBytask(queryVo vo) {
		
		return loggerMapper.findBytask(vo);
	}

	public int updateStatusAndTicking(AoaTaskList task) {
		
		return mapper.updateByPrimaryKeySelective(task);
	}

	public Page<AoaTaskUser> taskUserQueryPage(queryVo vo) {
		Page<AoaTaskUser> page=new Page<AoaTaskUser>();
		//判断当前页数是否为空
		if(vo.getPage()==null){
			vo.setPage(1);
		} 
		
		//判断当前显示页数是否为空
		if(vo.getSize()==null){
			vo.setSize(10);
		}
		
		//算出开始条数
		vo.setStartRow((vo.getPage()-1)*vo.getSize());
		
		//查询总条数
		int count=taskUserMapper.taskUserFindCount(vo);
		//查询数据
		List<AoaTaskUser> list=taskUserMapper.taskUserQueryPage(vo);
		
		for (AoaTaskUser aoaTaskUser : list) {
			if(aoaTaskUser.getTask()!=null && aoaTaskUser.getTask().getStarTime()!=null){
				aoaTaskUser.getTask().setStarDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(aoaTaskUser.getTask().getStarTime().getTime())));
				
			}
			
		}
		
		page.setPage(vo.getPage());
		page.setSize(vo.getSize());
		page.setTotal(count);
		page.setRows(list);
		
		return page;
	}

	public int AddTaskLogger(AoaTaskLogger task) {
		 
		return loggerMapper.insert(task);
	}

	public int updateTaskUser(AoaTaskUser taskUser) {
		
		return taskUserMapper.updateByPrimaryKeySelective(taskUser);
	}

 
	
	
	 
}
