package com.chaoLiuWangLuo.OASys.entity;

import java.util.Date;

public class AoaTraffic {
    private Long trafficId;

    private String departName;

    private Date departTime;
    //字符串版时间
    private String departDate;

    private String reachName;

    private String seatType;

    private Double trafficMoney;

    private String trafficName;

    private AoaEvectionmoney tEvectionmoney;

    private AoaUser tUser;

	public Long getTrafficId() {
		return trafficId;
	}

	public void setTrafficId(Long trafficId) {
		this.trafficId = trafficId;
	}

	public String getDepartName() {
		return departName;
	}

	public void setDepartName(String departName) {
		this.departName = departName;
	}

	public Date getDepartTime() {
		return departTime;
	}

	public void setDepartTime(Date departTime) {
		this.departTime = departTime;
	}

	public String getDepartDate() {
		return departDate;
	}

	public void setDepartDate(String departDate) {
		this.departDate = departDate;
	}

	public String getReachName() {
		return reachName;
	}

	public void setReachName(String reachName) {
		this.reachName = reachName;
	}

	public String getSeatType() {
		return seatType;
	}

	public void setSeatType(String seatType) {
		this.seatType = seatType;
	}

	public Double getTrafficMoney() {
		return trafficMoney;
	}

	public void setTrafficMoney(Double trafficMoney) {
		this.trafficMoney = trafficMoney;
	}

	public String getTrafficName() {
		return trafficName;
	}

	public void setTrafficName(String trafficName) {
		this.trafficName = trafficName;
	}
 

	public AoaEvectionmoney gettEvectionmoney() {
		return tEvectionmoney;
	}

	public void settEvectionmoney(AoaEvectionmoney tEvectionmoney) {
		this.tEvectionmoney = tEvectionmoney;
	}

	public AoaUser gettUser() {
		return tUser;
	}

	public void settUser(AoaUser tUser) {
		this.tUser = tUser;
	}

    
}