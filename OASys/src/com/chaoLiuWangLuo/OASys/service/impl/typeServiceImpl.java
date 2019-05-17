package com.chaoLiuWangLuo.OASys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chaoLiuWangLuo.OASys.entity.AoaRole;
import com.chaoLiuWangLuo.OASys.entity.AoaTypeList;
import com.chaoLiuWangLuo.OASys.entity.AoaTypeListExample;
import com.chaoLiuWangLuo.OASys.entity.queryVo;
import com.chaoLiuWangLuo.OASys.mapper.AoaTypeListMapper;
import com.chaoLiuWangLuo.OASys.service.typeService;
import com.chaoLiuWangLuo.OASys.utils.Page;

@Service
@Transactional
public class typeServiceImpl implements typeService{
	@Autowired 
	private AoaTypeListMapper mapper;

	public Page<AoaTypeList> queryPage(queryVo vo) {
		Page<AoaTypeList> page=new Page<AoaTypeList>();
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
		int count=mapper.typeFindCount(vo);
		//查询数据
		List<AoaTypeList> list=mapper.typeQueryPage(vo);
		
		page.setPage(vo.getPage());
		page.setSize(vo.getSize());
		page.setTotal(count);
		page.setRows(list);
		
		return page;
	}

	public int add(AoaTypeList type) {
		int count=mapper.insert(type);
		return count;
	}

	public List<AoaTypeList> findList(AoaTypeListExample example) {
	
		return mapper.selectByExample(example);
	}

	public int update(AoaTypeList type) {
		// TODO Auto-generated method stub
		return mapper.updateByPrimaryKeySelective(type);
	}

	public int delete(Long id) {
		
		return mapper.deleteByPrimaryKey(id);
	}

	 

	public AoaTypeList findByName(queryVo vo) {
		return mapper.findByName(vo);
	}
	
}
