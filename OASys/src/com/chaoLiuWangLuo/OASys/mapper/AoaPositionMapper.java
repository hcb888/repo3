package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaPosition;
import com.chaoLiuWangLuo.OASys.entity.AoaPositionExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaPositionMapper {
    int countByExample(AoaPositionExample example);

    int deleteByExample(AoaPositionExample example);

    int deleteByPrimaryKey(Long positionId);

    int insert(AoaPosition record);

    int insertSelective(AoaPosition record);

    List<AoaPosition> selectByExample(AoaPositionExample example);

    AoaPosition selectByPrimaryKey(Long positionId);

    int updateByExampleSelective(@Param("record") AoaPosition record, @Param("example") AoaPositionExample example);

    int updateByExample(@Param("record") AoaPosition record, @Param("example") AoaPositionExample example);

    int updateByPrimaryKeySelective(AoaPosition record);

    int updateByPrimaryKey(AoaPosition record);
}