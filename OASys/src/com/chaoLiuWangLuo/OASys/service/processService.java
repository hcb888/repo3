package com.chaoLiuWangLuo.OASys.service;

import com.chaoLiuWangLuo.OASys.entity.AoaProcessList;
import com.chaoLiuWangLuo.OASys.entity.queryVo;
import com.chaoLiuWangLuo.OASys.utils.Page;

public interface processService {

	int addProcess(AoaProcessList process);

	Page<AoaProcessList> queryPage(queryVo vo);

	AoaProcessList findById(Long id);

	void update(AoaProcessList process);

}
