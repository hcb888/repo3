package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaDirector;
import com.chaoLiuWangLuo.OASys.entity.AoaDirectorExample;
import com.chaoLiuWangLuo.OASys.entity.AoaDirectorUsers;
import com.chaoLiuWangLuo.OASys.entity.queryVo;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaDirectorMapper {
    int countByExample(AoaDirectorExample example);

    int deleteByExample(AoaDirectorExample example);

    int deleteByPrimaryKey(Long directorId);

    int insert(AoaDirector record);

    int insertSelective(AoaDirector record);

    List<AoaDirector> selectByExample(AoaDirectorExample example);

    AoaDirector selectByPrimaryKey(Long directorId);

    int updateByExampleSelective(@Param("record") AoaDirector record, @Param("example") AoaDirectorExample example);

    int updateByExample(@Param("record") AoaDirector record, @Param("example") AoaDirectorExample example);

    int updateByPrimaryKeySelective(AoaDirector record);

    int updateByPrimaryKey(AoaDirector record);

 
}