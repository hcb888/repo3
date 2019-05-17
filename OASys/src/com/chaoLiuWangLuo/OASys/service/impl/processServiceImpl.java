package com.chaoLiuWangLuo.OASys.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chaoLiuWangLuo.OASys.entity.AoaProcessList;
import com.chaoLiuWangLuo.OASys.entity.AoaStatusList;
import com.chaoLiuWangLuo.OASys.entity.queryVo;
import com.chaoLiuWangLuo.OASys.mapper.AoaProcessListMapper;
import com.chaoLiuWangLuo.OASys.service.processService;
import com.chaoLiuWangLuo.OASys.utils.Page;

@Service
@Transactional
public class processServiceImpl implements processService{
	@Autowired
	private AoaProcessListMapper mapper;

	public int addProcess(AoaProcessList process) {
		 
		return mapper.insert(process);
	}

	public Page<AoaProcessList> queryPage(queryVo vo) {
		Page<AoaProcessList> page=new Page<AoaProcessList>();
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
		int count=mapper.processFindCount(vo);
		//查询数据
		List<AoaProcessList> list=mapper.processQueryPage(vo);
		
		for (AoaProcessList aoaProcessList : list) {
			if(aoaProcessList!=null && aoaProcessList.getApplyTime()!=null){
				aoaProcessList.setApplyDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(aoaProcessList.getApplyTime().getTime())));
			}
		}
		
		page.setPage(vo.getPage());
		page.setSize(vo.getSize());
		page.setTotal(count);
		page.setRows(list);
		
		return page;
	}

	public AoaProcessList findById(Long id) {
		 AoaProcessList process=mapper.findById(id);
		SimpleDateFormat format= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 if(process!=null && process.getApplyTime()!=null){
			 process.setApplyDate(format.format(new Date(process.getApplyTime().getTime())));
		 }
		 if(process!=null && process.getStartTime()!=null){
			 process.setStartDate(format.format(new Date(process.getStartTime().getTime())));
		 }
		 if(process!=null && process.getEndTime()!=null){
			 process.setEndDate(format.format(new Date(process.getEndTime().getTime())));
		 }
		return  process;
	}

	public void update(AoaProcessList process) {
		 mapper.updateByPrimaryKeySelective(process);
	}
}
