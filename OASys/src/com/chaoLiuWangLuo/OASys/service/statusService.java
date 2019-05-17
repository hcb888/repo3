package com.chaoLiuWangLuo.OASys.service;

import java.util.List;

import com.chaoLiuWangLuo.OASys.entity.AoaStatusList;
import com.chaoLiuWangLuo.OASys.entity.AoaStatusListExample;
import com.chaoLiuWangLuo.OASys.entity.queryVo;
import com.chaoLiuWangLuo.OASys.utils.Page;

public interface statusService {

	Page<AoaStatusList> queryPage(queryVo vo);

	int add(AoaStatusList statusList);

	List<AoaStatusList> findList(AoaStatusListExample example);

	int update(AoaStatusList statusList);

	int delete(Long id);

}
