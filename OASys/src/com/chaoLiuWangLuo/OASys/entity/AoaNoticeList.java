package com.chaoLiuWangLuo.OASys.entity;

import java.util.Date;

public class AoaNoticeList {
    private Long noticeId;

    private String content;

    private Integer isTop;

    private Date modifyTime;

    private Date noticeTime;
    
    private String modifyDate;

    private String noticeDate;

    private String title;

    private String url;
    	
    private AoaTypeList type;
    
    private AoaStatusList status;
    
    private AoaUser user;

    public Long getNoticeId() {
        return noticeId;
    }

    public void setNoticeId(Long noticeId) {
        this.noticeId = noticeId;
    }

    public String getContent() {
        return content;
    }

    public String getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(String noticeDate) {
		this.noticeDate = noticeDate;
	}

	public void setContent(String content) {
        this.content = content == null ? null : content.trim();
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

    public Date getNoticeTime() {
        return noticeTime;
    }

    public void setNoticeTime(Date noticeTime) {
        this.noticeTime = noticeTime;
    }

   

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

   

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

	public AoaTypeList getType() {
		return type;
	}

	public void setType(AoaTypeList type) {
		this.type = type;
	}

	public AoaStatusList getStatus() {
		return status;
	}

	public void setStatus(AoaStatusList status) {
		this.status = status;
	}

	public AoaUser getUser() {
		return user;
	}

	public void setUser(AoaUser user) {
		this.user = user;
	}

    
}