package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaScheduleUser;
import com.chaoLiuWangLuo.OASys.entity.AoaScheduleUserExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaScheduleUserMapper {
    int countByExample(AoaScheduleUserExample example);

    int deleteByExample(AoaScheduleUserExample example);

    int insert(AoaScheduleUser record);

    int insertSelective(AoaScheduleUser record);

    List<AoaScheduleUser> selectByExample(AoaScheduleUserExample example);

    int updateByExampleSelective(@Param("record") AoaScheduleUser record, @Param("example") AoaScheduleUserExample example);

    int updateByExample(@Param("record") AoaScheduleUser record, @Param("example") AoaScheduleUserExample example);
}