package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaProcessList;
import com.chaoLiuWangLuo.OASys.entity.AoaProcessListExample;
import com.chaoLiuWangLuo.OASys.entity.queryVo;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaProcessListMapper {
    int countByExample(AoaProcessListExample example);

    int deleteByExample(AoaProcessListExample example);

    int deleteByPrimaryKey(Long processId);

    int insert(AoaProcessList record);

    int insertSelective(AoaProcessList record);

    List<AoaProcessList> selectByExampleWithBLOBs(AoaProcessListExample example);

    List<AoaProcessList> selectByExample(AoaProcessListExample example);

    AoaProcessList selectByPrimaryKey(Long processId);

    int updateByExampleSelective(@Param("record") AoaProcessList record, @Param("example") AoaProcessListExample example);

    int updateByExampleWithBLOBs(@Param("record") AoaProcessList record, @Param("example") AoaProcessListExample example);

    int updateByExample(@Param("record") AoaProcessList record, @Param("example") AoaProcessListExample example);

    int updateByPrimaryKeySelective(AoaProcessList record);

    int updateByPrimaryKeyWithBLOBs(AoaProcessList record);

    int updateByPrimaryKey(AoaProcessList record);

	int processFindCount(queryVo vo);

	List<AoaProcessList> processQueryPage(queryVo vo);

	AoaProcessList findById(Long id);
}