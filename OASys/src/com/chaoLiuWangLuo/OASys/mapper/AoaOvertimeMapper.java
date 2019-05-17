package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaOvertime;
import com.chaoLiuWangLuo.OASys.entity.AoaOvertimeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaOvertimeMapper {
    int countByExample(AoaOvertimeExample example);

    int deleteByExample(AoaOvertimeExample example);

    int deleteByPrimaryKey(Long overtimeId);

    int insert(AoaOvertime record);

    int insertSelective(AoaOvertime record);

    List<AoaOvertime> selectByExample(AoaOvertimeExample example);

    AoaOvertime selectByPrimaryKey(Long overtimeId);

    int updateByExampleSelective(@Param("record") AoaOvertime record, @Param("example") AoaOvertimeExample example);

    int updateByExample(@Param("record") AoaOvertime record, @Param("example") AoaOvertimeExample example);

    int updateByPrimaryKeySelective(AoaOvertime record);

    int updateByPrimaryKey(AoaOvertime record);

	AoaOvertime findById(Long id);
}