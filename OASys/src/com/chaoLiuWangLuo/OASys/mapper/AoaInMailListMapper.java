package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaInMailList;
import com.chaoLiuWangLuo.OASys.entity.AoaInMailListExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaInMailListMapper {
    int countByExample(AoaInMailListExample example);

    int deleteByExample(AoaInMailListExample example);

    int deleteByPrimaryKey(Long mailId);

    int insert(AoaInMailList record);

    int insertSelective(AoaInMailList record);

    List<AoaInMailList> selectByExampleWithBLOBs(AoaInMailListExample example);

    List<AoaInMailList> selectByExample(AoaInMailListExample example);

    AoaInMailList selectByPrimaryKey(Long mailId);

    int updateByExampleSelective(@Param("record") AoaInMailList record, @Param("example") AoaInMailListExample example);

    int updateByExampleWithBLOBs(@Param("record") AoaInMailList record, @Param("example") AoaInMailListExample example);

    int updateByExample(@Param("record") AoaInMailList record, @Param("example") AoaInMailListExample example);

    int updateByPrimaryKeySelective(AoaInMailList record);

    int updateByPrimaryKeyWithBLOBs(AoaInMailList record);

    int updateByPrimaryKey(AoaInMailList record);
}