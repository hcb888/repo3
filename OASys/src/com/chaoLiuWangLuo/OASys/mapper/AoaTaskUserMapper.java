package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaStatusList;
import com.chaoLiuWangLuo.OASys.entity.AoaTaskUser;
import com.chaoLiuWangLuo.OASys.entity.AoaTaskUserExample;
import com.chaoLiuWangLuo.OASys.entity.queryVo;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaTaskUserMapper {
    int countByExample(AoaTaskUserExample example);

    int deleteByExample(AoaTaskUserExample example);

    int deleteByPrimaryKey(Long pkId);

    int insert(AoaTaskUser record);

    int insertSelective(AoaTaskUser record);

    List<AoaTaskUser> selectByExample(AoaTaskUserExample example);

    AoaTaskUser selectByPrimaryKey(Long pkId);

    int updateByExampleSelective(@Param("record") AoaTaskUser record, @Param("example") AoaTaskUserExample example);

    int updateByExample(@Param("record") AoaTaskUser record, @Param("example") AoaTaskUserExample example);

    int updateByPrimaryKeySelective(AoaTaskUser record);

    int updateByPrimaryKey(AoaTaskUser record);

	AoaTaskUser findById(queryVo vo);

	int taskUserFindCount(queryVo vo);

	List<AoaTaskUser> taskUserQueryPage(queryVo vo);
}