package com.chaoLiuWangLuo.OASys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chaoLiuWangLuo.OASys.entity.AoaDept;
import com.chaoLiuWangLuo.OASys.entity.AoaDeptExample;
import com.chaoLiuWangLuo.OASys.mapper.AoaDeptMapper;
import com.chaoLiuWangLuo.OASys.service.deptService;

@Service
@Transactional
public class deptServiceImpl implements deptService {
	@Autowired
	private AoaDeptMapper deptMapper;

	public List<AoaDept> findList(AoaDeptExample example) {
		List<AoaDept> depts=deptMapper.selectByExample(example);
		return depts;
	}

	public int add(AoaDept dept) {
		 int count=deptMapper.insert(dept);
		return count;
	}

	public int update(AoaDept dept) {
		int count=deptMapper.updateByPrimaryKeySelective(dept);
		return count;
	}
	
	
}
