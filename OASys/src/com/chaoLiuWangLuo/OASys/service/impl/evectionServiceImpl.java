package com.chaoLiuWangLuo.OASys.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chaoLiuWangLuo.OASys.entity.AoaEvection;
import com.chaoLiuWangLuo.OASys.mapper.AoaEvectionMapper;
import com.chaoLiuWangLuo.OASys.service.evectionService;

@Service
@Transactional
public class evectionServiceImpl implements evectionService{
	@Autowired
	private AoaEvectionMapper mapper;

	public int add(AoaEvection evection) {
		 
		return mapper.insert(evection);
	}

	public AoaEvection findById(Long id) {
		 AoaEvection evection=mapper.findById(id);
		SimpleDateFormat format= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 if(evection!=null && evection.getProcess()!=null && evection.getProcess().getApplyTime()!=null){
			 evection.getProcess().setApplyDate(format.format(new Date(evection.getProcess().getApplyTime().getTime())));
		 }
		 if(evection!=null && evection.getProcess()!=null && evection.getProcess().getStartTime()!=null){
			 evection.getProcess().setStartDate(format.format(new Date(evection.getProcess().getStartTime().getTime())));
		 }
		 if(evection!=null && evection.getProcess()!=null && evection.getProcess().getEndTime()!=null){
			 evection.getProcess().setEndDate(format.format(new Date(evection.getProcess().getEndTime().getTime())));
		 }
		return evection;
	}
	
}
