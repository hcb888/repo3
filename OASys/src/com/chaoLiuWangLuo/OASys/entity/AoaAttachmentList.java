package com.chaoLiuWangLuo.OASys.entity;

import java.util.Date;

public class AoaAttachmentList {
    private Long attachmentId;

    private String attachmentName;

    private String attachmentPath;

    private String attachmentShuffix;

    private String attachmentSize;

    private String attachmentType;

    private String model;

    private Date uploadTime;

    private AoaUser attachmentUser;

    public Long getAttachmentId() {
        return attachmentId;
    }

    public void setAttachmentId(Long attachmentId) {
        this.attachmentId = attachmentId;
    }

    public String getAttachmentName() {
        return attachmentName;
    }

    public void setAttachmentName(String attachmentName) {
        this.attachmentName = attachmentName == null ? null : attachmentName.trim();
    }

    public String getAttachmentPath() {
        return attachmentPath;
    }

    public void setAttachmentPath(String attachmentPath) {
        this.attachmentPath = attachmentPath == null ? null : attachmentPath.trim();
    }

    public String getAttachmentShuffix() {
        return attachmentShuffix;
    }

    public void setAttachmentShuffix(String attachmentShuffix) {
        this.attachmentShuffix = attachmentShuffix == null ? null : attachmentShuffix.trim();
    }

    public String getAttachmentSize() {
        return attachmentSize;
    }

    public void setAttachmentSize(String attachmentSize) {
        this.attachmentSize = attachmentSize == null ? null : attachmentSize.trim();
    }

    public String getAttachmentType() {
        return attachmentType;
    }

    public void setAttachmentType(String attachmentType) {
        this.attachmentType = attachmentType == null ? null : attachmentType.trim();
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model == null ? null : model.trim();
    }

    public Date getUploadTime() {
        return uploadTime;
    }

    public void setUploadTime(Date uploadTime) {
        this.uploadTime = uploadTime;
    }

	public AoaUser getAttachmentUser() {
		return attachmentUser;
	}

	public void setAttachmentUser(AoaUser attachmentUser) {
		this.attachmentUser = attachmentUser;
	}

  
}