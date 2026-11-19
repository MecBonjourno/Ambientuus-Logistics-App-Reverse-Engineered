package androidx.camera.camera2.internal;

import android.util.Range;
import android.util.Size;
import androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.AttachedSurfaceInfo;
import androidx.camera.core.impl.UseCaseConfig;
import androidx.camera.core.internal.utils.SizeUtil;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.exifinterface.media.ExifInterface;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.Metadata;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.collections.ArraysKt;
import kotlin.collections.CollectionsKt;
import kotlin.collections.MapsKt;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: HighSpeedResolver.kt */
@Metadata(d1 = {"\u0000F\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010 \n\u0002\b\u0004\n\u0002\u0010$\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\b\u0006\u0018\u0000 %2\u00020\u0001:\u0001%B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J8\u0010\u0015\u001a\u0014\u0012\u0004\u0012\u0002H\u0017\u0012\n\u0012\b\u0012\u0004\u0012\u00020\f0\u00110\u0016\"\u0004\b\u0000\u0010\u00172\u0018\u0010\u0018\u001a\u0014\u0012\u0004\u0012\u0002H\u0017\u0012\n\u0012\b\u0012\u0004\u0012\u00020\f0\u00110\u0016J\u000e\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u001b\u001a\u00020\fJ&\u0010\u001c\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\f0\u00110\u00112\u0012\u0010\u001d\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\f0\u00110\u0011J'\u0010\u001e\u001a\u0010\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u001a0 \u0018\u00010\u001f2\f\u0010!\u001a\b\u0012\u0004\u0012\u00020\f0\u0011¢\u0006\u0002\u0010\"J$\u0010#\u001a\b\u0012\u0004\u0012\u0002H\u00170\u0011\"\u0004\b\u0000\u0010\u0017*\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u0002H\u00170\u00110\u0011H\u0002J\u001c\u0010$\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u001a0 0\u00112\u0006\u0010\u001b\u001a\u00020\fH\u0002R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u001b\u0010\u0006\u001a\u00020\u00078FX\u0086\u0084\u0002¢\u0006\f\n\u0004\b\t\u0010\n\u001a\u0004\b\u0006\u0010\bR\u001d\u0010\u000b\u001a\u0004\u0018\u00010\f8FX\u0086\u0084\u0002¢\u0006\f\n\u0004\b\u000f\u0010\n\u001a\u0004\b\r\u0010\u000eR!\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\f0\u00118BX\u0082\u0084\u0002¢\u0006\f\n\u0004\b\u0014\u0010\n\u001a\u0004\b\u0012\u0010\u0013¨\u0006&"}, d2 = {"Landroidx/camera/camera2/internal/HighSpeedResolver;", "", "characteristics", "Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;", "<init>", "(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)V", "isHighSpeedSupported", "", "()Z", "isHighSpeedSupported$delegate", "Lkotlin/Lazy;", "maxSize", "Landroid/util/Size;", "getMaxSize", "()Landroid/util/Size;", "maxSize$delegate", "supportedSizes", "", "getSupportedSizes", "()Ljava/util/List;", "supportedSizes$delegate", "filterCommonSupportedSizes", "", ExifInterface.GPS_DIRECTION_TRUE, "sizesMap", "getMaxFrameRate", "", "size", "getSizeArrangements", "sizesList", "getFrameRateRangesFor", "", "Landroid/util/Range;", "surfaceSizes", "(Ljava/util/List;)[Landroid/util/Range;", "findCommonElements", "getHighSpeedVideoFpsRangesFor", "Companion", "camera-camera2_release"}, k = 1, mv = {2, 0, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* carregado de: classes.dex */
public final class HighSpeedResolver {

    /* renomeado de: Companion, motivo: de metadados do Kotlin */
    public static final Companion INSTANCE = new Companion(null);
    public static final Range<Integer> DEFAULT_FPS = new Range<>((Comparable) 120, (Comparable) 120);
    private static final String TAG = "HighSpeedResolver";
    private final CameraCharacteristicsCompat characteristics;

    /* renomeado de: isHighSpeedSupported$delegate, motivo: de metadados do Kotlin */
    private final Lazy isHighSpeedSupported;

    /* renomeado de: maxSize$delegate, motivo: de metadados do Kotlin */
    private final Lazy maxSize;

    /* renomeado de: supportedSizes$delegate, motivo: de metadados do Kotlin */
    private final Lazy supportedSizes;

    public HighSpeedResolver(CameraCharacteristicsCompat characteristics) {
        Intrinsics.checkNotNullParameter(characteristics, "characteristics");
        this.characteristics = characteristics;
        this.isHighSpeedSupported = LazyKt.lazy(new Function0() { // da classe: androidx.camera.camera2.internal.HighSpeedResolver$$ExternalSyntheticLambda0
            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                boolean isHighSpeedSupported_delegate$lambda$1;
                isHighSpeedSupported_delegate$lambda$1 = HighSpeedResolver.isHighSpeedSupported_delegate$lambda$1(HighSpeedResolver.this);
                return Boolean.valueOf(isHighSpeedSupported_delegate$lambda$1);
            }
        });
        this.maxSize = LazyKt.lazy(new Function0() { // da classe: androidx.camera.camera2.internal.HighSpeedResolver$$ExternalSyntheticLambda1
            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                Size maxSize_delegate$lambda$4;
                maxSize_delegate$lambda$4 = HighSpeedResolver.maxSize_delegate$lambda$4(HighSpeedResolver.this);
                return maxSize_delegate$lambda$4;
            }
        });
        this.supportedSizes = LazyKt.lazy(new Function0() { // da classe: androidx.camera.camera2.internal.HighSpeedResolver$$ExternalSyntheticLambda2
            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                List supportedSizes_delegate$lambda$5;
                supportedSizes_delegate$lambda$5 = HighSpeedResolver.supportedSizes_delegate$lambda$5(HighSpeedResolver.this);
                return supportedSizes_delegate$lambda$5;
            }
        });
    }

    public final boolean isHighSpeedSupported() {
        return ((Boolean) this.isHighSpeedSupported.getValue()).booleanValue();
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    /* JADX WARN: região duplicada removida para o bloco: B:15:0x0030  */
    /* JADX WARN: região duplicada removida para o bloco: B:18:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final boolean isHighSpeedSupported_delegate$lambda$1(androidx.camera.camera2.internal.HighSpeedResolver r10) {
        /*
            androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat r0 = r10.characteristics
            android.hardware.camera2.CameraCharacteristics$Key r1 = android.hardware.camera2.CameraCharacteristics.REQUEST_AVAILABLE_CAPABILITIES
            java.lang.Object r0 = r0.get(r1)
            int[] r0 = (int[]) r0
            r1 = 1
            r2 = 0
            if (r0 == 0) goto L2c
            r3 = 0
            int r4 = r0.length
            r5 = r2
        L12:
            if (r5 >= r4) goto L26
            r6 = r0[r5]
            r7 = r6
            r8 = 0
            r9 = 9
            if (r7 != r9) goto L1e
            r7 = r1
            goto L1f
        L1e:
            r7 = r2
        L1f:
            if (r7 == 0) goto L23
            r0 = r1
            goto L27
        L23:
            int r5 = r5 + 1
            goto L12
        L26:
            r0 = r2
        L27:
            if (r0 != r1) goto L2c
            r0 = r1
            goto L2d
        L2c:
            r0 = r2
        L2d:
            if (r0 == 0) goto L30
            goto L31
        L30:
            r1 = r2
        L31:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.camera.camera2.internal.HighSpeedResolver.isHighSpeedSupported_delegate$lambda$1(androidx.camera.camera2.internal.HighSpeedResolver):boolean");
    }

    public final Size getMaxSize() {
        return (Size) this.maxSize.getValue();
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public static final Size maxSize_delegate$lambda$4(HighSpeedResolver this$0) {
        Iterable it = this$0.getSupportedSizes();
        if (((Collection) it).isEmpty()) {
            it = null;
        }
        if (it == null) {
            return null;
        }
        Iterable $this$maxBy$iv = it;
        Iterator iterator$iv = $this$maxBy$iv.iterator();
        if (!iterator$iv.hasNext()) {
            throw new NoSuchElementException();
        }
        Object maxElem$iv = iterator$iv.next();
        if (iterator$iv.hasNext()) {
            int maxValue$iv = SizeUtil.getArea((Size) maxElem$iv);
            do {
                Object e$iv = iterator$iv.next();
                int v$iv = SizeUtil.getArea((Size) e$iv);
                if (maxValue$iv < v$iv) {
                    maxElem$iv = e$iv;
                    maxValue$iv = v$iv;
                }
            } while (iterator$iv.hasNext());
        }
        return (Size) maxElem$iv;
    }

    private final List<Size> getSupportedSizes() {
        return (List) this.supportedSizes.getValue();
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public static final List supportedSizes_delegate$lambda$5(HighSpeedResolver this$0) {
        List filterNotNull;
        Size[] highSpeedVideoSizes = this$0.characteristics.getStreamConfigurationMapCompat().getHighSpeedVideoSizes();
        return (highSpeedVideoSizes == null || (filterNotNull = ArraysKt.filterNotNull(highSpeedVideoSizes)) == null) ? CollectionsKt.emptyList() : filterNotNull;
    }

    public final <T> Map<T, List<Size>> filterCommonSupportedSizes(Map<T, ? extends List<Size>> sizesMap) {
        Intrinsics.checkNotNullParameter(sizesMap, "sizesMap");
        Iterable $this$filter$iv = findCommonElements(CollectionsKt.toList(sizesMap.values()));
        Collection destination$iv$iv = new ArrayList();
        for (Object element$iv$iv : $this$filter$iv) {
            Size it = (Size) element$iv$iv;
            if (getSupportedSizes().contains(it)) {
                destination$iv$iv.add(element$iv$iv);
            }
        }
        List commonSupportedSizes = (List) destination$iv$iv;
        Map $this$mapValues$iv = sizesMap;
        Map destination$iv$iv2 = new LinkedHashMap(MapsKt.mapCapacity($this$mapValues$iv.size()));
        Iterable $this$associateByTo$iv$iv$iv = $this$mapValues$iv.entrySet();
        for (Object element$iv$iv$iv : $this$associateByTo$iv$iv$iv) {
            Map.Entry it$iv$iv = (Map.Entry) element$iv$iv$iv;
            Object key = it$iv$iv.getKey();
            Iterable sizes = (List) ((Map.Entry) element$iv$iv$iv).getValue();
            Iterable $this$filter$iv2 = sizes;
            Map $this$mapValues$iv2 = $this$mapValues$iv;
            Collection destination$iv$iv3 = new ArrayList();
            for (Object element$iv$iv2 : $this$filter$iv2) {
                Size it2 = (Size) element$iv$iv2;
                if (commonSupportedSizes.contains(it2)) {
                    destination$iv$iv3.add(element$iv$iv2);
                }
            }
            destination$iv$iv2.put(key, (List) destination$iv$iv3);
            $this$mapValues$iv = $this$mapValues$iv2;
        }
        return destination$iv$iv2;
    }

    public final int getMaxFrameRate(Size size) {
        Intrinsics.checkNotNullParameter(size, "size");
        List supportedFpsRangesForSize = getHighSpeedVideoFpsRangesFor(size);
        if (supportedFpsRangesForSize.isEmpty()) {
            supportedFpsRangesForSize = null;
        }
        if (supportedFpsRangesForSize == null) {
            Logger.w(TAG, "No supported high speed  fps for " + size);
            return 0;
        }
        Iterator<T> it = supportedFpsRangesForSize.iterator();
        if (!it.hasNext()) {
            throw new NoSuchElementException();
        }
        Range it2 = (Range) it.next();
        Integer num = (Integer) it2.getUpper();
        while (it.hasNext()) {
            Range it3 = (Range) it.next();
            Integer num2 = (Integer) it3.getUpper();
            if (num.compareTo(num2) < 0) {
                num = num2;
            }
        }
        Intrinsics.checkNotNullExpressionValue(num, "maxOf(...)");
        return num.intValue();
    }

    public final List<List<Size>> getSizeArrangements(List<? extends List<Size>> sizesList) {
        Intrinsics.checkNotNullParameter(sizesList, "sizesList");
        if (sizesList.isEmpty()) {
            return CollectionsKt.emptyList();
        }
        Iterable commonSizes = findCommonElements(sizesList);
        Iterable $this$map$iv = commonSizes;
        Collection destination$iv$iv = new ArrayList(CollectionsKt.collectionSizeOrDefault($this$map$iv, 10));
        for (Object item$iv$iv : $this$map$iv) {
            Size commonSize = (Size) item$iv$iv;
            int size = sizesList.size();
            ArrayList arrayList = new ArrayList(size);
            for (int i = 0; i < size; i++) {
                arrayList.add(commonSize);
            }
            destination$iv$iv.add(arrayList);
        }
        return (List) destination$iv$iv;
    }

    public final Range<Integer>[] getFrameRateRangesFor(List<Size> surfaceSizes) {
        Collection destination$iv$iv;
        Intrinsics.checkNotNullParameter(surfaceSizes, "surfaceSizes");
        int size = surfaceSizes.size();
        if (!(1 <= size && size < 3) || CollectionsKt.distinct(surfaceSizes).size() != 1) {
            return null;
        }
        Collection supportedFpsRanges = getHighSpeedVideoFpsRangesFor(surfaceSizes.get(0));
        if (supportedFpsRanges.isEmpty()) {
            supportedFpsRanges = null;
        }
        if (supportedFpsRanges == null) {
            return null;
        }
        if (surfaceSizes.size() == 2) {
            Collection $this$filter$iv = supportedFpsRanges;
            Collection destination$iv$iv2 = new ArrayList();
            for (Object element$iv$iv : $this$filter$iv) {
                Range it = (Range) element$iv$iv;
                if (Intrinsics.areEqual(it.getLower(), it.getUpper())) {
                    destination$iv$iv2.add(element$iv$iv);
                }
            }
            destination$iv$iv = (List) destination$iv$iv2;
        } else {
            destination$iv$iv = supportedFpsRanges;
        }
        Collection $this$toTypedArray$iv = destination$iv$iv;
        return (Range[]) $this$toTypedArray$iv.toArray(new Range[0]);
    }

    private final <T> List<T> findCommonElements(List<? extends List<? extends T>> list) {
        if (list.isEmpty()) {
            return CollectionsKt.emptyList();
        }
        List commonElements = CollectionsKt.toMutableList((Collection) CollectionsKt.first((List) list));
        Iterable $this$forEach$iv = CollectionsKt.drop(list, 1);
        for (Object element$iv : $this$forEach$iv) {
            List it = (List) element$iv;
            commonElements.retainAll(it);
        }
        return commonElements;
    }

    private final List<Range<Integer>> getHighSpeedVideoFpsRangesFor(Size size) {
        Object m880constructorimpl;
        List filterNotNull;
        List<Range<Integer>> list;
        try {
            Result.Companion companion = Result.INSTANCE;
            HighSpeedResolver $this$getHighSpeedVideoFpsRangesFor_u24lambda_u2417 = this;
            m880constructorimpl = Result.m880constructorimpl($this$getHighSpeedVideoFpsRangesFor_u24lambda_u2417.characteristics.getStreamConfigurationMapCompat().getHighSpeedVideoFpsRangesFor(size));
        } catch (Throwable th) {
            Result.Companion companion2 = Result.INSTANCE;
            m880constructorimpl = Result.m880constructorimpl(ResultKt.createFailure(th));
        }
        if (Result.m886isFailureimpl(m880constructorimpl)) {
            m880constructorimpl = null;
        }
        Range[] rangeArr = (Range[]) m880constructorimpl;
        return (rangeArr == null || (filterNotNull = ArraysKt.filterNotNull(rangeArr)) == null || (list = CollectionsKt.toList(filterNotNull)) == null) ? CollectionsKt.emptyList() : list;
    }

    /* compiled from: HighSpeedResolver.kt */
    @Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u001e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J(\u0010\t\u001a\u00020\n2\f\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\r0\f2\u0010\u0010\u000e\u001a\f\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u000f0\fH\u0007R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u0016\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\b0\u00078\u0006X\u0087\u0004¢\u0006\u0002\n\u0000¨\u0006\u0010"}, d2 = {"Landroidx/camera/camera2/internal/HighSpeedResolver$Companion;", "", "<init>", "()V", "TAG", "", "DEFAULT_FPS", "Landroid/util/Range;", "", "isHighSpeedOn", "", "attachedSurfaces", "", "Landroidx/camera/core/impl/AttachedSurfaceInfo;", "newUseCaseConfigs", "Landroidx/camera/core/impl/UseCaseConfig;", "camera-camera2_release"}, k = 1, mv = {2, 0, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    public static final class Companion {
        public /* sintético */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        @JvmStatic
        public final boolean isHighSpeedOn(Collection<? extends AttachedSurfaceInfo> attachedSurfaces, Collection<? extends UseCaseConfig<?>> newUseCaseConfigs) {
            boolean z;
            boolean hasHighSpeedSessionType;
            Intrinsics.checkNotNullParameter(attachedSurfaces, "attachedSurfaces");
            Intrinsics.checkNotNullParameter(newUseCaseConfigs, "newUseCaseConfigs");
            Collection<? extends AttachedSurfaceInfo> $this$map$iv = attachedSurfaces;
            Collection destination$iv$iv = new ArrayList(CollectionsKt.collectionSizeOrDefault($this$map$iv, 10));
            for (Object item$iv$iv : $this$map$iv) {
                AttachedSurfaceInfo it = (AttachedSurfaceInfo) item$iv$iv;
                destination$iv$iv.add(Integer.valueOf(it.getSessionType()));
            }
            Collection collection = (List) destination$iv$iv;
            Collection<? extends UseCaseConfig<?>> $this$map$iv2 = newUseCaseConfigs;
            Collection destination$iv$iv2 = new ArrayList(CollectionsKt.collectionSizeOrDefault($this$map$iv2, 10));
            Iterator it2 = $this$map$iv2.iterator();
            while (true) {
                z = false;
                if (!it2.hasNext()) {
                    break;
                }
                Object item$iv$iv2 = it2.next();
                UseCaseConfig it3 = (UseCaseConfig) item$iv$iv2;
                destination$iv$iv2.add(Integer.valueOf(it3.getSessionType(0)));
            }
            Iterable sessionTypes = CollectionsKt.plus(collection, destination$iv$iv2);
            Iterable $this$any$iv = sessionTypes;
            if (!($this$any$iv instanceof Collection) || !((Collection) $this$any$iv).isEmpty()) {
                Iterator it4 = $this$any$iv.iterator();
                while (true) {
                    if (!it4.hasNext()) {
                        hasHighSpeedSessionType = false;
                        break;
                    }
                    Object element$iv = it4.next();
                    int it5 = ((Number) element$iv).intValue();
                    int it6 = it5 == 1 ? 1 : 0;
                    if (it6 != 0) {
                        hasHighSpeedSessionType = true;
                        break;
                    }
                }
            } else {
                hasHighSpeedSessionType = false;
            }
            if (hasHighSpeedSessionType) {
                Iterable $this$all$iv = sessionTypes;
                if (!($this$all$iv instanceof Collection) || !((Collection) $this$all$iv).isEmpty()) {
                    Iterator it7 = $this$all$iv.iterator();
                    while (true) {
                        if (!it7.hasNext()) {
                            z = true;
                            break;
                        }
                        Object element$iv2 = it7.next();
                        int it8 = ((Number) element$iv2).intValue();
                        int it9 = it8 == 1 ? 1 : 0;
                        if (it9 == 0) {
                            break;
                        }
                    }
                } else {
                    z = true;
                }
                if (!z) {
                    throw new IllegalArgumentException("All sessionTypes should be high-speed when any of them is high-speed".toString());
                }
            }
            return hasHighSpeedSessionType;
        }
    }

    @JvmStatic
    public static final boolean isHighSpeedOn(Collection<? extends AttachedSurfaceInfo> collection, Collection<? extends UseCaseConfig<?>> collection2) {
        return INSTANCE.isHighSpeedOn(collection, collection2);
    }
}
