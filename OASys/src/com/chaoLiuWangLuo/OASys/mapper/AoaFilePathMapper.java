package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaFilePath;
import com.chaoLiuWangLuo.OASys.entity.AoaFilePathExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaFilePathMapper {
    int countByExample(AoaFilePathExample example);

    int deleteByExample(AoaFilePathExample example);

    int deleteByPrimaryKey(Long pathId);

    int insert(AoaFilePath record);

    int insertSelective(AoaFilePath record);

    List<AoaFilePath> selectByExample(AoaFilePathExample example);

    AoaFilePath selectByPrimaryKey(Long pathId);

    int updateByExampleSelective(@Param("record") AoaFilePath record, @Param("example") AoaFilePathExample example);

    int updateByExample(@Param("record") AoaFilePath record, @Param("example") AoaFilePathExample example);

    int updateByPrimaryKeySelective(AoaFilePath record);

    int updateByPrimaryKey(AoaFilePath record);
}