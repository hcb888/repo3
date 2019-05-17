package com.chaoLiuWangLuo.OASys.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chaoLiuWangLuo.OASys.entity.AoaOvertime;
import com.chaoLiuWangLuo.OASys.mapper.AoaOvertimeMapper;
import com.chaoLiuWangLuo.OASys.service.overtimeService;

@Service
@Transactional
public class overtimeServiceImpl  implements overtimeService{
	@Autowired
	private AoaOvertimeMapper mapper;

	public int overtimeAdd(AoaOvertime overtime) {
		 
		return mapper.insert(overtime);
	}

	public AoaOvertime findById(Long id) {
		 AoaOvertime overtime=mapper.findById(id);
		 SimpleDateFormat format= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 if(overtime!=null && overtime.getProcess()!=null && overtime.getProcess().getApplyTime()!=null){
			 overtime.getProcess().setApplyDate(format.format(new Date(overtime.getProcess().getApplyTime().getTime())));
		 }
		 if(overtime!=null && overtime.getProcess()!=null && overtime.getProcess().getStartTime()!=null){
			 overtime.getProcess().setStartDate(format.format(new Date(overtime.getProcess().getStartTime().getTime())));
		 }
		 if(overtime!=null && overtime.getProcess()!=null && overtime.getProcess().getEndTime()!=null){
			 overtime.getProcess().setEndDate(format.format(new Date(overtime.getProcess().getEndTime().getTime())));
		 }
		return overtime;
	}
	
}
