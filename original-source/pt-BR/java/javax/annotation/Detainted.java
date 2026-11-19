package javax.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import javax.annotation.meta.When;

@Documented
@Retention(RetentionPolicy.RUNTIME)
@Untainted(when = When.ALWAYS)
/* carregado de: classes16.dex */
public @interface Detainted {
}
