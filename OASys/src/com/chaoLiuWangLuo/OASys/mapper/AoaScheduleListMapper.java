package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaScheduleList;
import com.chaoLiuWangLuo.OASys.entity.AoaScheduleListExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaScheduleListMapper {
    int countByExample(AoaScheduleListExample example);

    int deleteByExample(AoaScheduleListExample example);

    int deleteByPrimaryKey(Long rcId);

    int insert(AoaScheduleList record);

    int insertSelective(AoaScheduleList record);

    List<AoaScheduleList> selectByExample(AoaScheduleListExample example);

    AoaScheduleList selectByPrimaryKey(Long rcId);

    int updateByExampleSelective(@Param("record") AoaScheduleList record, @Param("example") AoaScheduleListExample example);

    int updateByExample(@Param("record") AoaScheduleList record, @Param("example") AoaScheduleListExample example);

    int updateByPrimaryKeySelective(AoaScheduleList record);

    int updateByPrimaryKey(AoaScheduleList record);
}