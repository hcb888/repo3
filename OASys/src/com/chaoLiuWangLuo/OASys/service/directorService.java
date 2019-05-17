package com.chaoLiuWangLuo.OASys.service;

import com.chaoLiuWangLuo.OASys.entity.AoaDirector;
import com.chaoLiuWangLuo.OASys.entity.AoaDirectorUsers;
import com.chaoLiuWangLuo.OASys.entity.queryVo;
import com.chaoLiuWangLuo.OASys.utils.Page;

public interface directorService {

	Page<AoaDirectorUsers> queryPage(queryVo vo);

	AoaDirectorUsers directorUsersFindById(Long id);

 

	void updateDirectorUser(AoaDirectorUsers du);

	void addDirectorUser(AoaDirectorUsers du);

	void directorUsersDelete(AoaDirectorUsers du);

	void externalCommunicationAdd(AoaDirector director, AoaDirectorUsers du)  throws Exception;

	Page<AoaDirectorUsers> mySharedContactsQueryPage(queryVo vo);

	Page<AoaDirectorUsers> sharedWithMeContactsQueryPage(queryVo vo); 

}
