package com.chaoLiuWangLuo.OASys.entity;

public class AoaHoliday {
    private Long holidayId;

    private Integer leaveDays;

    private AoaTypeList holidayType;

    private AoaProcessList process;

    private String managerAdvice;

    private String personnelAdvice;

    public Long getHolidayId() {
        return holidayId;
    }

    public void setHolidayId(Long holidayId) {
        this.holidayId = holidayId;
    }

    public Integer getLeaveDays() {
        return leaveDays;
    }

    public void setLeaveDays(Integer leaveDays) {
        this.leaveDays = leaveDays;
    }

  

    public AoaTypeList getHolidayType() {
		return holidayType;
	}

	public void setHolidayType(AoaTypeList holidayType) {
		this.holidayType = holidayType;
	}

	public AoaProcessList getProcess() {
		return process;
	}

	public void setProcess(AoaProcessList process) {
		this.process = process;
	}

	public String getManagerAdvice() {
        return managerAdvice;
    }

    public void setManagerAdvice(String managerAdvice) {
        this.managerAdvice = managerAdvice == null ? null : managerAdvice.trim();
    }

    public String getPersonnelAdvice() {
        return personnelAdvice;
    }

    public void setPersonnelAdvice(String personnelAdvice) {
        this.personnelAdvice = personnelAdvice == null ? null : personnelAdvice.trim();
    }
}