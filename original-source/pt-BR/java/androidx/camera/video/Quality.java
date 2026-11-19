package androidx.camera.video;

import android.util.Size;
import androidx.credentials.CredentialOption;
import j$.util.DesugarCollections;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/* carregado de: classes.dex */
public class Quality {
    public static final int QUALITY_SOURCE_HIGH_SPEED = 2;
    public static final int QUALITY_SOURCE_REGULAR = 1;
    public static final Quality SD = ConstantQuality.of(4, 2002, "SD", DesugarCollections.unmodifiableList(Arrays.asList(new Size(720, 480), new Size(640, 480))));
    public static final Quality HD = ConstantQuality.of(5, 2003, "HD", Collections.singletonList(new Size(1280, 720)));
    public static final Quality FHD = ConstantQuality.of(6, 2004, "FHD", Collections.singletonList(new Size(1920, 1080)));
    public static final Quality UHD = ConstantQuality.of(8, 2005, "UHD", Collections.singletonList(new Size(3840, 2160)));
    public static final Quality LOWEST = ConstantQuality.of(0, CredentialOption.PRIORITY_DEFAULT, "LOWEST", Collections.emptyList());
    public static final Quality HIGHEST = ConstantQuality.of(1, 2001, "HIGHEST", Collections.emptyList());
    static final Quality NONE = ConstantQuality.of(-1, -1, "NONE", Collections.emptyList());
    private static final Set<Quality> QUALITIES = new HashSet(Arrays.asList(LOWEST, HIGHEST, SD, HD, FHD, UHD));
    private static final List<Quality> QUALITIES_ORDER_BY_SIZE = Arrays.asList(UHD, FHD, HD, SD);

    @Retention(RetentionPolicy.SOURCE)
    public @interface QualitySource {
    }

    private Quality() {
    }

    static boolean containsQuality(Quality quality) {
        return QUALITIES.contains(quality);
    }

    public static List<Quality> getSortedQualities() {
        return new ArrayList(QUALITIES_ORDER_BY_SIZE);
    }

    public static abstract class ConstantQuality extends Quality {
        abstract int getHighSpeedValue();

        public abstract String getName();

        public abstract List<Size> getTypicalSizes();

        abstract int getValue();

        public ConstantQuality() {
            super();
        }

        static ConstantQuality of(int value, int highSpeedValue, String name, List<Size> typicalSizes) {
            return new AutoValue_Quality_ConstantQuality(value, highSpeedValue, name, typicalSizes);
        }

        public int getQualityValue(int qualitySource) {
            switch (qualitySource) {
                case 1:
                    return getValue();
                case 2:
                    return getHighSpeedValue();
                default:
                    throw new AssertionError("Unknown quality source: " + qualitySource);
            }
        }
    }
}
