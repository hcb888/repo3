package com.chaoLiuWangLuo.OASys.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chaoLiuWangLuo.OASys.entity.AoaBursement;
import com.chaoLiuWangLuo.OASys.mapper.AoaBursementMapper;
import com.chaoLiuWangLuo.OASys.service.bursementService;

@Service
@Transactional
public class bursementServiceImpl implements bursementService {
	@Autowired
	private AoaBursementMapper mapper;

	public int addBursement(AoaBursement bursement) {
		 
		return  mapper.insert(bursement);
	}

	public AoaBursement findById(Long id) {
		 
		return mapper.findById(id);
	}
	
}
