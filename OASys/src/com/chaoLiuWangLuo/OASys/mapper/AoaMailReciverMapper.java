package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaMailReciver;
import com.chaoLiuWangLuo.OASys.entity.AoaMailReciverExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaMailReciverMapper {
    int countByExample(AoaMailReciverExample example);

    int deleteByExample(AoaMailReciverExample example);

    int deleteByPrimaryKey(Long pkId);

    int insert(AoaMailReciver record);

    int insertSelective(AoaMailReciver record);

    List<AoaMailReciver> selectByExample(AoaMailReciverExample example);

    AoaMailReciver selectByPrimaryKey(Long pkId);

    int updateByExampleSelective(@Param("record") AoaMailReciver record, @Param("example") AoaMailReciverExample example);

    int updateByExample(@Param("record") AoaMailReciver record, @Param("example") AoaMailReciverExample example);

    int updateByPrimaryKeySelective(AoaMailReciver record);

    int updateByPrimaryKey(AoaMailReciver record);
}