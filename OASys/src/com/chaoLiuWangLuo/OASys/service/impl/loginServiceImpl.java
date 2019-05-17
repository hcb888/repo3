package com.chaoLiuWangLuo.OASys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chaoLiuWangLuo.OASys.entity.AoaRole;
import com.chaoLiuWangLuo.OASys.entity.AoaUserLoginRecord;
import com.chaoLiuWangLuo.OASys.entity.queryVo;
import com.chaoLiuWangLuo.OASys.mapper.AoaUserLoginRecordMapper;
import com.chaoLiuWangLuo.OASys.service.loginService;
import com.chaoLiuWangLuo.OASys.utils.Page;

@Service
@Transactional
public class loginServiceImpl implements loginService {
	@Autowired
	private AoaUserLoginRecordMapper mapper;

	public Page<AoaUserLoginRecord> queryPage(queryVo vo) {
		Page<AoaUserLoginRecord> page=new Page<AoaUserLoginRecord>();
		//判断当前页数是否为空
		if(vo.getPage()==null){
			vo.setPage(1);
		} 
		
		//判断当前显示页数是否为空
		if(vo.getSize()==null){
			vo.setSize(10);
		}
		
		//算出开始条数
		vo.setStartRow((vo.getPage()-1)*vo.getSize());
		
		//查询总条数
		int count=mapper.loginFindCount(vo);
		//查询数据
		List<AoaUserLoginRecord> list=mapper.loginQueryPage(vo);
		
		page.setPage(vo.getPage());
		page.setSize(vo.getSize());
		page.setTotal(count);
		page.setRows(list);
		
		return page;
	}
	
}
