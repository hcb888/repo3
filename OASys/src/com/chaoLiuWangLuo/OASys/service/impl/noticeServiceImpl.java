package com.chaoLiuWangLuo.OASys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chaoLiuWangLuo.OASys.entity.AoaNoticeList;
import com.chaoLiuWangLuo.OASys.entity.AoaRole;
import com.chaoLiuWangLuo.OASys.entity.queryVo;
import com.chaoLiuWangLuo.OASys.mapper.AoaNoticeListMapper;
import com.chaoLiuWangLuo.OASys.service.noticeService;
import com.chaoLiuWangLuo.OASys.utils.Page;

@Service
@Transactional
public class noticeServiceImpl implements noticeService{
	@Autowired
	private AoaNoticeListMapper mapper;

	public Page<AoaNoticeList> queryPage(queryVo vo) {
		Page<AoaNoticeList> page=new Page<AoaNoticeList>();
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
		int count=mapper.noticeFindCount(vo);
		//查询数据
		List<AoaNoticeList> list=mapper.noticeQueryPage(vo);
		
		page.setPage(vo.getPage());
		page.setSize(vo.getSize());
		page.setTotal(count);
		page.setRows(list);
		
		return page;
 
	}

	public int add(AoaNoticeList noticeList) {
		 int count=mapper.insert(noticeList);
		return count;
	}

	public AoaNoticeList findById(Long id) {
		AoaNoticeList noticeList=mapper.findById(id);
		return noticeList;
	}

	public int update(AoaNoticeList aoaNoticeList) {
		 int count =mapper.updateByPrimaryKeySelective(aoaNoticeList);
		return count;
	}

	public void delete(Long id) {
		 mapper.delete(id);
		 
	}
	
}
