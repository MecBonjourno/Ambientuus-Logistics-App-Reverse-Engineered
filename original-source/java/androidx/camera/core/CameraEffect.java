package androidx.camera.core;

import androidx.camera.core.processing.SurfaceProcessorInternal;
import androidx.camera.core.processing.SurfaceProcessorWithExecutor;
import androidx.camera.core.processing.TargetUtils;
import androidx.core.util.Consumer;
import androidx.core.util.Preconditions;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.Executor;

/* loaded from: classes.dex */
public abstract class CameraEffect {
    public static final int IMAGE_CAPTURE = 4;
    public static final int OUTPUT_OPTION_ONE_FOR_ALL_TARGETS = 0;
    public static final int OUTPUT_OPTION_ONE_FOR_EACH_TARGET = 1;
    public static final int PREVIEW = 1;
    private static final List<Integer> SURFACE_PROCESSOR_TARGETS = Arrays.asList(1, 2, 3, 7);
    public static final int TRANSFORMATION_ARBITRARY = 0;
    public static final int TRANSFORMATION_CAMERA_AND_SURFACE_ROTATION = 1;
    public static final int TRANSFORMATION_PASSTHROUGH = 2;
    public static final int VIDEO_CAPTURE = 2;
    private final Consumer<Throwable> mErrorListener;
    private final Executor mExecutor;
    private final ImageProcessor mImageProcessor;
    private final int mOutputOption;
    private final SurfaceProcessor mSurfaceProcessor;
    private final int mTargets;
    private final int mTransformation;

    @Retention(RetentionPolicy.SOURCE)
    public @interface Formats {
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface OutputOptions {
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface Targets {
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface Transformations {
    }

    protected CameraEffect(int targets, Executor executor, ImageProcessor imageProcessor, Consumer<Throwable> errorListener) {
        Preconditions.checkArgument(targets == 4, "Currently ImageProcessor can only target IMAGE_CAPTURE.");
        this.mTargets = targets;
        this.mTransformation = 0;
        this.mOutputOption = 0;
        this.mExecutor = executor;
        this.mSurfaceProcessor = null;
        this.mImageProcessor = imageProcessor;
        this.mErrorListener = errorListener;
    }

    protected CameraEffect(int targets, int transformation, Executor executor, SurfaceProcessor surfaceProcessor, Consumer<Throwable> errorListener) {
        this(targets, 0, transformation, executor, surfaceProcessor, errorListener);
    }

    protected CameraEffect(int targets, int outputOption, int transformation, Executor executor, SurfaceProcessor surfaceProcessor, Consumer<Throwable> errorListener) {
        TargetUtils.checkSupportedTargets(SURFACE_PROCESSOR_TARGETS, targets);
        this.mTargets = targets;
        this.mOutputOption = outputOption;
        this.mTransformation = transformation;
        this.mExecutor = executor;
        this.mSurfaceProcessor = surfaceProcessor;
        this.mImageProcessor = null;
        this.mErrorListener = errorListener;
    }

    protected CameraEffect(int targets, Executor executor, SurfaceProcessor surfaceProcessor, Consumer<Throwable> errorListener) {
        this(targets, 0, 0, executor, surfaceProcessor, errorListener);
    }

    public int getTargets() {
        return this.mTargets;
    }

    public int getTransformation() {
        return this.mTransformation;
    }

    public int getOutputOption() {
        return this.mOutputOption;
    }

    public Executor getExecutor() {
        return this.mExecutor;
    }

    public Consumer<Throwable> getErrorListener() {
        return this.mErrorListener;
    }

    public SurfaceProcessor getSurfaceProcessor() {
        return this.mSurfaceProcessor;
    }

    public ImageProcessor getImageProcessor() {
        return this.mImageProcessor;
    }

    public SurfaceProcessorInternal createSurfaceProcessorInternal() {
        return new SurfaceProcessorWithExecutor(this);
    }
}
