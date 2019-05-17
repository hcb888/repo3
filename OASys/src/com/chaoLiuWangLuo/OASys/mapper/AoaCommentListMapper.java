package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaCommentList;
import com.chaoLiuWangLuo.OASys.entity.AoaCommentListExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaCommentListMapper {
    int countByExample(AoaCommentListExample example);

    int deleteByExample(AoaCommentListExample example);

    int deleteByPrimaryKey(Long commentId);

    int insert(AoaCommentList record);

    int insertSelective(AoaCommentList record);

    List<AoaCommentList> selectByExample(AoaCommentListExample example);

    AoaCommentList selectByPrimaryKey(Long commentId);

    int updateByExampleSelective(@Param("record") AoaCommentList record, @Param("example") AoaCommentListExample example);

    int updateByExample(@Param("record") AoaCommentList record, @Param("example") AoaCommentListExample example);

    int updateByPrimaryKeySelective(AoaCommentList record);

    int updateByPrimaryKey(AoaCommentList record);
}