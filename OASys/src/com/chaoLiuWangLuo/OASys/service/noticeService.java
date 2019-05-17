package com.chaoLiuWangLuo.OASys.service;

import com.chaoLiuWangLuo.OASys.entity.AoaNoticeList;
import com.chaoLiuWangLuo.OASys.entity.queryVo;
import com.chaoLiuWangLuo.OASys.utils.Page;

public interface noticeService {

	Page<AoaNoticeList> queryPage(queryVo vo);

	int add(AoaNoticeList noticeList);

	AoaNoticeList findById(Long id);

	int update(AoaNoticeList aoaNoticeList);

	void delete(Long id);

}
