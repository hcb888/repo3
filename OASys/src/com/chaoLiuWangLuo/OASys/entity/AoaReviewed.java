package com.chaoLiuWangLuo.OASys.entity;

import java.util.Date;

public class AoaReviewed {
    private Long reviewedId;

    private String advice;

    private Date reviewedTime;

    private String reviewedDate;
    
    private AoaStatusList reviewedStatus;

    private AoaProcessList reviewedProcess;

    private AoaUser reviewedUser;

    private Integer del;

	public Long getReviewedId() {
		return reviewedId;
	}

	public String getReviewedDate() {
		return reviewedDate;
	}

	public void setReviewedDate(String reviewedDate) {
		this.reviewedDate = reviewedDate;
	}

	public void setReviewedId(Long reviewedId) {
		this.reviewedId = reviewedId;
	}

	public String getAdvice() {
		return advice;
	}

	public void setAdvice(String advice) {
		this.advice = advice;
	}

	public Date getReviewedTime() {
		return reviewedTime;
	}

	public void setReviewedTime(Date reviewedTime) {
		this.reviewedTime = reviewedTime;
	}

	public AoaStatusList getReviewedStatus() {
		return reviewedStatus;
	}

	public void setReviewedStatus(AoaStatusList reviewedStatus) {
		this.reviewedStatus = reviewedStatus;
	}

	public AoaProcessList getReviewedProcess() {
		return reviewedProcess;
	}

	public void setReviewedProcess(AoaProcessList reviewedProcess) {
		this.reviewedProcess = reviewedProcess;
	}

	public AoaUser getReviewedUser() {
		return reviewedUser;
	}

	public void setReviewedUser(AoaUser reviewedUser) {
		this.reviewedUser = reviewedUser;
	}

	public Integer getDel() {
		return del;
	}

	public void setDel(Integer del) {
		this.del = del;
	}

    
}