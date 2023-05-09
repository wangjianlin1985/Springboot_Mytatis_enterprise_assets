package com.jtj.web.common;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.thymeleaf.util.StringUtils;

import java.time.Instant;

/**
 * Created by me
 * 2019/12/8.
 */
@Component
public class StringToInstantConverter implements Converter<String,Instant> {
    @Override
    public Instant convert(String source) {
        if (StringUtils.isEmpty(source) || "NaN".equals(source)){
            return null;
        }
        return Instant.ofEpochSecond(Long.parseLong(source));
    }
}
