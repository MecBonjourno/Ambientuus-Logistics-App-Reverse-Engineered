package androidx.camera.video.internal.workaround;

import android.util.Size;
import androidx.camera.core.impl.CameraInfoInternal;
import androidx.camera.core.impl.EncoderProfilesProvider;
import androidx.camera.core.impl.EncoderProfilesProxy;
import androidx.camera.video.Quality;
import androidx.camera.video.internal.encoder.VideoEncoderInfo;
import androidx.constraintlayout.widget.ConstraintLayout;
import com.google.android.gms.common.Scopes;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.Metadata;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: DefaultEncoderProfilesProvider.kt */
@Metadata(d1 = {"\u0000j\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010%\n\u0002\u0010\b\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\b\u0002\u0018\u0000 :2\u00020\u0001:\u0001:B%\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005\u0012\u0006\u0010\u0007\u001a\u00020\b¢\u0006\u0004\b\t\u0010\nJ\u0010\u0010\u0018\u001a\u00020\u00192\u0006\u0010\u001a\u001a\u00020\u0016H\u0016J\u0012\u0010\u001b\u001a\u0004\u0018\u00010\u00172\u0006\u0010\u001a\u001a\u00020\u0016H\u0016J\u0012\u0010\u001c\u001a\u0004\u0018\u00010\u00172\u0006\u0010\u001a\u001a\u00020\u0016H\u0002J\u0012\u0010\u001d\u001a\u0004\u0018\u00010\u00172\u0006\u0010\u001a\u001a\u00020\u0016H\u0002J\u0012\u0010\u001e\u001a\u0004\u0018\u00010\u001f2\u0006\u0010\u001a\u001a\u00020\u0016H\u0002J\"\u0010 \u001a\u0004\u0018\u00010\u001f2\u0006\u0010!\u001a\u00020\u00162\u0006\u0010\"\u001a\u00020\u00162\u0006\u0010#\u001a\u00020\u0016H\u0002J,\u0010$\u001a\u00020\u00172\b\b\u0002\u0010%\u001a\u00020\u00162\b\b\u0002\u0010&\u001a\u00020\u00162\u0006\u0010'\u001a\u00020\u001f2\u0006\u0010(\u001a\u00020)H\u0002Jf\u0010*\u001a\u00020\u001f2\b\b\u0002\u0010+\u001a\u00020\u00162\b\b\u0002\u0010,\u001a\u00020-2\u0006\u0010!\u001a\u00020\u00162\u0006\u0010\"\u001a\u00020\u00162\u0006\u0010#\u001a\u00020\u00162\b\b\u0002\u0010.\u001a\u00020\u00162\b\b\u0002\u0010/\u001a\u00020\u00162\b\b\u0002\u00100\u001a\u00020\u00162\b\b\u0002\u00101\u001a\u00020\u00162\b\b\u0002\u00102\u001a\u00020\u0016H\u0002JD\u00103\u001a\u00020)2\b\b\u0002\u0010+\u001a\u00020\u00162\b\b\u0002\u0010,\u001a\u00020-2\b\b\u0002\u00104\u001a\u00020\u00162\b\b\u0002\u00105\u001a\u00020\u00162\b\b\u0002\u00106\u001a\u00020\u00162\b\b\u0002\u0010/\u001a\u00020\u0016H\u0002J\f\u00107\u001a\u00020\u0016*\u00020\u0006H\u0002J\u001c\u00108\u001a\u0004\u0018\u000109*\b\u0012\u0004\u0012\u00020\u00060\u00052\u0006\u0010\u001a\u001a\u00020\u0016H\u0002R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\bX\u0082\u0004¢\u0006\u0002\n\u0000RG\u0010\u000b\u001a.\u0012\f\u0012\n \u000e*\u0004\u0018\u00010\r0\r \u000e*\u0015\u0012\f\u0012\n \u000e*\u0004\u0018\u00010\r0\r0\u0005¢\u0006\u0002\b\u000f0\f¢\u0006\u0002\b\u000f8BX\u0082\u0084\u0002¢\u0006\f\n\u0004\b\u0012\u0010\u0013\u001a\u0004\b\u0010\u0010\u0011R\u001c\u0010\u0014\u001a\u0010\u0012\u0004\u0012\u00020\u0016\u0012\u0006\u0012\u0004\u0018\u00010\u00170\u0015X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006;"}, d2 = {"Landroidx/camera/video/internal/workaround/DefaultEncoderProfilesProvider;", "Landroidx/camera/core/impl/EncoderProfilesProvider;", "cameraInfo", "Landroidx/camera/core/impl/CameraInfoInternal;", "targetQualities", "", "Landroidx/camera/video/Quality;", "videoEncoderInfoFinder", "Landroidx/camera/video/internal/encoder/VideoEncoderInfo$Finder;", "<init>", "(Landroidx/camera/core/impl/CameraInfoInternal;Ljava/util/List;Landroidx/camera/video/internal/encoder/VideoEncoderInfo$Finder;)V", "supportedSizes", "", "Landroid/util/Size;", "kotlin.jvm.PlatformType", "Lorg/jspecify/annotations/NonNull;", "getSupportedSizes", "()Ljava/util/List;", "supportedSizes$delegate", "Lkotlin/Lazy;", "encoderProfilesMap", "", "", "Landroidx/camera/core/impl/EncoderProfilesProxy;", "hasProfile", "", "quality", "getAll", "getProfileInternal", "generateEncoderProfiles", "generateVideoProfiles", "Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;", "resolveVideoProfile", "width", "height", "bitrate", "createDefaultEncoderProfiles", "defaultDurationSeconds", "recommendedFileFormat", "videoProfile", "audioProfile", "Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;", "createDefaultVideoProfile", "codec", "mimeType", "", "frameRate", Scopes.PROFILE, "bitDepth", "chromaSubsampling", "hdrFormat", "createDefaultAudioProfile", "bitRate", "sampleRate", "channels", "getTypicalBitrate", "find", "Landroidx/camera/video/Quality$ConstantQuality;", "Companion", "camera-video_release"}, k = 1, mv = {2, 0, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* carregado de: classes.dex */
public final class DefaultEncoderProfilesProvider implements EncoderProfilesProvider {
    public static final int DEFAULT_AUDIO_BITRATE = 96000;
    public static final int DEFAULT_AUDIO_CHANNELS = 1;
    public static final int DEFAULT_AUDIO_CODEC = 3;
    public static final String DEFAULT_AUDIO_MIME_TYPE = "audio/mp4a-latm";
    public static final int DEFAULT_AUDIO_PROFILE = 2;
    public static final int DEFAULT_AUDIO_SAMPLE_RATE = 44100;
    public static final int DEFAULT_DURATION_SECONDS = 60;
    public static final int DEFAULT_OUTPUT_FORMAT = 2;
    public static final int DEFAULT_VIDEO_BITRATE_FHD = 10000000;
    public static final int DEFAULT_VIDEO_BITRATE_HD = 4000000;
    public static final int DEFAULT_VIDEO_BITRATE_SD = 2000000;
    public static final int DEFAULT_VIDEO_BITRATE_UHD = 40000000;
    public static final int DEFAULT_VIDEO_BIT_DEPTH = 8;
    public static final int DEFAULT_VIDEO_CHROMA_SUBSAMPLING = 0;
    public static final int DEFAULT_VIDEO_CODEC = 2;
    public static final int DEFAULT_VIDEO_FRAME_RATE = 30;
    public static final int DEFAULT_VIDEO_HDR_FORMAT = 0;
    public static final String DEFAULT_VIDEO_MIME_TYPE = "video/avc";
    public static final int DEFAULT_VIDEO_PROFILE = -1;
    private final CameraInfoInternal cameraInfo;
    private final Map<Integer, EncoderProfilesProxy> encoderProfilesMap;

    /* renomeado de: supportedSizes$delegate, motivo: de metadados do Kotlin */
    private final Lazy supportedSizes;
    private final List<Quality> targetQualities;
    private final VideoEncoderInfo.Finder videoEncoderInfoFinder;

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    public DefaultEncoderProfilesProvider(CameraInfoInternal cameraInfo, List<? extends Quality> targetQualities, VideoEncoderInfo.Finder videoEncoderInfoFinder) {
        Intrinsics.checkNotNullParameter(cameraInfo, "cameraInfo");
        Intrinsics.checkNotNullParameter(targetQualities, "targetQualities");
        Intrinsics.checkNotNullParameter(videoEncoderInfoFinder, "videoEncoderInfoFinder");
        this.cameraInfo = cameraInfo;
        this.targetQualities = targetQualities;
        this.videoEncoderInfoFinder = videoEncoderInfoFinder;
        this.supportedSizes = LazyKt.lazy(new Function0() { // da classe: androidx.camera.video.internal.workaround.DefaultEncoderProfilesProvider$$ExternalSyntheticLambda0
            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                List supportedSizes_delegate$lambda$0;
                supportedSizes_delegate$lambda$0 = DefaultEncoderProfilesProvider.supportedSizes_delegate$lambda$0(DefaultEncoderProfilesProvider.this);
                return supportedSizes_delegate$lambda$0;
            }
        });
        this.encoderProfilesMap = new LinkedHashMap();
    }

    private final List<Size> getSupportedSizes() {
        return (List) this.supportedSizes.getValue();
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public static final List supportedSizes_delegate$lambda$0(DefaultEncoderProfilesProvider this$0) {
        return this$0.cameraInfo.getSupportedResolutions(34);
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProvider
    public boolean hasProfile(int quality) {
        return getProfileInternal(quality) != null;
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProvider
    public EncoderProfilesProxy getAll(int quality) {
        return getProfileInternal(quality);
    }

    private final EncoderProfilesProxy getProfileInternal(int quality) {
        if (this.encoderProfilesMap.containsKey(Integer.valueOf(quality))) {
            return this.encoderProfilesMap.get(Integer.valueOf(quality));
        }
        EncoderProfilesProxy it = generateEncoderProfiles(quality);
        this.encoderProfilesMap.put(Integer.valueOf(quality), it);
        return it;
    }

    private final EncoderProfilesProxy generateEncoderProfiles(int quality) {
        EncoderProfilesProxy.VideoProfileProxy videoProfile = generateVideoProfiles(quality);
        if (videoProfile == null) {
            return null;
        }
        return createDefaultEncoderProfiles$default(this, 0, 0, videoProfile, createDefaultAudioProfile$default(this, 0, null, 0, 0, 0, 0, 63, null), 3, null);
    }

    private final EncoderProfilesProxy.VideoProfileProxy generateVideoProfiles(int quality) {
        EncoderProfilesProxy.VideoProfileProxy videoProfile;
        Quality.ConstantQuality qualityObj = find(this.targetQualities, quality);
        if (qualityObj == null) {
            return null;
        }
        for (Size size : qualityObj.getTypicalSizes()) {
            if (getSupportedSizes().contains(size) && (videoProfile = resolveVideoProfile(size.getWidth(), size.getHeight(), getTypicalBitrate(qualityObj))) != null) {
                return videoProfile;
            }
        }
        return null;
    }

    private final EncoderProfilesProxy.VideoProfileProxy resolveVideoProfile(int width, int height, int bitrate) {
        EncoderProfilesProxy.VideoProfileProxy videoProfile = createDefaultVideoProfile$default(this, 0, null, width, height, bitrate, 0, 0, 0, 0, 0, 995, null);
        VideoEncoderInfo encoderInfo = this.videoEncoderInfoFinder.find(videoProfile.getMediaType());
        if (encoderInfo == null || !encoderInfo.isSizeSupportedAllowSwapping(width, height)) {
            return null;
        }
        Integer resolvedBitrate = encoderInfo.getSupportedBitrateRange().clamp(Integer.valueOf(bitrate));
        if (resolvedBitrate != null && resolvedBitrate.intValue() == bitrate) {
            return videoProfile;
        }
        Intrinsics.checkNotNull(resolvedBitrate);
        return createDefaultVideoProfile$default(this, 0, null, width, height, resolvedBitrate.intValue(), 0, 0, 0, 0, 0, 995, null);
    }

    static /* sintético */ EncoderProfilesProxy createDefaultEncoderProfiles$default(DefaultEncoderProfilesProvider defaultEncoderProfilesProvider, int i, int i2, EncoderProfilesProxy.VideoProfileProxy videoProfileProxy, EncoderProfilesProxy.AudioProfileProxy audioProfileProxy, int i3, Object obj) {
        if ((i3 & 1) != 0) {
            i = 60;
        }
        if ((i3 & 2) != 0) {
            i2 = 2;
        }
        return defaultEncoderProfilesProvider.createDefaultEncoderProfiles(i, i2, videoProfileProxy, audioProfileProxy);
    }

    private final EncoderProfilesProxy createDefaultEncoderProfiles(int defaultDurationSeconds, int recommendedFileFormat, EncoderProfilesProxy.VideoProfileProxy videoProfile, EncoderProfilesProxy.AudioProfileProxy audioProfile) {
        EncoderProfilesProxy.ImmutableEncoderProfilesProxy create = EncoderProfilesProxy.ImmutableEncoderProfilesProxy.create(defaultDurationSeconds, recommendedFileFormat, CollectionsKt.listOf(audioProfile), CollectionsKt.listOf(videoProfile));
        Intrinsics.checkNotNullExpressionValue(create, "create(...)");
        return create;
    }

    static /* sintético */ EncoderProfilesProxy.VideoProfileProxy createDefaultVideoProfile$default(DefaultEncoderProfilesProvider defaultEncoderProfilesProvider, int i, String str, int i2, int i3, int i4, int i5, int i6, int i7, int i8, int i9, int i10, Object obj) {
        if ((i10 & 1) != 0) {
            i = 2;
        }
        if ((i10 & 2) != 0) {
            str = DEFAULT_VIDEO_MIME_TYPE;
        }
        if ((i10 & 32) != 0) {
            i5 = 30;
        }
        if ((i10 & 64) != 0) {
            i6 = -1;
        }
        if ((i10 & 128) != 0) {
            i7 = 8;
        }
        if ((i10 & 256) != 0) {
            i8 = 0;
        }
        return defaultEncoderProfilesProvider.createDefaultVideoProfile(i, str, i2, i3, i4, i5, i6, i7, i8, (i10 & 512) != 0 ? 0 : i9);
    }

    private final EncoderProfilesProxy.VideoProfileProxy createDefaultVideoProfile(int codec, String mimeType, int width, int height, int bitrate, int frameRate, int profile, int bitDepth, int chromaSubsampling, int hdrFormat) {
        EncoderProfilesProxy.VideoProfileProxy create = EncoderProfilesProxy.VideoProfileProxy.create(codec, mimeType, bitrate, frameRate, width, height, profile, bitDepth, chromaSubsampling, hdrFormat);
        Intrinsics.checkNotNullExpressionValue(create, "create(...)");
        return create;
    }

    static /* sintético */ EncoderProfilesProxy.AudioProfileProxy createDefaultAudioProfile$default(DefaultEncoderProfilesProvider defaultEncoderProfilesProvider, int i, String str, int i2, int i3, int i4, int i5, int i6, Object obj) {
        if ((i6 & 1) != 0) {
            i = 3;
        }
        if ((i6 & 2) != 0) {
            str = DEFAULT_AUDIO_MIME_TYPE;
        }
        if ((i6 & 4) != 0) {
            i2 = DEFAULT_AUDIO_BITRATE;
        }
        if ((i6 & 8) != 0) {
            i3 = DEFAULT_AUDIO_SAMPLE_RATE;
        }
        if ((i6 & 16) != 0) {
            i4 = 1;
        }
        int i7 = (i6 & 32) != 0 ? 2 : i5;
        int i8 = i4;
        return defaultEncoderProfilesProvider.createDefaultAudioProfile(i, str, i2, i3, i8, i7);
    }

    private final EncoderProfilesProxy.AudioProfileProxy createDefaultAudioProfile(int codec, String mimeType, int bitRate, int sampleRate, int channels, int profile) {
        EncoderProfilesProxy.AudioProfileProxy create = EncoderProfilesProxy.AudioProfileProxy.create(codec, mimeType, bitRate, sampleRate, channels, profile);
        Intrinsics.checkNotNullExpressionValue(create, "create(...)");
        return create;
    }

    private final int getTypicalBitrate(Quality $this$getTypicalBitrate) {
        if (Intrinsics.areEqual($this$getTypicalBitrate, Quality.UHD)) {
            return DEFAULT_VIDEO_BITRATE_UHD;
        }
        if (Intrinsics.areEqual($this$getTypicalBitrate, Quality.FHD)) {
            return DEFAULT_VIDEO_BITRATE_FHD;
        }
        if (Intrinsics.areEqual($this$getTypicalBitrate, Quality.HD)) {
            return DEFAULT_VIDEO_BITRATE_HD;
        }
        if (Intrinsics.areEqual($this$getTypicalBitrate, Quality.SD)) {
            return DEFAULT_VIDEO_BITRATE_SD;
        }
        throw new IllegalArgumentException("Undefined bitrate for quality: " + $this$getTypicalBitrate);
    }

    private final Quality.ConstantQuality find(List<? extends Quality> list, int quality) {
        Object obj;
        Iterator<T> it = list.iterator();
        while (true) {
            if (!it.hasNext()) {
                obj = null;
                break;
            }
            obj = it.next();
            Quality it2 = (Quality) obj;
            Intrinsics.checkNotNull(it2, "null cannot be cast to non-null type androidx.camera.video.Quality.ConstantQuality");
            boolean z = true;
            if (((Quality.ConstantQuality) it2).getQualityValue(1) != quality) {
                z = false;
            }
            if (z) {
                break;
            }
        }
        if (obj instanceof Quality.ConstantQuality) {
            return (Quality.ConstantQuality) obj;
        }
        return null;
    }
}
