package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaDiscussList;
import com.chaoLiuWangLuo.OASys.entity.AoaDiscussListExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaDiscussListMapper {
    int countByExample(AoaDiscussListExample example);

    int deleteByExample(AoaDiscussListExample example);

    int deleteByPrimaryKey(Long discussId);

    int insert(AoaDiscussList record);

    int insertSelective(AoaDiscussList record);

    List<AoaDiscussList> selectByExampleWithBLOBs(AoaDiscussListExample example);

    List<AoaDiscussList> selectByExample(AoaDiscussListExample example);

    AoaDiscussList selectByPrimaryKey(Long discussId);

    int updateByExampleSelective(@Param("record") AoaDiscussList record, @Param("example") AoaDiscussListExample example);

    int updateByExampleWithBLOBs(@Param("record") AoaDiscussList record, @Param("example") AoaDiscussListExample example);

    int updateByExample(@Param("record") AoaDiscussList record, @Param("example") AoaDiscussListExample example);

    int updateByPrimaryKeySelective(AoaDiscussList record);

    int updateByPrimaryKeyWithBLOBs(AoaDiscussList record);

    int updateByPrimaryKey(AoaDiscussList record);
}