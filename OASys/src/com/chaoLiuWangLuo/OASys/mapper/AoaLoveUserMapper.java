package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaLoveUser;
import com.chaoLiuWangLuo.OASys.entity.AoaLoveUserExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaLoveUserMapper {
    int countByExample(AoaLoveUserExample example);

    int deleteByExample(AoaLoveUserExample example);

    int insert(AoaLoveUser record);

    int insertSelective(AoaLoveUser record);

    List<AoaLoveUser> selectByExample(AoaLoveUserExample example);

    int updateByExampleSelective(@Param("record") AoaLoveUser record, @Param("example") AoaLoveUserExample example);

    int updateByExample(@Param("record") AoaLoveUser record, @Param("example") AoaLoveUserExample example);
}