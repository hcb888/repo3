package com.chaoLiuWangLuo.OASys.service;

import java.util.List;

import com.chaoLiuWangLuo.OASys.entity.AoaTaskList;
import com.chaoLiuWangLuo.OASys.entity.AoaTaskLogger;
import com.chaoLiuWangLuo.OASys.entity.AoaTaskUser;
import com.chaoLiuWangLuo.OASys.entity.queryVo;
import com.chaoLiuWangLuo.OASys.utils.Page;

public interface taskService {

	Page<AoaTaskList> queryPage(queryVo vo);

	Long add(AoaTaskList task);

	AoaTaskList findById(Long id);

	int update(AoaTaskList task);

	int delete(Long id);

	int taskUserAdd(AoaTaskUser taskUser);

	AoaTaskUser taskUserFindById(String id, Long taskId);

	int taskUserDelete(Long pkId);

	List<AoaTaskLogger> findBytask(queryVo vo);

	int updateStatusAndTicking(AoaTaskList task);

 

	Page<AoaTaskUser> taskUserQueryPage(queryVo vo);

	int AddTaskLogger(AoaTaskLogger task);

	int updateTaskUser(AoaTaskUser taskUser);

}
