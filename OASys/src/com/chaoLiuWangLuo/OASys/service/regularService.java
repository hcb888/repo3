package com.chaoLiuWangLuo.OASys.service;

import com.chaoLiuWangLuo.OASys.entity.AoaRegular;

public interface regularService {

	int add(AoaRegular regular);

	AoaRegular findById(Long id);

}
