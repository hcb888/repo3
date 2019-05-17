package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaVoteTitles;
import com.chaoLiuWangLuo.OASys.entity.AoaVoteTitlesExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaVoteTitlesMapper {
    int countByExample(AoaVoteTitlesExample example);

    int deleteByExample(AoaVoteTitlesExample example);

    int deleteByPrimaryKey(Long titleId);

    int insert(AoaVoteTitles record);

    int insertSelective(AoaVoteTitles record);

    List<AoaVoteTitles> selectByExample(AoaVoteTitlesExample example);

    AoaVoteTitles selectByPrimaryKey(Long titleId);

    int updateByExampleSelective(@Param("record") AoaVoteTitles record, @Param("example") AoaVoteTitlesExample example);

    int updateByExample(@Param("record") AoaVoteTitles record, @Param("example") AoaVoteTitlesExample example);

    int updateByPrimaryKeySelective(AoaVoteTitles record);

    int updateByPrimaryKey(AoaVoteTitles record);
}