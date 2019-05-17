package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaNoticeList;
import com.chaoLiuWangLuo.OASys.entity.AoaNoticeListExample;
import com.chaoLiuWangLuo.OASys.entity.queryVo;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaNoticeListMapper {
    int countByExample(AoaNoticeListExample example);

    int deleteByExample(AoaNoticeListExample example);

    int deleteByPrimaryKey(Long noticeId);

    int insert(AoaNoticeList record);

    int insertSelective(AoaNoticeList record);

    List<AoaNoticeList> selectByExample(AoaNoticeListExample example);

    AoaNoticeList selectByPrimaryKey(Long noticeId);

    int updateByExampleSelective(@Param("record") AoaNoticeList record, @Param("example") AoaNoticeListExample example);

    int updateByExample(@Param("record") AoaNoticeList record, @Param("example") AoaNoticeListExample example);

    int updateByPrimaryKeySelective(AoaNoticeList record);

    int updateByPrimaryKey(AoaNoticeList record);
    
    List<AoaNoticeList> noticeQueryPage(queryVo  vo);

	int noticeFindCount(queryVo vo);

	AoaNoticeList findById(Long id);

	void delete(Long id);
 }