package com.chaoLiuWangLuo.OASys.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chaoLiuWangLuo.OASys.entity.AoaTraffic;
import com.chaoLiuWangLuo.OASys.mapper.AoaTrafficMapper;
import com.chaoLiuWangLuo.OASys.service.trafficService;

@Service
@Transactional
public class trafficServiceImpl implements trafficService {
	@Autowired
	private AoaTrafficMapper mapper;

	public int addTraffic(AoaTraffic traffic) {
		 
		return mapper.insert(traffic);
	}

	public List<AoaTraffic> findByList(Long evectionmoneyId) {
		List<AoaTraffic>  list=mapper.findByList(evectionmoneyId);
		for (AoaTraffic aoaTraffic : list) {
			if(aoaTraffic!=null  && aoaTraffic.getDepartTime()!=null){
				SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				aoaTraffic.setDepartDate(dateFormat.format(new Date(aoaTraffic.getDepartTime().getTime())));
			}
		}
		return list;
	}
}
