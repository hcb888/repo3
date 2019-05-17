package com.chaoLiuWangLuo.OASys.entity;

public class AoaCatalog {
    private Long catalogId;

    private String catalogName;

    private Integer parentId;

    private Long cataUserId;

    public Long getCatalogId() {
        return catalogId;
    }

    public void setCatalogId(Long catalogId) {
        this.catalogId = catalogId;
    }

    public String getCatalogName() {
        return catalogName;
    }

    public void setCatalogName(String catalogName) {
        this.catalogName = catalogName == null ? null : catalogName.trim();
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public Long getCataUserId() {
        return cataUserId;
    }

    public void setCataUserId(Long cataUserId) {
        this.cataUserId = cataUserId;
    }
}