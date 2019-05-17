package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaNotepaper;
import com.chaoLiuWangLuo.OASys.entity.AoaNotepaperExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaNotepaperMapper {
    int countByExample(AoaNotepaperExample example);

    int deleteByExample(AoaNotepaperExample example);

    int deleteByPrimaryKey(Long notepaperId);

    int insert(AoaNotepaper record);

    int insertSelective(AoaNotepaper record);

    List<AoaNotepaper> selectByExampleWithBLOBs(AoaNotepaperExample example);

    List<AoaNotepaper> selectByExample(AoaNotepaperExample example);

    AoaNotepaper selectByPrimaryKey(Long notepaperId);

    int updateByExampleSelective(@Param("record") AoaNotepaper record, @Param("example") AoaNotepaperExample example);

    int updateByExampleWithBLOBs(@Param("record") AoaNotepaper record, @Param("example") AoaNotepaperExample example);

    int updateByExample(@Param("record") AoaNotepaper record, @Param("example") AoaNotepaperExample example);

    int updateByPrimaryKeySelective(AoaNotepaper record);

    int updateByPrimaryKeyWithBLOBs(AoaNotepaper record);

    int updateByPrimaryKey(AoaNotepaper record);
}