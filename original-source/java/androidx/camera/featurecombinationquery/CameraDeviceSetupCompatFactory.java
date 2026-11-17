package androidx.camera.featurecombinationquery;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.ServiceInfo;
import android.hardware.camera2.CameraAccessException;
import android.os.Build;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes.dex */
public class CameraDeviceSetupCompatFactory {
    private static final String PLAY_SERVICES_IMPL_KEY = "androidx.camera.featurecombinationquery.PLAY_SERVICES_IMPL_PROVIDER_KEY";
    private CameraDeviceSetupCompatProvider mCamera2Provider;
    private final Context mContext;
    private CameraDeviceSetupCompatProvider mPlayServicesProvider;

    public CameraDeviceSetupCompatFactory(Context context) {
        this.mContext = context;
        if (Build.VERSION.SDK_INT >= 35) {
            this.mCamera2Provider = new Camera2CameraDeviceSetupCompatProvider(this.mContext);
        }
        this.mPlayServicesProvider = getPlayServicesCameraDeviceSetupCompatProvider();
    }

    public CameraDeviceSetupCompat getCameraDeviceSetupCompat(String cameraId) throws CameraAccessException {
        List<CameraDeviceSetupCompat> impls = new ArrayList<>();
        if (this.mPlayServicesProvider != null) {
            impls.add(this.mPlayServicesProvider.getCameraDeviceSetupCompat(cameraId));
        }
        if (this.mCamera2Provider != null) {
            try {
                impls.add(this.mCamera2Provider.getCameraDeviceSetupCompat(cameraId));
            } catch (UnsupportedOperationException e) {
            }
        }
        return new AggregatedCameraDeviceSetupCompat(impls);
    }

    private CameraDeviceSetupCompatProvider getPlayServicesCameraDeviceSetupCompatProvider() throws IllegalStateException {
        String className;
        try {
            PackageInfo packageInfo = this.mContext.getPackageManager().getPackageInfo(this.mContext.getPackageName(), 132);
            String playServiceImplClassName = null;
            if (packageInfo.services == null) {
                return null;
            }
            for (ServiceInfo serviceInfo : packageInfo.services) {
                if (serviceInfo.metaData != null && (className = serviceInfo.metaData.getString(PLAY_SERVICES_IMPL_KEY)) != null) {
                    if (playServiceImplClassName != null) {
                        throw new IllegalStateException("Multiple Play Services CameraDeviceSetupCompat implementations found in the manifest.");
                    }
                    playServiceImplClassName = className;
                }
            }
            if (playServiceImplClassName == null) {
                return null;
            }
            return instantiatePlayServicesImplProvider(playServiceImplClassName);
        } catch (PackageManager.NameNotFoundException e) {
            return null;
        }
    }

    private CameraDeviceSetupCompatProvider instantiatePlayServicesImplProvider(String className) {
        try {
            Class<?> clazz = Class.forName(className);
            return (CameraDeviceSetupCompatProvider) clazz.getConstructor(Context.class).newInstance(this.mContext);
        } catch (Exception e) {
            throw new IllegalStateException("Failed to instantiate Play Services CameraDeviceSetupCompat implementation", e);
        }
    }
}
