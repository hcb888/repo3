package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaTypeList;
import com.chaoLiuWangLuo.OASys.entity.AoaTypeListExample;
import com.chaoLiuWangLuo.OASys.entity.queryVo;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaTypeListMapper {
    int countByExample(AoaTypeListExample example);

    int deleteByExample(AoaTypeListExample example);

    int deleteByPrimaryKey(Long typeId);

    int insert(AoaTypeList record);

    int insertSelective(AoaTypeList record);

    List<AoaTypeList> selectByExample(AoaTypeListExample example);

    AoaTypeList selectByPrimaryKey(Long typeId);

    int updateByExampleSelective(@Param("record") AoaTypeList record, @Param("example") AoaTypeListExample example);

    int updateByExample(@Param("record") AoaTypeList record, @Param("example") AoaTypeListExample example);

    int updateByPrimaryKeySelective(AoaTypeList record);

    int updateByPrimaryKey(AoaTypeList record);

	int typeFindCount(queryVo vo);

	List<AoaTypeList> typeQueryPage(queryVo vo);

	AoaTypeList findByName(queryVo vo);
}