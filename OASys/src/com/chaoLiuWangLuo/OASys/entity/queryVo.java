package com.chaoLiuWangLuo.OASys.entity;

import java.util.List;

public class queryVo {
	private String startDate;
	private String endDate;
	private List<AoaDept> depts;
	private List<AoaPosition> positions;
	private Long id1; 
	private Long id2;
	private Long id3;
	private String find;
	
	//总页数
	private int countPage;
	private String[] reciverArray;
	//接收人数组
	private String [] nameArray;
	
	//差旅交通明细总额
	private Double trafficRental ;
	
	//差旅住宿明细
	private Double stayRental ;
	
	//id
	private String[] idArray;
 	
	//证明人
	private String[] zmrArray;
	private String name;
	
	//审核人id
	private Long rId;
	//审核人name
	private String rName;
	//流程id
	private Long processId;
	
	//什么计划
	private String jh;
	
	//生日
	private String birthDate;
	//入职日期
	private String hireDate;
	
	//字母
	private String alph;
	//通讯条件
	private String baseKey;
	
	//用户名
	private String uName;
	//电话
	private String phone;
	
	//类型id
	private Long tId;
	//类型名称
	private String tName;
	private String  tModel;
	
	
	
	
	
	public String[] getIdArray() {
		return idArray;
	}
	public void setIdArray(String[] idArray) {
		this.idArray = idArray;
	}
	public String gettModel() {
		return tModel;
	}
	public void settModel(String tModel) {
		this.tModel = tModel;
	}
	public String gettName() {
		return tName;
	}
	public void settName(String tName) {
		this.tName = tName;
	}
	public Long gettId() {
		return tId;
	}
	public void settId(Long tId) {
		this.tId = tId;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAlph() {
		return alph;
	}
	public void setAlph(String alph) {
		this.alph = alph;
	}
	public String getBaseKey() {
		return baseKey;
	}
	public void setBaseKey(String baseKey) {
		this.baseKey = baseKey;
	}
	public String getJh() {
		return jh;
	}
	public void setJh(String jh) {
		this.jh = jh;
	}
	//时间
	private String time;
	
	//总钱数
	private Double countMoney;
	
	//合计大写
	private String amountInTotal;
	
	//当前年月
	private String yearMonth;
	
	//日
	private  String day;
	//周
	private String week;
	//月
	private String month;
	

	//考勤时间
	private String attendsDate;
	
	//当前页
	private Integer page;
	//每页数
	private Integer size; 
	//开始行
	private Integer startRow;
	
	
	public Long getrId() {
		return rId;
	}
	public void setrId(Long rId) {
		this.rId = rId;
	}
	public String getrName() {
		return rName;
	}
	public void setrName(String rName) {
		this.rName = rName;
	}
	public String[] getZmrArray() {
		return zmrArray;
	}
	public int getCountPage() {
		return countPage;
	}
	public void setCountPage(int countPage) {
		this.countPage = countPage;
	}
	public void setZmrArray(String[] zmrArray) {
		this.zmrArray = zmrArray;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getWeek() {
		return week;
	}
	public void setWeek(String week) {
		this.week = week;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	 
	public String getYearMonth() {
		return yearMonth;
	}
	public void setYearMonth(String yearMonth) {
		this.yearMonth = yearMonth;
	}
	public List<AoaDept> getDepts() {
		return depts;
	}
	public void setDepts(List<AoaDept> depts) {
		this.depts = depts;
	}
 
	public Long getProcessId() {
		return processId;
	}
	public void setProcessId(Long processId) {
		this.processId = processId;
	}
	 
	public List<AoaPosition> getPositions() {
		return positions;
	}
	public String getAmountInTotal() {
		return amountInTotal;
	}
	public void setAmountInTotal(String amountInTotal) {
		this.amountInTotal = amountInTotal;
	}
	public Double getCountMoney() {
		return countMoney;
	}
	public void setCountMoney(Double countMoney) {
		this.countMoney = countMoney;
	}
	public void setPositions(List<AoaPosition> positions) {
		this.positions = positions;
	}
	public Long getId1() {
		return id1;
	}
	public String[] getNameArray() {
		return nameArray;
	}
	public void setNameArray(String[] nameArray) {
		this.nameArray = nameArray;
	}
	public void setId1(Long id1) {
		this.id1 = id1;
	}
	public Long getId2() {
		return id2;
	}
	public void setId2(Long id2) {
		this.id2 = id2;
	}
	public Long getId3() {
		return id3;
	}
	public void setId3(Long id3) {
		this.id3 = id3;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getSize() {
		return size;
	}
	public void setSize(Integer size) {
		this.size = size;
	}
	public Integer getStartRow() {
		return startRow;
	}
	public void setStartRow(Integer startRow) {
		this.startRow = startRow;
	}
	public String getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}
	public String getHireDate() {
		return hireDate;
	}
	public void setHireDate(String hireDate) {
		this.hireDate = hireDate;
	}
	public String getFind() {
		return find;
	}
	public void setFind(String find) {
		this.find = find;
	}
	public String getAttendsDate() {
		return attendsDate;
	}
	public void setAttendsDate(String attendsDate) {
		this.attendsDate = attendsDate;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String[] getReciverArray() {
		return reciverArray;
	}
	public void setReciverArray(String[] reciverArray) {
		this.reciverArray = reciverArray;
	}
	public Double getTrafficRental() {
		return trafficRental;
	}
	public void setTrafficRental(Double trafficRental) {
		this.trafficRental = trafficRental;
	}
	public Double getStayRental() {
		return stayRental;
	}
	public void setStayRental(Double stayRental) {
		this.stayRental = stayRental;
	}
	
}
