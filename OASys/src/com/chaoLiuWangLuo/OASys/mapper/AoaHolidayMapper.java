package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaHoliday;
import com.chaoLiuWangLuo.OASys.entity.AoaHolidayExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaHolidayMapper {
    int countByExample(AoaHolidayExample example);

    int deleteByExample(AoaHolidayExample example);

    int deleteByPrimaryKey(Long holidayId);

    int insert(AoaHoliday record);

    int insertSelective(AoaHoliday record);

    List<AoaHoliday> selectByExample(AoaHolidayExample example);

    AoaHoliday selectByPrimaryKey(Long holidayId);

    int updateByExampleSelective(@Param("record") AoaHoliday record, @Param("example") AoaHolidayExample example);

    int updateByExample(@Param("record") AoaHoliday record, @Param("example") AoaHolidayExample example);

    int updateByPrimaryKeySelective(AoaHoliday record);

    int updateByPrimaryKey(AoaHoliday record);

	AoaHoliday findById(Long id);
}