package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaStatusList;
import com.chaoLiuWangLuo.OASys.entity.AoaStatusListExample;
import com.chaoLiuWangLuo.OASys.entity.queryVo;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaStatusListMapper {
    int countByExample(AoaStatusListExample example);

    int deleteByExample(AoaStatusListExample example);

    int deleteByPrimaryKey(Long statusId);

    int insert(AoaStatusList record);

    int insertSelective(AoaStatusList record);

    List<AoaStatusList> selectByExample(AoaStatusListExample example);

    AoaStatusList selectByPrimaryKey(Long statusId);

    int updateByExampleSelective(@Param("record") AoaStatusList record, @Param("example") AoaStatusListExample example);

    int updateByExample(@Param("record") AoaStatusList record, @Param("example") AoaStatusListExample example);

    int updateByPrimaryKeySelective(AoaStatusList record);

    int updateByPrimaryKey(AoaStatusList record);

	int statusFindCount(queryVo vo);

	List<AoaStatusList> statusQueryPage(queryVo vo);
}