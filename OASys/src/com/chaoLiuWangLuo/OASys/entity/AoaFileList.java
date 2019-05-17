package com.chaoLiuWangLuo.OASys.entity;

import java.util.Date;

public class AoaFileList {
    private Long fileId;

    private String fileName;

    private String filePath;

    private String fileShuffix;

    private String contentType;

    private String model;

    private Long pathId;

    private Long size;

    private Date uploadTime;

    private Long fileUserId;

    private Long fileIstrash;

    private Long fileIsshare;

    public Long getFileId() {
        return fileId;
    }

    public void setFileId(Long fileId) {
        this.fileId = fileId;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName == null ? null : fileName.trim();
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath == null ? null : filePath.trim();
    }

    public String getFileShuffix() {
        return fileShuffix;
    }

    public void setFileShuffix(String fileShuffix) {
        this.fileShuffix = fileShuffix == null ? null : fileShuffix.trim();
    }

    public String getContentType() {
        return contentType;
    }

    public void setContentType(String contentType) {
        this.contentType = contentType == null ? null : contentType.trim();
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model == null ? null : model.trim();
    }

    public Long getPathId() {
        return pathId;
    }

    public void setPathId(Long pathId) {
        this.pathId = pathId;
    }

    public Long getSize() {
        return size;
    }

    public void setSize(Long size) {
        this.size = size;
    }

    public Date getUploadTime() {
        return uploadTime;
    }

    public void setUploadTime(Date uploadTime) {
        this.uploadTime = uploadTime;
    }

    public Long getFileUserId() {
        return fileUserId;
    }

    public void setFileUserId(Long fileUserId) {
        this.fileUserId = fileUserId;
    }

    public Long getFileIstrash() {
        return fileIstrash;
    }

    public void setFileIstrash(Long fileIstrash) {
        this.fileIstrash = fileIstrash;
    }

    public Long getFileIsshare() {
        return fileIsshare;
    }

    public void setFileIsshare(Long fileIsshare) {
        this.fileIsshare = fileIsshare;
    }
}