package com.chaoLiuWangLuo.OASys.service;

import java.util.List;

import com.chaoLiuWangLuo.OASys.entity.AoaUser;
import com.chaoLiuWangLuo.OASys.entity.AoaUserExample;
import com.chaoLiuWangLuo.OASys.entity.queryVo;
import com.chaoLiuWangLuo.OASys.utils.Page;

public interface userService {

	List<AoaUser> findByIdList(Long id);

	List<AoaUser> findByList(AoaUserExample example);

	int deleteById(Long id);

	void updateById(queryVo vo);

	List<AoaUser> findList();

	Page<AoaUser> queryPage(queryVo vo);

	int add(AoaUser user);

	AoaUser findById(Long id);

	int update(AoaUser user);

	int delete(Long id);

}
