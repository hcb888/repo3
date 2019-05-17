package com.chaoLiuWangLuo.OASys.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chaoLiuWangLuo.OASys.entity.AoaRegular;
import com.chaoLiuWangLuo.OASys.mapper.AoaRegularMapper;
import com.chaoLiuWangLuo.OASys.service.regularService;

@Service
@Transactional
public class regularServiceImpl implements regularService {
	@Autowired
	private AoaRegularMapper mapper;

	public int add(AoaRegular regular) {
		 
		return mapper.insert(regular);
	}

	public AoaRegular findById(Long id) {
		AoaRegular regular=mapper.findById(id);
		 SimpleDateFormat format= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 if(regular!=null && regular.getProcess()!=null && regular.getProcess().getApplyTime()!=null){
			 regular.getProcess().setApplyDate(format.format(new Date(regular.getProcess().getApplyTime().getTime())));
		 }
		 if(regular!=null && regular.getProcess()!=null && regular.getProcess().getStartTime()!=null){
			 regular.getProcess().setStartDate(format.format(new Date(regular.getProcess().getStartTime().getTime())));
		 }
		 if(regular!=null && regular.getProcess()!=null && regular.getProcess().getEndTime()!=null){
			 regular.getProcess().setEndDate(format.format(new Date(regular.getProcess().getEndTime().getTime())));
		 }
		return regular;
	}
}
