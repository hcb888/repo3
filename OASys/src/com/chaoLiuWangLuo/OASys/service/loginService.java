package com.chaoLiuWangLuo.OASys.service;

import com.chaoLiuWangLuo.OASys.entity.AoaUserLoginRecord;
import com.chaoLiuWangLuo.OASys.entity.queryVo;
import com.chaoLiuWangLuo.OASys.utils.Page;

public interface loginService {

	Page<AoaUserLoginRecord> queryPage(queryVo vo);

}
