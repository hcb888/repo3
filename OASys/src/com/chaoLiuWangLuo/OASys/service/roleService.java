package com.chaoLiuWangLuo.OASys.service;

import java.util.List;

import com.chaoLiuWangLuo.OASys.entity.AoaRole;
import com.chaoLiuWangLuo.OASys.entity.AoaRoleExample;
import com.chaoLiuWangLuo.OASys.entity.queryVo;
import com.chaoLiuWangLuo.OASys.utils.Page;

public interface roleService {

	List<AoaRole> findList(AoaRoleExample roleExample);

	Page<AoaRole> queryPage(queryVo vo);

	int add(AoaRole role);

	int update(AoaRole role);

	int delete(Long id);

}
