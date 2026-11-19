package com.google.auto.value;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.TYPE})
@Retention(RetentionPolicy.CLASS)
/* carregado de: classes16.dex */
public @interface AutoOneOf {
    Class<? extends Enum<?>> value();
}
