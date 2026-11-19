package androidx.camera.core.processing.util;

import android.opengl.EGL14;
import android.opengl.EGLConfig;
import android.opengl.EGLDisplay;
import android.opengl.EGLSurface;
import android.opengl.GLES20;
import android.opengl.Matrix;
import android.util.Log;
import android.util.Size;
import android.view.Surface;
import androidx.camera.core.DynamicRange;
import androidx.camera.core.Logger;
import androidx.camera.core.processing.ShaderProvider;
import androidx.core.util.Preconditions;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* carregado de: classes.dex */
public final class GLUtils {
    public static final String BLANK_FRAGMENT_SHADER = "precision mediump float;\nuniform float uAlphaScale;\nvoid main() {\n    gl_FragColor = vec4(0.0, 0.0, 0.0, uAlphaScale);\n}\n";
    public static final String BLANK_VERTEX_SHADER = "uniform mat4 uTransMatrix;\nattribute vec4 aPosition;\nvoid main() {\n    gl_Position = uTransMatrix * aPosition;\n}\n";
    public static final int PIXEL_STRIDE = 4;
    public static final int SIZEOF_FLOAT = 4;
    public static final String TAG = "GLUtils";
    public static final String VAR_TEXTURE = "sTexture";
    public static final String VERSION_UNKNOWN = "0.0";
    public static final int[] EMPTY_ATTRIBS = {12344};
    public static final int EGL_GL_COLORSPACE_KHR = 12445;
    public static final int EGL_GL_COLORSPACE_BT2020_HLG_EXT = 13632;
    public static final int[] HLG_SURFACE_ATTRIBS = {EGL_GL_COLORSPACE_KHR, EGL_GL_COLORSPACE_BT2020_HLG_EXT, 12344};
    public static final String VAR_TEXTURE_COORD = "vTextureCoord";
    public static final String DEFAULT_VERTEX_SHADER = String.format(Locale.US, "uniform mat4 uTexMatrix;\nuniform mat4 uTransMatrix;\nattribute vec4 aPosition;\nattribute vec4 aTextureCoord;\nvarying vec2 %s;\nvoid main() {\n    gl_Position = uTransMatrix * aPosition;\n    %s = (uTexMatrix * aTextureCoord).xy;\n}\n", VAR_TEXTURE_COORD, VAR_TEXTURE_COORD);
    public static final String HDR_VERTEX_SHADER = String.format(Locale.US, "#version 300 es\nin vec4 aPosition;\nin vec4 aTextureCoord;\nuniform mat4 uTexMatrix;\nuniform mat4 uTransMatrix;\nout vec2 %s;\nvoid main() {\n  gl_Position = uTransMatrix * aPosition;\n  %s = (uTexMatrix * aTextureCoord).xy;\n}\n", VAR_TEXTURE_COORD, VAR_TEXTURE_COORD);
    private static final ShaderProvider SHADER_PROVIDER_DEFAULT = new ShaderProvider() { // da classe: androidx.camera.core.processing.util.GLUtils.1
        @Override // androidx.camera.core.processing.ShaderProvider
        public String createFragmentShader(String samplerVarName, String fragCoordsVarName) {
            return String.format(Locale.US, "#extension GL_OES_EGL_image_external : require\nprecision mediump float;\nvarying vec2 %s;\nuniform samplerExternalOES %s;\nuniform float uAlphaScale;\nvoid main() {\n    vec4 src = texture2D(%s, %s);\n    gl_FragColor = vec4(src.rgb, src.a * uAlphaScale);\n}\n", fragCoordsVarName, samplerVarName, samplerVarName, fragCoordsVarName);
        }
    };
    private static final ShaderProvider SHADER_PROVIDER_HDR_DEFAULT = new ShaderProvider() { // da classe: androidx.camera.core.processing.util.GLUtils.2
        @Override // androidx.camera.core.processing.ShaderProvider
        public String createFragmentShader(String samplerVarName, String fragCoordsVarName) {
            return String.format(Locale.US, "#version 300 es\n#extension GL_OES_EGL_image_external_essl3 : require\nprecision mediump float;\nuniform samplerExternalOES %s;\nuniform float uAlphaScale;\nin vec2 %s;\nout vec4 outColor;\n\nvoid main() {\n  vec4 src = texture(%s, %s);\n  outColor = vec4(src.rgb, src.a * uAlphaScale);\n}", samplerVarName, fragCoordsVarName, samplerVarName, fragCoordsVarName);
        }
    };
    private static final ShaderProvider SHADER_PROVIDER_HDR_YUV = new ShaderProvider() { // da classe: androidx.camera.core.processing.util.GLUtils.3
        @Override // androidx.camera.core.processing.ShaderProvider
        public String createFragmentShader(String samplerVarName, String fragCoordsVarName) {
            return String.format(Locale.US, "#version 300 es\n#extension GL_EXT_YUV_target : require\nprecision mediump float;\nuniform __samplerExternal2DY2YEXT %s;\nuniform float uAlphaScale;\nin vec2 %s;\nout vec4 outColor;\n\nvec3 yuvToRgb(vec3 yuv) {\n  const vec3 yuvOffset = vec3(0.0625, 0.5, 0.5);\n  const mat3 yuvToRgbColorMat = mat3(\n    1.1689f, 1.1689f, 1.1689f,\n    0.0000f, -0.1881f, 2.1502f,\n    1.6853f, -0.6530f, 0.0000f\n  );\n  return clamp(yuvToRgbColorMat * (yuv - yuvOffset), 0.0, 1.0);\n}\n\nvoid main() {\n  vec3 srcYuv = texture(%s, %s).xyz;\n  vec3 srcRgb = yuvToRgb(srcYuv);\n  outColor = vec4(srcRgb, uAlphaScale);\n}", samplerVarName, fragCoordsVarName, samplerVarName, fragCoordsVarName);
        }
    };
    public static final float[] VERTEX_COORDS = {-1.0f, -1.0f, 1.0f, -1.0f, -1.0f, 1.0f, 1.0f, 1.0f};
    public static final FloatBuffer VERTEX_BUF = createFloatBuffer(VERTEX_COORDS);
    public static final float[] TEX_COORDS = {0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 1.0f, 1.0f, 1.0f};
    public static final FloatBuffer TEX_BUF = createFloatBuffer(TEX_COORDS);
    public static final OutputSurface NO_OUTPUT_SURFACE = OutputSurface.of(EGL14.EGL_NO_SURFACE, 0, 0);

    public enum InputFormat {
        UNKNOWN,
        DEFAULT,
        YUV
    }

    private GLUtils() {
    }

    public static abstract class Program2D {
        protected int mProgramHandle;
        protected int mTransMatrixLoc = -1;
        protected int mAlphaScaleLoc = -1;
        protected int mPositionLoc = -1;

        protected Program2D(String vertexShaderSource, String fragmentShaderSource) {
            try {
                int vertexShader = GLUtils.loadShader(35633, vertexShaderSource);
                int fragmentShader = GLUtils.loadShader(35632, fragmentShaderSource);
                int program = GLES20.glCreateProgram();
                GLUtils.checkGlErrorOrThrow("glCreateProgram");
                GLES20.glAttachShader(program, vertexShader);
                GLUtils.checkGlErrorOrThrow("glAttachShader");
                GLES20.glAttachShader(program, fragmentShader);
                GLUtils.checkGlErrorOrThrow("glAttachShader");
                GLES20.glLinkProgram(program);
                int[] linkStatus = new int[1];
                GLES20.glGetProgramiv(program, 35714, linkStatus, 0);
                if (linkStatus[0] != 1) {
                    throw new IllegalStateException("Could not link program: " + GLES20.glGetProgramInfoLog(program));
                }
                this.mProgramHandle = program;
                loadLocations();
            } catch (IllegalArgumentException | IllegalStateException e) {
                if (-1 != -1) {
                    GLES20.glDeleteShader(-1);
                }
                if (-1 != -1) {
                    GLES20.glDeleteShader(-1);
                }
                if (-1 != -1) {
                    GLES20.glDeleteProgram(-1);
                }
                throw e;
            }
        }

        public void use() {
            GLES20.glUseProgram(this.mProgramHandle);
            GLUtils.checkGlErrorOrThrow("glUseProgram");
            GLES20.glEnableVertexAttribArray(this.mPositionLoc);
            GLUtils.checkGlErrorOrThrow("glEnableVertexAttribArray");
            GLES20.glVertexAttribPointer(this.mPositionLoc, 2, 5126, false, 0, (Buffer) GLUtils.VERTEX_BUF);
            GLUtils.checkGlErrorOrThrow("glVertexAttribPointer");
            updateTransformMatrix(GLUtils.create4x4IdentityMatrix());
            updateAlpha(1.0f);
        }

        public void updateTransformMatrix(float[] transformMat) {
            GLES20.glUniformMatrix4fv(this.mTransMatrixLoc, 1, false, transformMat, 0);
            GLUtils.checkGlErrorOrThrow("glUniformMatrix4fv");
        }

        public void updateAlpha(float alpha) {
            GLES20.glUniform1f(this.mAlphaScaleLoc, alpha);
            GLUtils.checkGlErrorOrThrow("glUniform1f");
        }

        public void delete() {
            GLES20.glDeleteProgram(this.mProgramHandle);
        }

        /* JADX INFO: modificadores de acesso alterados de: private */
        public void loadLocations() {
            this.mPositionLoc = GLES20.glGetAttribLocation(this.mProgramHandle, "aPosition");
            GLUtils.checkLocationOrThrow(this.mPositionLoc, "aPosition");
            this.mTransMatrixLoc = GLES20.glGetUniformLocation(this.mProgramHandle, "uTransMatrix");
            GLUtils.checkLocationOrThrow(this.mTransMatrixLoc, "uTransMatrix");
            this.mAlphaScaleLoc = GLES20.glGetUniformLocation(this.mProgramHandle, "uAlphaScale");
            GLUtils.checkLocationOrThrow(this.mAlphaScaleLoc, "uAlphaScale");
        }
    }

    public static class SamplerShaderProgram extends Program2D {
        private int mSamplerLoc;
        private int mTexCoordLoc;
        private int mTexMatrixLoc;

        public SamplerShaderProgram(DynamicRange dynamicRange, InputFormat inputFormat) {
            this(dynamicRange, resolveDefaultShaderProvider(dynamicRange, inputFormat));
        }

        public SamplerShaderProgram(DynamicRange dynamicRange, ShaderProvider shaderProvider) {
            super(dynamicRange.is10BitHdr() ? GLUtils.HDR_VERTEX_SHADER : GLUtils.DEFAULT_VERTEX_SHADER, GLUtils.getFragmentShaderSource(shaderProvider));
            this.mSamplerLoc = -1;
            this.mTexMatrixLoc = -1;
            this.mTexCoordLoc = -1;
            loadLocations();
        }

        @Override // androidx.camera.core.processing.util.GLUtils.Program2D
        public void use() {
            super.use();
            GLES20.glUniform1i(this.mSamplerLoc, 0);
            GLES20.glEnableVertexAttribArray(this.mTexCoordLoc);
            GLUtils.checkGlErrorOrThrow("glEnableVertexAttribArray");
            GLES20.glVertexAttribPointer(this.mTexCoordLoc, 2, 5126, false, 0, (Buffer) GLUtils.TEX_BUF);
            GLUtils.checkGlErrorOrThrow("glVertexAttribPointer");
        }

        public void updateTextureMatrix(float[] textureMat) {
            GLES20.glUniformMatrix4fv(this.mTexMatrixLoc, 1, false, textureMat, 0);
            GLUtils.checkGlErrorOrThrow("glUniformMatrix4fv");
        }

        private void loadLocations() {
            loadLocations();
            this.mSamplerLoc = GLES20.glGetUniformLocation(this.mProgramHandle, GLUtils.VAR_TEXTURE);
            GLUtils.checkLocationOrThrow(this.mSamplerLoc, GLUtils.VAR_TEXTURE);
            this.mTexCoordLoc = GLES20.glGetAttribLocation(this.mProgramHandle, "aTextureCoord");
            GLUtils.checkLocationOrThrow(this.mTexCoordLoc, "aTextureCoord");
            this.mTexMatrixLoc = GLES20.glGetUniformLocation(this.mProgramHandle, "uTexMatrix");
            GLUtils.checkLocationOrThrow(this.mTexMatrixLoc, "uTexMatrix");
        }

        private static ShaderProvider resolveDefaultShaderProvider(DynamicRange dynamicRange, InputFormat inputFormat) {
            if (!dynamicRange.is10BitHdr()) {
                return GLUtils.SHADER_PROVIDER_DEFAULT;
            }
            Preconditions.checkArgument(inputFormat != InputFormat.UNKNOWN, "No default sampler shader available for" + inputFormat);
            return inputFormat == InputFormat.YUV ? GLUtils.SHADER_PROVIDER_HDR_YUV : GLUtils.SHADER_PROVIDER_HDR_DEFAULT;
        }
    }

    public static class BlankShaderProgram extends Program2D {
        public BlankShaderProgram() {
            super(GLUtils.BLANK_VERTEX_SHADER, GLUtils.BLANK_FRAGMENT_SHADER);
        }
    }

    public static EGLSurface createWindowSurface(EGLDisplay eglDisplay, EGLConfig eglConfig, Surface surface, int[] surfaceAttrib) {
        EGLSurface eglSurface = EGL14.eglCreateWindowSurface(eglDisplay, eglConfig, surface, surfaceAttrib, 0);
        checkEglErrorOrThrow("eglCreateWindowSurface");
        if (eglSurface == null) {
            throw new IllegalStateException("surface was null");
        }
        return eglSurface;
    }

    public static int loadShader(int shaderType, String source) {
        int shader = GLES20.glCreateShader(shaderType);
        checkGlErrorOrThrow("glCreateShader type=" + shaderType);
        GLES20.glShaderSource(shader, source);
        GLES20.glCompileShader(shader);
        int[] compiled = new int[1];
        GLES20.glGetShaderiv(shader, 35713, compiled, 0);
        if (compiled[0] == 0) {
            Logger.w(TAG, "Could not compile shader: " + source);
            String shaderLog = GLES20.glGetShaderInfoLog(shader);
            GLES20.glDeleteShader(shader);
            throw new IllegalStateException("Could not compile shader type " + shaderType + ":" + shaderLog);
        }
        return shader;
    }

    public static int querySurface(EGLDisplay eglDisplay, EGLSurface eglSurface, int what) {
        int[] value = new int[1];
        EGL14.eglQuerySurface(eglDisplay, eglSurface, what, value, 0);
        return value[0];
    }

    public static Size getSurfaceSize(EGLDisplay eglDisplay, EGLSurface eglSurface) {
        int width = querySurface(eglDisplay, eglSurface, 12375);
        int height = querySurface(eglDisplay, eglSurface, 12374);
        return new Size(width, height);
    }

    public static FloatBuffer createFloatBuffer(float[] coords) {
        ByteBuffer bb = ByteBuffer.allocateDirect(coords.length * 4);
        bb.order(ByteOrder.nativeOrder());
        FloatBuffer fb = bb.asFloatBuffer();
        fb.put(coords);
        fb.position(0);
        return fb;
    }

    public static EGLSurface createPBufferSurface(EGLDisplay eglDisplay, EGLConfig eglConfig, int width, int height) {
        int[] surfaceAttrib = {12375, width, 12374, height, 12344};
        EGLSurface eglSurface = EGL14.eglCreatePbufferSurface(eglDisplay, eglConfig, surfaceAttrib, 0);
        checkEglErrorOrThrow("eglCreatePbufferSurface");
        if (eglSurface == null) {
            throw new IllegalStateException("surface was null");
        }
        return eglSurface;
    }

    public static Map<InputFormat, Program2D> createPrograms(DynamicRange dynamicRange, Map<InputFormat, ShaderProvider> shaderProviderOverrides) {
        Program2D program;
        HashMap<InputFormat, Program2D> programs = new HashMap<>();
        InputFormat[] values = InputFormat.values();
        int length = values.length;
        for (int i = 0; i < length; i++) {
            InputFormat inputFormat = values[i];
            ShaderProvider shaderProviderOverride = shaderProviderOverrides.get(inputFormat);
            if (shaderProviderOverride != null) {
                program = new SamplerShaderProgram(dynamicRange, shaderProviderOverride);
            } else if (inputFormat == InputFormat.YUV || inputFormat == InputFormat.DEFAULT) {
                program = new SamplerShaderProgram(dynamicRange, inputFormat);
            } else {
                Preconditions.checkState(inputFormat == InputFormat.UNKNOWN, "Unhandled input format: " + inputFormat);
                if (dynamicRange.is10BitHdr()) {
                    program = new BlankShaderProgram();
                } else {
                    ShaderProvider defaultShaderProviderOverride = shaderProviderOverrides.get(InputFormat.DEFAULT);
                    if (defaultShaderProviderOverride != null) {
                        program = new SamplerShaderProgram(dynamicRange, defaultShaderProviderOverride);
                    } else {
                        program = new SamplerShaderProgram(dynamicRange, InputFormat.DEFAULT);
                    }
                }
            }
            Log.d(TAG, "Shader program for input format " + inputFormat + " created: " + program);
            programs.put(inputFormat, program);
        }
        return programs;
    }

    public static int createTexture() {
        int[] textures = new int[1];
        GLES20.glGenTextures(1, textures, 0);
        checkGlErrorOrThrow("glGenTextures");
        int texId = textures[0];
        GLES20.glBindTexture(36197, texId);
        checkGlErrorOrThrow("glBindTexture " + texId);
        GLES20.glTexParameteri(36197, 10241, 9729);
        GLES20.glTexParameteri(36197, 10240, 9729);
        GLES20.glTexParameteri(36197, 10242, 33071);
        GLES20.glTexParameteri(36197, 10243, 33071);
        checkGlErrorOrThrow("glTexParameter");
        return texId;
    }

    public static float[] create4x4IdentityMatrix() {
        float[] matrix = new float[16];
        Matrix.setIdentityM(matrix, 0);
        return matrix;
    }

    public static void checkLocationOrThrow(int location, String label) {
        if (location < 0) {
            throw new IllegalStateException("Unable to locate '" + label + "' in program");
        }
    }

    public static void checkEglErrorOrThrow(String op) {
        int error = EGL14.eglGetError();
        if (error != 12288) {
            throw new IllegalStateException(op + ": EGL error: 0x" + Integer.toHexString(error));
        }
    }

    public static void checkGlErrorOrThrow(String op) {
        int error = GLES20.glGetError();
        if (error != 0) {
            throw new IllegalStateException(op + ": GL error 0x" + Integer.toHexString(error));
        }
    }

    public static void checkEglErrorOrLog(String op) {
        try {
            checkEglErrorOrThrow(op);
        } catch (IllegalStateException e) {
            Logger.e(TAG, e.toString(), e);
        }
    }

    public static void checkInitializedOrThrow(AtomicBoolean initialized, boolean shouldInitialized) {
        boolean result = shouldInitialized == initialized.get();
        String message = shouldInitialized ? "OpenGlRenderer is not initialized" : "OpenGlRenderer is already initialized";
        Preconditions.checkState(result, message);
    }

    public static void checkGlThreadOrThrow(Thread thread) {
        Preconditions.checkState(thread == Thread.currentThread(), "Method call must be called on the GL thread.");
    }

    public static String getGlVersionNumber() {
        String glVersion = GLES20.glGetString(7938);
        Pattern pattern = Pattern.compile("OpenGL ES ([0-9]+)\\.([0-9]+).*");
        Matcher matcher = pattern.matcher(glVersion);
        if (matcher.find()) {
            String major = (String) Preconditions.checkNotNull(matcher.group(1));
            String minor = (String) Preconditions.checkNotNull(matcher.group(2));
            return major + "." + minor;
        }
        return VERSION_UNKNOWN;
    }

    public static int[] chooseSurfaceAttrib(String eglExtensions, DynamicRange dynamicRange) {
        int[] attribs = EMPTY_ATTRIBS;
        if (dynamicRange.getEncoding() == 3) {
            if (eglExtensions.contains("EGL_EXT_gl_colorspace_bt2020_hlg")) {
                return HLG_SURFACE_ATTRIBS;
            }
            Logger.w(TAG, "Dynamic range uses HLG encoding, but device does not support EGL_EXT_gl_colorspace_bt2020_hlg.Fallback to default colorspace.");
            return attribs;
        }
        return attribs;
    }

    public static int generateFbo() {
        int[] fbos = new int[1];
        GLES20.glGenFramebuffers(1, fbos, 0);
        checkGlErrorOrThrow("glGenFramebuffers");
        return fbos[0];
    }

    public static int generateTexture() {
        int[] textures = new int[1];
        GLES20.glGenTextures(1, textures, 0);
        checkGlErrorOrThrow("glGenTextures");
        return textures[0];
    }

    public static void deleteTexture(int texture) {
        int[] textures = {texture};
        GLES20.glDeleteTextures(1, textures, 0);
        checkGlErrorOrThrow("glDeleteTextures");
    }

    public static void deleteFbo(int fbo) {
        int[] fbos = {fbo};
        GLES20.glDeleteFramebuffers(1, fbos, 0);
        checkGlErrorOrThrow("glDeleteFramebuffers");
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public static String getFragmentShaderSource(ShaderProvider shaderProvider) {
        try {
            String source = shaderProvider.createFragmentShader(VAR_TEXTURE, VAR_TEXTURE_COORD);
            if (source == null || !source.contains(VAR_TEXTURE_COORD) || !source.contains(VAR_TEXTURE)) {
                throw new IllegalArgumentException("Invalid fragment shader");
            }
            return source;
        } catch (Throwable t) {
            if (t instanceof IllegalArgumentException) {
                throw t;
            }
            throw new IllegalArgumentException("Unable retrieve fragment shader source", t);
        }
    }
}
