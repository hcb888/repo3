package com.chaoLiuWangLuo.OASys.service;

import com.chaoLiuWangLuo.OASys.entity.AoaHoliday;

public interface holidayService {

	int add(AoaHoliday holiday);

	AoaHoliday findById(Long id);

}
