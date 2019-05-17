package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaReplyList;
import com.chaoLiuWangLuo.OASys.entity.AoaReplyListExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaReplyListMapper {
    int countByExample(AoaReplyListExample example);

    int deleteByExample(AoaReplyListExample example);

    int deleteByPrimaryKey(Long replyId);

    int insert(AoaReplyList record);

    int insertSelective(AoaReplyList record);

    List<AoaReplyList> selectByExampleWithBLOBs(AoaReplyListExample example);

    List<AoaReplyList> selectByExample(AoaReplyListExample example);

    AoaReplyList selectByPrimaryKey(Long replyId);

    int updateByExampleSelective(@Param("record") AoaReplyList record, @Param("example") AoaReplyListExample example);

    int updateByExampleWithBLOBs(@Param("record") AoaReplyList record, @Param("example") AoaReplyListExample example);

    int updateByExample(@Param("record") AoaReplyList record, @Param("example") AoaReplyListExample example);

    int updateByPrimaryKeySelective(AoaReplyList record);

    int updateByPrimaryKeyWithBLOBs(AoaReplyList record);

    int updateByPrimaryKey(AoaReplyList record);
}