package com.chaoLiuWangLuo.OASys.service;

import java.util.List;

import com.chaoLiuWangLuo.OASys.entity.AoaDetailsburse;

public interface detailsburseService {

	int addDetailsburse(AoaDetailsburse detailsburse);

	List<AoaDetailsburse> findList(Long bursementId);

}
