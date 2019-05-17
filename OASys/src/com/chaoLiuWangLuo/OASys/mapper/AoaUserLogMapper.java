package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaUserLog;
import com.chaoLiuWangLuo.OASys.entity.AoaUserLogExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaUserLogMapper {
    int countByExample(AoaUserLogExample example);

    int deleteByExample(AoaUserLogExample example);

    int deleteByPrimaryKey(Long logId);

    int insert(AoaUserLog record);

    int insertSelective(AoaUserLog record);

    List<AoaUserLog> selectByExample(AoaUserLogExample example);

    AoaUserLog selectByPrimaryKey(Long logId);

    int updateByExampleSelective(@Param("record") AoaUserLog record, @Param("example") AoaUserLogExample example);

    int updateByExample(@Param("record") AoaUserLog record, @Param("example") AoaUserLogExample example);

    int updateByPrimaryKeySelective(AoaUserLog record);

    int updateByPrimaryKey(AoaUserLog record);
}