package com.chaoLiuWangLuo.OASys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chaoLiuWangLuo.OASys.entity.AoaStatusList;
import com.chaoLiuWangLuo.OASys.entity.AoaStatusListExample;
import com.chaoLiuWangLuo.OASys.entity.AoaTypeList;
import com.chaoLiuWangLuo.OASys.entity.queryVo;
import com.chaoLiuWangLuo.OASys.mapper.AoaStatusListMapper;
import com.chaoLiuWangLuo.OASys.service.statusService;
import com.chaoLiuWangLuo.OASys.utils.Page;

@Service
@Transactional
public class statusServiceImpl  implements statusService{
	@Autowired
	private AoaStatusListMapper mapper;

	public Page<AoaStatusList> queryPage(queryVo vo) {
		Page<AoaStatusList> page=new Page<AoaStatusList>();
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
		int count=mapper.statusFindCount(vo);
		//查询数据
		List<AoaStatusList> list=mapper.statusQueryPage(vo);
		
		page.setPage(vo.getPage());
		page.setSize(vo.getSize());
		page.setTotal(count);
		page.setRows(list);
		
		return page;
	}

	public int add(AoaStatusList statusList) {
		 
		return mapper.insert(statusList);
	}

	public List<AoaStatusList> findList(AoaStatusListExample example) {
		
		return mapper.selectByExample(example);
	}

	public int update(AoaStatusList statusList) {
		 
		return mapper.updateByPrimaryKeySelective(statusList);
	}

	public int delete(Long id) {
		 
		return mapper.deleteByPrimaryKey(id);
	}
}
