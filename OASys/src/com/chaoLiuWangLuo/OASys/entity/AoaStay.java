package com.chaoLiuWangLuo.OASys.entity;

import java.util.Date;

public class AoaStay {
    private Long stayId;

    private Integer day;

    private String hotelName;

    private Date leaveTime;
    
    private String leaveDate;

    private String stayCity;

    private Double stayMoney;

    private Date stayTime;
    
    private String stayDate;

    private AoaEvectionmoney sEvectionmoney;

    private AoaUser sUser;

	public Long getStayId() {
		return stayId;
	}

	public void setStayId(Long stayId) {
		this.stayId = stayId;
	}

	public Integer getDay() {
		return day;
	}

	public void setDay(Integer day) {
		this.day = day;
	}

	public String getHotelName() {
		return hotelName;
	}

	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}

	public Date getLeaveTime() {
		return leaveTime;
	}

	public void setLeaveTime(Date leaveTime) {
		this.leaveTime = leaveTime;
	}

	public String getLeaveDate() {
		return leaveDate;
	}

	public void setLeaveDate(String leaveDate) {
		this.leaveDate = leaveDate;
	}

	public String getStayCity() {
		return stayCity;
	}

	public void setStayCity(String stayCity) {
		this.stayCity = stayCity;
	}

	public Double getStayMoney() {
		return stayMoney;
	}

	public void setStayMoney(Double stayMoney) {
		this.stayMoney = stayMoney;
	}

	public Date getStayTime() {
		return stayTime;
	}

	public void setStayTime(Date stayTime) {
		this.stayTime = stayTime;
	}

	public String getStayDate() {
		return stayDate;
	}

	public void setStayDate(String stayDate) {
		this.stayDate = stayDate;
	}

	public AoaEvectionmoney getsEvectionmoney() {
		return sEvectionmoney;
	}

	public void setsEvectionmoney(AoaEvectionmoney sEvectionmoney) {
		this.sEvectionmoney = sEvectionmoney;
	}

	public AoaUser getsUser() {
		return sUser;
	}

	public void setsUser(AoaUser sUser) {
		this.sUser = sUser;
	}

	 

   
}