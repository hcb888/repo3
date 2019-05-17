package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaSubject;
import com.chaoLiuWangLuo.OASys.entity.AoaSubjectExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaSubjectMapper {
    int countByExample(AoaSubjectExample example);

    int deleteByExample(AoaSubjectExample example);

    int deleteByPrimaryKey(Long subjectId);

    int insert(AoaSubject record);

    int insertSelective(AoaSubject record);

    List<AoaSubject> selectByExample(AoaSubjectExample example);

    AoaSubject selectByPrimaryKey(Long subjectId);

    int updateByExampleSelective(@Param("record") AoaSubject record, @Param("example") AoaSubjectExample example);

    int updateByExample(@Param("record") AoaSubject record, @Param("example") AoaSubjectExample example);

    int updateByPrimaryKeySelective(AoaSubject record);

    int updateByPrimaryKey(AoaSubject record);
}