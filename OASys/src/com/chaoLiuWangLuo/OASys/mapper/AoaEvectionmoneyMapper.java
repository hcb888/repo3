package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaEvectionmoney;
import com.chaoLiuWangLuo.OASys.entity.AoaEvectionmoneyExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaEvectionmoneyMapper {
    int countByExample(AoaEvectionmoneyExample example);

    int deleteByExample(AoaEvectionmoneyExample example);

    int deleteByPrimaryKey(Long evectionmoneyId);

    int insert(AoaEvectionmoney record);

    int insertSelective(AoaEvectionmoney record);

    List<AoaEvectionmoney> selectByExample(AoaEvectionmoneyExample example);

    AoaEvectionmoney selectByPrimaryKey(Long evectionmoneyId);

    int updateByExampleSelective(@Param("record") AoaEvectionmoney record, @Param("example") AoaEvectionmoneyExample example);

    int updateByExample(@Param("record") AoaEvectionmoney record, @Param("example") AoaEvectionmoneyExample example);

    int updateByPrimaryKeySelective(AoaEvectionmoney record);

    int updateByPrimaryKey(AoaEvectionmoney record);

	AoaEvectionmoney findById(Long id);
}