package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaMailnumber;
import com.chaoLiuWangLuo.OASys.entity.AoaMailnumberExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaMailnumberMapper {
    int countByExample(AoaMailnumberExample example);

    int deleteByExample(AoaMailnumberExample example);

    int deleteByPrimaryKey(Long mailNumberId);

    int insert(AoaMailnumber record);

    int insertSelective(AoaMailnumber record);

    List<AoaMailnumber> selectByExample(AoaMailnumberExample example);

    AoaMailnumber selectByPrimaryKey(Long mailNumberId);

    int updateByExampleSelective(@Param("record") AoaMailnumber record, @Param("example") AoaMailnumberExample example);

    int updateByExample(@Param("record") AoaMailnumber record, @Param("example") AoaMailnumberExample example);

    int updateByPrimaryKeySelective(AoaMailnumber record);

    int updateByPrimaryKey(AoaMailnumber record);
}