package com.chaoLiuWangLuo.OASys.service.impl;

import java.util.List;

import org.apache.ibatis.binding.MapperRegistry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chaoLiuWangLuo.OASys.entity.AoaUser;
import com.chaoLiuWangLuo.OASys.entity.AoaUserExample;
import com.chaoLiuWangLuo.OASys.entity.queryVo;
import com.chaoLiuWangLuo.OASys.mapper.AoaUserMapper;
import com.chaoLiuWangLuo.OASys.service.userService;
import com.chaoLiuWangLuo.OASys.utils.Page;

@Service
@Transactional
public class userServiceImpl implements userService {
	@Autowired
	private AoaUserMapper mapper;

 

	public List<AoaUser> findByIdList(Long id) {
		List<AoaUser> list= mapper.findByList(id);
		return list;
	}



	public List<AoaUser> findByList(AoaUserExample example) {
		List<AoaUser> list=mapper.selectByExample(example);
		return list;
	}



	public int deleteById(Long id) {
		 int count=mapper.deleteByPrimaryKey(id);
		return count;
	}



	public void updateById(queryVo vo) {
		  mapper.updateById(vo);
		 
	}



	public List<AoaUser> findList() {
		 
		return mapper.findList();
	}



	public Page<AoaUser> queryPage(queryVo vo) {
		Page<AoaUser> page=new Page<AoaUser>();
		//判断当前页数是否为空
		if(vo.getPage()==null){
			vo.setPage(1);
		} 
		
		//判断当前显示页数是否为空
		if(vo.getSize()==null){
			vo.setSize(100);
		}
		
		//算出开始条数
		vo.setStartRow((vo.getPage()-1)*vo.getSize());
		
		//通讯查询条件判断
		if(vo!=null && vo.getBaseKey()!=null){
			//先转数字
			try {
				Long phone=Long.valueOf(vo.getBaseKey().trim());
				vo.setPhone(phone.toString());
			} catch (Exception e) {
				//报错了证明是字符
				vo.setuName(vo.getBaseKey());
			}finally {
				//查询总条数
				int count=mapper.findCount(vo);
				//查询数据
				List<AoaUser> list=mapper.queryPage(vo);
				
				page.setPage(vo.getPage());
				page.setSize(vo.getSize());
				page.setTotal(count);
				page.setRows(list);
				
				return page;
			}
		}
		
		//查询总条数
		int count=mapper.findCount(vo);
		//查询数据
		List<AoaUser> list=mapper.queryPage(vo);
		
		page.setPage(vo.getPage());
		page.setSize(vo.getSize());
		page.setTotal(count);
		page.setRows(list);
		
		return page;
	}



	public int add(AoaUser user) {
		 int count=mapper.insertSelective(user);
		return count;
	}



	public AoaUser findById(Long id) {
		 
		return mapper.findById(id);
	}



	public int update(AoaUser user) {
		int count=mapper.updateByPrimaryKeySelective(user);
		return count;
	}
	
	public int delete(Long id){
		
		return mapper.deleteByPrimaryKey(id);
	}
}
