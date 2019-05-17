package com.chaoLiuWangLuo.OASys.service.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chaoLiuWangLuo.OASys.entity.AoaNoticeList;
import com.chaoLiuWangLuo.OASys.entity.AoaPlanList;
import com.chaoLiuWangLuo.OASys.entity.queryVo;
import com.chaoLiuWangLuo.OASys.mapper.AoaPlanListMapper;
import com.chaoLiuWangLuo.OASys.service.planService;
import com.chaoLiuWangLuo.OASys.utils.Page;

@Service
@Transactional
public class planServiceImpl implements planService{
	@Autowired
	private AoaPlanListMapper mapper;

	public Page<AoaPlanList> queryPage(queryVo vo) {
		Page<AoaPlanList> page=new Page<AoaPlanList>();
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
		int count=mapper.planFindCount(vo);
		//查询数据
		List<AoaPlanList> list=mapper.planQueryPage(vo);
		
		for (AoaPlanList aoaPlanList : list) {
			if(aoaPlanList!=null && aoaPlanList.getCreateTime()!=null){
				aoaPlanList.setCreateDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(aoaPlanList.getCreateTime()));
			}
		}
		
		page.setPage(vo.getPage());
		page.setSize(vo.getSize());
		page.setTotal(count);
		page.setRows(list);
		
		return page;
	}

	public int add(AoaPlanList plan) {
		 
		return mapper.insert(plan);
	}

	public AoaPlanList findById(Long id) {
		 AoaPlanList plan=mapper.findById(id);
		 SimpleDateFormat dateForma=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 if(plan!=null && plan.getStartTime()!=null){
			 plan.setStartDate(dateForma.format(plan.getStartTime()));
		 }
		 
		 if(plan!=null && plan.getEndTime()!=null){
			 plan.setEndDate(dateForma.format(plan.getEndTime()));
		 }
		return plan;
	}

	public int update(AoaPlanList plan) {
		 
		return mapper.updateByPrimaryKeySelective(plan);
	}

	public int delete(long id) {
		// TODO Auto-generated method stub
		AoaPlanList plan=mapper.findById(id);
		return mapper.deleteByPrimaryKey(plan);
	}

	public Page<AoaPlanList> dayWeekMonthPlanQueryPage(queryVo vo) {
		SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
		if(vo!=null && vo.getStartDate()==null){
			vo.setStartDate(dateFormat.format(new Date(System.currentTimeMillis())));
		}
		
		if(vo!=null && vo.getEndDate()==null){
			Calendar calendar=Calendar.getInstance();
			calendar.add(Calendar.DATE, +1);
			vo.setEndDate(dateFormat.format(calendar.getTime()));
			vo.setJh("日计划");
		}
 
		
		Page<AoaPlanList> page=new Page<AoaPlanList>();
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
		int count=mapper.dayWeekMonthPlanFindCount(vo);
		//查询数据
		List<AoaPlanList> list=mapper.dayWeekMonthPlanQueryPage(vo);
		
		for (AoaPlanList aoaPlanList : list) {
			if(aoaPlanList!=null && aoaPlanList.getCreateTime()!=null){
				aoaPlanList.setCreateDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(aoaPlanList.getCreateTime()));
			}
		}
		
		page.setPage(vo.getPage());
		page.setSize(vo.getSize());
		page.setTotal(count);
		page.setRows(list);
		
		return page;
	}
	public static void main(String[] args) {
		queryVo vo=new queryVo();
		SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
		if(vo!=null && vo.getStartDate()==null){
			vo.setStartDate(dateFormat.format(new Date(System.currentTimeMillis())));
		}
		
		if(vo!=null && vo.getEndDate()==null){
			Calendar calendar=Calendar.getInstance();
			calendar.add(Calendar.DATE, +1);
			vo.setEndDate(dateFormat.format(calendar.getTime()));
		}
		System.out.println(vo.getStartDate());
		System.out.println(vo.getEndDate());
	}

	public int updatePlanComment(AoaPlanList plan) {  
		return mapper.updateByPrimaryKeySelective(plan);
	}
	
}
