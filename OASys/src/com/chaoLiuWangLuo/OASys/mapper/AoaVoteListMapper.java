package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaVoteList;
import com.chaoLiuWangLuo.OASys.entity.AoaVoteListExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaVoteListMapper {
    int countByExample(AoaVoteListExample example);

    int deleteByExample(AoaVoteListExample example);

    int deleteByPrimaryKey(Long voteId);

    int insert(AoaVoteList record);

    int insertSelective(AoaVoteList record);

    List<AoaVoteList> selectByExample(AoaVoteListExample example);

    AoaVoteList selectByPrimaryKey(Long voteId);

    int updateByExampleSelective(@Param("record") AoaVoteList record, @Param("example") AoaVoteListExample example);

    int updateByExample(@Param("record") AoaVoteList record, @Param("example") AoaVoteListExample example);

    int updateByPrimaryKeySelective(AoaVoteList record);

    int updateByPrimaryKey(AoaVoteList record);
}