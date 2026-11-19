package androidx.camera.video;

import android.location.Location;
import android.os.ParcelFileDescriptor;
import androidx.camera.video.AutoValue_FileDescriptorOutputOptions_FileDescriptorOutputOptionsInternal;
import androidx.camera.video.OutputOptions;
import androidx.core.util.Preconditions;

/* carregado de: classes.dex */
public final class FileDescriptorOutputOptions extends OutputOptions {
    private final FileDescriptorOutputOptionsInternal mFileDescriptorOutputOptionsInternal;

    FileDescriptorOutputOptions(FileDescriptorOutputOptionsInternal fileDescriptorOutputOptionsInternal) {
        super(fileDescriptorOutputOptionsInternal);
        this.mFileDescriptorOutputOptionsInternal = fileDescriptorOutputOptionsInternal;
    }

    public ParcelFileDescriptor getParcelFileDescriptor() {
        return this.mFileDescriptorOutputOptionsInternal.getParcelFileDescriptor();
    }

    public String toString() {
        return this.mFileDescriptorOutputOptionsInternal.toString().replaceFirst("FileDescriptorOutputOptionsInternal", "FileDescriptorOutputOptions");
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof FileDescriptorOutputOptions)) {
            return false;
        }
        return this.mFileDescriptorOutputOptionsInternal.equals(((FileDescriptorOutputOptions) o).mFileDescriptorOutputOptionsInternal);
    }

    public int hashCode() {
        return this.mFileDescriptorOutputOptionsInternal.hashCode();
    }

    public static final class Builder extends OutputOptions.Builder<FileDescriptorOutputOptions, Builder> {
        private final FileDescriptorOutputOptionsInternal.Builder mInternalBuilder;

        /* JADX WARN: falha na inferência de tipo para: r1v1, types: [androidx.camera.video.FileDescriptorOutputOptions$Builder, java.lang.Object] */
        @Override // androidx.camera.video.OutputOptions.Builder
        public /* bridge */ /* sintético */ Builder setDurationLimitMillis(long j) {
            return super.setDurationLimitMillis(j);
        }

        /* JADX WARN: falha na inferência de tipo para: r1v1, types: [androidx.camera.video.FileDescriptorOutputOptions$Builder, java.lang.Object] */
        @Override // androidx.camera.video.OutputOptions.Builder
        public /* bridge */ /* sintético */ Builder setFileSizeLimit(long j) {
            return super.setFileSizeLimit(j);
        }

        /* JADX WARN: falha na inferência de tipo para: r1v1, types: [androidx.camera.video.FileDescriptorOutputOptions$Builder, java.lang.Object] */
        @Override // androidx.camera.video.OutputOptions.Builder
        public /* bridge */ /* sintético */ Builder setLocation(Location location) {
            return super.setLocation(location);
        }

        public Builder(ParcelFileDescriptor fileDescriptor) {
            super(new AutoValue_FileDescriptorOutputOptions_FileDescriptorOutputOptionsInternal.Builder());
            Preconditions.checkNotNull(fileDescriptor, "File descriptor can't be null.");
            this.mInternalBuilder = (FileDescriptorOutputOptionsInternal.Builder) this.mRootInternalBuilder;
            this.mInternalBuilder.setParcelFileDescriptor(fileDescriptor);
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        @Override // androidx.camera.video.OutputOptions.Builder
        public FileDescriptorOutputOptions build() {
            return new FileDescriptorOutputOptions(this.mInternalBuilder.build());
        }
    }

    static abstract class FileDescriptorOutputOptionsInternal extends OutputOptions.OutputOptionsInternal {
        abstract ParcelFileDescriptor getParcelFileDescriptor();

        FileDescriptorOutputOptionsInternal() {
        }

        static abstract class Builder extends OutputOptions.OutputOptionsInternal.Builder<Builder> {
            /* JADX INFO: modificadores de acesso alterados de: package-private */
            @Override // androidx.camera.video.OutputOptions.OutputOptionsInternal.Builder
            public abstract FileDescriptorOutputOptionsInternal build();

            abstract Builder setParcelFileDescriptor(ParcelFileDescriptor parcelFileDescriptor);

            Builder() {
            }
        }
    }
}
