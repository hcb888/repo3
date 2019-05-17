package com.chaoLiuWangLuo.OASys.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

 
import com.chaoLiuWangLuo.OASys.entity.AoaResign;
import com.chaoLiuWangLuo.OASys.mapper.AoaResignMapper;
import com.chaoLiuWangLuo.OASys.service.resignService;

@Service
@Transactional
public class resignServiceImpl implements resignService{
	@Autowired
	private AoaResignMapper mapper;

	public int resignAdd(AoaResign resign) {
		 
		return mapper.insert(resign);
	}

	public AoaResign findById(Long id) {
		AoaResign resign=mapper.findById(id);
		 SimpleDateFormat format= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 if(resign!=null && resign.getProcess()!=null && resign.getProcess().getApplyTime()!=null){
			 resign.getProcess().setApplyDate(format.format(new Date(resign.getProcess().getApplyTime().getTime())));
		 }
		 if(resign!=null && resign.getProcess()!=null && resign.getProcess().getStartTime()!=null){
			 resign.getProcess().setStartDate(format.format(new Date(resign.getProcess().getStartTime().getTime())));
		 }
		 if(resign!=null && resign.getProcess()!=null && resign.getProcess().getEndTime()!=null){
			 resign.getProcess().setEndDate(format.format(new Date(resign.getProcess().getEndTime().getTime())));
		 }
		return resign;
	}
}
