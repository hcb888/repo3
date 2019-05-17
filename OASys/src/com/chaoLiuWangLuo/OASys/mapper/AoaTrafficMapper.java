package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaTraffic;
import com.chaoLiuWangLuo.OASys.entity.AoaTrafficExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaTrafficMapper {
    int countByExample(AoaTrafficExample example);

    int deleteByExample(AoaTrafficExample example);

    int deleteByPrimaryKey(Long trafficId);

    int insert(AoaTraffic record);

    int insertSelective(AoaTraffic record);

    List<AoaTraffic> selectByExample(AoaTrafficExample example);

    AoaTraffic selectByPrimaryKey(Long trafficId);

    int updateByExampleSelective(@Param("record") AoaTraffic record, @Param("example") AoaTrafficExample example);

    int updateByExample(@Param("record") AoaTraffic record, @Param("example") AoaTrafficExample example);

    int updateByPrimaryKeySelective(AoaTraffic record);

    int updateByPrimaryKey(AoaTraffic record);

	List<AoaTraffic> findByList(Long evectionmoneyId);
}