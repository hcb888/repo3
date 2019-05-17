package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaCatalog;
import com.chaoLiuWangLuo.OASys.entity.AoaCatalogExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaCatalogMapper {
    int countByExample(AoaCatalogExample example);

    int deleteByExample(AoaCatalogExample example);

    int deleteByPrimaryKey(Long catalogId);

    int insert(AoaCatalog record);

    int insertSelective(AoaCatalog record);

    List<AoaCatalog> selectByExample(AoaCatalogExample example);

    AoaCatalog selectByPrimaryKey(Long catalogId);

    int updateByExampleSelective(@Param("record") AoaCatalog record, @Param("example") AoaCatalogExample example);

    int updateByExample(@Param("record") AoaCatalog record, @Param("example") AoaCatalogExample example);

    int updateByPrimaryKeySelective(AoaCatalog record);

    int updateByPrimaryKey(AoaCatalog record);
}