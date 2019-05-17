package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaPlanList;
import com.chaoLiuWangLuo.OASys.entity.AoaPlanListExample;
import com.chaoLiuWangLuo.OASys.entity.AoaPlanListKey;
import com.chaoLiuWangLuo.OASys.entity.queryVo;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaPlanListMapper {
    int countByExample(AoaPlanListExample example);

    int deleteByExample(AoaPlanListExample example);

    int deleteByPrimaryKey(AoaPlanListKey key);

    int insert(AoaPlanList record);

    int insertSelective(AoaPlanList record);

    List<AoaPlanList> selectByExample(AoaPlanListExample example);

    AoaPlanList selectByPrimaryKey(AoaPlanListKey key);

    int updateByExampleSelective(@Param("record") AoaPlanList record, @Param("example") AoaPlanListExample example);

    int updateByExample(@Param("record") AoaPlanList record, @Param("example") AoaPlanListExample example);

    int updateByPrimaryKeySelective(AoaPlanList record);

    int updateByPrimaryKey(AoaPlanList record);

	List<AoaPlanList> planQueryPage(queryVo vo);

	int planFindCount(queryVo vo);

	AoaPlanList findById(Long id);

	int dayWeekMonthPlanFindCount(queryVo vo);

	List<AoaPlanList> dayWeekMonthPlanQueryPage(queryVo vo);
}