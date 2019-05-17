package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaUser;
import com.chaoLiuWangLuo.OASys.entity.AoaUserExample;
import com.chaoLiuWangLuo.OASys.entity.queryVo;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaUserMapper {
    int countByExample(AoaUserExample example);

    int deleteByExample(AoaUserExample example);

    int deleteByPrimaryKey(Long userId);

    int insert(AoaUser record);

    int insertSelective(AoaUser record);

    List<AoaUser> selectByExample(AoaUserExample example);

    AoaUser selectByPrimaryKey(Long userId);

    int updateByExampleSelective(@Param("record") AoaUser record, @Param("example") AoaUserExample example);

    int updateByExample(@Param("record") AoaUser record, @Param("example") AoaUserExample example);

    int updateByPrimaryKeySelective(AoaUser record);

    int updateByPrimaryKey(AoaUser record);
    
    void updateById(queryVo vo);
    
    List<AoaUser> findByList(Long id);

	List<AoaUser> findList();

	int findCount(queryVo vo);

	List<AoaUser> queryPage(queryVo vo);

	AoaUser findById(Long id);
}