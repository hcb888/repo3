package com.chaoLiuWangLuo.OASys.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chaoLiuWangLuo.OASys.entity.AoaStay;
import com.chaoLiuWangLuo.OASys.mapper.AoaStayMapper;
import com.chaoLiuWangLuo.OASys.service.stayService;

@Service
@Transactional
public class stayServiceImpl  implements stayService{
	@Autowired
	private AoaStayMapper mapper;

	public int addStay(AoaStay stay) {
		// TODO Auto-generated method stub
		return mapper.insert(stay);
	}

	public List<AoaStay> findByList(Long evectionmoneyId) {
		 List<AoaStay> list=mapper.findByList(evectionmoneyId);
		 for (AoaStay aoaStay : list) {
			SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			if(aoaStay!=null && aoaStay.getStayTime()!=null){
				aoaStay.setStayDate(dateFormat.format(new Date(aoaStay.getStayTime().getTime())));
			}
			if(aoaStay!=null && aoaStay.getLeaveTime()!=null){
				aoaStay.setLeaveDate(dateFormat.format(new Date(aoaStay.getLeaveTime().getTime())));
			}
		}
		return list;
	}
}
