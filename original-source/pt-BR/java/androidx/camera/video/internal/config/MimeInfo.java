package androidx.camera.video.internal.config;

/* carregado de: classes.dex */
public abstract class MimeInfo {

    public static abstract class Builder<B> {
        public abstract MimeInfo build();

        protected abstract B setMimeType(String str);

        public abstract B setProfile(int i);
    }

    public abstract String getMimeType();

    public abstract int getProfile();
}
