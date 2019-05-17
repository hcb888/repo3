package com.chaoLiuWangLuo.OASys.entity;

public class AoaTaskUser {
    private Long pkId;

    private AoaStatusList status;

    private AoaTaskList task;

    private AoaUser user;

	public Long getPkId() {
		return pkId;
	}

	public void setPkId(Long pkId) {
		this.pkId = pkId;
	}

	public AoaStatusList getStatus() {
		return status;
	}

	public void setStatus(AoaStatusList status) {
		this.status = status;
	}

	public AoaTaskList getTask() {
		return task;
	}

	public void setTask(AoaTaskList task) {
		this.task = task;
	}

	public AoaUser getUser() {
		return user;
	}

	public void setUser(AoaUser user) {
		this.user = user;
	}

   
}