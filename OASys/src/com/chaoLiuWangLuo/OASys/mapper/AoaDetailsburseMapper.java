package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaDetailsburse;
import com.chaoLiuWangLuo.OASys.entity.AoaDetailsburseExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaDetailsburseMapper {
    int countByExample(AoaDetailsburseExample example);

    int deleteByExample(AoaDetailsburseExample example);

    int deleteByPrimaryKey(Long detailsburseId);

    int insert(AoaDetailsburse record);

    int insertSelective(AoaDetailsburse record);

    List<AoaDetailsburse> selectByExample(AoaDetailsburseExample example);

    AoaDetailsburse selectByPrimaryKey(Long detailsburseId);

    int updateByExampleSelective(@Param("record") AoaDetailsburse record, @Param("example") AoaDetailsburseExample example);

    int updateByExample(@Param("record") AoaDetailsburse record, @Param("example") AoaDetailsburseExample example);

    int updateByPrimaryKeySelective(AoaDetailsburse record);

    int updateByPrimaryKey(AoaDetailsburse record);

	List<AoaDetailsburse> findList(Long bursementId);
}