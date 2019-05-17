package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaReviewed;
import com.chaoLiuWangLuo.OASys.entity.AoaReviewedExample;
import com.chaoLiuWangLuo.OASys.entity.queryVo;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaReviewedMapper {
    int countByExample(AoaReviewedExample example);

    int deleteByExample(AoaReviewedExample example);

    int deleteByPrimaryKey(Long reviewedId);

    int insert(AoaReviewed record);

    int insertSelective(AoaReviewed record);

    List<AoaReviewed> selectByExample(AoaReviewedExample example);

    AoaReviewed selectByPrimaryKey(Long reviewedId);

    int updateByExampleSelective(@Param("record") AoaReviewed record, @Param("example") AoaReviewedExample example);

    int updateByExample(@Param("record") AoaReviewed record, @Param("example") AoaReviewedExample example);

    int updateByPrimaryKeySelective(AoaReviewed record);

    int updateByPrimaryKey(AoaReviewed record);

	List<AoaReviewed> findByList(Long bursementId);

	List<AoaReviewed> reviewedQueryPage(queryVo vo);

	int reviewedFindCount(queryVo vo);

	AoaReviewed findById(queryVo vo);

	List<AoaReviewed> findProcessByReviewedList(Long processId);
}