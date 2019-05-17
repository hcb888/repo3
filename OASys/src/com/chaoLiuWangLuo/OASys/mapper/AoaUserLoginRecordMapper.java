package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaUserLoginRecord;
import com.chaoLiuWangLuo.OASys.entity.AoaUserLoginRecordExample;
import com.chaoLiuWangLuo.OASys.entity.queryVo;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaUserLoginRecordMapper {
    int countByExample(AoaUserLoginRecordExample example);

    int deleteByExample(AoaUserLoginRecordExample example);

    int deleteByPrimaryKey(Long recordId);

    int insert(AoaUserLoginRecord record);

    int insertSelective(AoaUserLoginRecord record);

    List<AoaUserLoginRecord> selectByExample(AoaUserLoginRecordExample example);

    AoaUserLoginRecord selectByPrimaryKey(Long recordId);

    int updateByExampleSelective(@Param("record") AoaUserLoginRecord record, @Param("example") AoaUserLoginRecordExample example);

    int updateByExample(@Param("record") AoaUserLoginRecord record, @Param("example") AoaUserLoginRecordExample example);

    int updateByPrimaryKeySelective(AoaUserLoginRecord record);

    int updateByPrimaryKey(AoaUserLoginRecord record);

	int loginFindCount(queryVo vo);

	List<AoaUserLoginRecord> loginQueryPage(queryVo vo);
}