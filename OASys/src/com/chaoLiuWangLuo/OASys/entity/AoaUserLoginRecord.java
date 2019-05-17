package com.chaoLiuWangLuo.OASys.entity;

import java.util.Date;

public class AoaUserLoginRecord {
    private Long recordId;

    private String browser;

    private String ipAddr;

    private Date loginTime;

    private String sessionId;

    private AoaUser  user;

    public Long getRecordId() {
        return recordId;
    }

    public void setRecordId(Long recordId) {
        this.recordId = recordId;
    }

    public String getBrowser() {
        return browser;
    }

    public void setBrowser(String browser) {
        this.browser = browser == null ? null : browser.trim();
    }

    public String getIpAddr() {
        return ipAddr;
    }

    public void setIpAddr(String ipAddr) {
        this.ipAddr = ipAddr == null ? null : ipAddr.trim();
    }

    public Date getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(Date loginTime) {
        this.loginTime = loginTime;
    }

    public String getSessionId() {
        return sessionId;
    }

    public void setSessionId(String sessionId) {
        this.sessionId = sessionId == null ? null : sessionId.trim();
    }

	public AoaUser getUser() {
		return user;
	}

	public void setUser(AoaUser user) {
		this.user = user;
	}
    
    
  
}