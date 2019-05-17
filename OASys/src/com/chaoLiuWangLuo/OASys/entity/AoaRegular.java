package com.chaoLiuWangLuo.OASys.entity;

public class AoaRegular {
    private Long regularId;

    private String regularAdvice;

    private String deficiency;

    private String dobetter;

    private String experience;

    private String personnelAdvice;

    private String pullulate;

    private String understand;

    private AoaProcessList process;

    private String managerAdvice;

    private Integer days;

    public Long getRegularId() {
        return regularId;
    }

    public void setRegularId(Long regularId) {
        this.regularId = regularId;
    }

   

    public String getRegularAdvice() {
		return regularAdvice;
	}

	public void setRegularAdvice(String regularAdvice) {
		this.regularAdvice = regularAdvice;
	}

	public String getDeficiency() {
        return deficiency;
    }

    public void setDeficiency(String deficiency) {
        this.deficiency = deficiency == null ? null : deficiency.trim();
    }

    public String getDobetter() {
        return dobetter;
    }

    public void setDobetter(String dobetter) {
        this.dobetter = dobetter == null ? null : dobetter.trim();
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience == null ? null : experience.trim();
    }

    public String getPersonnelAdvice() {
        return personnelAdvice;
    }

    public void setPersonnelAdvice(String personnelAdvice) {
        this.personnelAdvice = personnelAdvice == null ? null : personnelAdvice.trim();
    }

    public String getPullulate() {
        return pullulate;
    }

    public void setPullulate(String pullulate) {
        this.pullulate = pullulate == null ? null : pullulate.trim();
    }

    public String getUnderstand() {
        return understand;
    }

    public void setUnderstand(String understand) {
        this.understand = understand == null ? null : understand.trim();
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

    public Integer getDays() {
        return days;
    }

    public void setDays(Integer days) {
        this.days = days;
    }
}