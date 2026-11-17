package org.chromium.net;

import java.io.IOException;

/* loaded from: classes17.dex */
public abstract class CronetException extends IOException {
    protected CronetException(String message, Throwable cause) {
        super(message, cause);
    }
}
