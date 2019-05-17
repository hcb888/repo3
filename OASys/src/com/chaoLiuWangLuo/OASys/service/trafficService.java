package com.chaoLiuWangLuo.OASys.service;

import java.util.List;

import com.chaoLiuWangLuo.OASys.entity.AoaTraffic;

public interface trafficService {

	int addTraffic(AoaTraffic traffic);

	List<AoaTraffic> findByList(Long evectionmoneyId);

}
