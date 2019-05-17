package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaLoveDiscussUserExample;
import com.chaoLiuWangLuo.OASys.entity.AoaLoveDiscussUserKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaLoveDiscussUserMapper {
    int countByExample(AoaLoveDiscussUserExample example);

    int deleteByExample(AoaLoveDiscussUserExample example);

    int deleteByPrimaryKey(AoaLoveDiscussUserKey key);

    int insert(AoaLoveDiscussUserKey record);

    int insertSelective(AoaLoveDiscussUserKey record);

    List<AoaLoveDiscussUserKey> selectByExample(AoaLoveDiscussUserExample example);

    int updateByExampleSelective(@Param("record") AoaLoveDiscussUserKey record, @Param("example") AoaLoveDiscussUserExample example);

    int updateByExample(@Param("record") AoaLoveDiscussUserKey record, @Param("example") AoaLoveDiscussUserExample example);
}