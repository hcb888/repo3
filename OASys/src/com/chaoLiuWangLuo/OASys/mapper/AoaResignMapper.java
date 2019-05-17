package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaResign;
import com.chaoLiuWangLuo.OASys.entity.AoaResignExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaResignMapper {
    int countByExample(AoaResignExample example);

    int deleteByExample(AoaResignExample example);

    int deleteByPrimaryKey(Long resignId);

    int insert(AoaResign record);

    int insertSelective(AoaResign record);

    List<AoaResign> selectByExample(AoaResignExample example);

    AoaResign selectByPrimaryKey(Long resignId);

    int updateByExampleSelective(@Param("record") AoaResign record, @Param("example") AoaResignExample example);

    int updateByExample(@Param("record") AoaResign record, @Param("example") AoaResignExample example);

    int updateByPrimaryKeySelective(AoaResign record);

    int updateByPrimaryKey(AoaResign record);

	AoaResign findById(Long id);
}