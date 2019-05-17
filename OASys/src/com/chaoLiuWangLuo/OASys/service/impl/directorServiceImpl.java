package com.chaoLiuWangLuo.OASys.service.impl;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chaoLiuWangLuo.OASys.entity.AoaDirector;
import com.chaoLiuWangLuo.OASys.entity.AoaDirectorUsers;
import com.chaoLiuWangLuo.OASys.entity.AoaUser;
import com.chaoLiuWangLuo.OASys.entity.queryVo;
import com.chaoLiuWangLuo.OASys.mapper.AoaDirectorMapper;
import com.chaoLiuWangLuo.OASys.mapper.AoaDirectorUsersMapper;
import com.chaoLiuWangLuo.OASys.service.directorService;
import com.chaoLiuWangLuo.OASys.utils.Page;
import com.chaoLiuWangLuo.OASys.utils.PinYin4jUtils;

@Service
@Transactional
public class directorServiceImpl implements directorService {
	@Autowired
	private AoaDirectorMapper mapper;
	@Autowired
	private AoaDirectorUsersMapper duMapper;
	

	public Page<AoaDirectorUsers> queryPage(queryVo vo) {
		Page<AoaDirectorUsers> page=new Page<AoaDirectorUsers>();
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
				int count=duMapper.directorfindCount(vo);
				//查询数据
				List<AoaDirectorUsers> list=duMapper.directorQueryPage(vo);
				
				page.setPage(vo.getPage());
				page.setSize(vo.getSize());
				page.setTotal(count);
				page.setRows(list);
				
				return page;
			}
		}
		
		//查询总条数
		int count=duMapper.directorfindCount(vo);
		//查询数据
		List<AoaDirectorUsers> list=duMapper.directorQueryPage(vo);
		
		page.setPage(vo.getPage());
		page.setSize(vo.getSize());
		page.setTotal(count);
		page.setRows(list);
		
		return page;
	}


	public AoaDirectorUsers directorUsersFindById(Long id) {
		
		return duMapper.directorUsersFindById(id);
	}


	public void updateDirectorUser(AoaDirectorUsers du) {
		 duMapper.updateByPrimaryKeySelective(du);
		
	}


	public void addDirectorUser(AoaDirectorUsers du) {
		 duMapper.insert(du);
		
	}


	public void directorUsersDelete(AoaDirectorUsers du) {
		 duMapper.deleteByPrimaryKey(du.getDirectorUsersId());
		
	}


	public void externalCommunicationAdd(AoaDirector director, AoaDirectorUsers du) throws Exception {
		 director.setPinyin(PinYin4jUtils.hanziToPinyin(director.getUserName(),""));
		 mapper.insert(director);
		 
		 if(director!=null && director.getDirectorId()!=null){
			 du.setDirector(director);
		 }else{
			 throw new Exception("联系人添加失败");
		 }
		 duMapper.insert(du);
		
	}


	public Page<AoaDirectorUsers> mySharedContactsQueryPage(queryVo vo) {
		Page<AoaDirectorUsers> page=new Page<AoaDirectorUsers>();
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
		
		SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
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
				int count=duMapper.mySharedContactsCount(vo);
				//查询数据
				List<AoaDirectorUsers> list=duMapper.mySharedContactsQueryPage(vo);
				
				for (AoaDirectorUsers aoaDirectorUsers : list) {
					if(aoaDirectorUsers!=null && aoaDirectorUsers.getSharetime()!=null){
						aoaDirectorUsers.setShareDate(dateFormat.format(aoaDirectorUsers.getSharetime()));
					}
				}
				
				page.setPage(vo.getPage());
				page.setSize(vo.getSize());
				page.setTotal(count);
				page.setRows(list);
				
				return page;
			}
		}
		
		//查询总条数
		int count=duMapper.mySharedContactsCount(vo);
		//查询数据
		List<AoaDirectorUsers> list=duMapper.mySharedContactsQueryPage(vo);
		for (AoaDirectorUsers aoaDirectorUsers : list) {
			if(aoaDirectorUsers!=null && aoaDirectorUsers.getSharetime()!=null){
				aoaDirectorUsers.setShareDate(dateFormat.format(aoaDirectorUsers.getSharetime()));
			}
		}
		
		page.setPage(vo.getPage());
		page.setSize(vo.getSize());
		page.setTotal(count);
		page.setRows(list);
		
		return page;
	}


	public Page<AoaDirectorUsers> sharedWithMeContactsQueryPage(queryVo vo) {
		Page<AoaDirectorUsers> page=new Page<AoaDirectorUsers>();
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
		
		SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
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
				int count=duMapper.sharedWithMeContactsCount(vo);
				//查询数据
				List<AoaDirectorUsers> list=duMapper.sharedWithMeContactsQueryPage(vo);
				
				for (AoaDirectorUsers aoaDirectorUsers : list) {
					if(aoaDirectorUsers!=null && aoaDirectorUsers.getSharetime()!=null){
						aoaDirectorUsers.setShareDate(dateFormat.format(aoaDirectorUsers.getSharetime()));
					}
				}
				
				page.setPage(vo.getPage());
				page.setSize(vo.getSize());
				page.setTotal(count);
				page.setRows(list);
				
				return page;
			}
		}
		
		//查询总条数
		int count=duMapper.sharedWithMeContactsCount(vo);
		//查询数据
		List<AoaDirectorUsers> list=duMapper.sharedWithMeContactsQueryPage(vo);
		for (AoaDirectorUsers aoaDirectorUsers : list) {
			if(aoaDirectorUsers!=null && aoaDirectorUsers.getSharetime()!=null){
				aoaDirectorUsers.setShareDate(dateFormat.format(aoaDirectorUsers.getSharetime()));
			}
		}
		
		page.setPage(vo.getPage());
		page.setSize(vo.getSize());
		page.setTotal(count);
		page.setRows(list);
		
		return page;
	}


 
	
}
