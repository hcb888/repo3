package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaRole;
import com.chaoLiuWangLuo.OASys.entity.AoaRoleExample;
import com.chaoLiuWangLuo.OASys.entity.AoaUser;
import com.chaoLiuWangLuo.OASys.entity.queryVo;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaRoleMapper {
    int countByExample(AoaRoleExample example);

    int deleteByExample(AoaRoleExample example);

    int deleteByPrimaryKey(Long roleId);

    int insert(AoaRole record);

    int insertSelective(AoaRole record);

    List<AoaRole> selectByExample(AoaRoleExample example);

    AoaRole selectByPrimaryKey(Long roleId);

    int updateByExampleSelective(@Param("record") AoaRole record, @Param("example") AoaRoleExample example);

    int updateByExample(@Param("record") AoaRole record, @Param("example") AoaRoleExample example);

    int updateByPrimaryKeySelective(AoaRole record);

    int updateByPrimaryKey(AoaRole record);

	int roleFindCount(queryVo vo);

	List<AoaRole> roleQueryPage(queryVo vo);
}