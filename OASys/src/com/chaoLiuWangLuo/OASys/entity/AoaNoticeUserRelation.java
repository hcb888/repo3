package com.chaoLiuWangLuo.OASys.entity;

public class AoaNoticeUserRelation {
    private Long relatinId;

    private Integer isRead;

    private Long relatinNoticeId;

    private Long relatinUserId;

    public Long getRelatinId() {
        return relatinId;
    }

    public void setRelatinId(Long relatinId) {
        this.relatinId = relatinId;
    }

    public Integer getIsRead() {
        return isRead;
    }

    public void setIsRead(Integer isRead) {
        this.isRead = isRead;
    }

    public Long getRelatinNoticeId() {
        return relatinNoticeId;
    }

    public void setRelatinNoticeId(Long relatinNoticeId) {
        this.relatinNoticeId = relatinNoticeId;
    }

    public Long getRelatinUserId() {
        return relatinUserId;
    }

    public void setRelatinUserId(Long relatinUserId) {
        this.relatinUserId = relatinUserId;
    }
}