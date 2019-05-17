package com.chaoLiuWangLuo.OASys.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chaoLiuWangLuo.OASys.entity.AoaAttendsList;
import com.chaoLiuWangLuo.OASys.entity.AoaAttendsListExample;
import com.chaoLiuWangLuo.OASys.entity.AoaStatusList;
import com.chaoLiuWangLuo.OASys.entity.AoaStatusListExample;
import com.chaoLiuWangLuo.OASys.entity.AoaTypeList;
import com.chaoLiuWangLuo.OASys.entity.AoaTypeListExample;
import com.chaoLiuWangLuo.OASys.entity.queryVo;
import com.chaoLiuWangLuo.OASys.service.attendsService;
import com.chaoLiuWangLuo.OASys.service.statusService;
import com.chaoLiuWangLuo.OASys.service.typeService;
import com.chaoLiuWangLuo.OASys.service.impl.typeServiceImpl;
import com.chaoLiuWangLuo.OASys.utils.Page;
import com.chaoLiuWangLuo.OASys.utils.monthUtils;
import com.chaoLiuWangLuo.OASys.utils.weekUtils;

@Controller
@RequestMapping(value="/attendsController/")
public class attendsController {
	@Autowired
	private attendsService attendsServiceImpl;
	@Autowired 
	private statusService statusServiceImpl;
	@Autowired
	private typeService typeServiceImpl;
	
	//分页查询
	@RequestMapping(value="queryPage.action")
	public String queryPage(Model model,queryVo vo){
		Page<AoaAttendsList> page=attendsServiceImpl.queryPage(vo);
		
		queryVo queryVo=new queryVo();
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		for (AoaAttendsList attends : page.getRows()) {
			if(attends!=null && attends.getAttendsTime()!=null){
				attends.setAttendsDate(format.format(new Date(attends.getAttendsTime().getTime())));
			}
		}
		
		model.addAttribute("page", page);
		
		
		return "attendceview";
	}
	
	//根据id查询
	@RequestMapping(value="findById.action")
	public String findById(Model model,Long id){
		List<AoaAttendsList> list=attendsServiceImpl.findList(id);
		
		//查询状态
		AoaStatusListExample statusListExample=new AoaStatusListExample();
		statusListExample.createCriteria().andStatusModelEqualTo("aoa_attends_list");
		List<AoaStatusList> statusLists=statusServiceImpl.findList(statusListExample);
		
		//查询类型
		AoaTypeListExample aoaTypeListExample=new AoaTypeListExample();
		aoaTypeListExample.createCriteria().andTypeModelEqualTo("aoa_attends_list");
		List<AoaTypeList> aoaTypeLists=typeServiceImpl.findList(aoaTypeListExample);
		
		
		model.addAttribute("attends",list.get(0));
		model.addAttribute("statusLists", statusLists);
		model.addAttribute("aoaTypeLists", aoaTypeLists);
		
		return "attendceedit";
	}
	
	//修改
	@RequestMapping(value="update.action")
	public String update(AoaAttendsList attendsList){
		attendsServiceImpl.update(attendsList);
		return "redirect:/attendsController/queryPage.action";
	}
	
	//删除
	@RequestMapping(value="delete.action")
	public String delete(Long id){
		int count =attendsServiceImpl.delete(id);
		return "redirect:/attendsController/queryPage.action";
	}
	
	/*//考勤周报表 
	@RequestMapping(value="queryAttendsWeekPage.action")
	public @ResponseBody Page<weekUtils> queryAttendsWeekPage(queryVo vo) throws ParseException{
		Page<weekUtils> page=attendsServiceImpl.queryAttendsWeek(vo);
		return page;
	}
	*/
	//考勤周报表 
		@RequestMapping(value="AttendsWeekYeShu.action")
		public @ResponseBody Page<weekUtils> AttendsWeekYeShu(queryVo vo) throws ParseException{
			Page<weekUtils> page=attendsServiceImpl.AttendsWeekYeShu(vo);
			return page;
		}
		
  @RequestMapping(value="queryAttendsWeekPage.action")
  public String queryAttendsWeekPage(Model model,queryVo vo) throws ParseException{
		Page<weekUtils> page=attendsServiceImpl.queryAttendsWeek(vo);
		
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		
		model.addAttribute("page", page);
		String startDate=vo.getStartDate();
	 
		
		model.addAttribute("startDate",startDate);
		 
		 Date endDate=format.parse(vo.getEndDate());
		 Calendar endCalendar=Calendar.getInstance();
		 endCalendar.setTime(endDate);
		 endCalendar.add(Calendar.DATE,-1);
		 
		model.addAttribute("endDate",format.format(endCalendar.getTime()));
		
		System.out.println(startDate);
		System.out.println(endDate);
		
		return "attendceweektable";
	}

  @RequestMapping(value="queryAttendsMonthPage.action")
  public String queryAttendsMonthPage(Model model,queryVo vo){
	  Page<monthUtils> page=attendsServiceImpl.queryAttendsMonthPage(vo);
	  model.addAttribute("page", page);
	  model.addAttribute("vo", vo);
	  return "attendcemonthtable";
  }
  
	 
	
public static  int week(){
		
		Date date = new Date();
		SimpleDateFormat dateFm = new SimpleDateFormat("EEEE");
		String currSun = dateFm.format(date);
		int week=0;
		if(currSun=="星期一"){
			week=1;
		}else if(currSun.equals("星期二")){
			week=2;
		}else if(currSun.equals("星期三")){
			week=3;
		}else if(currSun.equals("星期四")){
			week=4;
		}else if(currSun.equals("星期五")){
			week=5;
		}else if(currSun.equals("星期六")){
			week=6;
		}else if(currSun.equals("星期日")){
			week=7;
		}
		
		return week;
  
 }

public static void main(String[] args) throws ParseException {
    Calendar cale =Calendar.getInstance();  
   
	 // 获取当月第一天和最后一天  
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");  
    String firstday, lastday;  
    // 获取前月的第一天  
    cale = Calendar.getInstance();  
    cale.setTime(new SimpleDateFormat("yyyy-MM").parse("2019-0"));
    cale.add(Calendar.MONTH, 0);  
    cale.set(Calendar.DAY_OF_MONTH, 1);  
    firstday = format.format(cale.getTime());  
    // 获取前月的最后一天  
    cale = Calendar.getInstance();  
    cale.setTime(new SimpleDateFormat("yyyy-MM").parse("2019-0"));
    cale.add(Calendar.MONTH, 1);  
    cale.set(Calendar.DAY_OF_MONTH, 0);  
    lastday = format.format(cale.getTime());  
    System.out.println("本月第一天和最后一天分别是 ： " + firstday + " and " + lastday);  
 
}
}

