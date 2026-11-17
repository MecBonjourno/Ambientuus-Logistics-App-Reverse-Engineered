package org.chromium.net;

import android.net.Uri;
import android.webkit.MimeTypeMap;
import androidx.credentials.exceptions.publickeycredential.DomExceptionUtils;
import java.io.File;
import java.io.FileFilter;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

/* loaded from: classes17.dex */
public class MimeTypeFilter implements FileFilter {
    private boolean mAcceptAllMimeTypes;
    private boolean mAcceptDirectory;
    private MimeTypeMap mMimeTypeMap;
    private HashSet<String> mExtensions = new HashSet<>();
    private HashSet<String> mMimeTypes = new HashSet<>();
    private HashSet<String> mMimeSupertypes = new HashSet<>();

    public MimeTypeFilter(List<String> mimeTypes, boolean acceptDirectory) {
        Iterator<String> it = mimeTypes.iterator();
        while (it.hasNext()) {
            String field = it.next().trim().toLowerCase(Locale.US);
            if (field.startsWith(".")) {
                this.mExtensions.add(field.substring(1));
            } else if (field.equals("*/*")) {
                this.mAcceptAllMimeTypes = true;
            } else if (field.endsWith("/*")) {
                this.mMimeSupertypes.add(field.substring(0, field.length() - 2));
            } else if (field.contains(DomExceptionUtils.SEPARATOR)) {
                this.mMimeTypes.add(field);
            }
        }
        this.mMimeTypeMap = MimeTypeMap.getSingleton();
        this.mAcceptDirectory = acceptDirectory;
    }

    public boolean accept(Uri uri, String mimeType) {
        if (uri != null) {
            String fileExtension = MimeTypeMap.getFileExtensionFromUrl(uri.toString()).toLowerCase(Locale.US);
            if (this.mExtensions.contains(fileExtension)) {
                return true;
            }
            if (mimeType == null) {
                mimeType = getMimeTypeFromExtension(fileExtension);
            }
        }
        if (mimeType != null) {
            if (this.mAcceptAllMimeTypes || this.mMimeTypes.contains(mimeType) || this.mMimeSupertypes.contains(getMimeSupertype(mimeType))) {
                return true;
            }
            return false;
        }
        return false;
    }

    @Override // java.io.FileFilter
    public boolean accept(File file) {
        if (file.isDirectory()) {
            return this.mAcceptDirectory;
        }
        return accept(Uri.fromFile(file), null);
    }

    private String getMimeTypeFromExtension(String ext) {
        String mimeType = this.mMimeTypeMap.getMimeTypeFromExtension(ext);
        if (mimeType != null) {
            return mimeType.toLowerCase(Locale.US);
        }
        return null;
    }

    private static String getMimeSupertype(String mimeType) {
        return mimeType.split(DomExceptionUtils.SEPARATOR, 2)[0];
    }
}
