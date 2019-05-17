package com.chaoLiuWangLuo.OASys.service;

import java.util.List;

import com.chaoLiuWangLuo.OASys.entity.AoaPosition;
import com.chaoLiuWangLuo.OASys.entity.AoaPositionExample;

public interface positionServic {

	List<AoaPosition> findByList(AoaPositionExample positionExample);

	int add(AoaPosition position);

	int update(AoaPosition position);

}
