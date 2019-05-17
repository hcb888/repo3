package com.chaoLiuWangLuo.OASys.controller;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.chaoLiuWangLuo.OASys.entity.AoaAttachmentList;
import com.chaoLiuWangLuo.OASys.entity.AoaDirector;
import com.chaoLiuWangLuo.OASys.entity.AoaDirectorUsers;
import com.chaoLiuWangLuo.OASys.entity.AoaTypeList;
import com.chaoLiuWangLuo.OASys.entity.AoaTypeListExample;
import com.chaoLiuWangLuo.OASys.entity.AoaUser;
import com.chaoLiuWangLuo.OASys.entity.queryVo;
import com.chaoLiuWangLuo.OASys.service.attachmentService;
import com.chaoLiuWangLuo.OASys.service.directorService;
import com.chaoLiuWangLuo.OASys.service.typeService;
import com.chaoLiuWangLuo.OASys.service.userService;
import com.chaoLiuWangLuo.OASys.service.impl.typeServiceImpl;
import com.chaoLiuWangLuo.OASys.service.impl.userServiceImpl;
import com.chaoLiuWangLuo.OASys.utils.Page;
import com.chaoLiuWangLuo.OASys.utils.PinYin4jUtils;

@Controller
@RequestMapping(value="/directorController/")
public class directorController {
	@Autowired
	private directorService directorServiceImpl;
	@Autowired
	private userService userServiceImpl;
	@Autowired
	private typeService typeServiceImpl;
	@Autowired
	private attachmentService attachmentServiceImpl;
	
	//分页查询内部通讯
		@RequestMapping(value="internalCommunicationQueryPage.action")
		public String internalCommunicationQueryPage(Model model,queryVo vo){
			 
			 Page<AoaUser> page=userServiceImpl.queryPage(vo);
			 page.setCountPage((page.getTotal()+page.getSize()-1)/page.getSize());
			 model.addAttribute("page", page);
			 model.addAttribute("vo",vo);
			return "inaddress";
		}
	
		//分页查询内部通讯ajax版
		@RequestMapping(value="internalCommunicationQueryPageAjax.action")
		public @ResponseBody Page<AoaUser> internalCommunicationQueryPageAjax(queryVo vo){
			 Page<AoaUser> page=userServiceImpl.queryPage(vo);
			 page.setCountPage((page.getTotal()+page.getSize()-1)/page.getSize());		 
			return page;
		}
		
		//内部通讯根据id查询
		@RequestMapping(value="internalCommunicationFindById.action")
		public String internalCommunicationFindById(Model  model,Long id){
			AoaUser user=userServiceImpl.findById(id);
			model.addAttribute("user",user);
			return "inaddressshow";
		}
		
		//分页查询：外部通讯
		@RequestMapping(value="externalCommunicationQueryPage.action")
		public String externalCommunicationQueryPage(Model model,queryVo vo){
			//由于没有登陆
			Long userId=1l;
			vo.setId1(userId);
			
			 Page<AoaDirectorUsers> page=directorServiceImpl.queryPage(vo);
			 page.setCountPage((page.getTotal()+page.getSize()-1)/page.getSize());
			 model.addAttribute("page", page);
			 model.addAttribute("vo",vo);
			return "outaddress";
		}
		
		//分页查询：外部通讯Ajax
		@RequestMapping(value="externalCommunicationQueryPageAjax.action")
		public @ResponseBody Page<AoaDirectorUsers> externalCommunicationQueryPageAjax(queryVo vo){
				//由于没有登陆
				Long userId=1l;
				vo.setId1(userId);
					
				Page<AoaDirectorUsers> page=directorServiceImpl.queryPage(vo);
				page.setCountPage((page.getTotal()+page.getSize()-1)/page.getSize());
 
					 
				return page;
		}
		
		//外部通讯根据id查询
		@RequestMapping(value="externalCommunicationFindById.action")
		public String externalCommunicationFindById(Model model,Long id){
			AoaDirectorUsers directorUsers=directorServiceImpl.directorUsersFindById(id);
			model.addAttribute("directorUsers", directorUsers);
			return "outaddressshow";
		}
		
		//加载基本信息
		@RequestMapping(value="directorType.action")
		public String directorType(Model model){
			//紧急程度
			AoaTypeListExample example1=new AoaTypeListExample();
			example1.createCriteria().andTypeModelEqualTo("aoa-director");
			List<AoaTypeList> directorType=typeServiceImpl.findList(example1);
			
			model.addAttribute("directorType", directorType);
			return "addrmanage";
		}
		
		//加载基本信息ajax版
		@RequestMapping(value="directorTypeAjax.action")
		public @ResponseBody List<AoaTypeList> directorTypeAjax(){
			//紧急程度
			AoaTypeListExample example1=new AoaTypeListExample();
			example1.createCriteria().andTypeModelEqualTo("aoa-director");
			List<AoaTypeList> directorType=typeServiceImpl.findList(example1);
					
			return  directorType;
		}
		
		//添加类型
		@RequestMapping(value="directorTypeAdd.action")
		public @ResponseBody String directorTypeAdd(queryVo vo){
		    //根据name和model查询
			vo.settModel("aoa-director");
			AoaTypeList typeList=typeServiceImpl.findByName(vo);
			if(typeList!=null  ){
				//类名以存在
				return "loser1";
			}
			 
			AoaTypeList type=new AoaTypeList();
			type.setTypeModel("aoa-director");
			type.setTypeName(vo.gettName());
			try {
				typeServiceImpl.add(type);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				//添加失败
				 return "loser2";
			}
			//添加成功
			return "success";
		}
		
		//切换外部通讯联系人的 类型
		@RequestMapping(value="updateDirectorUser.action")
		public  @ResponseBody String updateDirectorUser(AoaDirectorUsers du){
			try {
				directorServiceImpl.updateDirectorUser(du);
			} catch (Exception e) {
				 //修改失败
				return "loser";
			}
		
			
			//修改成功
			return "success";
		}
		
		//分享联系人
		@RequestMapping(value="shareContactsAjax.action")
		public  @ResponseBody String  shareContactsAjax(queryVo vo,AoaDirector director){
			//由于没登陆所以职员静态id
			AoaUser shareUser=new AoaUser();
			shareUser.setUserId(1l);
			try {
				//将获取到的分享到的联系人循环
				for (String uId : vo.getIdArray()) {
					 AoaDirectorUsers du=new AoaDirectorUsers();
					 //创建分享人对象
					 AoaUser user=new AoaUser();
					 user.setUserId(Long.valueOf(uId));
					 du.setUser(user);
					 du.setDirector(director);
					 du.setShareUser(shareUser);
					 du.setIsHandle(0);
					 du.setSharetime(new Date(System.currentTimeMillis()));
					 
					 //提交
					directorServiceImpl.addDirectorUser(du);
					 
				}
				
				
			} catch (Exception e) {
				//分享失败
				return "loser";
			}
			//		分享成功
			return "success";
		}
		
		//删除联系人
		@RequestMapping(value="directorUsersDeleteAjax.action")
		public @ResponseBody String directorUsersDeleteAjax(AoaDirectorUsers du){
			try {
				 
				//提交
				directorServiceImpl.directorUsersDelete(du);
			} catch (Exception e) {
				//删除联系人失败
				return "loser";
			}
			//		删除联系人成功
			return "success";
		}
		
		//加载添加外部通讯 的基本信息
		@RequestMapping(value="addDirectorUserEssentialInformation.action")
		public String addDirectorUserEssentialInformation(Model model){
			//紧急程度
			AoaTypeListExample example1=new AoaTypeListExample();
			example1.createCriteria().andTypeModelEqualTo("aoa-director");
			List<AoaTypeList> directorType=typeServiceImpl.findList(example1);
			
			model.addAttribute("duType", directorType);
			
			return "addressadd";
		}
		
		//添加外部通讯
		@RequestMapping(value="externalCommunicationAddAjax.action")
		public @ResponseBody String externalCommunicationAddAjax(MultipartFile imgFile,AoaDirector director,AoaDirectorUsers du){
			//由于没登陆所以职员静态id
			AoaUser user=new AoaUser();
			user.setUserId(1l);
			try {
				
				 //-----------------添加图片---------------------
				 AoaAttachmentList attachmentList=new AoaAttachmentList();
					//判读图片是否为空
					if(imgFile!=null && imgFile.getOriginalFilename()!=null){
						//uuid作为图片名
						String imgName=UUID.randomUUID().toString().replace("-","");
						//获取上传图片名
						String oriName=imgFile.getOriginalFilename();
						//获取图片后缀
						String extName=oriName.substring(oriName.lastIndexOf("."));
									
						//开始上传
						imgFile.transferTo(new File("F:/upload/"+imgName+extName));
							
						//数据单
					 
						attachmentList.setAttachmentName(imgName);
						attachmentList.setAttachmentPath(imgName+extName);
						attachmentList.setAttachmentShuffix(extName);
						attachmentList.setAttachmentSize(String.valueOf(imgFile.getSize()));
						attachmentList.setAttachmentType(imgFile.getContentType());
						attachmentList.setAttachmentUser(user);
						attachmentList.setModel("aoa_bursement");
						attachmentList.setUploadTime(new Date(System.currentTimeMillis()));
						
						if(attachmentList!=null && attachmentList.getAttachmentId()!=null){
							director.setImage(attachmentList);
						}
						
						//提交
						int attachmentCount=attachmentServiceImpl.addAttachment(attachmentList);
					}
					 du.setUser(user);
					 if(attachmentList!=null && attachmentList.getAttachmentId()!=null){
						 director.setImage(attachmentList);
					 }else{
						 throw new Exception("图片添加失败"); 
					 }
					//提交
				     directorServiceImpl.externalCommunicationAdd(director,du);
			} catch (Exception e) {
				//添加联系人失败
				return "loser";
			}
			
           // 添加联系人成功
			 return "success";
		}
		
		
		//我共享的联系人分页查询
		@RequestMapping(value="mySharedContactsQueryPage.action")
		public String mySharedContactsQueryPage(Model model,queryVo vo){
			//由于没有登陆
			Long userId=1l;
			vo.setId1(userId);
			
			 Page<AoaDirectorUsers> page=directorServiceImpl.mySharedContactsQueryPage(vo);
			 page.setCountPage((page.getTotal()+page.getSize()-1)/page.getSize());
			 model.addAttribute("page", page);
			 model.addAttribute("vo",vo);
			return "meshareaddress";

		}
		
		//我共享的联系人分页查询
		@RequestMapping(value="mySharedContactsQueryPageAjax.action")
		public @ResponseBody Page<AoaDirectorUsers> mySharedContactsQueryPageAjax(queryVo vo){
			//由于没有登陆
			Long userId=1l;
			vo.setId1(userId);
					
			Page<AoaDirectorUsers> page=directorServiceImpl.mySharedContactsQueryPage(vo);
			page.setCountPage((page.getTotal()+page.getSize()-1)/page.getSize());
				
			return  page;

		}
		
		
		//共享给我的联系人
		@RequestMapping(value="sharedWithMeContactsQueryPage.action")
		public String sharedWithMeContactsQueryPage(Model model,queryVo vo){
			
			//由于没有登陆
			Long userId=1l;
			vo.setId1(userId);
			
			 Page<AoaDirectorUsers> page=directorServiceImpl.sharedWithMeContactsQueryPage(vo);
			 page.setCountPage((page.getTotal()+page.getSize()-1)/page.getSize());
			 
			 
				AoaTypeListExample example1=new AoaTypeListExample();
				example1.createCriteria().andTypeModelEqualTo("aoa-director");
				List<AoaTypeList> directorType=typeServiceImpl.findList(example1);
				
				model.addAttribute("duType", directorType);
			 
			 model.addAttribute("page", page);
			 model.addAttribute("vo",vo);
			 
			 
			return "sharemeaddress";
		}
		
		//共享给我的联系人ajax版本
		@RequestMapping(value="sharedWithMeContactsQueryPageAjax.action")
		public @ResponseBody Page<AoaDirectorUsers>  sharedWithMeContactsQueryPageAjax(queryVo vo){
					
			//由于没有登陆
			Long userId=1l;
			vo.setId1(userId);
			Page<AoaDirectorUsers> page=directorServiceImpl.sharedWithMeContactsQueryPage(vo);
			page.setCountPage((page.getTotal()+page.getSize()-1)/page.getSize());  
			return  page;
		}
	 
}
