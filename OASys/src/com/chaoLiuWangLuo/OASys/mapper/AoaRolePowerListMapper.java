package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaRolePowerList;
import com.chaoLiuWangLuo.OASys.entity.AoaRolePowerListExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaRolePowerListMapper {
    int countByExample(AoaRolePowerListExample example);

    int deleteByExample(AoaRolePowerListExample example);

    int deleteByPrimaryKey(Long pkId);

    int insert(AoaRolePowerList record);

    int insertSelective(AoaRolePowerList record);

    List<AoaRolePowerList> selectByExample(AoaRolePowerListExample example);

    AoaRolePowerList selectByPrimaryKey(Long pkId);

    int updateByExampleSelective(@Param("record") AoaRolePowerList record, @Param("example") AoaRolePowerListExample example);

    int updateByExample(@Param("record") AoaRolePowerList record, @Param("example") AoaRolePowerListExample example);

    int updateByPrimaryKeySelective(AoaRolePowerList record);

    int updateByPrimaryKey(AoaRolePowerList record);
}