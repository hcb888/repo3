package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaTaskList;
import com.chaoLiuWangLuo.OASys.entity.AoaTaskListExample;
import com.chaoLiuWangLuo.OASys.entity.queryVo;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaTaskListMapper {
    int countByExample(AoaTaskListExample example);

    int deleteByExample(AoaTaskListExample example);

    int deleteByPrimaryKey(Long taskId);

    int insert(AoaTaskList record);

    int insertSelective(AoaTaskList record);

    List<AoaTaskList> selectByExample(AoaTaskListExample example);

    AoaTaskList selectByPrimaryKey(Long taskId);

    int updateByExampleSelective(@Param("record") AoaTaskList record, @Param("example") AoaTaskListExample example);

    int updateByExample(@Param("record") AoaTaskList record, @Param("example") AoaTaskListExample example);

    int updateByPrimaryKeySelective(AoaTaskList record);

    int updateByPrimaryKey(AoaTaskList record);

	int taskFindCount(queryVo vo);

	List<AoaTaskList> taskQueryPage(queryVo vo);

	AoaTaskList findById(Long id);
	
	Long add(AoaTaskList list) ;

	 
}