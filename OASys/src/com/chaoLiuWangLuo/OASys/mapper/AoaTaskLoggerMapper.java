package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaTaskLogger;
import com.chaoLiuWangLuo.OASys.entity.AoaTaskLoggerExample;
import com.chaoLiuWangLuo.OASys.entity.queryVo;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaTaskLoggerMapper {
    int countByExample(AoaTaskLoggerExample example);

    int deleteByExample(AoaTaskLoggerExample example);

    int deleteByPrimaryKey(Long loggerId);

    int insert(AoaTaskLogger record);

    int insertSelective(AoaTaskLogger record);

    List<AoaTaskLogger> selectByExample(AoaTaskLoggerExample example);

    AoaTaskLogger selectByPrimaryKey(Long loggerId);

    int updateByExampleSelective(@Param("record") AoaTaskLogger record, @Param("example") AoaTaskLoggerExample example);

    int updateByExample(@Param("record") AoaTaskLogger record, @Param("example") AoaTaskLoggerExample example);

    int updateByPrimaryKeySelective(AoaTaskLogger record);

    int updateByPrimaryKey(AoaTaskLogger record);
    
    List<AoaTaskLogger> findBytask(queryVo vo);
}