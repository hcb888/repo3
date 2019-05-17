package com.chaoLiuWangLuo.OASys.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chaoLiuWangLuo.OASys.entity.AoaHoliday;
 
import com.chaoLiuWangLuo.OASys.mapper.AoaHolidayMapper;
import com.chaoLiuWangLuo.OASys.service.holidayService;

@Service
@Transactional
public class holidayServiceImpl  implements holidayService{
	@Autowired
	private AoaHolidayMapper  mapper;

	public int add(AoaHoliday holiday) {
		 
		return mapper.insert(holiday);
	}

	public AoaHoliday findById(Long id) {
		AoaHoliday holiday=mapper.findById(id);
		 SimpleDateFormat format= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 if(holiday!=null && holiday.getProcess()!=null && holiday.getProcess().getApplyTime()!=null){
			 holiday.getProcess().setApplyDate(format.format(new Date(holiday.getProcess().getApplyTime().getTime())));
		 }
		 if(holiday!=null && holiday.getProcess()!=null && holiday.getProcess().getStartTime()!=null){
			 holiday.getProcess().setStartDate(format.format(new Date(holiday.getProcess().getStartTime().getTime())));
		 }
		 if(holiday!=null && holiday.getProcess()!=null && holiday.getProcess().getEndTime()!=null){
			 holiday.getProcess().setEndDate(format.format(new Date(holiday.getProcess().getEndTime().getTime())));
		 }
		return holiday;
	}
}
