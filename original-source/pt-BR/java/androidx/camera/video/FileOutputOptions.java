package androidx.camera.video;

import android.location.Location;
import androidx.camera.video.AutoValue_FileOutputOptions_FileOutputOptionsInternal;
import androidx.camera.video.OutputOptions;
import androidx.core.util.Preconditions;
import java.io.File;

/* carregado de: classes.dex */
public final class FileOutputOptions extends OutputOptions {
    private final FileOutputOptionsInternal mFileOutputOptionsInternal;

    FileOutputOptions(FileOutputOptionsInternal fileOutputOptionsInternal) {
        super(fileOutputOptionsInternal);
        this.mFileOutputOptionsInternal = fileOutputOptionsInternal;
    }

    public File getFile() {
        return this.mFileOutputOptionsInternal.getFile();
    }

    public String toString() {
        return this.mFileOutputOptionsInternal.toString().replaceFirst("FileOutputOptionsInternal", "FileOutputOptions");
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof FileOutputOptions)) {
            return false;
        }
        return this.mFileOutputOptionsInternal.equals(((FileOutputOptions) o).mFileOutputOptionsInternal);
    }

    public int hashCode() {
        return this.mFileOutputOptionsInternal.hashCode();
    }

    public static final class Builder extends OutputOptions.Builder<FileOutputOptions, Builder> {
        private final FileOutputOptionsInternal.Builder mInternalBuilder;

        /* JADX WARN: falha na inferência de tipo para: r1v1, types: [androidx.camera.video.FileOutputOptions$Builder, java.lang.Object] */
        @Override // androidx.camera.video.OutputOptions.Builder
        public /* bridge */ /* sintético */ Builder setDurationLimitMillis(long j) {
            return super.setDurationLimitMillis(j);
        }

        /* JADX WARN: falha na inferência de tipo para: r1v1, types: [androidx.camera.video.FileOutputOptions$Builder, java.lang.Object] */
        @Override // androidx.camera.video.OutputOptions.Builder
        public /* bridge */ /* sintético */ Builder setFileSizeLimit(long j) {
            return super.setFileSizeLimit(j);
        }

        /* JADX WARN: falha na inferência de tipo para: r1v1, types: [androidx.camera.video.FileOutputOptions$Builder, java.lang.Object] */
        @Override // androidx.camera.video.OutputOptions.Builder
        public /* bridge */ /* sintético */ Builder setLocation(Location location) {
            return super.setLocation(location);
        }

        public Builder(File file) {
            super(new AutoValue_FileOutputOptions_FileOutputOptionsInternal.Builder());
            Preconditions.checkNotNull(file, "File can't be null.");
            this.mInternalBuilder = (FileOutputOptionsInternal.Builder) this.mRootInternalBuilder;
            this.mInternalBuilder.setFile(file);
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        @Override // androidx.camera.video.OutputOptions.Builder
        public FileOutputOptions build() {
            return new FileOutputOptions(this.mInternalBuilder.build());
        }
    }

    static abstract class FileOutputOptionsInternal extends OutputOptions.OutputOptionsInternal {
        abstract File getFile();

        FileOutputOptionsInternal() {
        }

        static abstract class Builder extends OutputOptions.OutputOptionsInternal.Builder<Builder> {
            /* JADX INFO: modificadores de acesso alterados de: package-private */
            @Override // androidx.camera.video.OutputOptions.OutputOptionsInternal.Builder
            public abstract FileOutputOptionsInternal build();

            abstract Builder setFile(File file);

            Builder() {
            }
        }
    }
}
