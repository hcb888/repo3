package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaNoticeUserRelation;
import com.chaoLiuWangLuo.OASys.entity.AoaNoticeUserRelationExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaNoticeUserRelationMapper {
    int countByExample(AoaNoticeUserRelationExample example);

    int deleteByExample(AoaNoticeUserRelationExample example);

    int deleteByPrimaryKey(Long relatinId);

    int insert(AoaNoticeUserRelation record);

    int insertSelective(AoaNoticeUserRelation record);

    List<AoaNoticeUserRelation> selectByExample(AoaNoticeUserRelationExample example);

    AoaNoticeUserRelation selectByPrimaryKey(Long relatinId);

    int updateByExampleSelective(@Param("record") AoaNoticeUserRelation record, @Param("example") AoaNoticeUserRelationExample example);

    int updateByExample(@Param("record") AoaNoticeUserRelation record, @Param("example") AoaNoticeUserRelationExample example);

    int updateByPrimaryKeySelective(AoaNoticeUserRelation record);

    int updateByPrimaryKey(AoaNoticeUserRelation record);
}