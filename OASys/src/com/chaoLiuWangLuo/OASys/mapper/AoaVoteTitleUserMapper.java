package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaVoteTitleUser;
import com.chaoLiuWangLuo.OASys.entity.AoaVoteTitleUserExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaVoteTitleUserMapper {
    int countByExample(AoaVoteTitleUserExample example);

    int deleteByExample(AoaVoteTitleUserExample example);

    int deleteByPrimaryKey(Long voteTitleUserId);

    int insert(AoaVoteTitleUser record);

    int insertSelective(AoaVoteTitleUser record);

    List<AoaVoteTitleUser> selectByExample(AoaVoteTitleUserExample example);

    AoaVoteTitleUser selectByPrimaryKey(Long voteTitleUserId);

    int updateByExampleSelective(@Param("record") AoaVoteTitleUser record, @Param("example") AoaVoteTitleUserExample example);

    int updateByExample(@Param("record") AoaVoteTitleUser record, @Param("example") AoaVoteTitleUserExample example);

    int updateByPrimaryKeySelective(AoaVoteTitleUser record);

    int updateByPrimaryKey(AoaVoteTitleUser record);
}