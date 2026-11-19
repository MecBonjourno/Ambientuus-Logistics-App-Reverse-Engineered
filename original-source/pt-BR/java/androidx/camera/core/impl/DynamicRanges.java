package androidx.camera.core.impl;

import androidx.camera.core.DynamicRange;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.core.util.Preconditions;
import java.util.Iterator;
import java.util.Set;
import kotlin.Metadata;
import kotlin.collections.SetsKt;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: DynamicRanges.kt */
@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\"\n\u0002\b\b\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u001e\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\f\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00070\tH\u0007J*\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00070\t2\f\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00070\t2\f\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00070\tH\u0007J\u0018\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u00072\u0006\u0010\u000e\u001a\u00020\u0007H\u0002J\u0018\u0010\u000f\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u000e\u001a\u00020\u0007H\u0002J\u0018\u0010\u0010\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u000e\u001a\u00020\u0007H\u0002¨\u0006\u0011"}, d2 = {"Landroidx/camera/core/impl/DynamicRanges;", "", "<init>", "()V", "canResolve", "", "dynamicRangeToTest", "Landroidx/camera/core/DynamicRange;", "fullySpecifiedDynamicRanges", "", "findAllPossibleMatches", "dynamicRangesToTest", "canResolveUnderSpecifiedTo", "underSpecifiedDynamicRange", "fullySpecifiedDynamicRange", "canMatchBitDepth", "canMatchEncoding", "camera-core_release"}, k = 1, mv = {2, 0, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* carregado de: classes.dex */
public final class DynamicRanges {
    public static final DynamicRanges INSTANCE = new DynamicRanges();

    private DynamicRanges() {
    }

    @JvmStatic
    public static final boolean canResolve(DynamicRange dynamicRangeToTest, Set<DynamicRange> fullySpecifiedDynamicRanges) {
        Object element$iv;
        Intrinsics.checkNotNullParameter(dynamicRangeToTest, "dynamicRangeToTest");
        Intrinsics.checkNotNullParameter(fullySpecifiedDynamicRanges, "fullySpecifiedDynamicRanges");
        if (dynamicRangeToTest.isFullySpecified()) {
            return fullySpecifiedDynamicRanges.contains(dynamicRangeToTest);
        }
        Set<DynamicRange> $this$firstOrNull$iv = fullySpecifiedDynamicRanges;
        Iterator it = $this$firstOrNull$iv.iterator();
        while (true) {
            if (it.hasNext()) {
                element$iv = it.next();
                DynamicRange fullySpecifiedDynamicRange = (DynamicRange) element$iv;
                if (INSTANCE.canResolveUnderSpecifiedTo(dynamicRangeToTest, fullySpecifiedDynamicRange)) {
                    break;
                }
            } else {
                element$iv = null;
                break;
            }
        }
        return element$iv != null;
    }

    @JvmStatic
    public static final Set<DynamicRange> findAllPossibleMatches(Set<DynamicRange> dynamicRangesToTest, Set<DynamicRange> fullySpecifiedDynamicRanges) {
        Intrinsics.checkNotNullParameter(dynamicRangesToTest, "dynamicRangesToTest");
        Intrinsics.checkNotNullParameter(fullySpecifiedDynamicRanges, "fullySpecifiedDynamicRanges");
        if (dynamicRangesToTest.isEmpty()) {
            throw new IllegalArgumentException("Candidate dynamic range set must contain at least 1 candidate dynamic range.");
        }
        Set $this$findAllPossibleMatches_u24lambda_u243 = SetsKt.createSetBuilder();
        Set<DynamicRange> $this$forEach$iv = dynamicRangesToTest;
        for (Object element$iv : $this$forEach$iv) {
            DynamicRange it = (DynamicRange) element$iv;
            if (it.isFullySpecified()) {
                if (fullySpecifiedDynamicRanges.contains(it)) {
                    $this$findAllPossibleMatches_u24lambda_u243.add(it);
                }
            } else {
                Set<DynamicRange> $this$forEach$iv2 = fullySpecifiedDynamicRanges;
                for (Object element$iv2 : $this$forEach$iv2) {
                    DynamicRange fullySpecifiedDynamicRange = (DynamicRange) element$iv2;
                    if (INSTANCE.canResolveUnderSpecifiedTo(it, fullySpecifiedDynamicRange)) {
                        $this$findAllPossibleMatches_u24lambda_u243.add(fullySpecifiedDynamicRange);
                    }
                }
            }
        }
        return SetsKt.build($this$findAllPossibleMatches_u24lambda_u243);
    }

    private final boolean canResolveUnderSpecifiedTo(DynamicRange underSpecifiedDynamicRange, DynamicRange fullySpecifiedDynamicRange) {
        return canMatchBitDepth(underSpecifiedDynamicRange, fullySpecifiedDynamicRange) && canMatchEncoding(underSpecifiedDynamicRange, fullySpecifiedDynamicRange);
    }

    private final boolean canMatchBitDepth(DynamicRange dynamicRangeToTest, DynamicRange fullySpecifiedDynamicRange) {
        Preconditions.checkState(fullySpecifiedDynamicRange.isFullySpecified(), "Fully specified range is not actually fully specified.");
        return dynamicRangeToTest.getBitDepth() == 0 || dynamicRangeToTest.getBitDepth() == fullySpecifiedDynamicRange.getBitDepth();
    }

    private final boolean canMatchEncoding(DynamicRange dynamicRangeToTest, DynamicRange fullySpecifiedDynamicRange) {
        Preconditions.checkState(fullySpecifiedDynamicRange.isFullySpecified(), "Fully specified range is not actually fully specified.");
        int encodingToTest = dynamicRangeToTest.getEncoding();
        if (encodingToTest == 0) {
            return true;
        }
        int fullySpecifiedEncoding = fullySpecifiedDynamicRange.getEncoding();
        return (encodingToTest == 2 && fullySpecifiedEncoding != 1) || encodingToTest == fullySpecifiedEncoding;
    }
}
