package com.chaoLiuWangLuo.OASys.service;

import java.util.List;

import com.chaoLiuWangLuo.OASys.entity.AoaStay;

public interface stayService {

	int addStay(AoaStay stay);

	List<AoaStay> findByList(Long evectionmoneyId);

}
