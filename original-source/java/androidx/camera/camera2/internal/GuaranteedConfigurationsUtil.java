package androidx.camera.camera2.internal;

import android.util.Size;
import androidx.camera.core.impl.StreamUseCase;
import androidx.camera.core.impl.SurfaceCombination;
import androidx.camera.core.impl.SurfaceConfig;
import androidx.camera.core.impl.SurfaceSizeDefinition;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes.dex */
public final class GuaranteedConfigurationsUtil {
    private GuaranteedConfigurationsUtil() {
    }

    public static List<SurfaceCombination> getLegacySupportedCombinationList() {
        List<SurfaceCombination> combinationList = new ArrayList<>();
        SurfaceCombination surfaceCombination1 = new SurfaceCombination();
        surfaceCombination1.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination1);
        SurfaceCombination surfaceCombination2 = new SurfaceCombination();
        surfaceCombination2.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.JPEG, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination2);
        SurfaceCombination surfaceCombination3 = new SurfaceCombination();
        surfaceCombination3.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination3);
        SurfaceCombination surfaceCombination4 = new SurfaceCombination();
        surfaceCombination4.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination4.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.JPEG, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination4);
        SurfaceCombination surfaceCombination5 = new SurfaceCombination();
        surfaceCombination5.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination5.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.JPEG, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination5);
        SurfaceCombination surfaceCombination6 = new SurfaceCombination();
        surfaceCombination6.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination6.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        combinationList.add(surfaceCombination6);
        SurfaceCombination surfaceCombination7 = new SurfaceCombination();
        surfaceCombination7.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination7.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.PREVIEW));
        combinationList.add(surfaceCombination7);
        SurfaceCombination surfaceCombination8 = new SurfaceCombination();
        surfaceCombination8.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination8.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination8.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.JPEG, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination8);
        return combinationList;
    }

    public static List<SurfaceCombination> getLimitedSupportedCombinationList() {
        List<SurfaceCombination> combinationList = new ArrayList<>();
        SurfaceCombination surfaceCombination1 = new SurfaceCombination();
        surfaceCombination1.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination1.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.RECORD));
        combinationList.add(surfaceCombination1);
        SurfaceCombination surfaceCombination2 = new SurfaceCombination();
        surfaceCombination2.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination2.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.RECORD));
        combinationList.add(surfaceCombination2);
        SurfaceCombination surfaceCombination3 = new SurfaceCombination();
        surfaceCombination3.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination3.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.RECORD));
        combinationList.add(surfaceCombination3);
        SurfaceCombination surfaceCombination4 = new SurfaceCombination();
        surfaceCombination4.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination4.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.RECORD));
        surfaceCombination4.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.JPEG, SurfaceConfig.ConfigSize.RECORD));
        combinationList.add(surfaceCombination4);
        SurfaceCombination surfaceCombination5 = new SurfaceCombination();
        surfaceCombination5.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination5.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.RECORD));
        surfaceCombination5.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.JPEG, SurfaceConfig.ConfigSize.RECORD));
        combinationList.add(surfaceCombination5);
        SurfaceCombination surfaceCombination6 = new SurfaceCombination();
        surfaceCombination6.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination6.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination6.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.JPEG, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination6);
        return combinationList;
    }

    public static List<SurfaceCombination> getFullSupportedCombinationList() {
        List<SurfaceCombination> combinationList = new ArrayList<>();
        SurfaceCombination surfaceCombination1 = new SurfaceCombination();
        surfaceCombination1.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination1.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination1);
        SurfaceCombination surfaceCombination2 = new SurfaceCombination();
        surfaceCombination2.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination2.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination2);
        SurfaceCombination surfaceCombination3 = new SurfaceCombination();
        surfaceCombination3.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination3.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination3);
        SurfaceCombination surfaceCombination4 = new SurfaceCombination();
        surfaceCombination4.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination4.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination4.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.JPEG, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination4);
        SurfaceCombination surfaceCombination5 = new SurfaceCombination();
        surfaceCombination5.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.VGA));
        surfaceCombination5.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination5.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination5);
        SurfaceCombination surfaceCombination6 = new SurfaceCombination();
        surfaceCombination6.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.VGA));
        surfaceCombination6.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination6.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination6);
        return combinationList;
    }

    public static List<SurfaceCombination> getRAWSupportedCombinationList() {
        List<SurfaceCombination> combinationList = new ArrayList<>();
        SurfaceCombination surfaceCombination1 = new SurfaceCombination();
        surfaceCombination1.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.RAW, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination1);
        SurfaceCombination surfaceCombination2 = new SurfaceCombination();
        surfaceCombination2.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination2.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.RAW, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination2);
        SurfaceCombination surfaceCombination3 = new SurfaceCombination();
        surfaceCombination3.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination3.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.RAW, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination3);
        SurfaceCombination surfaceCombination4 = new SurfaceCombination();
        surfaceCombination4.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination4.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination4.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.RAW, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination4);
        SurfaceCombination surfaceCombination5 = new SurfaceCombination();
        surfaceCombination5.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination5.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination5.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.RAW, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination5);
        SurfaceCombination surfaceCombination6 = new SurfaceCombination();
        surfaceCombination6.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination6.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination6.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.RAW, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination6);
        SurfaceCombination surfaceCombination7 = new SurfaceCombination();
        surfaceCombination7.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination7.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.JPEG, SurfaceConfig.ConfigSize.MAXIMUM));
        surfaceCombination7.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.RAW, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination7);
        SurfaceCombination surfaceCombination8 = new SurfaceCombination();
        surfaceCombination8.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination8.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.JPEG, SurfaceConfig.ConfigSize.MAXIMUM));
        surfaceCombination8.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.RAW, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination8);
        return combinationList;
    }

    public static List<SurfaceCombination> getBurstSupportedCombinationList() {
        List<SurfaceCombination> combinationList = new ArrayList<>();
        SurfaceCombination surfaceCombination1 = new SurfaceCombination();
        surfaceCombination1.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination1.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination1);
        SurfaceCombination surfaceCombination2 = new SurfaceCombination();
        surfaceCombination2.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination2.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination2);
        SurfaceCombination surfaceCombination3 = new SurfaceCombination();
        surfaceCombination3.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination3.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination3);
        return combinationList;
    }

    public static List<SurfaceCombination> getLevel3SupportedCombinationList() {
        List<SurfaceCombination> combinationList = new ArrayList<>();
        SurfaceCombination surfaceCombination1 = new SurfaceCombination();
        surfaceCombination1.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination1.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.VGA));
        surfaceCombination1.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.MAXIMUM));
        surfaceCombination1.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.RAW, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination1);
        SurfaceCombination surfaceCombination2 = new SurfaceCombination();
        surfaceCombination2.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination2.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.VGA));
        surfaceCombination2.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.JPEG, SurfaceConfig.ConfigSize.MAXIMUM));
        surfaceCombination2.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.RAW, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination2);
        return combinationList;
    }

    public static List<SurfaceCombination> getUltraHighResolutionSupportedCombinationList() {
        List<SurfaceCombination> combinationList = new ArrayList<>();
        SurfaceCombination surfaceCombination1 = new SurfaceCombination();
        surfaceCombination1.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.ULTRA_MAXIMUM));
        surfaceCombination1.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination1.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.RECORD));
        combinationList.add(surfaceCombination1);
        SurfaceCombination surfaceCombination2 = new SurfaceCombination();
        surfaceCombination2.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.JPEG, SurfaceConfig.ConfigSize.ULTRA_MAXIMUM));
        surfaceCombination2.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination2.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.RECORD));
        combinationList.add(surfaceCombination2);
        SurfaceCombination surfaceCombination3 = new SurfaceCombination();
        surfaceCombination3.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.RAW, SurfaceConfig.ConfigSize.ULTRA_MAXIMUM));
        surfaceCombination3.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination3.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.RECORD));
        combinationList.add(surfaceCombination3);
        SurfaceCombination surfaceCombination4 = new SurfaceCombination();
        surfaceCombination4.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.ULTRA_MAXIMUM));
        surfaceCombination4.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination4.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.JPEG, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination4);
        SurfaceCombination surfaceCombination5 = new SurfaceCombination();
        surfaceCombination5.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.JPEG, SurfaceConfig.ConfigSize.ULTRA_MAXIMUM));
        surfaceCombination5.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination5.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.JPEG, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination5);
        SurfaceCombination surfaceCombination6 = new SurfaceCombination();
        surfaceCombination6.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.RAW, SurfaceConfig.ConfigSize.ULTRA_MAXIMUM));
        surfaceCombination6.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination6.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.JPEG, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination6);
        SurfaceCombination surfaceCombination7 = new SurfaceCombination();
        surfaceCombination7.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.ULTRA_MAXIMUM));
        surfaceCombination7.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination7.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination7);
        SurfaceCombination surfaceCombination8 = new SurfaceCombination();
        surfaceCombination8.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.JPEG, SurfaceConfig.ConfigSize.ULTRA_MAXIMUM));
        surfaceCombination8.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination8.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination8);
        SurfaceCombination surfaceCombination9 = new SurfaceCombination();
        surfaceCombination9.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.RAW, SurfaceConfig.ConfigSize.ULTRA_MAXIMUM));
        surfaceCombination9.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination9.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination9);
        SurfaceCombination surfaceCombination10 = new SurfaceCombination();
        surfaceCombination10.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.ULTRA_MAXIMUM));
        surfaceCombination10.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination10.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.RAW, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination10);
        SurfaceCombination surfaceCombination11 = new SurfaceCombination();
        surfaceCombination11.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.JPEG, SurfaceConfig.ConfigSize.ULTRA_MAXIMUM));
        surfaceCombination11.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination11.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.RAW, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination11);
        SurfaceCombination surfaceCombination12 = new SurfaceCombination();
        surfaceCombination12.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.RAW, SurfaceConfig.ConfigSize.ULTRA_MAXIMUM));
        surfaceCombination12.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination12.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.RAW, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination12);
        return combinationList;
    }

    public static List<SurfaceCombination> get10BitSupportedCombinationList() {
        List<SurfaceCombination> combinationList = new ArrayList<>();
        SurfaceCombination surfaceCombination1 = new SurfaceCombination();
        surfaceCombination1.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination1);
        SurfaceCombination surfaceCombination2 = new SurfaceCombination();
        surfaceCombination2.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination2);
        SurfaceCombination surfaceCombination3 = new SurfaceCombination();
        surfaceCombination3.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination3.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.JPEG, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination3);
        SurfaceCombination surfaceCombination4 = new SurfaceCombination();
        surfaceCombination4.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination4.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination4);
        SurfaceCombination surfaceCombination5 = new SurfaceCombination();
        surfaceCombination5.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination5.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination5);
        SurfaceCombination surfaceCombination6 = new SurfaceCombination();
        surfaceCombination6.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination6.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.RECORD));
        combinationList.add(surfaceCombination6);
        SurfaceCombination surfaceCombination7 = new SurfaceCombination();
        surfaceCombination7.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination7.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.RECORD));
        surfaceCombination7.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.RECORD));
        combinationList.add(surfaceCombination7);
        SurfaceCombination surfaceCombination8 = new SurfaceCombination();
        surfaceCombination8.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination8.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.RECORD));
        surfaceCombination8.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.JPEG, SurfaceConfig.ConfigSize.RECORD));
        combinationList.add(surfaceCombination8);
        return combinationList;
    }

    public static List<SurfaceCombination> getUltraHdrSupportedCombinationList() {
        List<SurfaceCombination> combinationList = new ArrayList<>();
        SurfaceCombination surfaceCombination1 = new SurfaceCombination();
        surfaceCombination1.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.JPEG_R, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination1);
        SurfaceCombination surfaceCombination2 = new SurfaceCombination();
        surfaceCombination2.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination2.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.JPEG_R, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination2);
        return combinationList;
    }

    public static List<SurfaceCombination> getConcurrentSupportedCombinationList() {
        List<SurfaceCombination> combinationList = new ArrayList<>();
        SurfaceCombination surfaceCombination1 = new SurfaceCombination();
        surfaceCombination1.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.S1440P_4_3));
        combinationList.add(surfaceCombination1);
        SurfaceCombination surfaceCombination2 = new SurfaceCombination();
        surfaceCombination2.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.S1440P_4_3));
        combinationList.add(surfaceCombination2);
        SurfaceCombination surfaceCombination3 = new SurfaceCombination();
        surfaceCombination3.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.JPEG, SurfaceConfig.ConfigSize.S1440P_4_3));
        combinationList.add(surfaceCombination3);
        SurfaceCombination surfaceCombination4 = new SurfaceCombination();
        surfaceCombination4.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.S720P_16_9));
        surfaceCombination4.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.JPEG, SurfaceConfig.ConfigSize.S1440P_4_3));
        combinationList.add(surfaceCombination4);
        SurfaceCombination surfaceCombination5 = new SurfaceCombination();
        surfaceCombination5.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.S720P_16_9));
        surfaceCombination5.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.JPEG, SurfaceConfig.ConfigSize.S1440P_4_3));
        combinationList.add(surfaceCombination5);
        SurfaceCombination surfaceCombination6 = new SurfaceCombination();
        surfaceCombination6.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.S720P_16_9));
        surfaceCombination6.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.S1440P_4_3));
        combinationList.add(surfaceCombination6);
        SurfaceCombination surfaceCombination7 = new SurfaceCombination();
        surfaceCombination7.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.S720P_16_9));
        surfaceCombination7.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.S1440P_4_3));
        combinationList.add(surfaceCombination7);
        SurfaceCombination surfaceCombination8 = new SurfaceCombination();
        surfaceCombination8.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.S720P_16_9));
        surfaceCombination8.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.S1440P_4_3));
        combinationList.add(surfaceCombination8);
        SurfaceCombination surfaceCombination9 = new SurfaceCombination();
        surfaceCombination9.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.S720P_16_9));
        surfaceCombination9.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.S1440P_4_3));
        combinationList.add(surfaceCombination9);
        return combinationList;
    }

    public static List<SurfaceCombination> getStreamUseCaseSupportedCombinationList() {
        List<SurfaceCombination> combinationList = new ArrayList<>();
        SurfaceCombination surfaceCombination1 = new SurfaceCombination();
        surfaceCombination1.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.S1440P_4_3, StreamUseCase.PREVIEW_VIDEO_STILL));
        combinationList.add(surfaceCombination1);
        SurfaceCombination surfaceCombination2 = new SurfaceCombination();
        surfaceCombination2.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.S1440P_4_3, StreamUseCase.PREVIEW_VIDEO_STILL));
        combinationList.add(surfaceCombination2);
        SurfaceCombination surfaceCombination3 = new SurfaceCombination();
        surfaceCombination3.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.RECORD, StreamUseCase.VIDEO_RECORD));
        combinationList.add(surfaceCombination3);
        SurfaceCombination surfaceCombination4 = new SurfaceCombination();
        surfaceCombination4.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.RECORD, StreamUseCase.VIDEO_RECORD));
        combinationList.add(surfaceCombination4);
        SurfaceCombination surfaceCombination5 = new SurfaceCombination();
        surfaceCombination5.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.JPEG, SurfaceConfig.ConfigSize.MAXIMUM, StreamUseCase.STILL_CAPTURE));
        combinationList.add(surfaceCombination5);
        SurfaceCombination surfaceCombination6 = new SurfaceCombination();
        surfaceCombination6.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.MAXIMUM, StreamUseCase.STILL_CAPTURE));
        combinationList.add(surfaceCombination6);
        SurfaceCombination surfaceCombination7 = new SurfaceCombination();
        surfaceCombination7.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW, StreamUseCase.PREVIEW));
        surfaceCombination7.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.JPEG, SurfaceConfig.ConfigSize.MAXIMUM, StreamUseCase.STILL_CAPTURE));
        combinationList.add(surfaceCombination7);
        SurfaceCombination surfaceCombination8 = new SurfaceCombination();
        surfaceCombination8.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW, StreamUseCase.PREVIEW));
        surfaceCombination8.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.MAXIMUM, StreamUseCase.STILL_CAPTURE));
        combinationList.add(surfaceCombination8);
        SurfaceCombination surfaceCombination9 = new SurfaceCombination();
        surfaceCombination9.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW, StreamUseCase.PREVIEW));
        surfaceCombination9.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.RECORD, StreamUseCase.VIDEO_RECORD));
        combinationList.add(surfaceCombination9);
        SurfaceCombination surfaceCombination10 = new SurfaceCombination();
        surfaceCombination10.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW, StreamUseCase.PREVIEW));
        surfaceCombination10.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.RECORD, StreamUseCase.VIDEO_RECORD));
        combinationList.add(surfaceCombination10);
        SurfaceCombination surfaceCombination11 = new SurfaceCombination();
        surfaceCombination11.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW, StreamUseCase.PREVIEW));
        surfaceCombination11.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.PREVIEW, StreamUseCase.PREVIEW));
        combinationList.add(surfaceCombination11);
        SurfaceCombination surfaceCombination12 = new SurfaceCombination();
        surfaceCombination12.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW, StreamUseCase.PREVIEW));
        surfaceCombination12.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.RECORD, StreamUseCase.VIDEO_RECORD));
        surfaceCombination12.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.JPEG, SurfaceConfig.ConfigSize.RECORD, StreamUseCase.STILL_CAPTURE));
        combinationList.add(surfaceCombination12);
        SurfaceCombination surfaceCombination13 = new SurfaceCombination();
        surfaceCombination13.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW, StreamUseCase.PREVIEW));
        surfaceCombination13.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.RECORD, StreamUseCase.VIDEO_RECORD));
        surfaceCombination13.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.JPEG, SurfaceConfig.ConfigSize.RECORD, StreamUseCase.STILL_CAPTURE));
        combinationList.add(surfaceCombination13);
        SurfaceCombination surfaceCombination14 = new SurfaceCombination();
        surfaceCombination14.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW, StreamUseCase.PREVIEW));
        surfaceCombination14.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.PREVIEW, StreamUseCase.PREVIEW));
        surfaceCombination14.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.JPEG, SurfaceConfig.ConfigSize.MAXIMUM, StreamUseCase.STILL_CAPTURE));
        combinationList.add(surfaceCombination14);
        return combinationList;
    }

    public static List<SurfaceCombination> getPreviewStabilizationSupportedCombinationList() {
        List<SurfaceCombination> combinationList = new ArrayList<>();
        SurfaceCombination surfaceCombination1 = new SurfaceCombination();
        surfaceCombination1.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.S1440P_4_3));
        combinationList.add(surfaceCombination1);
        SurfaceCombination surfaceCombination2 = new SurfaceCombination();
        surfaceCombination2.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.S1440P_4_3));
        combinationList.add(surfaceCombination2);
        SurfaceCombination surfaceCombination3 = new SurfaceCombination();
        surfaceCombination3.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.S1440P_4_3));
        surfaceCombination3.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.JPEG, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination3);
        SurfaceCombination surfaceCombination4 = new SurfaceCombination();
        surfaceCombination4.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.S1440P_4_3));
        surfaceCombination4.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.JPEG, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination4);
        SurfaceCombination surfaceCombination5 = new SurfaceCombination();
        surfaceCombination5.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.S1440P_4_3));
        surfaceCombination5.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination5);
        SurfaceCombination surfaceCombination6 = new SurfaceCombination();
        surfaceCombination6.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.S1440P_4_3));
        surfaceCombination6.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.MAXIMUM));
        combinationList.add(surfaceCombination6);
        SurfaceCombination surfaceCombination7 = new SurfaceCombination();
        surfaceCombination7.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination7.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.S1440P_4_3));
        combinationList.add(surfaceCombination7);
        SurfaceCombination surfaceCombination8 = new SurfaceCombination();
        surfaceCombination8.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination8.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.S1440P_4_3));
        combinationList.add(surfaceCombination8);
        SurfaceCombination surfaceCombination9 = new SurfaceCombination();
        surfaceCombination9.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination9.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.S1440P_4_3));
        combinationList.add(surfaceCombination9);
        SurfaceCombination surfaceCombination10 = new SurfaceCombination();
        surfaceCombination10.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.PREVIEW));
        surfaceCombination10.addSurfaceConfig(SurfaceConfig.create(SurfaceConfig.ConfigType.YUV, SurfaceConfig.ConfigSize.S1440P_4_3));
        combinationList.add(surfaceCombination10);
        return combinationList;
    }

    public static List<SurfaceCombination> generateSupportedCombinationList(int hardwareLevel, boolean isRawSupported, boolean isBurstCaptureSupported) {
        List<SurfaceCombination> surfaceCombinations = new ArrayList<>();
        surfaceCombinations.addAll(getLegacySupportedCombinationList());
        if (hardwareLevel == 0 || hardwareLevel == 4 || hardwareLevel == 1 || hardwareLevel == 3) {
            surfaceCombinations.addAll(getLimitedSupportedCombinationList());
        }
        if (hardwareLevel == 1 || hardwareLevel == 3) {
            surfaceCombinations.addAll(getFullSupportedCombinationList());
        }
        if (isRawSupported) {
            surfaceCombinations.addAll(getRAWSupportedCombinationList());
        }
        if (isBurstCaptureSupported && hardwareLevel == 0) {
            surfaceCombinations.addAll(getBurstSupportedCombinationList());
        }
        if (hardwareLevel == 3) {
            surfaceCombinations.addAll(getLevel3SupportedCombinationList());
        }
        return surfaceCombinations;
    }

    public static List<SurfaceCombination> generateHighSpeedSupportedCombinationList(Size maxSupportedSize, SurfaceSizeDefinition surfaceSizeDefinition) {
        List<SurfaceCombination> surfaceCombinations = new ArrayList<>();
        SurfaceConfig surfaceConfig = SurfaceConfig.transformSurfaceConfig(34, maxSupportedSize, surfaceSizeDefinition);
        SurfaceCombination surfaceCombination = new SurfaceCombination();
        surfaceCombination.addSurfaceConfig(surfaceConfig);
        surfaceCombinations.add(surfaceCombination);
        SurfaceCombination surfaceCombination2 = new SurfaceCombination();
        surfaceCombination2.addSurfaceConfig(surfaceConfig);
        surfaceCombination2.addSurfaceConfig(surfaceConfig);
        surfaceCombinations.add(surfaceCombination2);
        return surfaceCombinations;
    }

    public static List<SurfaceCombination> generateQueryableFcqCombinations() {
        List<SurfaceCombination> combinations = new ArrayList<>();
        combinations.add(new SurfaceCombination(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.S1080P_16_9)));
        combinations.add(new SurfaceCombination(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, SurfaceConfig.ConfigSize.S720P_16_9)));
        combinations.addAll(createPrivJpegXCombinations(SurfaceConfig.ConfigSize.S1080P_16_9, SurfaceConfig.ConfigSize.MAXIMUM_16_9));
        combinations.addAll(createPrivJpegXCombinations(SurfaceConfig.ConfigSize.S1080P_16_9, SurfaceConfig.ConfigSize.UHD));
        combinations.addAll(createPrivJpegXCombinations(SurfaceConfig.ConfigSize.S1080P_16_9, SurfaceConfig.ConfigSize.S1440P_16_9));
        combinations.addAll(createPrivJpegXCombinations(SurfaceConfig.ConfigSize.S1080P_16_9, SurfaceConfig.ConfigSize.S1080P_16_9));
        combinations.addAll(createPrivJpegXCombinations(SurfaceConfig.ConfigSize.S720P_16_9, SurfaceConfig.ConfigSize.MAXIMUM_16_9));
        combinations.addAll(createPrivJpegXCombinations(SurfaceConfig.ConfigSize.S720P_16_9, SurfaceConfig.ConfigSize.UHD));
        combinations.addAll(createPrivJpegXCombinations(SurfaceConfig.ConfigSize.S720P_16_9, SurfaceConfig.ConfigSize.S1080P_16_9));
        combinations.addAll(createPrivJpegXCombinations(SurfaceConfig.ConfigSize.X_VGA, SurfaceConfig.ConfigSize.MAXIMUM_4_3));
        combinations.addAll(createPrivJpegXCombinations(SurfaceConfig.ConfigSize.S1080P_4_3, SurfaceConfig.ConfigSize.MAXIMUM_4_3));
        return combinations;
    }

    private static List<SurfaceCombination> createPrivJpegXCombinations(SurfaceConfig.ConfigSize privSize, SurfaceConfig.ConfigSize jpegXSize) {
        List<SurfaceCombination> combinationList = new ArrayList<>();
        combinationList.add(new SurfaceCombination(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, privSize), SurfaceConfig.create(SurfaceConfig.ConfigType.JPEG, jpegXSize)));
        combinationList.add(new SurfaceCombination(SurfaceConfig.create(SurfaceConfig.ConfigType.PRIV, privSize), SurfaceConfig.create(SurfaceConfig.ConfigType.JPEG_R, jpegXSize)));
        return combinationList;
    }
}
