package com.chaoLiuWangLuo.OASys.entity;

public class AoaFilePath {
    private Long pathId;

    private Long parentId;

    private String pathName;

    private Long pathUserId;

    private Long pathIstrash;

    public Long getPathId() {
        return pathId;
    }

    public void setPathId(Long pathId) {
        this.pathId = pathId;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public String getPathName() {
        return pathName;
    }

    public void setPathName(String pathName) {
        this.pathName = pathName == null ? null : pathName.trim();
    }

    public Long getPathUserId() {
        return pathUserId;
    }

    public void setPathUserId(Long pathUserId) {
        this.pathUserId = pathUserId;
    }

    public Long getPathIstrash() {
        return pathIstrash;
    }

    public void setPathIstrash(Long pathIstrash) {
        this.pathIstrash = pathIstrash;
    }
}