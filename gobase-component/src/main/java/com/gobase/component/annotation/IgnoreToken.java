package com.gobase.component.annotation;

import java.lang.annotation.*;

/**
 * @author mm.sun
 * @date 2019/07/16 23:40
 */

@Target({ElementType.TYPE, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Inherited
public @interface IgnoreToken {
}
