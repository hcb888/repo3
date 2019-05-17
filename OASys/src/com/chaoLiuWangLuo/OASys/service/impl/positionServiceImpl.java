package com.chaoLiuWangLuo.OASys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chaoLiuWangLuo.OASys.entity.AoaPosition;
import com.chaoLiuWangLuo.OASys.entity.AoaPositionExample;
import com.chaoLiuWangLuo.OASys.mapper.AoaPositionMapper;
import com.chaoLiuWangLuo.OASys.service.positionServic;

@Service
@Transactional
public class positionServiceImpl implements positionServic {
	@Autowired
	private AoaPositionMapper mapper;

	public List<AoaPosition> findByList(AoaPositionExample positionExample) {
		List<AoaPosition> list= mapper.selectByExample(positionExample);
		return list;
	}

	public int add(AoaPosition position) {
		int count=mapper.insert(position);
		return count;
	}

	public int update(AoaPosition position) {
		int count =mapper.updateByPrimaryKey(position);
		return count;
	}
	
}
