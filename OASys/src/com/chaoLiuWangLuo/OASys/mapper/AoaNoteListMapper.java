package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaNoteList;
import com.chaoLiuWangLuo.OASys.entity.AoaNoteListExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaNoteListMapper {
    int countByExample(AoaNoteListExample example);

    int deleteByExample(AoaNoteListExample example);

    int deleteByPrimaryKey(Long noteId);

    int insert(AoaNoteList record);

    int insertSelective(AoaNoteList record);

    List<AoaNoteList> selectByExample(AoaNoteListExample example);

    AoaNoteList selectByPrimaryKey(Long noteId);

    int updateByExampleSelective(@Param("record") AoaNoteList record, @Param("example") AoaNoteListExample example);

    int updateByExample(@Param("record") AoaNoteList record, @Param("example") AoaNoteListExample example);

    int updateByPrimaryKeySelective(AoaNoteList record);

    int updateByPrimaryKey(AoaNoteList record);
}