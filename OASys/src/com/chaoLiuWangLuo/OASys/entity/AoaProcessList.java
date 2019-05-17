package com.chaoLiuWangLuo.OASys.entity;

import java.util.Date;

public class AoaProcessList {
    private Long processId;

    private Date applyTime;
    
    private String applyDate;

    private AoaTypeList processType;

    private Date endTime;
    
    private String endDate;

    private String processName;

    private Integer procseeDays;

    private Integer isChecked;

    private Date startTime;
    
    private String startDate;

    private AoaStatusList processStatus;

    private String typeName;

    private AoaAttachmentList proFile;

    private AoaUser processUser;

    private String shenuser;

    private String processDes;

	public Long getProcessId() {
		return processId;
	}

	public void setProcessId(Long processId) {
		this.processId = processId;
	}

	public Date getApplyTime() {
		return applyTime;
	}

	public String getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(String applyDate) {
		this.applyDate = applyDate;
	}

	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}

	public AoaTypeList getProcessType() {
		return processType;
	}

	public void setProcessType(AoaTypeList processType) {
		this.processType = processType;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getProcessName() {
		return processName;
	}

	public void setProcessName(String processName) {
		this.processName = processName;
	}

	public Integer getProcseeDays() {
		return procseeDays;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public void setProcseeDays(Integer procseeDays) {
		this.procseeDays = procseeDays;
	}

	public Integer getIsChecked() {
		return isChecked;
	}

	public void setIsChecked(Integer isChecked) {
		this.isChecked = isChecked;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public AoaStatusList getProcessStatus() {
		return processStatus;
	}

	public void setProcessStatus(AoaStatusList processStatus) {
		this.processStatus = processStatus;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public AoaAttachmentList getProFile() {
		return proFile;
	}

	public void setProFile(AoaAttachmentList proFile) {
		this.proFile = proFile;
	}

	public AoaUser getProcessUser() {
		return processUser;
	}

	public void setProcessUser(AoaUser processUser) {
		this.processUser = processUser;
	}

	public String getShenuser() {
		return shenuser;
	}

	public void setShenuser(String shenuser) {
		this.shenuser = shenuser;
	}

	public String getProcessDes() {
		return processDes;
	}

	public void setProcessDes(String processDes) {
		this.processDes = processDes;
	}

    
}