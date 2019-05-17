package com.chaoLiuWangLuo.OASys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chaoLiuWangLuo.OASys.entity.AoaRole;
import com.chaoLiuWangLuo.OASys.entity.AoaRoleExample;
import com.chaoLiuWangLuo.OASys.entity.AoaUser;
import com.chaoLiuWangLuo.OASys.entity.queryVo;
import com.chaoLiuWangLuo.OASys.mapper.AoaRoleMapper;
import com.chaoLiuWangLuo.OASys.service.roleService;
import com.chaoLiuWangLuo.OASys.utils.Page;

@Service
@Transactional
public class roleServiceImpl implements roleService{
	@Autowired
	private AoaRoleMapper mapper;

	public List<AoaRole> findList(AoaRoleExample roleExample) {
		 
		return mapper.selectByExample(roleExample);
	}

	public Page<AoaRole> queryPage(queryVo vo) {
		Page<AoaRole> page=new Page<AoaRole>();
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
		int count=mapper.roleFindCount(vo);
		//查询数据
		List<AoaRole> list=mapper.roleQueryPage(vo);
		
		page.setPage(vo.getPage());
		page.setSize(vo.getSize());
		page.setTotal(count);
		page.setRows(list);
		
		return page;
	}

	public int add(AoaRole role) {
		int count= mapper.insert(role);
		return count;
	}

	public int update(AoaRole role) {
		int count=mapper.updateByPrimaryKeySelective(role);
		return count;
	}

	public int delete(Long id) {
		int count =mapper.deleteByPrimaryKey(id);
		return count;
	}
	
}
