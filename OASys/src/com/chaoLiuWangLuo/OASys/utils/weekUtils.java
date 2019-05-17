package com.chaoLiuWangLuo.OASys.utils;

import java.util.ArrayList;
import java.util.List;

public class weekUtils {
	/**星期一*/
	private List<officeClosingTime>  monday=new ArrayList<officeClosingTime>();
	/**星期二*/
	private List<officeClosingTime>  tuesday=new ArrayList<officeClosingTime>();
	/**星期三*/
	private List<officeClosingTime>  wednesday=new ArrayList<officeClosingTime>();
	/**星期四*/
	private List<officeClosingTime>  thursday=new ArrayList<officeClosingTime>();
	/**星期五*/
	private List<officeClosingTime>  friday=new ArrayList<officeClosingTime>();
	/**星期六*/
	private List<officeClosingTime>  saturday=new ArrayList<officeClosingTime>();
	/**星期日*/
	private List<officeClosingTime>  sunday=new ArrayList<officeClosingTime>();
	
	/**部门名称*/
	private String deptName;
	
	/**用户名*/
	private String userName;

	public List<officeClosingTime> getMonday() {
		return monday;
	}

	public void setMonday(List<officeClosingTime> monday) {
		this.monday = monday;
	}

	public List<officeClosingTime> getTuesday() {
		return tuesday;
	}

	public void setTuesday(List<officeClosingTime> tuesday) {
		this.tuesday = tuesday;
	}

	public List<officeClosingTime> getWednesday() {
		return wednesday;
	}

	public void setWednesday(List<officeClosingTime> wednesday) {
		this.wednesday = wednesday;
	}

	public List<officeClosingTime> getThursday() {
		return thursday;
	}

	public void setThursday(List<officeClosingTime> thursday) {
		this.thursday = thursday;
	}

	public List<officeClosingTime> getFriday() {
		return friday;
	}

	public void setFriday(List<officeClosingTime> friday) {
		this.friday = friday;
	}

	public List<officeClosingTime> getSaturday() {
		return saturday;
	}

	public void setSaturday(List<officeClosingTime> saturday) {
		this.saturday = saturday;
	}

	public List<officeClosingTime> getSunday() {
		return sunday;
	}

	public void setSunday(List<officeClosingTime> sunday) {
		this.sunday = sunday;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	 

}
