package androidx.camera.core.impl;

import androidx.camera.core.ImageInfo;

/* carregado de: classes.dex */
public interface ImageInfoProcessor {
    CaptureStage getCaptureStage();

    boolean process(ImageInfo imageInfo);
}
