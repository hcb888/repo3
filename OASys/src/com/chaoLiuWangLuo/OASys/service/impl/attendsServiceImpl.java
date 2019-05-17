package com.chaoLiuWangLuo.OASys.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chaoLiuWangLuo.OASys.entity.AoaAttendsList;
import com.chaoLiuWangLuo.OASys.entity.AoaAttendsListExample;
import com.chaoLiuWangLuo.OASys.entity.AoaDept;
import com.chaoLiuWangLuo.OASys.entity.AoaDeptExample;
import com.chaoLiuWangLuo.OASys.entity.AoaUserLoginRecord;
import com.chaoLiuWangLuo.OASys.entity.queryVo;
import com.chaoLiuWangLuo.OASys.mapper.AoaAttendsListMapper;
import com.chaoLiuWangLuo.OASys.mapper.AoaDeptMapper;
import com.chaoLiuWangLuo.OASys.service.attendsService;
import com.chaoLiuWangLuo.OASys.utils.Page;
import com.chaoLiuWangLuo.OASys.utils.monthUtils;
import com.chaoLiuWangLuo.OASys.utils.officeClosingTime;
import com.chaoLiuWangLuo.OASys.utils.weekUtils;

@Service
@Transactional
public class attendsServiceImpl implements attendsService{
	@Autowired
	private AoaAttendsListMapper mapper;
	@Autowired
	private AoaDeptMapper deptMapper;

	public Page<AoaAttendsList> queryPage(queryVo vo) {
		Page<AoaAttendsList> page=new Page<AoaAttendsList>();
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
		int count=mapper.attendsFindCount(vo);
		//查询数据
		List<AoaAttendsList> list=mapper.attendsQueryPage(vo);
		
		page.setPage(vo.getPage());
		page.setSize(vo.getSize());
		page.setTotal(count);
		page.setRows(list);
		
		return page;
	}

	public List<AoaAttendsList> findList(AoaAttendsListExample example) {
		 
		return mapper.selectByExample(example);
	}

	public void update(AoaAttendsList attendsList) {  
		  mapper.update(attendsList);
	}

	public int delete(Long id) {
	 
		return mapper.deleteByPrimaryKey(id);
	}

	public List<AoaAttendsList> findList(Long id) {
		 
		return mapper.findList(id);
	}

	public Page<weekUtils> queryAttendsWeek(queryVo vo) {
		 int week=week();
			
		 SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		 
		 //开始时间
		 Calendar startCalendar=Calendar.getInstance();
		 startCalendar.add(Calendar.DATE,-week+1);
		 Date startDate=startCalendar.getTime();
		 
		 //结束时间
		 Date endDate=startCalendar.getTime();
		 Calendar endCalendar=Calendar.getInstance();
		 endCalendar.add(Calendar.DATE,7);
		 endDate=endCalendar.getTime();
		 
		
		Page<weekUtils> page=new Page<weekUtils>();
		//判断当前页数是否为空
		if(vo.getPage()==null){
			vo.setPage(1);
		} 
		
		//判断当前显示页数是否为空
		if(vo.getSize()==null){
			vo.setSize(3);
		}
		
		//判断开始时间是否为空
		if(vo.getStartDate()==null){
			vo.setStartDate(format.format(startDate));
		} 
		//判断结束时间是否为空
		if(vo.getEndDate()==null){
			vo.setEndDate(format.format(endDate));
		}
		
		//算出开始条数
		vo.setStartRow((vo.getPage()-1)*vo.getSize());
		
		//查询总条数
		List<Integer> counts=mapper.queryAttendsWeekCount(vo); 
		//查询数据
		List<AoaAttendsList> list=mapper.queryAttendsWeekPage(vo);
		
		//员工一个星期打开情况
		List<weekUtils> weekList=new ArrayList<weekUtils>();
		
		//根据查询出来的id在次查询此用户的一个星期打开情况
		for (AoaAttendsList attendsList : list) {
			//创建一个员工一个星期出勤对象
			weekUtils weekUtils=new weekUtils();
			
			
			
			//把员工id添加到条件中
			//判断userid是否为空
			if(attendsList.getUser()!=null && attendsList.getUser().getUserId()!=null){
				vo.setId1(attendsList.getUser().getUserId());
		
				//根据id查询出一个员工一个星期出勤情况
				List<AoaAttendsList> aoaAttendsLists=mapper.findByWeekId(vo);
				
				//根据部门id查询部门			
				//判断部门id是否为空
				/*if(aoaAttendsLists.get(0)!=null && aoaAttendsLists.get(0).getUser()!=null && aoaAttendsLists.get(0).getUser().getDept()!=null && aoaAttendsLists.get(0).getUser().getDept().getDeptId()!=null){
					AoaDeptExample example=new AoaDeptExample();
					example.createCriteria().andDeptIdEqualTo(aoaAttendsLists.get(0).getUser().getDept().getDeptId());
					List<AoaDept > deptList=deptMapper.selectByExample(example);
					//把部门名称添加到week对象中
					weekUtils.setDeptName(deptList.get(0).getDeptName());
				}*/
				
				
				//把员工名称添加到week对象中
				weekUtils.setUserName(aoaAttendsLists.get(0).getUser().getUserName());
				//把员工单位名称添加到week对象中
				if(attendsList!=null && attendsList.getUser()!=null && attendsList.getUser().getDept()!=null){
					weekUtils.setDeptName(attendsList.getUser().getDept().getDeptName());
				}
				
				
				//创建星期一上下班对象
				officeClosingTime mondayTime=new officeClosingTime();
				//创建星期二上下班对象
				officeClosingTime tuesdayTime=new officeClosingTime();
				//创建星期三上下班对象
				officeClosingTime wednesdayTime=new officeClosingTime();
				//创建星期四上下班对象
				officeClosingTime thursdayTime=new officeClosingTime();
				//创建星期五上下班对象
				officeClosingTime fridayTime=new officeClosingTime();
				//创建星期六上下班对象
				officeClosingTime saturdayTime=new officeClosingTime();
				//创建星期日上下班对象
				officeClosingTime sundayTime=new officeClosingTime();
				
				
				
				//循环一个员工一个星期出勤情况
				for (AoaAttendsList att : aoaAttendsLists) {
					//星期一
					if(att.getWeekOfday().equals("星期一")){	
							//上班时间
							if(att.getType().getTypeName().equals("上班")){
								mondayTime.setOfficeHours(att.getAttendHmtime());
							}else{
								mondayTime.setClosingTime(att.getAttendHmtime());
							}
							//下班时间
							if(att.getType().getTypeName().equals("下班")){
								mondayTime.setClosingTime(att.getAttendHmtime());
							}
						 
					}
					
					//星期二
					if(att.getWeekOfday().equals("星期二")){
						//上班时间
						if(att.getType().getTypeName().equals("上班")){
							tuesdayTime.setOfficeHours(att.getAttendHmtime());
						}
						//下班时间
						if(att.getType().getTypeName().equals("下班")){
							tuesdayTime.setClosingTime(att.getAttendHmtime());
						}
					}
					
					//星期三
					if(att.getWeekOfday().equals("星期三")){
						//上班时间
						if(att.getType().getTypeName().equals("上班")){
							wednesdayTime.setOfficeHours(att.getAttendHmtime());
						}
						//下班时间
						if(att.getType().getTypeName().equals("下班")){
							wednesdayTime.setClosingTime(att.getAttendHmtime());
						}						
					}
					
					//星期四
					if(att.getWeekOfday().equals("星期四")){
						//上班时间
						if(att.getType().getTypeName().equals("上班")){
							thursdayTime.setOfficeHours(att.getAttendHmtime());
						}
						//下班时间
						if(att.getType().getTypeName().equals("下班")){
							thursdayTime.setClosingTime(att.getAttendHmtime());
						}
					}
					
					//星期五
					if(att.getWeekOfday().equals("星期五")){
						//上班时间
						if(att.getType().getTypeName().equals("上班")){
							fridayTime.setOfficeHours(att.getAttendHmtime());
						}
						//下班时间
						if(att.getType().getTypeName().equals("下班")){
							fridayTime.setClosingTime(att.getAttendHmtime());
						}
					}
					
					//星期六
					if(att.getWeekOfday().equals("星期六")){
						//上班时间
						if(att.getType().getTypeName().equals("上班")){
							saturdayTime.setOfficeHours(att.getAttendHmtime());
						}
						//下班时间
						if(att.getType().getTypeName().equals("下班")){
							saturdayTime.setClosingTime(att.getAttendHmtime());
						}
					}
					
					//星期日
					if(att.getWeekOfday().equals("星期日")){
						//上班时间
						if(att.getType().getTypeName().equals("上班")){
							sundayTime.setOfficeHours(att.getAttendHmtime());
						}
						//下班时间
						if(att.getType().getTypeName().equals("下班")){
							sundayTime.setClosingTime(att.getAttendHmtime());
						
						}
					}
					
				}
				//把星期一上下班时间添加到一个星期出勤情况week对象中
				weekUtils.getMonday().add(mondayTime);
				//把星期二上下班时间添加到一个星期出勤情况week对象中
				weekUtils.getTuesday().add(tuesdayTime);
				//把星期三上下班时间添加到一个星期出勤情况week对象中
				weekUtils.getWednesday().add(wednesdayTime);
				//把星期四上下班时间添加到一个星期出勤情况week对象中
				weekUtils.getThursday().add(thursdayTime);
				//把星期五上下班时间添加到一个星期出勤情况week对象中
				weekUtils.getFriday().add(fridayTime);
				//把星期六上下班时间添加到一个星期出勤情况week对象中
				weekUtils.getSaturday().add(saturdayTime);
				//把星期日上下班时间添加到一个星期出勤情况week对象中
				weekUtils.getSunday().add(sundayTime);
				
				weekList.add(weekUtils);
			}
		}
		
		page.setPage(vo.getPage());
		page.setSize(vo.getSize());
		page.setTotal(counts.size());
		page.setRows(weekList);
		
		return page;
	}
	
	
	public Page<weekUtils> AttendsWeekYeShu(queryVo vo) {
		 int week=week();
			
		 SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		 
		 //开始时间
		 Calendar startCalendar=Calendar.getInstance();
		 startCalendar.add(Calendar.DATE,-week+1);
		 Date startDate=startCalendar.getTime();
		 
		 //结束时间
		  
	     Calendar endCalendar=Calendar.getInstance();
	     endCalendar.setTime(startDate);
		 endCalendar.add(Calendar.DATE,+7);
		 Date endDate=endCalendar.getTime();
		 
			//判断当前显示页数是否为空
			if(vo.getSize()==null){
				vo.setSize(3);
			}
			
			//判断开始时间是否为空
			if(vo.getStartDate()==null){
				vo.setStartDate(format.format(startDate));
			}
			//判断结束时间是否为空
			if(vo.getEndDate()==null){
				vo.setEndDate(format.format(endDate));
			}
			
		 
		
		Page<weekUtils> page=new Page<weekUtils>();
		//查询总条数
		List<Integer> counts=mapper.queryAttendsWeekCount(vo); 
		page.setSize(vo.getSize());
		page.setTotal(counts.size());

		return page;
	}
	
	public int week(){
		
		Date date = new Date();
		SimpleDateFormat dateFm = new SimpleDateFormat("EEEE");
		String currSun = dateFm.format(date);
		int week=0;
		if(currSun.equals("星期一")){
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
	/*
	 * public Page<weekUtils> queryAttendsWeek(queryVo vo) {
		 int week=week();
			
		 SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		 
		 //开始时间
		 Calendar startCalendar=Calendar.getInstance();
		 startCalendar.add(Calendar.DATE,-week+1);
		 Date startDate=startCalendar.getTime();
		 
		 //结束时间
		 Date endDate=startCalendar.getTime();
		 Calendar endCalendar=Calendar.getInstance();
		 endCalendar.add(Calendar.DATE,-week+1+7);
		 endDate=endCalendar.getTime();
		 
		
		Page<weekUtils> page=new Page<weekUtils>();
		//判断当前页数是否为空
		if(vo.getPage()==null){
			vo.setPage(1);
		} 
		
		//判断当前显示页数是否为空
		if(vo.getSize()==null){
			vo.setSize(3);
		}
		
		//判断开始时间是否为空
		if(vo.getStartDate()==null){
			vo.setStartDate(format.format(startDate));
		}
		//判断结束时间是否为空
		if(vo.getEndDate()==null){
			vo.setEndDate(format.format(endDate));
		}
		
		//算出开始条数
		vo.setStartRow((vo.getPage()-1)*vo.getSize());
		
		//查询总条数
		List<Integer> counts=mapper.queryAttendsWeekCount(vo); 
		//查询数据
		List<AoaAttendsList> list=mapper.queryAttendsWeekPage(vo);
		
		//员工一个星期打开情况
		List<weekUtils> weekList=new ArrayList<weekUtils>();
		
		//根据查询出来的id在次查询此用户的一个星期打开情况
		for (AoaAttendsList attendsList : list) {
			//创建一个员工一个星期出勤对象
			weekUtils weekUtils=new weekUtils();
			
			
			
			//把员工id添加到条件中
			//判断userid是否为空
			if(attendsList.getUser()!=null && attendsList.getUser().getUserId()!=null){
				vo.setId1(attendsList.getUser().getUserId());
		
				//根据id查询出一个员工一个星期出勤情况
				List<AoaAttendsList> aoaAttendsLists=mapper.findByWeekId(vo);
				
				//根据部门id查询部门			
				//判断部门id是否为空
				if(aoaAttendsLists.get(0)!=null && aoaAttendsLists.get(0).getUser()!=null && aoaAttendsLists.get(0).getUser().getDept()!=null && aoaAttendsLists.get(0).getUser().getDept().getDeptId()!=null){
					AoaDeptExample example=new AoaDeptExample();
					example.createCriteria().andDeptIdEqualTo(aoaAttendsLists.get(0).getUser().getDept().getDeptId());
					List<AoaDept > deptList=deptMapper.selectByExample(example);
					//把部门名称添加到week对象中
					weekUtils.setDeptName(deptList.get(0).getDeptName());
				}
				
				
				//把员工名称添加到week对象中
				weekUtils.setUserName(aoaAttendsLists.get(0).getUser().getUserName());
				
				
				
				//创建星期一上下班对象
				officeClosingTime mondayTime=new officeClosingTime();
				//创建星期二上下班对象
				officeClosingTime tuesdayTime=new officeClosingTime();
				//创建星期三上下班对象
				officeClosingTime wednesdayTime=new officeClosingTime();
				//创建星期四上下班对象
				officeClosingTime thursdayTime=new officeClosingTime();
				//创建星期五上下班对象
				officeClosingTime fridayTime=new officeClosingTime();
				//创建星期六上下班对象
				officeClosingTime saturdayTime=new officeClosingTime();
				//创建星期日上下班对象
				officeClosingTime sundayTime=new officeClosingTime();
				
				
				
				//循环一个员工一个星期出勤情况
				for (AoaAttendsList att : aoaAttendsLists) {
					//星期一
					if(att.getWeekOfday().equals("星期一")){	
							//上班时间
							if(att.getType().getTypeName().equals("上班")){
								mondayTime.setOfficeHours(att.getAttendHmtime());
							}else{
								mondayTime.setClosingTime(att.getAttendHmtime());
							}
							//下班时间
							if(att.getType().getTypeName().equals("下班")){
								mondayTime.setClosingTime(att.getAttendHmtime());
							}
						 
					}
					
					//星期二
					if(att.getWeekOfday().equals("星期二")){
						//上班时间
						if(att.getType().getTypeName().equals("上班")){
							tuesdayTime.setOfficeHours(att.getAttendHmtime());
						}
						//下班时间
						if(att.getType().getTypeName().equals("下班")){
							tuesdayTime.setClosingTime(att.getAttendHmtime());
						}
					}
					
					//星期三
					if(att.getWeekOfday().equals("星期三")){
						//上班时间
						if(att.getType().getTypeName().equals("上班")){
							wednesdayTime.setOfficeHours(att.getAttendHmtime());
						}
						//下班时间
						if(att.getType().getTypeName().equals("下班")){
							wednesdayTime.setClosingTime(att.getAttendHmtime());
						}						
					}
					
					//星期四
					if(att.getWeekOfday().equals("星期四")){
						//上班时间
						if(att.getType().getTypeName().equals("上班")){
							thursdayTime.setOfficeHours(att.getAttendHmtime());
						}
						//下班时间
						if(att.getType().getTypeName().equals("下班")){
							thursdayTime.setClosingTime(att.getAttendHmtime());
						}
					}
					
					//星期五
					if(att.getWeekOfday().equals("星期五")){
						//上班时间
						if(att.getType().getTypeName().equals("上班")){
							fridayTime.setOfficeHours(att.getAttendHmtime());
						}
						//下班时间
						if(att.getType().getTypeName().equals("下班")){
							fridayTime.setClosingTime(att.getAttendHmtime());
						}
					}
					
					//星期六
					if(att.getWeekOfday().equals("星期六")){
						//上班时间
						if(att.getType().getTypeName().equals("上班")){
							saturdayTime.setOfficeHours(att.getAttendHmtime());
						}
						//下班时间
						if(att.getType().getTypeName().equals("下班")){
							saturdayTime.setClosingTime(att.getAttendHmtime());
						}
					}
					
					//星期日
					if(att.getWeekOfday().equals("星期日")){
						//上班时间
						if(att.getType().getTypeName().equals("上班")){
							sundayTime.setOfficeHours(att.getAttendHmtime());
						}
						//下班时间
						if(att.getType().getTypeName().equals("下班")){
							sundayTime.setClosingTime(att.getAttendHmtime());
						
						}
					}
					
				}
				//把星期一上下班时间添加到一个星期出勤情况week对象中
				weekUtils.getMonday().add(mondayTime);
				//把星期二上下班时间添加到一个星期出勤情况week对象中
				weekUtils.getTuesday().add(tuesdayTime);
				//把星期三上下班时间添加到一个星期出勤情况week对象中
				weekUtils.getWednesday().add(wednesdayTime);
				//把星期四上下班时间添加到一个星期出勤情况week对象中
				weekUtils.getThursday().add(thursdayTime);
				//把星期五上下班时间添加到一个星期出勤情况week对象中
				weekUtils.getFriday().add(fridayTime);
				//把星期六上下班时间添加到一个星期出勤情况week对象中
				weekUtils.getSaturday().add(saturdayTime);
				//把星期日上下班时间添加到一个星期出勤情况week对象中
				weekUtils.getSunday().add(sundayTime);
				
				weekList.add(weekUtils);
			}
		}
		
		page.setPage(vo.getPage());
		page.setSize(vo.getSize());
		page.setTotal(counts.size());
		page.setRows(weekList);
		
		return page;
	}
	 * */
	
	public static void main(String[] args) throws ParseException {
		 SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		 Date date=format.parse("2019-03-31");
		 Calendar startCalendar=Calendar.getInstance();
		 startCalendar.setTime(date);
		 startCalendar.add(Calendar.DATE,1);
		 Date startDate=startCalendar.getTime();
		 
		 System.out.println(format.format(startDate));
	}

	public Page<monthUtils> queryAttendsMonthPage(queryVo vo)    {
		Calendar cale =Calendar.getInstance();  
		 // 获取当月第一天和最后一天  
	    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");  
	    SimpleDateFormat formatMonth=new SimpleDateFormat("yyyy-MM");
	    String firstday, lastday;  
	    // 获取前月的第一天  
	    cale = Calendar.getInstance();  
	    //判断查询的年月是否为空
	    if(vo.getYearMonth()!=null){
	    	try {
				cale.setTime(formatMonth.parse(vo.getYearMonth()));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }
	    cale.add(Calendar.MONTH, 0);  
	    
	    String my=new SimpleDateFormat("yyyy-MM").format(cale.getTime());
	 
	    
	    cale.set(Calendar.DAY_OF_MONTH, 1);  
	    firstday = format.format(cale.getTime());  
	    // 获取前月的最后一天  
	    cale = Calendar.getInstance();  
	    //判断查询的年月是否为空
	    if(vo.getYearMonth()!=null){
	    	try {
				cale.setTime(formatMonth.parse(vo.getYearMonth()));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }
	    cale.add(Calendar.MONTH, 1);  
	    cale.set(Calendar.DAY_OF_MONTH, 0);  
	    lastday = format.format(cale.getTime());    
	    
	    //当去到当前月第一天和最后一天
	    vo.setStartDate(firstday);
	    vo.setEndDate(lastday);
	    
	    
	    Page<monthUtils> page=new Page<monthUtils>();
		//判断当前页数是否为空
		if(vo.getPage()==null){
			vo.setPage(1);
		} 
		
		//判断当前显示页数是否为空
		if(vo.getSize()==null){
			vo.setSize(3);
		}
		
		 
		
		//算出开始条数
		vo.setStartRow((vo.getPage()-1)*vo.getSize());
		
		//查询总条数
		List<Integer> counts=mapper.queryAttendsMonthCount(vo); 
		//查询数据
		List<AoaAttendsList> list=mapper.queryAttendsMonthPage(vo);
		
		//当前时间段的员工出勤情况
		List<monthUtils> monthList=new ArrayList<monthUtils>();
		
		//循环list根据id查询出勤情况
		for (AoaAttendsList attends : list) {
			//创建当前员工一个月的出勤对象
			monthUtils monthUtils=new monthUtils();
			
			//判断userName是否为空
			if(attends!=null && attends.getUser()!=null && attends.getUser().getUserName()!=null){
				monthUtils.setUserName(attends.getUser().getUserName());
			}
			//判断dept是否为空
			if(attends!=null && attends.getUser()!=null && attends.getUser().getDept()!=null && attends.getUser().getDept().getDeptName()!=null){
				monthUtils.setDeptName(attends.getUser().getDept().getDeptName());
			}
			
			/**正常 */
			//private Integer normal;
			//设置参数
			vo.setId1(attends.getUser().getUserId());
			vo.setId2(10l);
			monthUtils.setNormal(mapper.findByStatusId(vo));
			
			/**迟到 */
			//private Integer beLate;
			//设置参数
			vo.setId2(11l);
			monthUtils.setBeLate(mapper.findByStatusId(vo));
			
			/**早退*/
			//private Integer leaveEarly;
			//设置参数
			vo.setId2(12l);
			monthUtils.setLeaveEarly(mapper.findByStatusId(vo));
			
			/**旷工*/
			//private Integer absenteeism;
			//设置参数
			vo.setId2(13l);
			monthUtils.setAbsenteeism(mapper.findByStatusId(vo));
			
			
			/**请假 */
			//private Integer leave;
			//设置参数
			vo.setId2(30l);
			monthUtils.setLeave(mapper.findByStatusId(vo));
			
			/**出差 */
			//private Integer evection;
			//设置参数
			vo.setId2(31l);
			monthUtils.setEvection(mapper.findByStatusId(vo));

			monthList.add(monthUtils);
		}
		 //获取到当前年月
	    vo.setYearMonth(my);
		page.setRows(monthList);
		if(counts!=null){
			page.setTotal(counts.size());
		}
		page.setPage(vo.getPage());
		page.setSize(vo.getSize());
		
		return page;
	}

 
}

