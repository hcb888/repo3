package com.chaoLiuWangLuo.OASys.entity;

import java.util.Date;

public class AoaTaskLogger {
    private Long loggerId;

    private Date createTime;
    
    private String createDate;

    private String loggerTicking;

    private AoaTaskList task;

    private String username;

    private AoaStatusList status;

	public Long getLoggerId() {
		return loggerId;
	}

	public void setLoggerId(Long loggerId) {
		this.loggerId = loggerId;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getLoggerTicking() {
		return loggerTicking;
	}

	public void setLoggerTicking(String loggerTicking) {
		this.loggerTicking = loggerTicking;
	}

	public AoaTaskList getTask() {
		return task;
	}

	public void setTask(AoaTaskList task) {
		this.task = task;
	}

	public String getUsername() {
		return username;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public AoaStatusList getStatus() {
		return status;
	}

	public void setStatus(AoaStatusList status) {
		this.status = status;
	}

	 
     
}