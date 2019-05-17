package com.chaoLiuWangLuo.OASys.entity;

import java.util.Date;

public class AoaTaskList {
    private Long taskId;

    private String comment;

    private Date endTime;

    private Integer isCancel;

    private Integer isTop;

    private Date modifyTime;

    private Date publishTime;

    private Date starTime;
    

    private String modifyDate;

    private String publishDate;

    private String starDate;
    
    private String endDate;

    private String taskDescribe;

    private String ticking;

    private String title;

    private String reciverlist;
    
    private String reciverlistId;
    
    private AoaStatusList status;
    
    private AoaTypeList type;
    
    private AoaUser user;

    public Long getTaskId() {
        return taskId;
    }

    public void setTaskId(Long taskId) {
        this.taskId = taskId;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment == null ? null : comment.trim();
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Integer getIsCancel() {
        return isCancel;
    }

    public void setIsCancel(Integer isCancel) {
        this.isCancel = isCancel;
    }

    public String getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getReciverlistId() {
		return reciverlistId;
	}

	public void setReciverlistId(String reciverlistId) {
		this.reciverlistId = reciverlistId;
	}

	public String getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(String publishDate) {
		this.publishDate = publishDate;
	}

	public String getStarDate() {
		return starDate;
	}

	public void setStarDate(String starDate) {
		this.starDate = starDate;
	}

	public Integer getIsTop() {
        return isTop;
    }

    public void setIsTop(Integer isTop) {
        this.isTop = isTop;
    }

    public Date getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
    }

    public Date getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }

    public Date getStarTime() {
        return starTime;
    }

    public void setStarTime(Date starTime) {
        this.starTime = starTime;
    }

   

    public String getTaskDescribe() {
        return taskDescribe;
    }

    public void setTaskDescribe(String taskDescribe) {
        this.taskDescribe = taskDescribe == null ? null : taskDescribe.trim();
    }

    public String getTicking() {
        return ticking;
    }

    public void setTicking(String ticking) {
        this.ticking = ticking == null ? null : ticking.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

   

    public String getReciverlist() {
        return reciverlist;
    }

    public void setReciverlist(String reciverlist) {
        this.reciverlist = reciverlist == null ? null : reciverlist.trim();
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
}