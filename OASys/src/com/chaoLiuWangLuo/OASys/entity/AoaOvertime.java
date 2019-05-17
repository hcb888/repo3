package com.chaoLiuWangLuo.OASys.entity;

public class AoaOvertime {
    private Long overtimeId;

    private AoaTypeList overtimeType;

    private AoaProcessList process;

    private String personnelAdvice;

    private String managerAdvice;

    public Long getOvertimeId() {
        return overtimeId;
    }

    public void setOvertimeId(Long overtimeId) {
        this.overtimeId = overtimeId;
    }

    

    public AoaTypeList getOvertimeType() {
		return overtimeType;
	}

	public void setOvertimeType(AoaTypeList overtimeType) {
		this.overtimeType = overtimeType;
	}

	public AoaProcessList getProcess() {
		return process;
	}

	public void setProcess(AoaProcessList process) {
		this.process = process;
	}

	public String getPersonnelAdvice() {
        return personnelAdvice;
    }

    public void setPersonnelAdvice(String personnelAdvice) {
        this.personnelAdvice = personnelAdvice == null ? null : personnelAdvice.trim();
    }

    public String getManagerAdvice() {
        return managerAdvice;
    }

    public void setManagerAdvice(String managerAdvice) {
        this.managerAdvice = managerAdvice == null ? null : managerAdvice.trim();
    }
}