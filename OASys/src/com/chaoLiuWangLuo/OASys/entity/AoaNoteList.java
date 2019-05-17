package com.chaoLiuWangLuo.OASys.entity;

import java.util.Date;

public class AoaNoteList {
    private Long noteId;

    private String content;

    private Date createTime;

    private Long statusId;

    private String title;

    private Long typeId;

    private Long catalogId;

    private Long attachId;

    private Long isCollected;

    private Long createmanId;

    private String receiver;

    public Long getNoteId() {
        return noteId;
    }

    public void setNoteId(Long noteId) {
        this.noteId = noteId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Long getStatusId() {
        return statusId;
    }

    public void setStatusId(Long statusId) {
        this.statusId = statusId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Long getTypeId() {
        return typeId;
    }

    public void setTypeId(Long typeId) {
        this.typeId = typeId;
    }

    public Long getCatalogId() {
        return catalogId;
    }

    public void setCatalogId(Long catalogId) {
        this.catalogId = catalogId;
    }

    public Long getAttachId() {
        return attachId;
    }

    public void setAttachId(Long attachId) {
        this.attachId = attachId;
    }

    public Long getIsCollected() {
        return isCollected;
    }

    public void setIsCollected(Long isCollected) {
        this.isCollected = isCollected;
    }

    public Long getCreatemanId() {
        return createmanId;
    }

    public void setCreatemanId(Long createmanId) {
        this.createmanId = createmanId;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver == null ? null : receiver.trim();
    }
}