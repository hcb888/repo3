package com.chaoLiuWangLuo.OASys.service;

import java.util.List;

import com.chaoLiuWangLuo.OASys.entity.AoaTypeList;
import com.chaoLiuWangLuo.OASys.entity.AoaTypeListExample;
import com.chaoLiuWangLuo.OASys.entity.queryVo;
import com.chaoLiuWangLuo.OASys.utils.Page;

public interface typeService {

	Page<AoaTypeList> queryPage(queryVo vo);

	int add(AoaTypeList type);

	List<AoaTypeList> findList(AoaTypeListExample example);

	int update(AoaTypeList type);

	int delete(Long id);

	AoaTypeList findByName(queryVo vo);

}
