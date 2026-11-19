package androidx.camera.core.processing.concurrent;

import android.graphics.SurfaceTexture;
import android.opengl.EGL14;
import android.opengl.EGLExt;
import android.opengl.GLES20;
import android.opengl.GLES30;
import android.opengl.Matrix;
import android.util.Size;
import android.view.Surface;
import androidx.camera.core.CompositionSettings;
import androidx.camera.core.DynamicRange;
import androidx.camera.core.Logger;
import androidx.camera.core.SurfaceOutput;
import androidx.camera.core.processing.OpenGlRenderer;
import androidx.camera.core.processing.ShaderProvider;
import androidx.camera.core.processing.util.GLUtils;
import androidx.camera.core.processing.util.GraphicDeviceInfo;
import androidx.camera.core.processing.util.OutputSurface;
import androidx.core.util.Preconditions;
import java.util.Map;

/* carregado de: classes.dex */
public final class DualOpenGlRenderer extends OpenGlRenderer {
    private static final String TAG = "DualOpenGlRenderer";
    private final CompositionSettings mPrimaryCompositionSettings;
    private final CompositionSettings mSecondaryCompositionSettings;
    private int mPrimaryExternalTextureId = -1;
    private int mSecondaryExternalTextureId = -1;

    public DualOpenGlRenderer(CompositionSettings primaryCompositionSettings, CompositionSettings secondaryCompositionSettings) {
        this.mPrimaryCompositionSettings = primaryCompositionSettings;
        this.mSecondaryCompositionSettings = secondaryCompositionSettings;
    }

    @Override // androidx.camera.core.processing.OpenGlRenderer
    public GraphicDeviceInfo init(DynamicRange dynamicRange, Map<GLUtils.InputFormat, ShaderProvider> shaderProviderOverrides) {
        GraphicDeviceInfo graphicDeviceInfo = super.init(dynamicRange, shaderProviderOverrides);
        this.mPrimaryExternalTextureId = GLUtils.createTexture();
        this.mSecondaryExternalTextureId = GLUtils.createTexture();
        return graphicDeviceInfo;
    }

    @Override // androidx.camera.core.processing.OpenGlRenderer
    public void release() {
        super.release();
        this.mPrimaryExternalTextureId = -1;
        this.mSecondaryExternalTextureId = -1;
    }

    public int getTextureName(boolean isPrimary) {
        GLUtils.checkInitializedOrThrow(this.mInitialized, true);
        GLUtils.checkGlThreadOrThrow(this.mGlThread);
        return isPrimary ? this.mPrimaryExternalTextureId : this.mSecondaryExternalTextureId;
    }

    public void render(long timestampNs, Surface surface, SurfaceOutput surfaceOutput, SurfaceTexture primarySurfaceTexture, SurfaceTexture secondarySurfaceTexture) {
        OutputSurface outputSurface;
        GLUtils.checkInitializedOrThrow(this.mInitialized, true);
        GLUtils.checkGlThreadOrThrow(this.mGlThread);
        OutputSurface outputSurface2 = getOutSurfaceOrThrow(surface);
        if (outputSurface2 != GLUtils.NO_OUTPUT_SURFACE) {
            outputSurface = outputSurface2;
        } else {
            OutputSurface outputSurface3 = createOutputSurfaceInternal(surface);
            if (outputSurface3 == null) {
                return;
            }
            this.mOutputSurfaceMap.put(surface, outputSurface3);
            outputSurface = outputSurface3;
        }
        if (surface != this.mCurrentSurface) {
            makeCurrent(outputSurface.getEglSurface());
            this.mCurrentSurface = surface;
        }
        GLES30.glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
        GLES30.glClear(16384);
        renderInternal(outputSurface, surfaceOutput, primarySurfaceTexture, this.mPrimaryCompositionSettings, this.mPrimaryExternalTextureId, true);
        renderInternal(outputSurface, surfaceOutput, secondarySurfaceTexture, this.mSecondaryCompositionSettings, this.mSecondaryExternalTextureId, false);
        EGLExt.eglPresentationTimeANDROID(this.mEglDisplay, outputSurface.getEglSurface(), timestampNs);
        if (!EGL14.eglSwapBuffers(this.mEglDisplay, outputSurface.getEglSurface())) {
            Logger.w(TAG, "Failed to swap buffers with EGL error: 0x" + Integer.toHexString(EGL14.eglGetError()));
            removeOutputSurfaceInternal(surface, false);
        }
    }

    private void renderInternal(OutputSurface outputSurface, SurfaceOutput surfaceOutput, SurfaceTexture surfaceTexture, CompositionSettings compositionSettings, int externalTextureId, boolean isPrimary) {
        useAndConfigureProgramWithTexture(externalTextureId);
        GLES20.glViewport(0, 0, outputSurface.getWidth(), outputSurface.getHeight());
        GLES20.glScissor(0, 0, outputSurface.getWidth(), outputSurface.getHeight());
        float[] textureTransform = new float[16];
        surfaceTexture.getTransformMatrix(textureTransform);
        float[] surfaceOutputMatrix = new float[16];
        surfaceOutput.updateTransformMatrix(surfaceOutputMatrix, textureTransform, isPrimary);
        GLUtils.Program2D currentProgram = (GLUtils.Program2D) Preconditions.checkNotNull(this.mCurrentProgram);
        if (currentProgram instanceof GLUtils.SamplerShaderProgram) {
            ((GLUtils.SamplerShaderProgram) currentProgram).updateTextureMatrix(surfaceOutputMatrix);
        }
        float[] transTransform = getTransformMatrix(new Size((int) (outputSurface.getWidth() * compositionSettings.getScale().first.floatValue()), (int) (outputSurface.getHeight() * compositionSettings.getScale().second.floatValue())), new Size(outputSurface.getWidth(), outputSurface.getHeight()), compositionSettings);
        currentProgram.updateTransformMatrix(transTransform);
        currentProgram.updateAlpha(compositionSettings.getAlpha());
        GLES20.glEnable(3042);
        GLES20.glBlendFuncSeparate(770, 771, 1, 771);
        GLES20.glDrawArrays(5, 0, 4);
        GLUtils.checkGlErrorOrThrow("glDrawArrays");
        GLES20.glDisable(3042);
    }

    private static float[] getTransformMatrix(Size overlaySize, Size backgroundSize, CompositionSettings compositionSettings) {
        float[] aspectRatioMatrix = GLUtils.create4x4IdentityMatrix();
        float[] overlayFrameAnchorMatrix = GLUtils.create4x4IdentityMatrix();
        float[] transformationMatrix = GLUtils.create4x4IdentityMatrix();
        Matrix.scaleM(aspectRatioMatrix, 0, overlaySize.getWidth() / backgroundSize.getWidth(), overlaySize.getHeight() / backgroundSize.getHeight(), 1.0f);
        if (compositionSettings.getScale().first.floatValue() != 0.0f || compositionSettings.getScale().second.floatValue() != 0.0f) {
            Matrix.translateM(overlayFrameAnchorMatrix, 0, compositionSettings.getOffset().first.floatValue() / compositionSettings.getScale().first.floatValue(), compositionSettings.getOffset().second.floatValue() / compositionSettings.getScale().second.floatValue(), 0.0f);
        }
        Matrix.multiplyMM(transformationMatrix, 0, aspectRatioMatrix, 0, overlayFrameAnchorMatrix, 0);
        return transformationMatrix;
    }
}
