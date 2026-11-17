package androidx.camera.core.processing;

import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.util.Size;
import androidx.camera.core.Logger;
import androidx.camera.core.ProcessingException;
import androidx.camera.core.SurfaceOutput;
import androidx.camera.core.SurfaceRequest;
import androidx.camera.core.impl.CameraInternal;
import androidx.camera.core.impl.StreamSpec;
import androidx.camera.core.impl.utils.Threads;
import androidx.camera.core.impl.utils.TransformUtils;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.FutureCallback;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.camera.core.processing.util.OutConfig;
import androidx.core.util.Consumer;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CancellationException;

/* loaded from: classes.dex */
public class SurfaceProcessorNode implements Node<In, Out> {
    private static final String TAG = "SurfaceProcessorNode";
    final CameraInternal mCameraInternal;
    private In mInput;
    private Out mOutput;
    final SurfaceProcessorInternal mSurfaceProcessor;

    public static class Out extends HashMap<OutConfig, SurfaceEdge> {
    }

    public SurfaceProcessorNode(CameraInternal cameraInternal, SurfaceProcessorInternal surfaceProcessor) {
        this.mCameraInternal = cameraInternal;
        this.mSurfaceProcessor = surfaceProcessor;
    }

    @Override // androidx.camera.core.processing.Node
    public Out transform(In input) {
        Threads.checkMainThread();
        Logger.d(TAG, "SurfaceProcessorNode Transform (Processor=" + this.mSurfaceProcessor + "\n   inputEdge = " + input.getSurfaceEdge());
        for (OutConfig outConfig : input.getOutConfigs()) {
            Logger.d(TAG, "   outputConfig = " + outConfig);
        }
        this.mInput = input;
        this.mOutput = new Out();
        SurfaceEdge inputSurface = input.getSurfaceEdge();
        for (OutConfig config : input.getOutConfigs()) {
            this.mOutput.put(config, transformSingleOutput(inputSurface, config));
        }
        sendSurfaceRequest(inputSurface);
        sendSurfaceOutputs(inputSurface, this.mOutput);
        setUpRotationUpdates(inputSurface, this.mOutput);
        return this.mOutput;
    }

    private SurfaceEdge transformSingleOutput(SurfaceEdge input, OutConfig outConfig) {
        Rect newCropRect;
        boolean z;
        Rect cropRect = outConfig.getCropRect();
        int rotationDegrees = outConfig.getRotationDegrees();
        boolean mirroring = outConfig.isMirroring();
        Matrix sensorToBufferTransform = new Matrix(input.getSensorToBufferTransform());
        Matrix newTransform = TransformUtils.getRectToRect(new RectF(cropRect), TransformUtils.sizeToRectF(outConfig.getSize()), rotationDegrees, mirroring);
        sensorToBufferTransform.postConcat(newTransform);
        Size rotatedCropSize = TransformUtils.getRotatedSize(cropRect, rotationDegrees);
        Preconditions.checkArgument(TransformUtils.isAspectRatioMatchingWithRoundingError(rotatedCropSize, outConfig.getSize()));
        if (outConfig.shouldRespectInputCropRect()) {
            Preconditions.checkArgument(outConfig.getCropRect().contains(input.getCropRect()), String.format("Output crop rect %s must contain input crop rect %s", outConfig.getCropRect(), input.getCropRect()));
            Rect newCropRect2 = new Rect();
            RectF newCropRectF = new RectF(input.getCropRect());
            newTransform.mapRect(newCropRectF);
            newCropRectF.round(newCropRect2);
            newCropRect = newCropRect2;
        } else {
            newCropRect = TransformUtils.sizeToRect(outConfig.getSize());
        }
        StreamSpec streamSpec = input.getStreamSpec().toBuilder().setResolution(outConfig.getSize()).build();
        int targets = outConfig.getTargets();
        int format = outConfig.getFormat();
        int rotationDegrees2 = input.getRotationDegrees() - rotationDegrees;
        if (input.isMirroring() != mirroring) {
            z = true;
        } else {
            z = false;
        }
        SurfaceEdge outputSurface = new SurfaceEdge(targets, format, streamSpec, sensorToBufferTransform, false, newCropRect, rotationDegrees2, -1, z);
        return outputSurface;
    }

    private void sendSurfaceRequest(SurfaceEdge input) {
        try {
            this.mSurfaceProcessor.onInputSurface(input.createSurfaceRequest(this.mCameraInternal));
        } catch (ProcessingException e) {
            Logger.e(TAG, "Failed to send SurfaceRequest to SurfaceProcessor.", e);
        }
    }

    private void sendSurfaceOutputs(final SurfaceEdge input, Map<OutConfig, SurfaceEdge> outputs) {
        for (final Map.Entry<OutConfig, SurfaceEdge> output : outputs.entrySet()) {
            m223x8baeb245(input, output);
            output.getValue().addOnInvalidatedListener(new Runnable() { // from class: androidx.camera.core.processing.SurfaceProcessorNode$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    SurfaceProcessorNode.this.m223x8baeb245(input, output);
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: createAndSendSurfaceOutput, reason: merged with bridge method [inline-methods] */
    public void m223x8baeb245(SurfaceEdge input, Map.Entry<OutConfig, SurfaceEdge> output) {
        final SurfaceEdge outputEdge = output.getValue();
        Logger.d(TAG, "     -> outputEdge = " + outputEdge);
        SurfaceOutput.CameraInputInfo cameraInputInfo = SurfaceOutput.CameraInputInfo.of(input.getStreamSpec().getResolution(), output.getKey().getCropRect(), input.hasCameraTransform() ? this.mCameraInternal : null, output.getKey().getRotationDegrees(), output.getKey().isMirroring());
        ListenableFuture<SurfaceOutput> future = outputEdge.createSurfaceOutputFuture(output.getKey().getFormat(), cameraInputInfo, null);
        Futures.addCallback(future, new FutureCallback<SurfaceOutput>() { // from class: androidx.camera.core.processing.SurfaceProcessorNode.1
            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onSuccess(SurfaceOutput output2) {
                Preconditions.checkNotNull(output2);
                try {
                    SurfaceProcessorNode.this.mSurfaceProcessor.onOutputSurface(output2);
                } catch (ProcessingException e) {
                    Logger.e(SurfaceProcessorNode.TAG, "Failed to send SurfaceOutput to SurfaceProcessor.", e);
                }
            }

            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onFailure(Throwable t) {
                if (outputEdge.getTargets() == 2 && (t instanceof CancellationException)) {
                    Logger.d(SurfaceProcessorNode.TAG, "Downstream VideoCapture failed to provide Surface.");
                } else {
                    Logger.w(SurfaceProcessorNode.TAG, "Downstream node failed to provide Surface. Target: " + TargetUtils.getHumanReadableName(outputEdge.getTargets()), t);
                }
            }
        }, CameraXExecutors.mainThreadExecutor());
    }

    void setUpRotationUpdates(SurfaceEdge inputEdge, final Map<OutConfig, SurfaceEdge> outputs) {
        inputEdge.addTransformationUpdateListener(new Consumer() { // from class: androidx.camera.core.processing.SurfaceProcessorNode$$ExternalSyntheticLambda1
            @Override // androidx.core.util.Consumer
            public final void accept(Object obj) {
                SurfaceProcessorNode.lambda$setUpRotationUpdates$1(outputs, (SurfaceRequest.TransformationInfo) obj);
            }
        });
    }

    static /* synthetic */ void lambda$setUpRotationUpdates$1(Map outputs, SurfaceRequest.TransformationInfo info) {
        for (Map.Entry<OutConfig, SurfaceEdge> output : outputs.entrySet()) {
            int rotationDegrees = info.getRotationDegrees() - output.getKey().getRotationDegrees();
            if (output.getKey().isMirroring()) {
                rotationDegrees = -rotationDegrees;
            }
            output.getValue().updateTransformation(TransformUtils.within360(rotationDegrees), -1);
        }
    }

    @Override // androidx.camera.core.processing.Node
    public void release() {
        this.mSurfaceProcessor.release();
        Threads.runOnMain(new Runnable() { // from class: androidx.camera.core.processing.SurfaceProcessorNode$$ExternalSyntheticLambda2
            @Override // java.lang.Runnable
            public final void run() {
                SurfaceProcessorNode.this.m222xa4033323();
            }
        });
    }

    /* renamed from: lambda$release$2$androidx-camera-core-processing-SurfaceProcessorNode, reason: not valid java name */
    /* synthetic */ void m222xa4033323() {
        if (this.mOutput != null) {
            for (SurfaceEdge surface : this.mOutput.values()) {
                surface.close();
            }
        }
    }

    public SurfaceProcessorInternal getSurfaceProcessor() {
        return this.mSurfaceProcessor;
    }

    public static abstract class In {
        public abstract List<OutConfig> getOutConfigs();

        public abstract SurfaceEdge getSurfaceEdge();

        public static In of(SurfaceEdge edge, List<OutConfig> configs) {
            return new AutoValue_SurfaceProcessorNode_In(edge, configs);
        }
    }
}
