package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaAttachmentList;
import com.chaoLiuWangLuo.OASys.entity.AoaAttachmentListExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaAttachmentListMapper {
    int countByExample(AoaAttachmentListExample example);

    int deleteByExample(AoaAttachmentListExample example);

    int deleteByPrimaryKey(Long attachmentId);

    int insert(AoaAttachmentList record);

    int insertSelective(AoaAttachmentList record);

    List<AoaAttachmentList> selectByExample(AoaAttachmentListExample example);

    AoaAttachmentList selectByPrimaryKey(Long attachmentId);

    int updateByExampleSelective(@Param("record") AoaAttachmentList record, @Param("example") AoaAttachmentListExample example);

    int updateByExample(@Param("record") AoaAttachmentList record, @Param("example") AoaAttachmentListExample example);

    int updateByPrimaryKeySelective(AoaAttachmentList record);

    int updateByPrimaryKey(AoaAttachmentList record);
}