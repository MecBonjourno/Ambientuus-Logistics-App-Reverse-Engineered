package androidx.camera.core.impl;

import androidx.camera.core.CameraIdentifier;
import androidx.camera.core.CameraPresenceListener;
import androidx.camera.core.CameraState;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.CameraPresenceProvider;
import androidx.camera.core.impl.Observable;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.lifecycle.LiveData;
import androidx.lifecycle.Observer;
import com.google.android.gms.common.internal.ServiceSpecificExtraArgs;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.CollectionsKt;
import kotlin.collections.MapsKt;
import kotlin.collections.SetsKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: CameraPresenseProvider.kt */
@Metadata(d1 = {"\u0000|\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010%\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0005\n\u0002\u0010\"\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\n\u0018\u0000 ;2\u00020\u0001:\u00039:;B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u0016\u0010\u001e\u001a\u00020\u001f2\u0006\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\nJ\u0006\u0010 \u001a\u00020\u001fJ\u0016\u0010!\u001a\u00020\u001f2\f\u0010\"\u001a\b\u0012\u0004\u0012\u00020\u000e0\rH\u0002J$\u0010#\u001a\u00020\u001f2\f\u0010$\u001a\b\u0012\u0004\u0012\u00020\u000e0%2\f\u0010&\u001a\b\u0012\u0004\u0012\u00020\u000e0%H\u0002J\u000e\u0010'\u001a\u00020\u001f2\u0006\u0010(\u001a\u00020\u0016J\u000e\u0010)\u001a\u00020\u001f2\u0006\u0010(\u001a\u00020\u0016J\u0010\u0010*\u001a\u00020\u001f2\u0006\u0010+\u001a\u00020\u001bH\u0002J\u0010\u0010,\u001a\u00020\u001f2\u0006\u0010-\u001a\u00020.H\u0002J\u0010\u0010/\u001a\u00020\u001f2\u0006\u0010+\u001a\u00020\u001bH\u0002J\b\u00100\u001a\u00020\u001fH\u0002J\u0016\u00101\u001a\u00020\u001f2\u0006\u0010(\u001a\u0002022\u0006\u00103\u001a\u00020\u0003J\u000e\u00104\u001a\u00020\u001f2\u0006\u0010(\u001a\u000202J\u0016\u00105\u001a\u00020\u001f2\f\u00106\u001a\b\u0012\u0004\u0012\u00020\u000e0%H\u0002J\u0016\u00107\u001a\u00020\u001f2\f\u00108\u001a\b\u0012\u0004\u0012\u00020\u000e0%H\u0002R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0001X\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\u0007\u001a\u0004\u0018\u00010\bX\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\t\u001a\u0004\u0018\u00010\nX\u0082\u000e¢\u0006\u0002\n\u0000R\u001c\u0010\u000b\u001a\u0010\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u000e0\r\u0018\u00010\fX\u0082\u000e¢\u0006\u0002\n\u0000R\u0012\u0010\u000f\u001a\u00060\u0010R\u00020\u0000X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u000e0\rX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0012\u001a\u00020\u0013X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u00160\u0015X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0017\u001a\b\u0012\u0004\u0012\u00020\u00180\u0015X\u0082\u0004¢\u0006\u0002\n\u0000R\"\u0010\u0019\u001a\u0014\u0012\u0004\u0012\u00020\u001b\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u001d0\u001c0\u001a8\u0002X\u0083\u0004¢\u0006\u0002\n\u0000¨\u0006<"}, d2 = {"Landroidx/camera/core/impl/CameraPresenceProvider;", "", "backgroundExecutor", "Ljava/util/concurrent/Executor;", "<init>", "(Ljava/util/concurrent/Executor;)V", "observerLock", "cameraFactory", "Landroidx/camera/core/impl/CameraFactory;", "cameraRepository", "Landroidx/camera/core/impl/CameraRepository;", "sourcePresenceObservable", "Landroidx/camera/core/impl/Observable;", "", "Landroidx/camera/core/CameraIdentifier;", "sourceObserver", "Landroidx/camera/core/impl/CameraPresenceProvider$SourceObservableObserver;", "currentFilteredIds", "isMonitoring", "Ljava/util/concurrent/atomic/AtomicBoolean;", "dependentInternalListeners", "Ljava/util/concurrent/CopyOnWriteArrayList;", "Landroidx/camera/core/impl/InternalCameraPresenceListener;", "publicApiListeners", "Landroidx/camera/core/impl/CameraPresenceProvider$ListenerWrapper;", "cameraStateObservers", "", "", "Landroidx/lifecycle/Observer;", "Landroidx/camera/core/CameraState;", "startup", "", "shutdown", "processFilteredCameraIdUpdate", "newFilteredIdentifiers", "notifyPublicListeners", "addedCameras", "", "removedCameras", "addDependentInternalListener", ServiceSpecificExtraArgs.CastExtraArgs.LISTENER, "removeDependentInternalListener", "conditionallySetupCameraStateObserver", "systemCameraId", "setupCameraStateObserver", "cameraInfoInternal", "Landroidx/camera/core/impl/CameraInfoInternal;", "removeCameraStateObserver", "clearAllCameraStateObservers", "addCameraPresenceListener", "Landroidx/camera/core/CameraPresenceListener;", "executor", "removeCameraPresenceListener", "notifyPublicCamerasAdded", "addedIds", "notifyPublicCamerasRemoved", "removedIds", "ListenerWrapper", "SourceObservableObserver", "Companion", "camera-core_release"}, k = 1, mv = {2, 0, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* loaded from: classes.dex */
public final class CameraPresenceProvider {
    private static final String TAG = "CameraPresencePrvdr";
    private final Executor backgroundExecutor;
    private CameraFactory cameraFactory;
    private CameraRepository cameraRepository;
    private final Map<String, Observer<CameraState>> cameraStateObservers;
    private volatile List<CameraIdentifier> currentFilteredIds;
    private final CopyOnWriteArrayList<InternalCameraPresenceListener> dependentInternalListeners;
    private final AtomicBoolean isMonitoring;
    private final Object observerLock;
    private final CopyOnWriteArrayList<ListenerWrapper> publicApiListeners;
    private final SourceObservableObserver sourceObserver;
    private Observable<List<CameraIdentifier>> sourcePresenceObservable;

    public CameraPresenceProvider(Executor backgroundExecutor) {
        Intrinsics.checkNotNullParameter(backgroundExecutor, "backgroundExecutor");
        this.backgroundExecutor = backgroundExecutor;
        this.observerLock = new Object();
        this.sourceObserver = new SourceObservableObserver();
        this.currentFilteredIds = CollectionsKt.emptyList();
        this.isMonitoring = new AtomicBoolean(false);
        this.dependentInternalListeners = new CopyOnWriteArrayList<>();
        this.publicApiListeners = new CopyOnWriteArrayList<>();
        this.cameraStateObservers = new LinkedHashMap();
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* compiled from: CameraPresenseProvider.kt */
    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0082\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0015HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0016"}, d2 = {"Landroidx/camera/core/impl/CameraPresenceProvider$ListenerWrapper;", "", ServiceSpecificExtraArgs.CastExtraArgs.LISTENER, "Landroidx/camera/core/CameraPresenceListener;", "executor", "Ljava/util/concurrent/Executor;", "<init>", "(Landroidx/camera/core/CameraPresenceListener;Ljava/util/concurrent/Executor;)V", "getListener", "()Landroidx/camera/core/CameraPresenceListener;", "getExecutor", "()Ljava/util/concurrent/Executor;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "", "camera-core_release"}, k = 1, mv = {2, 0, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    static final /* data */ class ListenerWrapper {
        private final Executor executor;
        private final CameraPresenceListener listener;

        public static /* synthetic */ ListenerWrapper copy$default(ListenerWrapper listenerWrapper, CameraPresenceListener cameraPresenceListener, Executor executor, int i, Object obj) {
            if ((i & 1) != 0) {
                cameraPresenceListener = listenerWrapper.listener;
            }
            if ((i & 2) != 0) {
                executor = listenerWrapper.executor;
            }
            return listenerWrapper.copy(cameraPresenceListener, executor);
        }

        /* renamed from: component1, reason: from getter */
        public final CameraPresenceListener getListener() {
            return this.listener;
        }

        /* renamed from: component2, reason: from getter */
        public final Executor getExecutor() {
            return this.executor;
        }

        public final ListenerWrapper copy(CameraPresenceListener listener, Executor executor) {
            Intrinsics.checkNotNullParameter(listener, "listener");
            Intrinsics.checkNotNullParameter(executor, "executor");
            return new ListenerWrapper(listener, executor);
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ListenerWrapper)) {
                return false;
            }
            ListenerWrapper listenerWrapper = (ListenerWrapper) other;
            return Intrinsics.areEqual(this.listener, listenerWrapper.listener) && Intrinsics.areEqual(this.executor, listenerWrapper.executor);
        }

        public int hashCode() {
            return (this.listener.hashCode() * 31) + this.executor.hashCode();
        }

        public String toString() {
            return "ListenerWrapper(listener=" + this.listener + ", executor=" + this.executor + ')';
        }

        public ListenerWrapper(CameraPresenceListener listener, Executor executor) {
            Intrinsics.checkNotNullParameter(listener, "listener");
            Intrinsics.checkNotNullParameter(executor, "executor");
            this.listener = listener;
            this.executor = executor;
        }

        public final CameraPresenceListener getListener() {
            return this.listener;
        }

        public final Executor getExecutor() {
            return this.executor;
        }
    }

    public final void startup(CameraFactory cameraFactory, CameraRepository cameraRepository) {
        Intrinsics.checkNotNullParameter(cameraFactory, "cameraFactory");
        Intrinsics.checkNotNullParameter(cameraRepository, "cameraRepository");
        if (!this.isMonitoring.compareAndSet(false, true)) {
            return;
        }
        Logger.i(TAG, "Starting CameraPresenceProvider monitoring.");
        Iterable availableCameraIds = cameraFactory.getAvailableCameraIds();
        Intrinsics.checkNotNullExpressionValue(availableCameraIds, "getAvailableCameraIds(...)");
        Iterable $this$map$iv = availableCameraIds;
        Collection destination$iv$iv = new ArrayList(CollectionsKt.collectionSizeOrDefault($this$map$iv, 10));
        for (Object item$iv$iv : $this$map$iv) {
            String it = (String) item$iv$iv;
            CameraIdentifier.Companion companion = CameraIdentifier.INSTANCE;
            Intrinsics.checkNotNull(it);
            destination$iv$iv.add(CameraIdentifier.Companion.create$default(companion, it, null, null, 6, null));
        }
        this.currentFilteredIds = (List) destination$iv$iv;
        this.cameraFactory = cameraFactory;
        this.cameraRepository = cameraRepository;
        this.sourcePresenceObservable = cameraFactory.getCameraPresenceSource();
        Observable<List<CameraIdentifier>> observable = this.sourcePresenceObservable;
        if (observable != null) {
            observable.addObserver(this.backgroundExecutor, this.sourceObserver);
        }
    }

    public final void shutdown() {
        if (!this.isMonitoring.getAndSet(false)) {
            Logger.d(TAG, "Shutdown called when not monitoring. Ignoring.");
            return;
        }
        Logger.i(TAG, "Shutting down CameraPresenceProvider monitoring.");
        Observable<List<CameraIdentifier>> observable = this.sourcePresenceObservable;
        if (observable != null) {
            observable.removeObserver(this.sourceObserver);
        }
        clearAllCameraStateObservers();
        this.dependentInternalListeners.clear();
        this.publicApiListeners.clear();
        this.currentFilteredIds = CollectionsKt.emptyList();
        this.cameraFactory = null;
        this.cameraRepository = null;
    }

    /* compiled from: CameraPresenseProvider.kt */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0010\u0003\n\u0000\b\u0082\u0004\u0018\u00002\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00030\u00020\u0001B\u0007¢\u0006\u0004\b\u0004\u0010\u0005J\u0018\u0010\u0006\u001a\u00020\u00072\u000e\u0010\b\u001a\n\u0012\u0004\u0012\u00020\u0003\u0018\u00010\u0002H\u0016J\u0010\u0010\t\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\u000bH\u0016¨\u0006\f"}, d2 = {"Landroidx/camera/core/impl/CameraPresenceProvider$SourceObservableObserver;", "Landroidx/camera/core/impl/Observable$Observer;", "", "Landroidx/camera/core/CameraIdentifier;", "<init>", "(Landroidx/camera/core/impl/CameraPresenceProvider;)V", "onNewData", "", "rawCameraIdentifiers", "onError", "t", "", "camera-core_release"}, k = 1, mv = {2, 0, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    private final class SourceObservableObserver implements Observable.Observer<List<? extends CameraIdentifier>> {
        public SourceObservableObserver() {
        }

        @Override // androidx.camera.core.impl.Observable.Observer
        public /* bridge */ /* synthetic */ void onNewData(List<? extends CameraIdentifier> list) {
            onNewData2((List<CameraIdentifier>) list);
        }

        /* renamed from: onNewData, reason: avoid collision after fix types in other method */
        public void onNewData2(List<CameraIdentifier> rawCameraIdentifiers) {
            CameraFactory factory;
            List rawIdStrings;
            if (CameraPresenceProvider.this.isMonitoring.get() && (factory = CameraPresenceProvider.this.cameraFactory) != null) {
                if (rawCameraIdentifiers != null) {
                    List<CameraIdentifier> $this$map$iv = rawCameraIdentifiers;
                    Collection destination$iv$iv = new ArrayList(CollectionsKt.collectionSizeOrDefault($this$map$iv, 10));
                    for (Object item$iv$iv : $this$map$iv) {
                        destination$iv$iv.add(((CameraIdentifier) item$iv$iv).getInternalId());
                    }
                    rawIdStrings = (List) destination$iv$iv;
                } else {
                    rawIdStrings = CollectionsKt.emptyList();
                }
                try {
                    factory.onCameraIdsUpdated(rawIdStrings);
                    Iterable availableCameraIds = factory.getAvailableCameraIds();
                    Intrinsics.checkNotNullExpressionValue(availableCameraIds, "getAvailableCameraIds(...)");
                    Iterable $this$map$iv2 = availableCameraIds;
                    Collection destination$iv$iv2 = new ArrayList(CollectionsKt.collectionSizeOrDefault($this$map$iv2, 10));
                    for (Object item$iv$iv2 : $this$map$iv2) {
                        String it = (String) item$iv$iv2;
                        CameraIdentifier.Companion companion = CameraIdentifier.INSTANCE;
                        Intrinsics.checkNotNull(it);
                        destination$iv$iv2.add(CameraIdentifier.Companion.create$default(companion, it, null, null, 6, null));
                    }
                    List newFilteredIds = (List) destination$iv$iv2;
                    CameraPresenceProvider.this.processFilteredCameraIdUpdate(newFilteredIds);
                } catch (Exception e) {
                    Logger.e(CameraPresenceProvider.TAG, "CameraFactory failed to update. Triggering refresh.", e);
                    Observable observable = CameraPresenceProvider.this.sourcePresenceObservable;
                    if (observable != null) {
                        observable.fetchData();
                    }
                }
            }
        }

        @Override // androidx.camera.core.impl.Observable.Observer
        public void onError(Throwable t) {
            Intrinsics.checkNotNullParameter(t, "t");
            if (CameraPresenceProvider.this.isMonitoring.get()) {
                Logger.e(CameraPresenceProvider.TAG, "Error from source camera presence observable. Triggering refresh.", t);
                Observable observable = CameraPresenceProvider.this.sourcePresenceObservable;
                if (observable != null) {
                    observable.fetchData();
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void processFilteredCameraIdUpdate(List<CameraIdentifier> newFilteredIdentifiers) {
        List oldFilteredIdsSnapshot;
        List oldFilteredIdsSnapshot2 = CollectionsKt.toList(this.currentFilteredIds);
        if (Intrinsics.areEqual(newFilteredIdentifiers, oldFilteredIdsSnapshot2)) {
            return;
        }
        Set oldIdSet = CollectionsKt.toSet(oldFilteredIdsSnapshot2);
        Set newIdSet = CollectionsKt.toSet(newFilteredIdentifiers);
        Set addedCameras = SetsKt.minus(newIdSet, (Iterable) oldIdSet);
        Set removedCameras = SetsKt.minus(oldIdSet, (Iterable) newIdSet);
        List successfullyUpdatedListeners = new ArrayList();
        List<CameraIdentifier> $this$map$iv = newFilteredIdentifiers;
        Collection destination$iv$iv = new ArrayList(CollectionsKt.collectionSizeOrDefault($this$map$iv, 10));
        for (Object item$iv$iv : $this$map$iv) {
            CameraIdentifier it = (CameraIdentifier) item$iv$iv;
            destination$iv$iv.add(it.getInternalId());
        }
        List newFilteredIdStrings = (List) destination$iv$iv;
        try {
            Set $this$forEach$iv = removedCameras;
            for (Object element$iv : $this$forEach$iv) {
                CameraIdentifier it2 = (CameraIdentifier) element$iv;
                removeCameraStateObserver(it2.getInternalId());
                $this$forEach$iv = $this$forEach$iv;
            }
            CameraRepository it3 = this.cameraRepository;
            if (it3 != null) {
                Logger.d(TAG, "Updating CameraRepository...");
                it3.onCamerasUpdated(newFilteredIdStrings);
                successfullyUpdatedListeners.add(it3);
                Logger.d(TAG, "CameraRepository updated successfully.");
            }
            if (!this.dependentInternalListeners.isEmpty()) {
                Logger.d(TAG, "Updating " + this.dependentInternalListeners.size() + " dependent listeners...");
                Iterable $this$forEach$iv2 = this.dependentInternalListeners;
                for (Object element$iv2 : $this$forEach$iv2) {
                    InternalCameraPresenceListener listener = (InternalCameraPresenceListener) element$iv2;
                    listener.onCamerasUpdated(newFilteredIdStrings);
                    Intrinsics.checkNotNull(listener);
                    successfullyUpdatedListeners.add(listener);
                }
            }
            this.currentFilteredIds = newFilteredIdentifiers;
            Set $this$forEach$iv3 = addedCameras;
            for (Object element$iv3 : $this$forEach$iv3) {
                CameraIdentifier it4 = (CameraIdentifier) element$iv3;
                conditionallySetupCameraStateObserver(it4.getInternalId());
                $this$forEach$iv3 = $this$forEach$iv3;
            }
            notifyPublicListeners(addedCameras, removedCameras);
        } catch (Exception e) {
            Logger.e(TAG, "A core module failed to update. Rolling back changes.", e);
            List $this$map$iv2 = oldFilteredIdsSnapshot2;
            Collection destination$iv$iv2 = new ArrayList(CollectionsKt.collectionSizeOrDefault($this$map$iv2, 10));
            for (Object item$iv$iv2 : $this$map$iv2) {
                CameraIdentifier it5 = (CameraIdentifier) item$iv$iv2;
                destination$iv$iv2.add(it5.getInternalId());
                $this$map$iv2 = $this$map$iv2;
            }
            List oldFilteredIdStrings = (List) destination$iv$iv2;
            Iterable $this$forEach$iv4 = CollectionsKt.asReversedMutable(successfullyUpdatedListeners);
            for (Object element$iv4 : $this$forEach$iv4) {
                InternalCameraPresenceListener listener2 = (InternalCameraPresenceListener) element$iv4;
                try {
                    listener2.onCamerasUpdated(oldFilteredIdStrings);
                    oldFilteredIdsSnapshot = oldFilteredIdsSnapshot2;
                } catch (Exception rollbackException) {
                    oldFilteredIdsSnapshot = oldFilteredIdsSnapshot2;
                    Logger.e(TAG, "Failed to rollback listener: " + listener2, rollbackException);
                }
                oldFilteredIdsSnapshot2 = oldFilteredIdsSnapshot;
            }
            Set $this$forEach$iv5 = removedCameras;
            for (Object element$iv5 : $this$forEach$iv5) {
                CameraIdentifier it6 = (CameraIdentifier) element$iv5;
                conditionallySetupCameraStateObserver(it6.getInternalId());
            }
            Set $this$forEach$iv6 = addedCameras;
            for (Object element$iv6 : $this$forEach$iv6) {
                CameraIdentifier it7 = (CameraIdentifier) element$iv6;
                removeCameraStateObserver(it7.getInternalId());
            }
        }
    }

    private final void notifyPublicListeners(Set<CameraIdentifier> addedCameras, Set<CameraIdentifier> removedCameras) {
        if (!addedCameras.isEmpty()) {
            Logger.i(TAG, "Notifying " + addedCameras.size() + " cameras added.");
            notifyPublicCamerasAdded(addedCameras);
        }
        if (!removedCameras.isEmpty()) {
            Logger.i(TAG, "Notifying " + removedCameras.size() + " cameras removed.");
            notifyPublicCamerasRemoved(removedCameras);
        }
    }

    public final void addDependentInternalListener(InternalCameraPresenceListener listener) {
        Intrinsics.checkNotNullParameter(listener, "listener");
        this.dependentInternalListeners.add(listener);
    }

    public final void removeDependentInternalListener(InternalCameraPresenceListener listener) {
        Intrinsics.checkNotNullParameter(listener, "listener");
        this.dependentInternalListeners.remove(listener);
    }

    private final void conditionallySetupCameraStateObserver(String systemCameraId) {
        CameraRepository repo = this.cameraRepository;
        if (repo == null) {
            return;
        }
        try {
            CameraInternal cameraInternal = repo.getCamera(systemCameraId);
            Intrinsics.checkNotNullExpressionValue(cameraInternal, "getCamera(...)");
            CameraInfoInternal cameraInfoInternal = cameraInternal.getCameraInfoInternal();
            Intrinsics.checkNotNullExpressionValue(cameraInfoInternal, "getCameraInfoInternal(...)");
            setupCameraStateObserver(cameraInfoInternal);
        } catch (IllegalArgumentException e) {
            Logger.w(TAG, "CameraInternal not found for " + systemCameraId + ". Cannot setup state observer.");
        }
    }

    private final void setupCameraStateObserver(final CameraInfoInternal cameraInfoInternal) {
        final String cameraIdStr = cameraInfoInternal.getCameraId();
        Intrinsics.checkNotNullExpressionValue(cameraIdStr, "getCameraId(...)");
        if (!this.isMonitoring.get()) {
            return;
        }
        synchronized (this.observerLock) {
            if (this.cameraStateObservers.containsKey(cameraIdStr)) {
                return;
            }
            final Observer stateObserver = new Observer() { // from class: androidx.camera.core.impl.CameraPresenceProvider$$ExternalSyntheticLambda5
                @Override // androidx.lifecycle.Observer
                public final void onChanged(Object obj) {
                    CameraPresenceProvider.setupCameraStateObserver$lambda$12$lambda$10(CameraPresenceProvider.this, cameraIdStr, (CameraState) obj);
                }
            };
            CameraXExecutors.mainThreadExecutor().execute(new Runnable() { // from class: androidx.camera.core.impl.CameraPresenceProvider$$ExternalSyntheticLambda6
                @Override // java.lang.Runnable
                public final void run() {
                    CameraPresenceProvider.setupCameraStateObserver$lambda$12$lambda$11(CameraInfoInternal.this, stateObserver);
                }
            });
            this.cameraStateObservers.put(cameraIdStr, stateObserver);
            Logger.d(TAG, "Registered state observer for camera: " + cameraIdStr);
            Unit unit = Unit.INSTANCE;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void setupCameraStateObserver$lambda$12$lambda$10(CameraPresenceProvider this$0, String $cameraIdStr, CameraState cameraState) {
        if (!this$0.isMonitoring.get()) {
            Logger.d(TAG, "Ignore camera state change handling since already stop monitoring");
            return;
        }
        if ((cameraState != null ? cameraState.getError() : null) == null) {
            if ((cameraState != null ? cameraState.getType() : null) != CameraState.Type.CLOSED) {
                return;
            }
        }
        StringBuilder append = new StringBuilder().append("Camera ").append($cameraIdStr).append(" state changed to ").append(cameraState.getType()).append(" with error: ");
        CameraState.StateError error = cameraState.getError();
        Logger.w(TAG, append.append(error != null ? Integer.valueOf(error.getCode()) : null).append(". Triggering refresh.").toString());
        Observable<List<CameraIdentifier>> observable = this$0.sourcePresenceObservable;
        if (observable != null) {
            observable.fetchData();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void setupCameraStateObserver$lambda$12$lambda$11(CameraInfoInternal $cameraInfoInternal, Observer $stateObserver) {
        $cameraInfoInternal.getCameraState().observeForever($stateObserver);
    }

    private final void removeCameraStateObserver(String systemCameraId) {
        synchronized (this.observerLock) {
            final Observer observer = this.cameraStateObservers.remove(systemCameraId);
            CameraRepository repo = this.cameraRepository;
            if (observer != null && repo != null) {
                try {
                    final CameraInternal cameraInternal = repo.getCamera(systemCameraId);
                    Intrinsics.checkNotNullExpressionValue(cameraInternal, "getCamera(...)");
                    CameraXExecutors.mainThreadExecutor().execute(new Runnable() { // from class: androidx.camera.core.impl.CameraPresenceProvider$$ExternalSyntheticLambda2
                        @Override // java.lang.Runnable
                        public final void run() {
                            CameraPresenceProvider.removeCameraStateObserver$lambda$14$lambda$13(CameraInternal.this, observer);
                        }
                    });
                    Logger.d(TAG, "Removed state observer for: " + systemCameraId);
                } catch (IllegalArgumentException e) {
                }
            }
            Unit unit = Unit.INSTANCE;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void removeCameraStateObserver$lambda$14$lambda$13(CameraInternal $cameraInternal, Observer $observer) {
        $cameraInternal.getCameraInfoInternal().getCameraState().removeObserver($observer);
    }

    private final void clearAllCameraStateObservers() {
        synchronized (this.observerLock) {
            if (this.cameraStateObservers.isEmpty()) {
                return;
            }
            Map map = MapsKt.toMap(this.cameraStateObservers);
            this.cameraStateObservers.clear();
            Unit unit = Unit.INSTANCE;
            CameraRepository repo = this.cameraRepository;
            if (repo != null) {
                Iterable cameras = repo.getCameras();
                Intrinsics.checkNotNullExpressionValue(cameras, "getCameras(...)");
                Iterable<CameraInternal> $this$map$iv = cameras;
                Collection destination$iv$iv = new ArrayList(CollectionsKt.collectionSizeOrDefault($this$map$iv, 10));
                for (CameraInternal cameraInternal : $this$map$iv) {
                    destination$iv$iv.add(cameraInternal.getCameraInfoInternal());
                }
                final List cameraInfosToRemoveObserver = (List) destination$iv$iv;
                Logger.d(TAG, "Clearing all " + map.size() + " state observers.");
                Collection destination$iv$iv2 = new ArrayList(map.size());
                for (Map.Entry item$iv$iv : map.entrySet()) {
                    final String cameraId = (String) item$iv$iv.getKey();
                    final Observer observer = (Observer) item$iv$iv.getValue();
                    CameraXExecutors.mainThreadExecutor().execute(new Runnable() { // from class: androidx.camera.core.impl.CameraPresenceProvider$$ExternalSyntheticLambda1
                        @Override // java.lang.Runnable
                        public final void run() {
                            CameraPresenceProvider.clearAllCameraStateObservers$lambda$19$lambda$18(cameraInfosToRemoveObserver, observer, cameraId);
                        }
                    });
                    destination$iv$iv2.add(Unit.INSTANCE);
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void clearAllCameraStateObservers$lambda$19$lambda$18(List $cameraInfosToRemoveObserver, Observer $observer, String $cameraId) {
        Object element$iv;
        LiveData<CameraState> cameraState;
        try {
            List $this$firstOrNull$iv = $cameraInfosToRemoveObserver;
            Iterator it = $this$firstOrNull$iv.iterator();
            while (true) {
                if (!it.hasNext()) {
                    element$iv = null;
                    break;
                }
                element$iv = it.next();
                CameraInfoInternal it2 = (CameraInfoInternal) element$iv;
                if (Intrinsics.areEqual(it2.getCameraId(), $cameraId)) {
                    break;
                }
            }
            CameraInfoInternal cameraInfoInternal = (CameraInfoInternal) element$iv;
            if (cameraInfoInternal == null || (cameraState = cameraInfoInternal.getCameraState()) == null) {
                return;
            }
            cameraState.removeObserver($observer);
        } catch (IllegalArgumentException e) {
        }
    }

    public final void addCameraPresenceListener(final CameraPresenceListener listener, Executor executor) {
        Intrinsics.checkNotNullParameter(listener, "listener");
        Intrinsics.checkNotNullParameter(executor, "executor");
        ListenerWrapper wrapper = new ListenerWrapper(listener, executor);
        this.publicApiListeners.add(wrapper);
        executor.execute(new Runnable() { // from class: androidx.camera.core.impl.CameraPresenceProvider$$ExternalSyntheticLambda4
            @Override // java.lang.Runnable
            public final void run() {
                CameraPresenceProvider.addCameraPresenceListener$lambda$20(CameraPresenceProvider.this, listener);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void addCameraPresenceListener$lambda$20(CameraPresenceProvider this$0, CameraPresenceListener $listener) {
        Set currentIds = CollectionsKt.toSet(this$0.currentFilteredIds);
        if (!currentIds.isEmpty()) {
            $listener.onCamerasAdded(currentIds);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean removeCameraPresenceListener$lambda$21(CameraPresenceListener $listener, ListenerWrapper it) {
        return Intrinsics.areEqual(it.getListener(), $listener);
    }

    public final void removeCameraPresenceListener(final CameraPresenceListener listener) {
        Intrinsics.checkNotNullParameter(listener, "listener");
        CollectionsKt.removeAll((List) this.publicApiListeners, new Function1() { // from class: androidx.camera.core.impl.CameraPresenceProvider$$ExternalSyntheticLambda7
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                boolean removeCameraPresenceListener$lambda$21;
                removeCameraPresenceListener$lambda$21 = CameraPresenceProvider.removeCameraPresenceListener$lambda$21(CameraPresenceListener.this, (CameraPresenceProvider.ListenerWrapper) obj);
                return Boolean.valueOf(removeCameraPresenceListener$lambda$21);
            }
        });
    }

    private final void notifyPublicCamerasAdded(final Set<CameraIdentifier> addedIds) {
        Iterable $this$forEach$iv = this.publicApiListeners;
        for (Object element$iv : $this$forEach$iv) {
            final ListenerWrapper wrapper = (ListenerWrapper) element$iv;
            wrapper.getExecutor().execute(new Runnable() { // from class: androidx.camera.core.impl.CameraPresenceProvider$$ExternalSyntheticLambda3
                @Override // java.lang.Runnable
                public final void run() {
                    CameraPresenceProvider.notifyPublicCamerasAdded$lambda$23$lambda$22(CameraPresenceProvider.ListenerWrapper.this, addedIds);
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void notifyPublicCamerasAdded$lambda$23$lambda$22(ListenerWrapper $wrapper, Set $addedIds) {
        $wrapper.getListener().onCamerasAdded($addedIds);
    }

    private final void notifyPublicCamerasRemoved(final Set<CameraIdentifier> removedIds) {
        Iterable $this$forEach$iv = this.publicApiListeners;
        for (Object element$iv : $this$forEach$iv) {
            final ListenerWrapper wrapper = (ListenerWrapper) element$iv;
            wrapper.getExecutor().execute(new Runnable() { // from class: androidx.camera.core.impl.CameraPresenceProvider$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    CameraPresenceProvider.notifyPublicCamerasRemoved$lambda$25$lambda$24(CameraPresenceProvider.ListenerWrapper.this, removedIds);
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void notifyPublicCamerasRemoved$lambda$25$lambda$24(ListenerWrapper $wrapper, Set $removedIds) {
        $wrapper.getListener().onCamerasRemoved($removedIds);
    }
}
