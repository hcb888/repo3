package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaBursement;
import com.chaoLiuWangLuo.OASys.entity.AoaBursementExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaBursementMapper {
    int countByExample(AoaBursementExample example);

    int deleteByExample(AoaBursementExample example);

    int deleteByPrimaryKey(Long bursementId);

    int insert(AoaBursement record);

    int insertSelective(AoaBursement record);

    List<AoaBursement> selectByExample(AoaBursementExample example);

    AoaBursement selectByPrimaryKey(Long bursementId);

    int updateByExampleSelective(@Param("record") AoaBursement record, @Param("example") AoaBursementExample example);

    int updateByExample(@Param("record") AoaBursement record, @Param("example") AoaBursementExample example);

    int updateByPrimaryKeySelective(AoaBursement record);

    int updateByPrimaryKey(AoaBursement record);

	AoaBursement findById(Long id);
}