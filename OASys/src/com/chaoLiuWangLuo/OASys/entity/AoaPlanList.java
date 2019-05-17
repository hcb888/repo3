package com.chaoLiuWangLuo.OASys.entity;

import java.util.Date;

public class AoaPlanList extends AoaPlanListKey {
	private Long planId;
    private Date createTime;
    
    private String createDate;

    private Date endTime;
    
    private String endDate;
    
    private Date startTime;
    
    private String startDate;

    private String label;

    private String planComment;

    private String planContent;

    private String planSummary;

    private String title;
    
    private AoaStatusList planStatus;
    
    private AoaTypeList palnType;

    private AoaUser planUser;

    private AoaAttachmentList planAoaAttachment;

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public Long getPlanId() {
		return planId;
	}

	public void setPlanId(Long planId) {
		this.planId = planId;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getPlanComment() {
		return planComment;
	}

	public void setPlanComment(String planComment) {
		this.planComment = planComment;
	}

	public String getPlanContent() {
		return planContent;
	}

	public void setPlanContent(String planContent) {
		this.planContent = planContent;
	}

	public String getPlanSummary() {
		return planSummary;
	}

	public void setPlanSummary(String planSummary) {
		this.planSummary = planSummary;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public AoaStatusList getPlanStatus() {
		return planStatus;
	}

	public void setPlanStatus(AoaStatusList planStatus) {
		this.planStatus = planStatus;
	}

	public AoaTypeList getPalnType() {
		return palnType;
	}

	public void setPalnType(AoaTypeList palnType) {
		this.palnType = palnType;
	}

	public AoaUser getPlanUser() {
		return planUser;
	}

	public void setPlanUser(AoaUser planUser) {
		this.planUser = planUser;
	}

	public AoaAttachmentList getPlanAoaAttachment() {
		return planAoaAttachment;
	}

	public void setPlanAoaAttachment(AoaAttachmentList planAoaAttachment) {
		this.planAoaAttachment = planAoaAttachment;
	}

  

    
}