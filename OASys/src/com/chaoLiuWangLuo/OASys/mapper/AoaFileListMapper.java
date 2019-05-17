package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaFileList;
import com.chaoLiuWangLuo.OASys.entity.AoaFileListExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaFileListMapper {
    int countByExample(AoaFileListExample example);

    int deleteByExample(AoaFileListExample example);

    int deleteByPrimaryKey(Long fileId);

    int insert(AoaFileList record);

    int insertSelective(AoaFileList record);

    List<AoaFileList> selectByExample(AoaFileListExample example);

    AoaFileList selectByPrimaryKey(Long fileId);

    int updateByExampleSelective(@Param("record") AoaFileList record, @Param("example") AoaFileListExample example);

    int updateByExample(@Param("record") AoaFileList record, @Param("example") AoaFileListExample example);

    int updateByPrimaryKeySelective(AoaFileList record);

    int updateByPrimaryKey(AoaFileList record);
}