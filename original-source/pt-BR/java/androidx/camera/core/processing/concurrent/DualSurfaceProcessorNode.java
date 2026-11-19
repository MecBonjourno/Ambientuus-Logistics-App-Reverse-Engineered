package androidx.camera.core.processing.concurrent;

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
import androidx.camera.core.processing.Node;
import androidx.camera.core.processing.SurfaceEdge;
import androidx.camera.core.processing.SurfaceProcessorInternal;
import androidx.camera.core.processing.TargetUtils;
import androidx.camera.core.processing.util.OutConfig;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CancellationException;

/* carregado de: classes.dex */
public class DualSurfaceProcessorNode implements Node<In, Out> {
    private static final String TAG = "DualSurfaceProcessorNode";
    private In mInput;
    private Out mOutput;
    final CameraInternal mPrimaryCameraInternal;
    final CameraInternal mSecondaryCameraInternal;
    final SurfaceProcessorInternal mSurfaceProcessor;

    public static class Out extends HashMap<DualOutConfig, SurfaceEdge> {
    }

    public DualSurfaceProcessorNode(CameraInternal primaryCameraInternal, CameraInternal secondaryCameraInternal, SurfaceProcessorInternal surfaceProcessor) {
        this.mPrimaryCameraInternal = primaryCameraInternal;
        this.mSecondaryCameraInternal = secondaryCameraInternal;
        this.mSurfaceProcessor = surfaceProcessor;
    }

    @Override // androidx.camera.core.processing.Node
    public Out transform(In in) {
        Threads.checkMainThread();
        Logger.d(TAG, "DualSurfaceProcessorNode Transform Processor = " + this.mSurfaceProcessor + "\n   primary input = " + in.getPrimarySurfaceEdge() + "\n   secondary input = " + in.getSecondarySurfaceEdge());
        for (DualOutConfig outConfig : in.getOutConfigs()) {
            Logger.d("SurfaceProcessorNode", "   outputConfig = " + outConfig);
        }
        this.mInput = in;
        this.mOutput = new Out();
        SurfaceEdge primaryInputSurfaceEdge = this.mInput.getPrimarySurfaceEdge();
        SurfaceEdge secondaryInputSurfaceEdge = this.mInput.getSecondarySurfaceEdge();
        for (DualOutConfig config : this.mInput.getOutConfigs()) {
            this.mOutput.put(config, transformSingleOutput(primaryInputSurfaceEdge, config.getPrimaryOutConfig()));
        }
        sendSurfaceRequest(this.mPrimaryCameraInternal, primaryInputSurfaceEdge, true);
        sendSurfaceRequest(this.mSecondaryCameraInternal, secondaryInputSurfaceEdge, false);
        sendSurfaceOutputs(this.mPrimaryCameraInternal, this.mSecondaryCameraInternal, primaryInputSurfaceEdge, secondaryInputSurfaceEdge, this.mOutput);
        return this.mOutput;
    }

    private SurfaceEdge transformSingleOutput(SurfaceEdge input, OutConfig outConfig) {
        Rect cropRect = outConfig.getCropRect();
        int rotationDegrees = outConfig.getRotationDegrees();
        boolean mirroring = outConfig.isMirroring();
        Matrix sensorToBufferTransform = new Matrix(input.getSensorToBufferTransform());
        Matrix newTransform = TransformUtils.getRectToRect(new RectF(cropRect), TransformUtils.sizeToRectF(outConfig.getSize()), rotationDegrees, mirroring);
        sensorToBufferTransform.postConcat(newTransform);
        Size rotatedCropSize = TransformUtils.getRotatedSize(cropRect, rotationDegrees);
        Preconditions.checkArgument(TransformUtils.isAspectRatioMatchingWithRoundingError(rotatedCropSize, outConfig.getSize()));
        Rect newCropRect = TransformUtils.sizeToRect(outConfig.getSize());
        StreamSpec streamSpec = input.getStreamSpec().toBuilder().setResolution(outConfig.getSize()).build();
        SurfaceEdge outputSurface = new SurfaceEdge(outConfig.getTargets(), outConfig.getFormat(), streamSpec, sensorToBufferTransform, false, newCropRect, input.getRotationDegrees() - rotationDegrees, -1, input.isMirroring() != mirroring);
        return outputSurface;
    }

    private void sendSurfaceRequest(CameraInternal cameraInternal, SurfaceEdge input, boolean isPrimary) {
        SurfaceRequest surfaceRequest = input.createSurfaceRequest(cameraInternal, isPrimary);
        try {
            this.mSurfaceProcessor.onInputSurface(surfaceRequest);
        } catch (ProcessingException e) {
            Logger.e(TAG, "Failed to send SurfaceRequest to SurfaceProcessor.", e);
        }
    }

    private void sendSurfaceOutputs(CameraInternal primaryCameraInternal, CameraInternal secondaryCameraInternal, SurfaceEdge primarySurfaceEdge, SurfaceEdge secondarySurfaceEdge, Map<DualOutConfig, SurfaceEdge> outputs) {
        for (final Map.Entry<DualOutConfig, SurfaceEdge> output : outputs.entrySet()) {
            final CameraInternal primaryCameraInternal2 = primaryCameraInternal;
            final CameraInternal secondaryCameraInternal2 = secondaryCameraInternal;
            final SurfaceEdge primarySurfaceEdge2 = primarySurfaceEdge;
            final SurfaceEdge secondarySurfaceEdge2 = secondarySurfaceEdge;
            m235xacee03b(primaryCameraInternal2, secondaryCameraInternal2, primarySurfaceEdge2, secondarySurfaceEdge2, output);
            output.getValue().addOnInvalidatedListener(new Runnable() { // da classe: androidx.camera.core.processing.concurrent.DualSurfaceProcessorNode$$ExternalSyntheticLambda1
                @Override // java.lang.Runnable
                public final void run() {
                    DualSurfaceProcessorNode.this.m235xacee03b(primaryCameraInternal2, secondaryCameraInternal2, primarySurfaceEdge2, secondarySurfaceEdge2, output);
                }
            });
            primaryCameraInternal = primaryCameraInternal2;
            secondaryCameraInternal = secondaryCameraInternal2;
            primarySurfaceEdge = primarySurfaceEdge2;
            secondarySurfaceEdge = secondarySurfaceEdge2;
        }
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    /* renomeado de: createAndSendSurfaceOutput, motivo: mesclado com método bridge [métodos inline] */
    public void m235xacee03b(CameraInternal primaryCameraInternal, CameraInternal secondaryCameraInternal, SurfaceEdge primarySurfaceEdge, SurfaceEdge secondarySurfaceEdge, Map.Entry<DualOutConfig, SurfaceEdge> output) {
        final SurfaceEdge outputEdge = output.getValue();
        Logger.d(TAG, "     -> outputEdge = " + outputEdge);
        SurfaceOutput.CameraInputInfo primaryCameraInputInfo = SurfaceOutput.CameraInputInfo.of(primarySurfaceEdge.getStreamSpec().getResolution(), output.getKey().getPrimaryOutConfig().getCropRect(), primarySurfaceEdge.hasCameraTransform() ? primaryCameraInternal : null, output.getKey().getPrimaryOutConfig().getRotationDegrees(), output.getKey().getPrimaryOutConfig().isMirroring());
        SurfaceOutput.CameraInputInfo secondaryCameraInputInfo = SurfaceOutput.CameraInputInfo.of(secondarySurfaceEdge.getStreamSpec().getResolution(), output.getKey().getSecondaryOutConfig().getCropRect(), secondarySurfaceEdge.hasCameraTransform() ? secondaryCameraInternal : null, output.getKey().getSecondaryOutConfig().getRotationDegrees(), output.getKey().getSecondaryOutConfig().isMirroring());
        ListenableFuture<SurfaceOutput> future = outputEdge.createSurfaceOutputFuture(output.getKey().getPrimaryOutConfig().getFormat(), primaryCameraInputInfo, secondaryCameraInputInfo);
        Futures.addCallback(future, new FutureCallback<SurfaceOutput>() { // da classe: androidx.camera.core.processing.concurrent.DualSurfaceProcessorNode.1
            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onSuccess(SurfaceOutput output2) {
                Preconditions.checkNotNull(output2);
                try {
                    DualSurfaceProcessorNode.this.mSurfaceProcessor.onOutputSurface(output2);
                } catch (ProcessingException e) {
                    Logger.e(DualSurfaceProcessorNode.TAG, "Failed to send SurfaceOutput to SurfaceProcessor.", e);
                }
            }

            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onFailure(Throwable t) {
                if (outputEdge.getTargets() == 2 && (t instanceof CancellationException)) {
                    Logger.d(DualSurfaceProcessorNode.TAG, "Downstream VideoCapture failed to provide Surface.");
                } else {
                    Logger.w(DualSurfaceProcessorNode.TAG, "Downstream node failed to provide Surface. Target: " + TargetUtils.getHumanReadableName(outputEdge.getTargets()), t);
                }
            }
        }, CameraXExecutors.mainThreadExecutor());
    }

    @Override // androidx.camera.core.processing.Node
    public void release() {
        this.mSurfaceProcessor.release();
        Threads.runOnMain(new Runnable() { // da classe: androidx.camera.core.processing.concurrent.DualSurfaceProcessorNode$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                DualSurfaceProcessorNode.this.m234x5a17381c();
            }
        });
    }

    /* renomeado de: lambda$release$1$androidx-camera-core-processing-concurrent-DualSurfaceProcessorNode, motivo: nome Java inválido */
    /* sintético */ void m234x5a17381c() {
        if (this.mOutput != null) {
            for (SurfaceEdge surface : this.mOutput.values()) {
                surface.close();
            }
        }
    }

    public static abstract class In {
        public abstract List<DualOutConfig> getOutConfigs();

        public abstract SurfaceEdge getPrimarySurfaceEdge();

        public abstract SurfaceEdge getSecondarySurfaceEdge();

        public static In of(SurfaceEdge primaryEdge, SurfaceEdge secondaryEdge, List<DualOutConfig> configs) {
            return new AutoValue_DualSurfaceProcessorNode_In(primaryEdge, secondaryEdge, configs);
        }
    }
}
