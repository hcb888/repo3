package com.chaoLiuWangLuo.OASys.service;

import java.util.List;

import com.chaoLiuWangLuo.OASys.entity.AoaAttendsList;
import com.chaoLiuWangLuo.OASys.entity.AoaAttendsListExample;
import com.chaoLiuWangLuo.OASys.entity.queryVo;
import com.chaoLiuWangLuo.OASys.utils.Page;
import com.chaoLiuWangLuo.OASys.utils.monthUtils;
import com.chaoLiuWangLuo.OASys.utils.weekUtils;

public interface attendsService  {

	Page<AoaAttendsList> queryPage(queryVo vo);

	List<AoaAttendsList> findList(AoaAttendsListExample example);

	void update(AoaAttendsList attendsList);

	int delete(Long id);

	List<AoaAttendsList> findList(Long id);

	Page<weekUtils> queryAttendsWeek(queryVo vo);

	Page<weekUtils> AttendsWeekYeShu(queryVo vo);

	Page<monthUtils> queryAttendsMonthPage(queryVo vo);


}
