package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaSysMenu;
import com.chaoLiuWangLuo.OASys.entity.AoaSysMenuExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaSysMenuMapper {
    int countByExample(AoaSysMenuExample example);

    int deleteByExample(AoaSysMenuExample example);

    int deleteByPrimaryKey(Long menuId);

    int insert(AoaSysMenu record);

    int insertSelective(AoaSysMenu record);

    List<AoaSysMenu> selectByExample(AoaSysMenuExample example);

    AoaSysMenu selectByPrimaryKey(Long menuId);

    int updateByExampleSelective(@Param("record") AoaSysMenu record, @Param("example") AoaSysMenuExample example);

    int updateByExample(@Param("record") AoaSysMenu record, @Param("example") AoaSysMenuExample example);

    int updateByPrimaryKeySelective(AoaSysMenu record);

    int updateByPrimaryKey(AoaSysMenu record);
}