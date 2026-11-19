package androidx.camera.camera2.internal.compat.quirk;

import android.os.Build;
import android.util.Size;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.Quirk;
import com.google.api.client.http.HttpStatusCodes;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* carregado de: classes.dex */
public class ExcludedSupportedSizesQuirk implements Quirk {
    private static final String TAG = "ExcludedSupportedSizesQuirk";
    private static final int UNKNOWN_IMAGE_FORMAT = -1;

    static boolean load() {
        return isOnePlus6() || isOnePlus6T() || isHuaweiP20Lite() || isSamsungJ7PrimeApi27Above() || isSamsungJ7Api27Above() || isRedmiNote9Pro() || isSamsungA05s() || isNokia7Plus();
    }

    private static boolean isOnePlus6() {
        return "OnePlus".equalsIgnoreCase(Build.BRAND) && "OnePlus6".equalsIgnoreCase(Build.DEVICE);
    }

    private static boolean isOnePlus6T() {
        return "OnePlus".equalsIgnoreCase(Build.BRAND) && "OnePlus6T".equalsIgnoreCase(Build.DEVICE);
    }

    private static boolean isHuaweiP20Lite() {
        return "HUAWEI".equalsIgnoreCase(Build.BRAND) && "HWANE".equalsIgnoreCase(Build.DEVICE);
    }

    private static boolean isSamsungJ7PrimeApi27Above() {
        return "SAMSUNG".equalsIgnoreCase(Build.BRAND) && "ON7XELTE".equalsIgnoreCase(Build.DEVICE) && Build.VERSION.SDK_INT >= 27;
    }

    private static boolean isSamsungJ7Api27Above() {
        return "SAMSUNG".equalsIgnoreCase(Build.BRAND) && "J7XELTE".equalsIgnoreCase(Build.DEVICE) && Build.VERSION.SDK_INT >= 27;
    }

    private static boolean isRedmiNote9Pro() {
        return "REDMI".equalsIgnoreCase(Build.BRAND) && "joyeuse".equalsIgnoreCase(Build.DEVICE);
    }

    private static boolean isSamsungA05s() {
        return "SAMSUNG".equalsIgnoreCase(Build.BRAND) && "a05s".equalsIgnoreCase(Build.DEVICE) && Build.MODEL.toUpperCase().contains("SM-A057");
    }

    private static boolean isNokia7Plus() {
        return "Nokia".equalsIgnoreCase(Build.BRAND) && ("B2N".equalsIgnoreCase(Build.DEVICE) || "B2N_sprout".equalsIgnoreCase(Build.DEVICE));
    }

    public List<Size> getExcludedSizes(String cameraId, int imageFormat) {
        if (isOnePlus6()) {
            return getOnePlus6ExcludedSizes(cameraId, imageFormat);
        }
        if (isOnePlus6T()) {
            return getOnePlus6TExcludedSizes(cameraId, imageFormat);
        }
        if (isHuaweiP20Lite()) {
            return getHuaweiP20LiteExcludedSizes(cameraId, imageFormat, null);
        }
        if (isSamsungJ7PrimeApi27Above()) {
            return getSamsungJ7PrimeApi27AboveExcludedSizes(cameraId, imageFormat, null);
        }
        if (isSamsungJ7Api27Above()) {
            return getSamsungJ7Api27AboveExcludedSizes(cameraId, imageFormat, null);
        }
        if (isRedmiNote9Pro()) {
            return getRedmiNote9ProExcludedSizes(cameraId, imageFormat);
        }
        if (isSamsungA05s()) {
            return getSamsungA05sExcludedSizes(imageFormat);
        }
        if (isNokia7Plus()) {
            return getNokia7PlusExcludedSizes(imageFormat);
        }
        Logger.w(TAG, "Cannot retrieve list of supported sizes to exclude on this device.");
        return Collections.emptyList();
    }

    public List<Size> getExcludedSizes(String cameraId, Class<?> klass) {
        if (isHuaweiP20Lite()) {
            return getHuaweiP20LiteExcludedSizes(cameraId, -1, klass);
        }
        if (isSamsungJ7PrimeApi27Above()) {
            return getSamsungJ7PrimeApi27AboveExcludedSizes(cameraId, -1, klass);
        }
        if (isSamsungJ7Api27Above()) {
            return getSamsungJ7Api27AboveExcludedSizes(cameraId, -1, klass);
        }
        Logger.w(TAG, "Cannot retrieve list of supported sizes to exclude on this device.");
        return Collections.emptyList();
    }

    private List<Size> getOnePlus6ExcludedSizes(String cameraId, int imageFormat) {
        List<Size> sizes = new ArrayList<>();
        if (cameraId.equals("0") && imageFormat == 256) {
            sizes.add(new Size(4160, 3120));
            sizes.add(new Size(4000, 3000));
        }
        return sizes;
    }

    private List<Size> getOnePlus6TExcludedSizes(String cameraId, int imageFormat) {
        List<Size> sizes = new ArrayList<>();
        if (cameraId.equals("0") && imageFormat == 256) {
            sizes.add(new Size(4160, 3120));
            sizes.add(new Size(4000, 3000));
        }
        return sizes;
    }

    private List<Size> getHuaweiP20LiteExcludedSizes(String cameraId, int imageFormat, Class<?> klass) {
        List<Size> sizes = new ArrayList<>();
        if (cameraId.equals("0") && (imageFormat == 34 || imageFormat == 35 || klass != null)) {
            sizes.add(new Size(720, 720));
            sizes.add(new Size(HttpStatusCodes.STATUS_CODE_BAD_REQUEST, HttpStatusCodes.STATUS_CODE_BAD_REQUEST));
        }
        return sizes;
    }

    private List<Size> getSamsungJ7PrimeApi27AboveExcludedSizes(String cameraId, int imageFormat, Class<?> klass) {
        List<Size> sizes = new ArrayList<>();
        if (cameraId.equals("0")) {
            if (imageFormat == 34 || klass != null) {
                sizes.add(new Size(4128, 3096));
                sizes.add(new Size(4128, 2322));
                sizes.add(new Size(3088, 3088));
                sizes.add(new Size(3264, 2448));
                sizes.add(new Size(3264, 1836));
                sizes.add(new Size(2048, 1536));
                sizes.add(new Size(2048, 1152));
                sizes.add(new Size(1920, 1080));
            } else if (imageFormat == 35) {
                sizes.add(new Size(4128, 2322));
                sizes.add(new Size(3088, 3088));
                sizes.add(new Size(3264, 2448));
                sizes.add(new Size(3264, 1836));
                sizes.add(new Size(2048, 1536));
                sizes.add(new Size(2048, 1152));
                sizes.add(new Size(1920, 1080));
            }
        } else if (cameraId.equals("1") && (imageFormat == 34 || imageFormat == 35 || klass != null)) {
            sizes.add(new Size(3264, 2448));
            sizes.add(new Size(3264, 1836));
            sizes.add(new Size(2448, 2448));
            sizes.add(new Size(1920, 1920));
            sizes.add(new Size(2048, 1536));
            sizes.add(new Size(2048, 1152));
            sizes.add(new Size(1920, 1080));
        }
        return sizes;
    }

    private List<Size> getSamsungJ7Api27AboveExcludedSizes(String cameraId, int imageFormat, Class<?> klass) {
        List<Size> sizes = new ArrayList<>();
        if (cameraId.equals("0")) {
            if (imageFormat == 34 || klass != null) {
                sizes.add(new Size(4128, 3096));
                sizes.add(new Size(4128, 2322));
                sizes.add(new Size(3088, 3088));
                sizes.add(new Size(3264, 2448));
                sizes.add(new Size(3264, 1836));
                sizes.add(new Size(2048, 1536));
                sizes.add(new Size(2048, 1152));
                sizes.add(new Size(1920, 1080));
            } else if (imageFormat == 35) {
                sizes.add(new Size(2048, 1536));
                sizes.add(new Size(2048, 1152));
                sizes.add(new Size(1920, 1080));
            }
        } else if (cameraId.equals("1") && (imageFormat == 34 || imageFormat == 35 || klass != null)) {
            sizes.add(new Size(2576, 1932));
            sizes.add(new Size(2560, 1440));
            sizes.add(new Size(1920, 1920));
            sizes.add(new Size(2048, 1536));
            sizes.add(new Size(2048, 1152));
            sizes.add(new Size(1920, 1080));
        }
        return sizes;
    }

    private List<Size> getRedmiNote9ProExcludedSizes(String cameraId, int imageFormat) {
        List<Size> sizes = new ArrayList<>();
        if (cameraId.equals("0") && imageFormat == 256) {
            sizes.add(new Size(9280, 6944));
        }
        return sizes;
    }

    private List<Size> getSamsungA05sExcludedSizes(int imageFormat) {
        List<Size> sizes = new ArrayList<>();
        if (imageFormat == 35) {
            sizes.add(new Size(3840, 2160));
            sizes.add(new Size(3264, 2448));
            sizes.add(new Size(3200, 2400));
            sizes.add(new Size(2688, 1512));
            sizes.add(new Size(2592, 1944));
            sizes.add(new Size(2592, 1940));
            sizes.add(new Size(1920, 1440));
        }
        return sizes;
    }

    private List<Size> getNokia7PlusExcludedSizes(int imageFormat) {
        List<Size> sizes = new ArrayList<>();
        if (imageFormat == 35) {
            sizes.add(new Size(4032, 3024));
            sizes.add(new Size(4000, 3000));
            sizes.add(new Size(3264, 2448));
            sizes.add(new Size(3200, 2400));
            sizes.add(new Size(3024, 3024));
            sizes.add(new Size(2976, 2976));
            sizes.add(new Size(2448, 2448));
        }
        return sizes;
    }
}
