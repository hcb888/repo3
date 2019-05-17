package com.chaoLiuWangLuo.OASys.entity;

public class AoaEvection {
    private Long evectionId;

    private AoaTypeList evectionType;

    private AoaProcessList process;

    private String personnelAdvice;

    private String managerAdvice;

	public Long getEvectionId() {
		return evectionId;
	}

	public void setEvectionId(Long evectionId) {
		this.evectionId = evectionId;
	}

	public AoaTypeList getEvectionType() {
		return evectionType;
	}

	public void setEvectionType(AoaTypeList evectionType) {
		this.evectionType = evectionType;
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
		this.personnelAdvice = personnelAdvice;
	}

	public String getManagerAdvice() {
		return managerAdvice;
	}

	public void setManagerAdvice(String managerAdvice) {
		this.managerAdvice = managerAdvice;
	}

    
}