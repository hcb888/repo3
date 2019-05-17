package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaReceiverNote;
import com.chaoLiuWangLuo.OASys.entity.AoaReceiverNoteExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaReceiverNoteMapper {
    int countByExample(AoaReceiverNoteExample example);

    int deleteByExample(AoaReceiverNoteExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(AoaReceiverNote record);

    int insertSelective(AoaReceiverNote record);

    List<AoaReceiverNote> selectByExample(AoaReceiverNoteExample example);

    AoaReceiverNote selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") AoaReceiverNote record, @Param("example") AoaReceiverNoteExample example);

    int updateByExample(@Param("record") AoaReceiverNote record, @Param("example") AoaReceiverNoteExample example);

    int updateByPrimaryKeySelective(AoaReceiverNote record);

    int updateByPrimaryKey(AoaReceiverNote record);
}