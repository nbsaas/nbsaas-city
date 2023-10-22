package com.nbsaas.boot.aop;


import org.apache.commons.beanutils.BeanUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import java.lang.reflect.InvocationTargetException;

@Component
@Aspect
public class CommonPointcuts {


    @Before("@annotation(com.nbsaas.boot.rest.annotations.CreateData)")
    public void before(JoinPoint point) {

        Object[] args = point.getArgs();
        if (args != null && args.length > 0) {
            Object object = args[0];
        }
        // ...
    }


    @Before("@annotation(com.nbsaas.boot.rest.annotations.UpdateData)")
    public void updateData(JoinPoint point) {
        Object[] args = point.getArgs();
        if (args != null && args.length > 0) {
            Object object = args[0];
//            UserInfoExtResponse user = UserUtils.user();
//
//            setValue(object, "updateUser", user.getId());
        }
    }

    public void setValue(Object object, String filed, Object value) {
        try {
            BeanUtils.setProperty(object, filed, value);
        } catch (IllegalAccessException | InvocationTargetException ignored) {

        }
    }




}
