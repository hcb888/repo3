package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaStay;
import com.chaoLiuWangLuo.OASys.entity.AoaStayExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaStayMapper {
    int countByExample(AoaStayExample example);

    int deleteByExample(AoaStayExample example);

    int deleteByPrimaryKey(Long stayId);

    int insert(AoaStay record);

    int insertSelective(AoaStay record);

    List<AoaStay> selectByExample(AoaStayExample example);

    AoaStay selectByPrimaryKey(Long stayId);

    int updateByExampleSelective(@Param("record") AoaStay record, @Param("example") AoaStayExample example);

    int updateByExample(@Param("record") AoaStay record, @Param("example") AoaStayExample example);

    int updateByPrimaryKeySelective(AoaStay record);

    int updateByPrimaryKey(AoaStay record);

	List<AoaStay> findByList(Long evectionmoneyId);
}