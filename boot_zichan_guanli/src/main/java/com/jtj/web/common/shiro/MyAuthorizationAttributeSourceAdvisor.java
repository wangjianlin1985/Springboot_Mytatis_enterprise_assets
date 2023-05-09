package com.jtj.web.common.shiro;

import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;

/**
 * Created by me
 * 2017/8/7.
 */
public class MyAuthorizationAttributeSourceAdvisor extends AuthorizationAttributeSourceAdvisor {

    public MyAuthorizationAttributeSourceAdvisor() {
        this.setAdvice(new MyAopAllianceAnnotationsAuthorizingMethodInterceptor());
    }

}
