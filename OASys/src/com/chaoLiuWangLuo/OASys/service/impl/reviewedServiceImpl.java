package com.chaoLiuWangLuo.OASys.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chaoLiuWangLuo.OASys.entity.AoaProcessList;
import com.chaoLiuWangLuo.OASys.entity.AoaReviewed;
import com.chaoLiuWangLuo.OASys.entity.queryVo;
import com.chaoLiuWangLuo.OASys.mapper.AoaReviewedMapper;
import com.chaoLiuWangLuo.OASys.service.reviewedService;
import com.chaoLiuWangLuo.OASys.utils.Page;

@Service
@Transactional
public class reviewedServiceImpl implements reviewedService{
	@Autowired
	private AoaReviewedMapper mapper;

	public int addReviewed(AoaReviewed reviewed) {
		 
		return  mapper.insert(reviewed);
	}

	public List<AoaReviewed> findByList(Long id) {
		List<AoaReviewed> reList= mapper.findByList(id);
		SimpleDateFormat format= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for (AoaReviewed aoaReviewed : reList) {
			 if(aoaReviewed!=null && aoaReviewed.getReviewedTime()!=null){
				 aoaReviewed.setReviewedDate(format.format(new Date(aoaReviewed.getReviewedTime().getTime())));
			 }	
			
			 if(aoaReviewed!=null && aoaReviewed.getReviewedProcess()!=null && aoaReviewed.getReviewedProcess().getApplyTime()!=null){
				 aoaReviewed.getReviewedProcess().setApplyDate(format.format(new Date(aoaReviewed.getReviewedProcess().getApplyTime().getTime())));
			 }
			 if(aoaReviewed!=null && aoaReviewed.getReviewedProcess()!=null  && aoaReviewed.getReviewedProcess().getStartTime()!=null){
				 aoaReviewed.getReviewedProcess().setStartDate(format.format(new Date(aoaReviewed.getReviewedProcess().getStartTime().getTime())));
			 }
			 if(aoaReviewed!=null && aoaReviewed.getReviewedProcess()!=null && aoaReviewed.getReviewedProcess().getEndTime()!=null){
				 aoaReviewed.getReviewedProcess().setEndDate(format.format(new Date(aoaReviewed.getReviewedProcess().getEndTime().getTime())));
			 }
		}
		return reList;
	}

	public Page<AoaReviewed> queryPage(queryVo vo) {
		Page<AoaReviewed> page=new Page<AoaReviewed>();
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
		int count=mapper.reviewedFindCount(vo);
		//查询数据
		List<AoaReviewed> list=mapper.reviewedQueryPage(vo);
		
		for (AoaReviewed reviewed : list) {
			if(reviewed!=null && reviewed.getReviewedProcess()!=null && reviewed.getReviewedProcess().getApplyTime()!=null){
				reviewed.getReviewedProcess().setApplyDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(reviewed.getReviewedProcess().getApplyTime().getTime())));
			}
		}
		
		page.setPage(vo.getPage());
		page.setSize(vo.getSize());
		page.setTotal(count);
		page.setRows(list);
		
		return page;
	}

	public AoaReviewed findById(queryVo vo) {
		AoaReviewed aoaReviewed=mapper.findById(vo);
		SimpleDateFormat format= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 if(aoaReviewed!=null && aoaReviewed.getReviewedProcess()!=null && aoaReviewed.getReviewedProcess().getApplyTime()!=null){
			 aoaReviewed.getReviewedProcess().setApplyDate(format.format(new Date(aoaReviewed.getReviewedProcess().getApplyTime().getTime())));
		 }
		 if(aoaReviewed!=null && aoaReviewed.getReviewedProcess()!=null  && aoaReviewed.getReviewedProcess().getStartTime()!=null){
			 aoaReviewed.getReviewedProcess().setStartDate(format.format(new Date(aoaReviewed.getReviewedProcess().getStartTime().getTime())));
		 }
		 if(aoaReviewed!=null && aoaReviewed.getReviewedProcess()!=null && aoaReviewed.getReviewedProcess().getEndTime()!=null){
			 aoaReviewed.getReviewedProcess().setEndDate(format.format(new Date(aoaReviewed.getReviewedProcess().getEndTime().getTime())));
		 }
		return aoaReviewed;
	}

	public void update(AoaReviewed reviewed) {
		 mapper.updateByPrimaryKeySelective(reviewed);
	}

 
}
