package j$.sun.security.action;

import java.io.File;
import java.io.FileInputStream;
import java.security.PrivilegedExceptionAction;

/* carregado de: classes15.dex */
public class OpenFileInputStreamAction implements PrivilegedExceptionAction<FileInputStream> {
    private final File file;

    public OpenFileInputStreamAction(File file) {
        this.file = file;
    }

    public OpenFileInputStreamAction(String filename) {
        this.file = new File(filename);
    }

    /* JADX WARN: não é possível renomear o método para resolver a colisão */
    @Override // java.security.PrivilegedExceptionAction
    public FileInputStream run() {
        return new FileInputStream(this.file);
    }
}
