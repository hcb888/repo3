package com.chaoLiuWangLuo.OASys.service;

import com.chaoLiuWangLuo.OASys.entity.AoaEvectionmoney;

public interface evectionmoneyService {

	int addEvectionmoney(AoaEvectionmoney evectionmoney);

	AoaEvectionmoney findById(Long id);

}
