package com.jtj.web.dto;

import com.jtj.web.common.BaseDto;

/**
 * Created by admin
 * 2019/12/17 21:52 End.
 */
public class PermissionDto extends BaseDto {

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
