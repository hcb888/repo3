package com.chaoLiuWangLuo.OASys.service;

import com.chaoLiuWangLuo.OASys.entity.AoaOvertime;

public interface overtimeService {

	int overtimeAdd(AoaOvertime overtime);

	AoaOvertime findById(Long id);

}
