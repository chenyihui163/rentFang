package com.hss.renthouse.admins.Log.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 自定义注解 拦截Controller
 * 
 * @author hss
 *
 */
@Target({ ElementType.PARAMETER, ElementType.METHOD })
@Retention(RetentionPolicy.RUNTIME)
public @interface SystemControllerAnnotation {
	/**
	 * 描述业务操作 例:Xxx管理-执行Xxx操作
	 * @return
	 */
	String value() default "";
}

