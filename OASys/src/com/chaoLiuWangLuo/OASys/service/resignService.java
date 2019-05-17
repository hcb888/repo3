package com.chaoLiuWangLuo.OASys.service;

import com.chaoLiuWangLuo.OASys.entity.AoaResign;

public interface resignService {

	int resignAdd(AoaResign resign);

	AoaResign findById(Long id);

}
