package kotlin.time.jdk8;

import androidx.constraintlayout.widget.ConstraintLayout;
import j$.time.Duration;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;

/* compiled from: DurationConversions.kt */
@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\u001a\u0014\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u0087\b¢\u0006\u0004\b\u0002\u0010\u0003\u001a\u0017\u0010\u0006\u001a\u00020\u0000*\u00020\u0001H\u0087\bø\u0001\u0000¢\u0006\u0004\b\u0004\u0010\u0005\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006\u0007"}, d2 = {"j$/time/Duration", "Lkotlin/time/Duration;", "toKotlinDuration", "(Lj$/time/Duration;)J", "toJavaDuration-LRDsOJo", "(J)Lj$/time/Duration;", "toJavaDuration", "kotlin-stdlib-jdk8"}, k = 2, mv = {1, 9, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* carregado de: classes17.dex */
public final class DurationConversionsJDK8Kt {
    private static final long toKotlinDuration(Duration $this$toKotlinDuration) {
        Intrinsics.checkNotNullParameter($this$toKotlinDuration, "<this>");
        return kotlin.time.Duration.m2242plusLRDsOJo(DurationKt.toDuration($this$toKotlinDuration.getSeconds(), DurationUnit.SECONDS), DurationKt.toDuration($this$toKotlinDuration.getNano(), DurationUnit.NANOSECONDS));
    }

    /* renomeado de: toJavaDuration-LRDsOJo, motivo: nome Java inválido */
    private static final Duration m2368toJavaDurationLRDsOJo(long $this$toJavaDuration_u2dLRDsOJo) {
        long seconds = kotlin.time.Duration.m2227getInWholeSecondsimpl($this$toJavaDuration_u2dLRDsOJo);
        int nanoseconds = kotlin.time.Duration.m2229getNanosecondsComponentimpl($this$toJavaDuration_u2dLRDsOJo);
        Duration ofSeconds = Duration.ofSeconds(seconds, nanoseconds);
        Intrinsics.checkNotNullExpressionValue(ofSeconds, "toComponents-impl(...)");
        return ofSeconds;
    }
}
