package androidx.camera.camera2.internal.compat.workaround;

import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CaptureFailure;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.TotalCaptureResult;
import android.util.Log;
import androidx.arch.core.util.Function;
import androidx.camera.camera2.internal.Camera2CaptureCallbacks;
import androidx.camera.camera2.internal.compat.workaround.RequestMonitor;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import com.google.common.util.concurrent.ListenableFuture;
import j$.util.DesugarCollections;
import j$.util.Objects;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

/* loaded from: classes.dex */
public class RequestMonitor {
    private static final String TAG = "RequestMonitor";
    private final boolean mQuirkEnabled;
    private final List<ListenableFuture<Void>> mRequestTasks = DesugarCollections.synchronizedList(new ArrayList());

    public RequestMonitor(boolean quirkEnabled) {
        this.mQuirkEnabled = quirkEnabled;
    }

    public boolean shouldMonitorRequest() {
        return this.mQuirkEnabled;
    }

    public ListenableFuture<Void> getRequestsProcessedFuture() {
        if (this.mRequestTasks.isEmpty()) {
            return Futures.immediateFuture(null);
        }
        return Futures.nonCancellationPropagating(Futures.transform(Futures.successfulAsList(new ArrayList(this.mRequestTasks)), new Function() { // from class: androidx.camera.camera2.internal.compat.workaround.RequestMonitor$$ExternalSyntheticLambda1
            @Override // androidx.arch.core.util.Function
            public final Object apply(Object obj) {
                return RequestMonitor.lambda$getRequestsProcessedFuture$0((List) obj);
            }
        }, CameraXExecutors.directExecutor()));
    }

    static /* synthetic */ Void lambda$getRequestsProcessedFuture$0(List input) {
        return null;
    }

    public CameraCaptureSession.CaptureCallback createMonitorListener(CameraCaptureSession.CaptureCallback originalListener) {
        return shouldMonitorRequest() ? Camera2CaptureCallbacks.createComboCallback(createMonitorListener(), originalListener) : originalListener;
    }

    private CameraCaptureSession.CaptureCallback createMonitorListener() {
        final RequestCompleteListener completeListener = new RequestCompleteListener();
        final ListenableFuture<Void> future = completeListener.mStartRequestFuture;
        this.mRequestTasks.add(future);
        Log.d(TAG, "RequestListener " + completeListener + " monitoring " + this);
        future.addListener(new Runnable() { // from class: androidx.camera.camera2.internal.compat.workaround.RequestMonitor$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                RequestMonitor.this.m130x78e11639(completeListener, future);
            }
        }, CameraXExecutors.directExecutor());
        return completeListener;
    }

    /* renamed from: lambda$createMonitorListener$1$androidx-camera-camera2-internal-compat-workaround-RequestMonitor, reason: not valid java name */
    /* synthetic */ void m130x78e11639(RequestCompleteListener completeListener, ListenableFuture future) {
        Log.d(TAG, "RequestListener " + completeListener + " done " + this);
        this.mRequestTasks.remove(future);
    }

    public void stop() {
        LinkedList<ListenableFuture<Void>> tasks = new LinkedList<>(this.mRequestTasks);
        while (!tasks.isEmpty()) {
            ((ListenableFuture) Objects.requireNonNull(tasks.poll())).cancel(true);
        }
    }

    static class RequestCompleteListener extends CameraCaptureSession.CaptureCallback {
        CallbackToFutureAdapter.Completer<Void> mStartRequestCompleter;
        final ListenableFuture<Void> mStartRequestFuture = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.camera2.internal.compat.workaround.RequestMonitor$RequestCompleteListener$$ExternalSyntheticLambda0
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return RequestMonitor.RequestCompleteListener.this.m131x4a889b3e(completer);
            }
        });

        RequestCompleteListener() {
        }

        /* renamed from: lambda$new$0$androidx-camera-camera2-internal-compat-workaround-RequestMonitor$RequestCompleteListener, reason: not valid java name */
        /* synthetic */ Object m131x4a889b3e(CallbackToFutureAdapter.Completer completer) throws Exception {
            this.mStartRequestCompleter = completer;
            return "RequestCompleteListener[" + this + "]";
        }

        @Override // android.hardware.camera2.CameraCaptureSession.CaptureCallback
        public void onCaptureStarted(CameraCaptureSession session, CaptureRequest request, long timestamp, long frameNumber) {
            completeFuture();
        }

        @Override // android.hardware.camera2.CameraCaptureSession.CaptureCallback
        public void onCaptureSequenceAborted(CameraCaptureSession session, int sequenceId) {
            completeFuture();
        }

        @Override // android.hardware.camera2.CameraCaptureSession.CaptureCallback
        public void onCaptureCompleted(CameraCaptureSession session, CaptureRequest request, TotalCaptureResult result) {
            completeFuture();
        }

        @Override // android.hardware.camera2.CameraCaptureSession.CaptureCallback
        public void onCaptureFailed(CameraCaptureSession session, CaptureRequest request, CaptureFailure failure) {
            completeFuture();
        }

        @Override // android.hardware.camera2.CameraCaptureSession.CaptureCallback
        public void onCaptureSequenceCompleted(CameraCaptureSession session, int sequenceId, long frameNumber) {
            completeFuture();
        }

        private void completeFuture() {
            if (this.mStartRequestCompleter != null) {
                this.mStartRequestCompleter.set(null);
                this.mStartRequestCompleter = null;
            }
        }
    }
}
