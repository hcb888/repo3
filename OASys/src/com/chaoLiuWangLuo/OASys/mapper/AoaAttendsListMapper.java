package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaAttendsList;
import com.chaoLiuWangLuo.OASys.entity.AoaAttendsListExample;
import com.chaoLiuWangLuo.OASys.entity.queryVo;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaAttendsListMapper {
    int countByExample(AoaAttendsListExample example);

    int deleteByExample(AoaAttendsListExample example);

    int deleteByPrimaryKey(Long attendsId);

    int insert(AoaAttendsList record);

    int insertSelective(AoaAttendsList record);

    List<AoaAttendsList> selectByExample(AoaAttendsListExample example);

    AoaAttendsList selectByPrimaryKey(Long attendsId);

    int updateByExampleSelective(@Param("record") AoaAttendsList record, @Param("example") AoaAttendsListExample example);

    int updateByExample(@Param("record") AoaAttendsList record, @Param("example") AoaAttendsListExample example);

    int updateByPrimaryKeySelective(AoaAttendsList record);

    int updateByPrimaryKey(AoaAttendsList record);

	int attendsFindCount(queryVo vo);

	List<AoaAttendsList> attendsQueryPage(queryVo vo);

	List<AoaAttendsList> findList(Long id);
	
	void update(AoaAttendsList AoaAttendsList);
	
	List<AoaAttendsList> queryAttendsWeekPage(queryVo queryVo);
	

	List<Integer> queryAttendsWeekCount(queryVo vo);
	
	List<AoaAttendsList> findByWeekId(queryVo vo);

	List<Integer> queryAttendsMonthCount(queryVo vo);

	List<AoaAttendsList> queryAttendsMonthPage(queryVo vo);

	Integer findByStatusId(queryVo vo);
}