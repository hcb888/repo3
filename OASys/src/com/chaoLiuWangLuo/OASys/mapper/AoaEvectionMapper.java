package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaEvection;
import com.chaoLiuWangLuo.OASys.entity.AoaEvectionExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaEvectionMapper {
    int countByExample(AoaEvectionExample example);

    int deleteByExample(AoaEvectionExample example);

    int deleteByPrimaryKey(Long evectionId);

    int insert(AoaEvection record);

    int insertSelective(AoaEvection record);

    List<AoaEvection> selectByExample(AoaEvectionExample example);

    AoaEvection selectByPrimaryKey(Long evectionId);

    int updateByExampleSelective(@Param("record") AoaEvection record, @Param("example") AoaEvectionExample example);

    int updateByExample(@Param("record") AoaEvection record, @Param("example") AoaEvectionExample example);

    int updateByPrimaryKeySelective(AoaEvection record);

    int updateByPrimaryKey(AoaEvection record);

	AoaEvection findById(Long id);
}