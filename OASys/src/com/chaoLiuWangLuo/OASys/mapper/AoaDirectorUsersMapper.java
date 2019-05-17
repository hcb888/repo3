package com.chaoLiuWangLuo.OASys.mapper;

import com.chaoLiuWangLuo.OASys.entity.AoaDirectorUsers;
import com.chaoLiuWangLuo.OASys.entity.AoaDirectorUsersExample;
import com.chaoLiuWangLuo.OASys.entity.queryVo;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AoaDirectorUsersMapper {
    int countByExample(AoaDirectorUsersExample example);

    int deleteByExample(AoaDirectorUsersExample example);

    int deleteByPrimaryKey(Long directorUsersId);

    int insert(AoaDirectorUsers record);

    int insertSelective(AoaDirectorUsers record);

    List<AoaDirectorUsers> selectByExample(AoaDirectorUsersExample example);

    AoaDirectorUsers selectByPrimaryKey(Long directorUsersId);

    int updateByExampleSelective(@Param("record") AoaDirectorUsers record, @Param("example") AoaDirectorUsersExample example);

    int updateByExample(@Param("record") AoaDirectorUsers record, @Param("example") AoaDirectorUsersExample example);

    int updateByPrimaryKeySelective(AoaDirectorUsers record);

    int updateByPrimaryKey(AoaDirectorUsers record);

	int directorfindCount(queryVo vo);

	List<AoaDirectorUsers> directorQueryPage(queryVo vo);

	AoaDirectorUsers directorUsersFindById(Long id);

	int mySharedContactsCount(queryVo vo);

	List<AoaDirectorUsers> mySharedContactsQueryPage(queryVo vo);

	int sharedWithMeContactsCount(queryVo vo);

	List<AoaDirectorUsers> sharedWithMeContactsQueryPage(queryVo vo);
}