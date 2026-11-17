package androidx.camera.core.processing.concurrent;

import android.graphics.SurfaceTexture;
import android.os.Handler;
import android.os.HandlerThread;
import android.view.Surface;
import androidx.camera.core.CompositionSettings;
import androidx.camera.core.DynamicRange;
import androidx.camera.core.Logger;
import androidx.camera.core.ProcessingException;
import androidx.camera.core.SurfaceOutput;
import androidx.camera.core.SurfaceRequest;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.camera.core.processing.DefaultSurfaceProcessor$$ExternalSyntheticLambda13;
import androidx.camera.core.processing.DefaultSurfaceProcessor$$ExternalSyntheticLambda2;
import androidx.camera.core.processing.ShaderProvider;
import androidx.camera.core.processing.SurfaceProcessorInternal;
import androidx.camera.core.processing.util.GLUtils;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.core.util.Consumer;
import com.google.common.util.concurrent.ListenableFuture;
import j$.util.Objects;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.jvm.functions.Function3;

/* loaded from: classes.dex */
public class DualSurfaceProcessor implements SurfaceProcessorInternal, SurfaceTexture.OnFrameAvailableListener {
    private static final String TAG = "DualSurfaceProcessor";
    private final Executor mGlExecutor;
    final Handler mGlHandler;
    private final DualOpenGlRenderer mGlRenderer;
    final HandlerThread mGlThread;
    private int mInputSurfaceCount;
    private final AtomicBoolean mIsReleaseRequested;
    private boolean mIsReleased;
    final Map<SurfaceOutput, Surface> mOutputSurfaces;
    private SurfaceTexture mPrimarySurfaceTexture;
    private SurfaceTexture mSecondarySurfaceTexture;

    @Override // androidx.camera.core.processing.SurfaceProcessorInternal
    public /* synthetic */ ListenableFuture snapshot(int i, int i2) {
        ListenableFuture immediateFuture;
        immediateFuture = Futures.immediateFuture(null);
        return immediateFuture;
    }

    DualSurfaceProcessor(DynamicRange dynamicRange, CompositionSettings primaryCompositionSettings, CompositionSettings secondaryCompositionSettings) {
        this(dynamicRange, Collections.emptyMap(), primaryCompositionSettings, secondaryCompositionSettings);
    }

    DualSurfaceProcessor(DynamicRange dynamicRange, Map<GLUtils.InputFormat, ShaderProvider> shaderProviderOverrides, CompositionSettings primaryCompositionSettings, CompositionSettings secondaryCompositionSettings) {
        this.mInputSurfaceCount = 0;
        this.mIsReleased = false;
        this.mIsReleaseRequested = new AtomicBoolean(false);
        this.mOutputSurfaces = new LinkedHashMap();
        this.mGlThread = new HandlerThread("CameraX-GL Thread");
        this.mGlThread.start();
        this.mGlHandler = new Handler(this.mGlThread.getLooper());
        this.mGlExecutor = CameraXExecutors.newHandlerExecutor(this.mGlHandler);
        this.mGlRenderer = new DualOpenGlRenderer(primaryCompositionSettings, secondaryCompositionSettings);
        try {
            initGlRenderer(dynamicRange, shaderProviderOverrides);
        } catch (RuntimeException e) {
            release();
            throw e;
        }
    }

    @Override // androidx.camera.core.SurfaceProcessor
    public void onInputSurface(final SurfaceRequest surfaceRequest) throws ProcessingException {
        if (this.mIsReleaseRequested.get()) {
            surfaceRequest.willNotProvideSurface();
            return;
        }
        Runnable runnable = new Runnable() { // from class: androidx.camera.core.processing.concurrent.DualSurfaceProcessor$$ExternalSyntheticLambda2
            @Override // java.lang.Runnable
            public final void run() {
                DualSurfaceProcessor.this.m230xb7e95d0f(surfaceRequest);
            }
        };
        Objects.requireNonNull(surfaceRequest);
        executeSafely(runnable, new DefaultSurfaceProcessor$$ExternalSyntheticLambda2(surfaceRequest));
    }

    /* renamed from: lambda$onInputSurface$1$androidx-camera-core-processing-concurrent-DualSurfaceProcessor, reason: not valid java name */
    /* synthetic */ void m230xb7e95d0f(SurfaceRequest surfaceRequest) {
        this.mInputSurfaceCount++;
        final SurfaceTexture surfaceTexture = new SurfaceTexture(this.mGlRenderer.getTextureName(surfaceRequest.isPrimary()));
        surfaceTexture.setDefaultBufferSize(surfaceRequest.getResolution().getWidth(), surfaceRequest.getResolution().getHeight());
        final Surface surface = new Surface(surfaceTexture);
        surfaceRequest.provideSurface(surface, this.mGlExecutor, new Consumer() { // from class: androidx.camera.core.processing.concurrent.DualSurfaceProcessor$$ExternalSyntheticLambda1
            @Override // androidx.core.util.Consumer
            public final void accept(Object obj) {
                DualSurfaceProcessor.this.m229x6a29e50e(surfaceTexture, surface, (SurfaceRequest.Result) obj);
            }
        });
        if (surfaceRequest.isPrimary()) {
            this.mPrimarySurfaceTexture = surfaceTexture;
        } else {
            this.mSecondarySurfaceTexture = surfaceTexture;
            surfaceTexture.setOnFrameAvailableListener(this, this.mGlHandler);
        }
    }

    /* renamed from: lambda$onInputSurface$0$androidx-camera-core-processing-concurrent-DualSurfaceProcessor, reason: not valid java name */
    /* synthetic */ void m229x6a29e50e(SurfaceTexture surfaceTexture, Surface surface, SurfaceRequest.Result result) {
        surfaceTexture.setOnFrameAvailableListener(null);
        surfaceTexture.release();
        surface.release();
        this.mInputSurfaceCount--;
        checkReadyToRelease();
    }

    @Override // androidx.camera.core.SurfaceProcessor
    public void onOutputSurface(final SurfaceOutput surfaceOutput) throws ProcessingException {
        if (this.mIsReleaseRequested.get()) {
            surfaceOutput.close();
            return;
        }
        Runnable runnable = new Runnable() { // from class: androidx.camera.core.processing.concurrent.DualSurfaceProcessor$$ExternalSyntheticLambda5
            @Override // java.lang.Runnable
            public final void run() {
                DualSurfaceProcessor.this.m232x4069eb42(surfaceOutput);
            }
        };
        Objects.requireNonNull(surfaceOutput);
        executeSafely(runnable, new DefaultSurfaceProcessor$$ExternalSyntheticLambda13(surfaceOutput));
    }

    /* renamed from: lambda$onOutputSurface$3$androidx-camera-core-processing-concurrent-DualSurfaceProcessor, reason: not valid java name */
    /* synthetic */ void m232x4069eb42(final SurfaceOutput surfaceOutput) {
        Surface surface = surfaceOutput.getSurface(this.mGlExecutor, new Consumer() { // from class: androidx.camera.core.processing.concurrent.DualSurfaceProcessor$$ExternalSyntheticLambda6
            @Override // androidx.core.util.Consumer
            public final void accept(Object obj) {
                DualSurfaceProcessor.this.m231xf2aa7341(surfaceOutput, (SurfaceOutput.Event) obj);
            }
        });
        this.mGlRenderer.registerOutputSurface(surface);
        this.mOutputSurfaces.put(surfaceOutput, surface);
    }

    /* renamed from: lambda$onOutputSurface$2$androidx-camera-core-processing-concurrent-DualSurfaceProcessor, reason: not valid java name */
    /* synthetic */ void m231xf2aa7341(SurfaceOutput surfaceOutput, SurfaceOutput.Event event) {
        surfaceOutput.close();
        Surface removedSurface = this.mOutputSurfaces.remove(surfaceOutput);
        if (removedSurface != null) {
            this.mGlRenderer.unregisterOutputSurface(removedSurface);
        }
    }

    @Override // androidx.camera.core.processing.SurfaceProcessorInternal
    public void release() {
        if (this.mIsReleaseRequested.getAndSet(true)) {
            return;
        }
        executeSafely(new Runnable() { // from class: androidx.camera.core.processing.concurrent.DualSurfaceProcessor$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                DualSurfaceProcessor.this.m233x5e4e8afd();
            }
        });
    }

    /* renamed from: lambda$release$4$androidx-camera-core-processing-concurrent-DualSurfaceProcessor, reason: not valid java name */
    /* synthetic */ void m233x5e4e8afd() {
        this.mIsReleased = true;
        checkReadyToRelease();
    }

    @Override // android.graphics.SurfaceTexture.OnFrameAvailableListener
    public void onFrameAvailable(SurfaceTexture surfaceTexture) {
        if (this.mIsReleaseRequested.get() || this.mPrimarySurfaceTexture == null || this.mSecondarySurfaceTexture == null) {
            return;
        }
        this.mPrimarySurfaceTexture.updateTexImage();
        this.mSecondarySurfaceTexture.updateTexImage();
        for (Map.Entry<SurfaceOutput, Surface> entry : this.mOutputSurfaces.entrySet()) {
            Surface surface = entry.getValue();
            SurfaceOutput surfaceOutput = entry.getKey();
            if (surfaceOutput.getFormat() == 34) {
                try {
                    this.mGlRenderer.render(surfaceTexture.getTimestamp(), surface, surfaceOutput, this.mPrimarySurfaceTexture, this.mSecondarySurfaceTexture);
                } catch (RuntimeException e) {
                    Logger.e(TAG, "Failed to render with OpenGL.", e);
                }
            }
        }
    }

    private void initGlRenderer(final DynamicRange dynamicRange, final Map<GLUtils.InputFormat, ShaderProvider> shaderProviderOverrides) {
        ListenableFuture<Void> initFuture = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.core.processing.concurrent.DualSurfaceProcessor$$ExternalSyntheticLambda3
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return DualSurfaceProcessor.this.m228x75bd888a(dynamicRange, shaderProviderOverrides, completer);
            }
        });
        try {
            initFuture.get();
        } catch (InterruptedException | ExecutionException e) {
            Throwable cause = e instanceof ExecutionException ? e.getCause() : e;
            if (cause instanceof RuntimeException) {
                throw ((RuntimeException) cause);
            }
            throw new IllegalStateException("Failed to create DefaultSurfaceProcessor", cause);
        }
    }

    /* renamed from: lambda$initGlRenderer$6$androidx-camera-core-processing-concurrent-DualSurfaceProcessor, reason: not valid java name */
    /* synthetic */ Object m228x75bd888a(final DynamicRange dynamicRange, final Map shaderProviderOverrides, final CallbackToFutureAdapter.Completer completer) throws Exception {
        executeSafely(new Runnable() { // from class: androidx.camera.core.processing.concurrent.DualSurfaceProcessor$$ExternalSyntheticLambda4
            @Override // java.lang.Runnable
            public final void run() {
                DualSurfaceProcessor.this.m227x27fe1089(dynamicRange, shaderProviderOverrides, completer);
            }
        });
        return "Init GlRenderer";
    }

    /* renamed from: lambda$initGlRenderer$5$androidx-camera-core-processing-concurrent-DualSurfaceProcessor, reason: not valid java name */
    /* synthetic */ void m227x27fe1089(DynamicRange dynamicRange, Map shaderProviderOverrides, CallbackToFutureAdapter.Completer completer) {
        try {
            this.mGlRenderer.init(dynamicRange, shaderProviderOverrides);
            completer.set(null);
        } catch (RuntimeException e) {
            completer.setException(e);
        }
    }

    private void executeSafely(Runnable runnable) {
        executeSafely(runnable, new Runnable() { // from class: androidx.camera.core.processing.concurrent.DualSurfaceProcessor$$ExternalSyntheticLambda8
            @Override // java.lang.Runnable
            public final void run() {
                DualSurfaceProcessor.lambda$executeSafely$7();
            }
        });
    }

    static /* synthetic */ void lambda$executeSafely$7() {
    }

    private void executeSafely(final Runnable runnable, final Runnable onFailure) {
        try {
            this.mGlExecutor.execute(new Runnable() { // from class: androidx.camera.core.processing.concurrent.DualSurfaceProcessor$$ExternalSyntheticLambda7
                @Override // java.lang.Runnable
                public final void run() {
                    DualSurfaceProcessor.this.m226x6156b869(onFailure, runnable);
                }
            });
        } catch (RejectedExecutionException e) {
            Logger.w(TAG, "Unable to executor runnable", e);
            onFailure.run();
        }
    }

    /* renamed from: lambda$executeSafely$8$androidx-camera-core-processing-concurrent-DualSurfaceProcessor, reason: not valid java name */
    /* synthetic */ void m226x6156b869(Runnable onFailure, Runnable runnable) {
        if (this.mIsReleased) {
            onFailure.run();
        } else {
            runnable.run();
        }
    }

    private void checkReadyToRelease() {
        if (this.mIsReleased && this.mInputSurfaceCount == 0) {
            for (SurfaceOutput surfaceOutput : this.mOutputSurfaces.keySet()) {
                surfaceOutput.close();
            }
            this.mOutputSurfaces.clear();
            this.mGlRenderer.release();
            this.mGlThread.quit();
        }
    }

    public static class Factory {
        private static Function3<DynamicRange, CompositionSettings, CompositionSettings, SurfaceProcessorInternal> sSupplier = new Function3() { // from class: androidx.camera.core.processing.concurrent.DualSurfaceProcessor$Factory$$ExternalSyntheticLambda0
            @Override // kotlin.jvm.functions.Function3
            public final Object invoke(Object obj, Object obj2, Object obj3) {
                return new DualSurfaceProcessor((DynamicRange) obj, (CompositionSettings) obj2, (CompositionSettings) obj3);
            }
        };

        private Factory() {
        }

        public static SurfaceProcessorInternal newInstance(DynamicRange dynamicRange, CompositionSettings primaryCompositionSettings, CompositionSettings secondaryCompositionSettings) {
            return sSupplier.invoke(dynamicRange, primaryCompositionSettings, secondaryCompositionSettings);
        }

        public static void setSupplier(Function3<DynamicRange, CompositionSettings, CompositionSettings, SurfaceProcessorInternal> supplier) {
            sSupplier = supplier;
        }
    }
}
