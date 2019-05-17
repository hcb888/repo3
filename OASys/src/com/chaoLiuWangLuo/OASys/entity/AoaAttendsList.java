package com.chaoLiuWangLuo.OASys.entity;

import java.util.Date;

public class AoaAttendsList {
    private Long attendsId;

    private String attendsIp;

    private String attendsRemark;

    private Date attendsTime;

    private AoaStatusList status;

    private AoaTypeList type;

    private AoaUser user;

    private String attendHmtime;

    private String weekOfday;

    private Double holidayDays;

    private Date holidayStart;
    
    private String attendsDate;

    public Long getAttendsId() {
        return attendsId;
    }

    public void setAttendsId(Long attendsId) {
        this.attendsId = attendsId;
    }

    public String getAttendsIp() {
        return attendsIp;
    }

    public void setAttendsIp(String attendsIp) {
        this.attendsIp = attendsIp == null ? null : attendsIp.trim();
    }

    public String getAttendsRemark() {
        return attendsRemark;
    }

    public void setAttendsRemark(String attendsRemark) {
        this.attendsRemark = attendsRemark == null ? null : attendsRemark.trim();
    }

    public Date getAttendsTime() {
        return attendsTime;
    }

    public void setAttendsTime(Date attendsTime) {
        this.attendsTime = attendsTime;
    }

    

    public AoaStatusList getStatus() {
		return status;
	}

	public void setStatus(AoaStatusList status) {
		this.status = status;
	}

	public AoaTypeList getType() {
		return type;
	}

	public void setType(AoaTypeList type) {
		this.type = type;
	}

	public AoaUser getUser() {
		return user;
	}

	public void setUser(AoaUser user) {
		this.user = user;
	}

	public String getAttendHmtime() {
        return attendHmtime;
    }

    public void setAttendHmtime(String attendHmtime) {
        this.attendHmtime = attendHmtime == null ? null : attendHmtime.trim();
    }

    public String getWeekOfday() {
        return weekOfday;
    }

    public void setWeekOfday(String weekOfday) {
        this.weekOfday = weekOfday == null ? null : weekOfday.trim();
    }

    public Double getHolidayDays() {
        return holidayDays;
    }

    public void setHolidayDays(Double holidayDays) {
        this.holidayDays = holidayDays;
    }

    public Date getHolidayStart() {
        return holidayStart;
    }

    public void setHolidayStart(Date holidayStart) {
        this.holidayStart = holidayStart;
    }

	public String getAttendsDate() {
		return attendsDate;
	}

	public void setAttendsDate(String attendsDate) {
		this.attendsDate = attendsDate;
	}
    
}