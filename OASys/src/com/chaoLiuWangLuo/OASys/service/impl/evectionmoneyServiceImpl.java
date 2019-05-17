package com.chaoLiuWangLuo.OASys.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chaoLiuWangLuo.OASys.entity.AoaEvectionmoney;
import com.chaoLiuWangLuo.OASys.mapper.AoaEvectionmoneyMapper;
import com.chaoLiuWangLuo.OASys.service.evectionmoneyService;

@Service
@Transactional
public class evectionmoneyServiceImpl implements evectionmoneyService {
	@Autowired
	private AoaEvectionmoneyMapper mapper;

	public int addEvectionmoney(AoaEvectionmoney evectionmoney) {
		 
		return mapper.insert(evectionmoney);
	}

	public AoaEvectionmoney findById(Long id) {
		AoaEvectionmoney evectionmoney=mapper.findById(id);
		SimpleDateFormat format= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 if(evectionmoney!=null && evectionmoney.getEvectionmoneyPro()!=null && evectionmoney.getEvectionmoneyPro().getApplyTime()!=null){
			 evectionmoney.getEvectionmoneyPro().setApplyDate(format.format(new Date(evectionmoney.getEvectionmoneyPro().getApplyTime().getTime())));
		 }
		 if(evectionmoney!=null && evectionmoney.getEvectionmoneyPro()!=null && evectionmoney.getEvectionmoneyPro().getStartTime()!=null){
			 evectionmoney.getEvectionmoneyPro().setStartDate(format.format(new Date(evectionmoney.getEvectionmoneyPro().getStartTime().getTime())));
		 }
		 if(evectionmoney!=null && evectionmoney.getEvectionmoneyPro()!=null && evectionmoney.getEvectionmoneyPro().getEndTime()!=null){
			 evectionmoney.getEvectionmoneyPro().setEndDate(format.format(new Date(evectionmoney.getEvectionmoneyPro().getEndTime().getTime())));
		 }
		return evectionmoney;
	}
}
