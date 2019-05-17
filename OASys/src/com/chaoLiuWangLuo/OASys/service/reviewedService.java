package com.chaoLiuWangLuo.OASys.service;

import java.util.List;

import com.chaoLiuWangLuo.OASys.entity.AoaReviewed;
import com.chaoLiuWangLuo.OASys.entity.queryVo;
import com.chaoLiuWangLuo.OASys.utils.Page;

public interface reviewedService {

	int addReviewed(AoaReviewed reviewed);

	List<AoaReviewed> findByList(Long id);

	Page<AoaReviewed> queryPage(queryVo vo);

	AoaReviewed findById(queryVo vo);

	void update(AoaReviewed reviewed);

	 

}
