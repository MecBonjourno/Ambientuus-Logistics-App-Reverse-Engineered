package androidx.camera.camera2.internal;

import android.hardware.camera2.CameraManager;
import android.util.Log;
import androidx.camera.camera2.internal.compat.CameraAccessExceptionCompat;
import androidx.camera.camera2.internal.compat.CameraManagerCompat;
import androidx.camera.core.CameraIdentifier;
import androidx.camera.core.CameraUnavailableException;
import androidx.camera.core.impl.AbstractCameraPresenceSource;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.constraintlayout.widget.ConstraintLayout;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.concurrent.Executor;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: Camera2PresenceSource.kt */
@Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\u0018\u0000 \u00142\u00020\u0001:\u0001\u0014B%\u0012\f\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\b¢\u0006\u0004\b\t\u0010\nJ\b\u0010\r\u001a\u00020\u000eH\u0016J\b\u0010\u000f\u001a\u00020\u000eH\u0016J\u0014\u0010\u0010\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00120\u00030\u0011H\u0016J\u0010\u0010\u0013\u001a\u00020\u000e*\u0006\u0012\u0002\b\u00030\u0011H\u0002R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\bX\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\u000b\u001a\u0004\u0018\u00010\fX\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006\u0015"}, d2 = {"Landroidx/camera/camera2/internal/Camera2PresenceSource;", "Landroidx/camera/core/impl/AbstractCameraPresenceSource;", "initialCameraIds", "", "", "cameraManager", "Landroidx/camera/camera2/internal/compat/CameraManagerCompat;", "systemCallbackExecutor", "Ljava/util/concurrent/Executor;", "<init>", "(Ljava/util/List;Landroidx/camera/camera2/internal/compat/CameraManagerCompat;Ljava/util/concurrent/Executor;)V", "systemAvailabilityCallback", "Landroid/hardware/camera2/CameraManager$AvailabilityCallback;", "startMonitoring", "", "stopMonitoring", "fetchData", "Lcom/google/common/util/concurrent/ListenableFuture;", "Landroidx/camera/core/CameraIdentifier;", "fetchDataAndForget", "Companion", "camera-camera2_release"}, k = 1, mv = {2, 0, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* carregado de: classes.dex */
public final class Camera2PresenceSource extends AbstractCameraPresenceSource {
    private static final Companion Companion = new Companion(null);
    private static final String TAG = "Camera2PresenceSrc";
    private final CameraManagerCompat cameraManager;
    private CameraManager.AvailabilityCallback systemAvailabilityCallback;
    private final Executor systemCallbackExecutor;

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    public Camera2PresenceSource(List<String> initialCameraIds, CameraManagerCompat cameraManager, Executor systemCallbackExecutor) {
        super(initialCameraIds);
        Intrinsics.checkNotNullParameter(initialCameraIds, "initialCameraIds");
        Intrinsics.checkNotNullParameter(cameraManager, "cameraManager");
        Intrinsics.checkNotNullParameter(systemCallbackExecutor, "systemCallbackExecutor");
        this.cameraManager = cameraManager;
        this.systemCallbackExecutor = systemCallbackExecutor;
    }

    @Override // androidx.camera.core.impl.AbstractCameraPresenceSource
    public void startMonitoring() {
        if (this.systemAvailabilityCallback != null) {
            Log.w(TAG, "Monitoring already started. Unregistering existing callback.");
            stopMonitoring();
        }
        Log.i(TAG, "Starting system availability monitoring.");
        this.systemAvailabilityCallback = new CameraManager.AvailabilityCallback() { // da classe: androidx.camera.camera2.internal.Camera2PresenceSource$startMonitoring$1
            @Override // android.hardware.camera2.CameraManager.AvailabilityCallback
            public void onCameraAvailable(String cameraId) {
                Intrinsics.checkNotNullParameter(cameraId, "cameraId");
                Log.d("Camera2PresenceSrc", "System onCameraAvailable: " + cameraId);
                Camera2PresenceSource.this.fetchDataAndForget(Camera2PresenceSource.this.fetchData());
            }

            @Override // android.hardware.camera2.CameraManager.AvailabilityCallback
            public void onCameraUnavailable(String cameraId) {
                Intrinsics.checkNotNullParameter(cameraId, "cameraId");
                Log.d("Camera2PresenceSrc", "System onCameraUnavailable: " + cameraId);
                Camera2PresenceSource.this.fetchDataAndForget(Camera2PresenceSource.this.fetchData());
            }

            @Override // android.hardware.camera2.CameraManager.AvailabilityCallback
            public void onCameraAccessPrioritiesChanged() {
                Log.d("Camera2PresenceSrc", "System onCameraAccessPrioritiesChanged.");
                Camera2PresenceSource.this.fetchDataAndForget(Camera2PresenceSource.this.fetchData());
            }
        };
        CameraManagerCompat cameraManagerCompat = this.cameraManager;
        Executor executor = this.systemCallbackExecutor;
        CameraManager.AvailabilityCallback availabilityCallback = this.systemAvailabilityCallback;
        Intrinsics.checkNotNull(availabilityCallback);
        cameraManagerCompat.registerAvailabilityCallback(executor, availabilityCallback);
        fetchDataAndForget(fetchData());
    }

    @Override // androidx.camera.core.impl.AbstractCameraPresenceSource
    public void stopMonitoring() {
        Log.i(TAG, "Stopping system availability monitoring.");
        CameraManager.AvailabilityCallback it = this.systemAvailabilityCallback;
        if (it != null) {
            try {
                try {
                    this.cameraManager.unregisterAvailabilityCallback(it);
                    Unit unit = Unit.INSTANCE;
                } catch (Exception e) {
                    Integer.valueOf(Log.w(TAG, "Failed to unregister system availability callback.", e));
                }
            } finally {
                this.systemAvailabilityCallback = null;
            }
        }
    }

    @Override // androidx.camera.core.impl.AbstractCameraPresenceSource, androidx.camera.core.impl.Observable
    public ListenableFuture<List<CameraIdentifier>> fetchData() {
        ListenableFuture<List<CameraIdentifier>> future = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // da classe: androidx.camera.camera2.internal.Camera2PresenceSource$$ExternalSyntheticLambda1
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                Object fetchData$lambda$3;
                fetchData$lambda$3 = Camera2PresenceSource.fetchData$lambda$3(Camera2PresenceSource.this, completer);
                return fetchData$lambda$3;
            }
        });
        Intrinsics.checkNotNullExpressionValue(future, "getFuture(...)");
        return future;
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public static final Object fetchData$lambda$3(final Camera2PresenceSource this$0, final CallbackToFutureAdapter.Completer completer) {
        Intrinsics.checkNotNullParameter(completer, "completer");
        this$0.systemCallbackExecutor.execute(new Runnable() { // da classe: androidx.camera.camera2.internal.Camera2PresenceSource$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                Camera2PresenceSource.fetchData$lambda$3$lambda$2(Camera2PresenceSource.this, completer);
            }
        });
        return "FetchData for CameraAvailability";
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public static final void fetchData$lambda$3$lambda$2(Camera2PresenceSource this$0, CallbackToFutureAdapter.Completer $completer) {
        try {
            Object[] cameraIdList = this$0.cameraManager.getCameraIdList();
            Intrinsics.checkNotNullExpressionValue(cameraIdList, "getCameraIdList(...)");
            Object[] $this$map$iv = cameraIdList;
            Collection destination$iv$iv = new ArrayList($this$map$iv.length);
            for (Object item$iv$iv : $this$map$iv) {
                String it = (String) item$iv$iv;
                CameraIdentifier.Companion companion = CameraIdentifier.INSTANCE;
                Intrinsics.checkNotNull(it);
                destination$iv$iv.add(CameraIdentifier.Companion.create$default(companion, it, null, null, 6, null));
            }
            ArrayList arrayList = (List) destination$iv$iv;
            Log.d(TAG, "[FetchData] Refreshed camera list: " + CollectionsKt.joinToString$default(arrayList, null, null, null, 0, null, null, 63, null));
            this$0.updateData(arrayList);
            $completer.set(arrayList);
        } catch (CameraAccessExceptionCompat e) {
            Log.e(TAG, "[FetchData] Failed to get camera list for refresh.", e);
            CameraUnavailableException error = CameraUnavailableExceptionHelper.createFrom(e);
            Intrinsics.checkNotNullExpressionValue(error, "createFrom(...)");
            this$0.updateError(error);
            $completer.setException(error);
        }
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public final void fetchDataAndForget(ListenableFuture<?> listenableFuture) {
        Futures.transformAsyncOnCompletion(listenableFuture);
    }

    /* compiled from: Camera2PresenceSource.kt */
    @Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\b\u0082\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000¨\u0006\u0006"}, d2 = {"Landroidx/camera/camera2/internal/Camera2PresenceSource$Companion;", "", "<init>", "()V", "TAG", "", "camera-camera2_release"}, k = 1, mv = {2, 0, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    private static final class Companion {
        public /* sintético */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }
    }
}
