package com.chaoLiuWangLuo.OASys.service;

import java.util.List;

import com.chaoLiuWangLuo.OASys.entity.AoaDept;
import com.chaoLiuWangLuo.OASys.entity.AoaDeptExample;

public interface deptService {

	List<AoaDept> findList(AoaDeptExample example);

	int add(AoaDept dept);

	int update(AoaDept dept);

}
