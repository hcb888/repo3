package com.chaoLiuWangLuo.OASys.service;

import com.chaoLiuWangLuo.OASys.entity.AoaEvection;

public interface evectionService {

	int add(AoaEvection evection);

	AoaEvection findById(Long id);

}
