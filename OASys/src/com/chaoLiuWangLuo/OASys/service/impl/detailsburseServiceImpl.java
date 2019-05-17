package com.chaoLiuWangLuo.OASys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chaoLiuWangLuo.OASys.entity.AoaDetailsburse;
import com.chaoLiuWangLuo.OASys.mapper.AoaDetailsburseMapper;
import com.chaoLiuWangLuo.OASys.service.detailsburseService;

@Service
@Transactional
public class detailsburseServiceImpl implements detailsburseService {
	@Autowired
	private AoaDetailsburseMapper mapper;

	public int addDetailsburse(AoaDetailsburse detailsburse) {
		 
		return mapper.insert(detailsburse);
	}

	public List<AoaDetailsburse> findList(Long bursementId) {
		 
		return mapper.findList(bursementId);
	}
}
