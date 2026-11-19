package androidx.camera.core.processing;

import android.graphics.Bitmap;
import android.opengl.EGL14;
import android.opengl.EGLConfig;
import android.opengl.EGLContext;
import android.opengl.EGLDisplay;
import android.opengl.EGLExt;
import android.opengl.EGLSurface;
import android.opengl.GLES20;
import android.util.Log;
import android.util.Size;
import android.view.Surface;
import androidx.camera.core.DynamicRange;
import androidx.camera.core.ImageProcessingUtil;
import androidx.camera.core.Logger;
import androidx.camera.core.processing.util.GLUtils;
import androidx.camera.core.processing.util.GraphicDeviceInfo;
import androidx.camera.core.processing.util.OutputSurface;
import androidx.core.util.Pair;
import androidx.core.util.Preconditions;
import j$.util.Objects;
import java.nio.ByteBuffer;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;

/* carregado de: classes.dex */
public class OpenGlRenderer {
    private static final String TAG = "OpenGlRenderer";
    protected Surface mCurrentSurface;
    protected EGLConfig mEglConfig;
    protected Thread mGlThread;
    protected final AtomicBoolean mInitialized = new AtomicBoolean(false);
    protected final Map<Surface, OutputSurface> mOutputSurfaceMap = new HashMap();
    protected EGLDisplay mEglDisplay = EGL14.EGL_NO_DISPLAY;
    protected EGLContext mEglContext = EGL14.EGL_NO_CONTEXT;
    protected int[] mSurfaceAttrib = GLUtils.EMPTY_ATTRIBS;
    protected EGLSurface mTempSurface = EGL14.EGL_NO_SURFACE;
    protected Map<GLUtils.InputFormat, GLUtils.Program2D> mProgramHandles = Collections.emptyMap();
    protected GLUtils.Program2D mCurrentProgram = null;
    protected GLUtils.InputFormat mCurrentInputformat = GLUtils.InputFormat.UNKNOWN;
    private int mExternalTextureId = -1;

    public GraphicDeviceInfo init(DynamicRange dynamicRange) {
        return init(dynamicRange, Collections.emptyMap());
    }

    public GraphicDeviceInfo init(DynamicRange dynamicRange, Map<GLUtils.InputFormat, ShaderProvider> shaderOverrides) {
        GLUtils.checkInitializedOrThrow(this.mInitialized, false);
        GraphicDeviceInfo.Builder infoBuilder = GraphicDeviceInfo.builder();
        try {
            if (dynamicRange.is10BitHdr()) {
                Pair<String, String> extensions = getExtensionsBeforeInitialized(dynamicRange);
                String glExtensions = (String) Preconditions.checkNotNull(extensions.first);
                String eglExtensions = (String) Preconditions.checkNotNull(extensions.second);
                if (!glExtensions.contains("GL_EXT_YUV_target")) {
                    Logger.w(TAG, "Device does not support GL_EXT_YUV_target. Fallback to SDR.");
                    dynamicRange = DynamicRange.SDR;
                }
                this.mSurfaceAttrib = GLUtils.chooseSurfaceAttrib(eglExtensions, dynamicRange);
                infoBuilder.setGlExtensions(glExtensions);
                infoBuilder.setEglExtensions(eglExtensions);
            }
            createEglContext(dynamicRange, infoBuilder);
            createTempSurface();
            makeCurrent(this.mTempSurface);
            infoBuilder.setGlVersion(GLUtils.getGlVersionNumber());
            this.mProgramHandles = GLUtils.createPrograms(dynamicRange, shaderOverrides);
            this.mExternalTextureId = GLUtils.createTexture();
            useAndConfigureProgramWithTexture(this.mExternalTextureId);
            this.mGlThread = Thread.currentThread();
            this.mInitialized.set(true);
            return infoBuilder.build();
        } catch (IllegalArgumentException | IllegalStateException e) {
            releaseInternal();
            throw e;
        }
    }

    public void release() {
        if (!this.mInitialized.getAndSet(false)) {
            return;
        }
        GLUtils.checkGlThreadOrThrow(this.mGlThread);
        releaseInternal();
    }

    public void registerOutputSurface(Surface surface) {
        GLUtils.checkInitializedOrThrow(this.mInitialized, true);
        GLUtils.checkGlThreadOrThrow(this.mGlThread);
        if (!this.mOutputSurfaceMap.containsKey(surface)) {
            this.mOutputSurfaceMap.put(surface, GLUtils.NO_OUTPUT_SURFACE);
        }
    }

    public void unregisterOutputSurface(Surface surface) {
        GLUtils.checkInitializedOrThrow(this.mInitialized, true);
        GLUtils.checkGlThreadOrThrow(this.mGlThread);
        removeOutputSurfaceInternal(surface, true);
    }

    public int getTextureName() {
        GLUtils.checkInitializedOrThrow(this.mInitialized, true);
        GLUtils.checkGlThreadOrThrow(this.mGlThread);
        return this.mExternalTextureId;
    }

    public void setInputFormat(GLUtils.InputFormat inputFormat) {
        GLUtils.checkInitializedOrThrow(this.mInitialized, true);
        GLUtils.checkGlThreadOrThrow(this.mGlThread);
        if (this.mCurrentInputformat != inputFormat) {
            this.mCurrentInputformat = inputFormat;
            useAndConfigureProgramWithTexture(this.mExternalTextureId);
        }
    }

    private void activateExternalTexture(int externalTextureId) {
        GLES20.glActiveTexture(33984);
        GLUtils.checkGlErrorOrThrow("glActiveTexture");
        GLES20.glBindTexture(36197, externalTextureId);
        GLUtils.checkGlErrorOrThrow("glBindTexture");
    }

    public void render(long timestampNs, float[] textureTransform, Surface surface) {
        GLUtils.checkInitializedOrThrow(this.mInitialized, true);
        GLUtils.checkGlThreadOrThrow(this.mGlThread);
        OutputSurface outputSurface = getOutSurfaceOrThrow(surface);
        if (outputSurface == GLUtils.NO_OUTPUT_SURFACE) {
            outputSurface = createOutputSurfaceInternal(surface);
            if (outputSurface == null) {
                return;
            } else {
                this.mOutputSurfaceMap.put(surface, outputSurface);
            }
        }
        if (surface != this.mCurrentSurface) {
            makeCurrent(outputSurface.getEglSurface());
            this.mCurrentSurface = surface;
            GLES20.glViewport(0, 0, outputSurface.getWidth(), outputSurface.getHeight());
            GLES20.glScissor(0, 0, outputSurface.getWidth(), outputSurface.getHeight());
        }
        GLUtils.Program2D program = (GLUtils.Program2D) Preconditions.checkNotNull(this.mCurrentProgram);
        if (program instanceof GLUtils.SamplerShaderProgram) {
            ((GLUtils.SamplerShaderProgram) program).updateTextureMatrix(textureTransform);
        }
        GLES20.glDrawArrays(5, 0, 4);
        GLUtils.checkGlErrorOrThrow("glDrawArrays");
        EGLExt.eglPresentationTimeANDROID(this.mEglDisplay, outputSurface.getEglSurface(), timestampNs);
        if (!EGL14.eglSwapBuffers(this.mEglDisplay, outputSurface.getEglSurface())) {
            Logger.w(TAG, "Failed to swap buffers with EGL error: 0x" + Integer.toHexString(EGL14.eglGetError()));
            removeOutputSurfaceInternal(surface, false);
        }
    }

    public Bitmap snapshot(Size size, float[] textureTransform) {
        ByteBuffer byteBuffer = ByteBuffer.allocateDirect(size.getWidth() * size.getHeight() * 4);
        snapshot(byteBuffer, size, textureTransform);
        Bitmap bitmap = Bitmap.createBitmap(size.getWidth(), size.getHeight(), Bitmap.Config.ARGB_8888);
        byteBuffer.rewind();
        ImageProcessingUtil.copyByteBufferToBitmap(bitmap, byteBuffer, size.getWidth() * 4);
        return bitmap;
    }

    private void snapshot(ByteBuffer byteBuffer, Size size, float[] textureTransform) {
        Preconditions.checkArgument(byteBuffer.capacity() == (size.getWidth() * size.getHeight()) * 4, "ByteBuffer capacity is not equal to width * height * 4.");
        Preconditions.checkArgument(byteBuffer.isDirect(), "ByteBuffer is not direct.");
        int texture = GLUtils.generateTexture();
        GLES20.glActiveTexture(33985);
        GLUtils.checkGlErrorOrThrow("glActiveTexture");
        GLES20.glBindTexture(3553, texture);
        GLUtils.checkGlErrorOrThrow("glBindTexture");
        GLES20.glTexImage2D(3553, 0, 6407, size.getWidth(), size.getHeight(), 0, 6407, 5121, null);
        GLUtils.checkGlErrorOrThrow("glTexImage2D");
        GLES20.glTexParameteri(3553, 10240, 9729);
        GLES20.glTexParameteri(3553, 10241, 9729);
        int fbo = GLUtils.generateFbo();
        GLES20.glBindFramebuffer(36160, fbo);
        GLUtils.checkGlErrorOrThrow("glBindFramebuffer");
        GLES20.glFramebufferTexture2D(36160, 36064, 3553, texture, 0);
        GLUtils.checkGlErrorOrThrow("glFramebufferTexture2D");
        GLES20.glActiveTexture(33984);
        GLUtils.checkGlErrorOrThrow("glActiveTexture");
        GLES20.glBindTexture(36197, this.mExternalTextureId);
        GLUtils.checkGlErrorOrThrow("glBindTexture");
        this.mCurrentSurface = null;
        GLES20.glViewport(0, 0, size.getWidth(), size.getHeight());
        GLES20.glScissor(0, 0, size.getWidth(), size.getHeight());
        GLUtils.Program2D program = (GLUtils.Program2D) Preconditions.checkNotNull(this.mCurrentProgram);
        if (program instanceof GLUtils.SamplerShaderProgram) {
            ((GLUtils.SamplerShaderProgram) program).updateTextureMatrix(textureTransform);
        }
        GLES20.glDrawArrays(5, 0, 4);
        GLUtils.checkGlErrorOrThrow("glDrawArrays");
        GLES20.glReadPixels(0, 0, size.getWidth(), size.getHeight(), 6408, 5121, byteBuffer);
        GLUtils.checkGlErrorOrThrow("glReadPixels");
        GLES20.glBindFramebuffer(36160, 0);
        GLUtils.deleteTexture(texture);
        GLUtils.deleteFbo(fbo);
        activateExternalTexture(this.mExternalTextureId);
    }

    private Pair<String, String> getExtensionsBeforeInitialized(DynamicRange dynamicRangeToInitialize) {
        GLUtils.checkInitializedOrThrow(this.mInitialized, false);
        try {
            createEglContext(dynamicRangeToInitialize, null);
            createTempSurface();
            makeCurrent(this.mTempSurface);
            String glExtensions = GLES20.glGetString(7939);
            String eglExtensions = EGL14.eglQueryString(this.mEglDisplay, 12373);
            return new Pair<>(glExtensions != null ? glExtensions : "", eglExtensions != null ? eglExtensions : "");
        } catch (IllegalStateException e) {
            Logger.w(TAG, "Failed to get GL or EGL extensions: " + e.getMessage(), e);
            return new Pair<>("", "");
        } finally {
            releaseInternal();
        }
    }

    private void createEglContext(DynamicRange dynamicRange, GraphicDeviceInfo.Builder infoBuilder) {
        this.mEglDisplay = EGL14.eglGetDisplay(0);
        if (Objects.equals(this.mEglDisplay, EGL14.EGL_NO_DISPLAY)) {
            throw new IllegalStateException("Unable to get EGL14 display");
        }
        int[] version = new int[2];
        if (!EGL14.eglInitialize(this.mEglDisplay, version, 0, version, 1)) {
            this.mEglDisplay = EGL14.EGL_NO_DISPLAY;
            throw new IllegalStateException("Unable to initialize EGL14");
        }
        if (infoBuilder != null) {
            infoBuilder.setEglVersion(version[0] + "." + version[1]);
        }
        int rgbBits = dynamicRange.is10BitHdr() ? 10 : 8;
        int alphaBits = dynamicRange.is10BitHdr() ? 2 : 8;
        int renderType = dynamicRange.is10BitHdr() ? 64 : 4;
        int recordableAndroid = dynamicRange.is10BitHdr() ? -1 : 1;
        int[] attribToChooseConfig = {12324, rgbBits, 12323, rgbBits, 12322, rgbBits, 12321, alphaBits, 12325, 0, 12326, 0, 12352, renderType, 12610, recordableAndroid, 12339, 5, 12344};
        EGLConfig[] configs = new EGLConfig[1];
        int[] numConfigs = new int[1];
        if (!EGL14.eglChooseConfig(this.mEglDisplay, attribToChooseConfig, 0, configs, 0, configs.length, numConfigs, 0)) {
            throw new IllegalStateException("Unable to find a suitable EGLConfig");
        }
        EGLConfig config = configs[0];
        int[] attribToCreateContext = {12440, dynamicRange.is10BitHdr() ? 3 : 2, 12344};
        EGLContext context = EGL14.eglCreateContext(this.mEglDisplay, config, EGL14.EGL_NO_CONTEXT, attribToCreateContext, 0);
        GLUtils.checkEglErrorOrThrow("eglCreateContext");
        this.mEglConfig = config;
        this.mEglContext = context;
        int[] values = new int[1];
        EGL14.eglQueryContext(this.mEglDisplay, this.mEglContext, 12440, values, 0);
        Log.d(TAG, "EGLContext created, client version " + values[0]);
    }

    private void createTempSurface() {
        this.mTempSurface = GLUtils.createPBufferSurface(this.mEglDisplay, (EGLConfig) Objects.requireNonNull(this.mEglConfig), 1, 1);
    }

    protected void makeCurrent(EGLSurface eglSurface) {
        Preconditions.checkNotNull(this.mEglDisplay);
        Preconditions.checkNotNull(this.mEglContext);
        if (!EGL14.eglMakeCurrent(this.mEglDisplay, eglSurface, eglSurface, this.mEglContext)) {
            throw new IllegalStateException("eglMakeCurrent failed");
        }
    }

    protected void useAndConfigureProgramWithTexture(int textureId) {
        GLUtils.Program2D program = this.mProgramHandles.get(this.mCurrentInputformat);
        if (program == null) {
            throw new IllegalStateException("Unable to configure program for input format: " + this.mCurrentInputformat);
        }
        if (this.mCurrentProgram != program) {
            this.mCurrentProgram = program;
            this.mCurrentProgram.use();
            Log.d(TAG, "Using program for input format " + this.mCurrentInputformat + ": " + this.mCurrentProgram);
        }
        activateExternalTexture(textureId);
    }

    private void releaseInternal() {
        for (GLUtils.Program2D program : this.mProgramHandles.values()) {
            program.delete();
        }
        this.mProgramHandles = Collections.emptyMap();
        this.mCurrentProgram = null;
        if (!Objects.equals(this.mEglDisplay, EGL14.EGL_NO_DISPLAY)) {
            EGL14.eglMakeCurrent(this.mEglDisplay, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_CONTEXT);
            for (OutputSurface outputSurface : this.mOutputSurfaceMap.values()) {
                if (!Objects.equals(outputSurface.getEglSurface(), EGL14.EGL_NO_SURFACE) && !EGL14.eglDestroySurface(this.mEglDisplay, outputSurface.getEglSurface())) {
                    GLUtils.checkEglErrorOrLog("eglDestroySurface");
                }
            }
            this.mOutputSurfaceMap.clear();
            if (!Objects.equals(this.mTempSurface, EGL14.EGL_NO_SURFACE)) {
                EGL14.eglDestroySurface(this.mEglDisplay, this.mTempSurface);
                this.mTempSurface = EGL14.EGL_NO_SURFACE;
            }
            if (!Objects.equals(this.mEglContext, EGL14.EGL_NO_CONTEXT)) {
                EGL14.eglDestroyContext(this.mEglDisplay, this.mEglContext);
                this.mEglContext = EGL14.EGL_NO_CONTEXT;
            }
            EGL14.eglReleaseThread();
            EGL14.eglTerminate(this.mEglDisplay);
            this.mEglDisplay = EGL14.EGL_NO_DISPLAY;
        }
        this.mEglConfig = null;
        this.mExternalTextureId = -1;
        this.mCurrentInputformat = GLUtils.InputFormat.UNKNOWN;
        this.mCurrentSurface = null;
        this.mGlThread = null;
    }

    protected OutputSurface getOutSurfaceOrThrow(Surface surface) {
        Preconditions.checkState(this.mOutputSurfaceMap.containsKey(surface), "The surface is not registered.");
        return (OutputSurface) Objects.requireNonNull(this.mOutputSurfaceMap.get(surface));
    }

    protected OutputSurface createOutputSurfaceInternal(Surface surface) {
        try {
            EGLSurface eglSurface = GLUtils.createWindowSurface(this.mEglDisplay, (EGLConfig) Objects.requireNonNull(this.mEglConfig), surface, this.mSurfaceAttrib);
            Size size = GLUtils.getSurfaceSize(this.mEglDisplay, eglSurface);
            return OutputSurface.of(eglSurface, size.getWidth(), size.getHeight());
        } catch (IllegalArgumentException | IllegalStateException e) {
            Logger.w(TAG, "Failed to create EGL surface: " + e.getMessage(), e);
            return null;
        }
    }

    protected void removeOutputSurfaceInternal(Surface surface, boolean unregister) {
        OutputSurface removedOutputSurface;
        if (this.mCurrentSurface == surface) {
            this.mCurrentSurface = null;
            makeCurrent(this.mTempSurface);
        }
        if (unregister) {
            removedOutputSurface = this.mOutputSurfaceMap.remove(surface);
        } else {
            removedOutputSurface = this.mOutputSurfaceMap.put(surface, GLUtils.NO_OUTPUT_SURFACE);
        }
        if (removedOutputSurface != null && removedOutputSurface != GLUtils.NO_OUTPUT_SURFACE) {
            try {
                EGL14.eglDestroySurface(this.mEglDisplay, removedOutputSurface.getEglSurface());
            } catch (RuntimeException e) {
                Logger.w(TAG, "Failed to destroy EGL surface: " + e.getMessage(), e);
            }
        }
    }
}
