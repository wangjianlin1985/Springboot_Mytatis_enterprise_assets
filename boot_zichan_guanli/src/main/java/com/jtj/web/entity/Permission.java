package com.jtj.web.entity;

import com.jtj.web.common.BaseEntity;

/**
 * Created by admin
 * 2019/12/17 21:52 End.
 */
public class Permission extends BaseEntity {

    private String code;
    private String name;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
