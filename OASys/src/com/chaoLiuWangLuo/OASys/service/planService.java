package com.chaoLiuWangLuo.OASys.service;

import com.chaoLiuWangLuo.OASys.entity.AoaPlanList;
import com.chaoLiuWangLuo.OASys.entity.queryVo;
import com.chaoLiuWangLuo.OASys.utils.Page;

public interface planService {

	Page<AoaPlanList> queryPage(queryVo vo);

	int add(AoaPlanList plan);

	AoaPlanList findById(Long id);

	int update(AoaPlanList plan);

	int delete(long id);

	Page<AoaPlanList> dayWeekMonthPlanQueryPage(queryVo vo);

	int updatePlanComment(AoaPlanList plan);

}
