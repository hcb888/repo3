package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaRegular;
import com.chaoLiuWangLuo.OASys.entity.AoaRegularExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaRegularMapper {
    int countByExample(AoaRegularExample example);

    int deleteByExample(AoaRegularExample example);

    int deleteByPrimaryKey(Long regularId);

    int insert(AoaRegular record);

    int insertSelective(AoaRegular record);

    List<AoaRegular> selectByExample(AoaRegularExample example);

    AoaRegular selectByPrimaryKey(Long regularId);

    int updateByExampleSelective(@Param("record") AoaRegular record, @Param("example") AoaRegularExample example);

    int updateByExample(@Param("record") AoaRegular record, @Param("example") AoaRegularExample example);

    int updateByPrimaryKeySelective(AoaRegular record);

    int updateByPrimaryKey(AoaRegular record);

	AoaRegular findById(Long id);
}