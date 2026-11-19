package org.apache.commons.lang;

import org.apache.commons.lang.exception.NestableRuntimeException;

/* carregado de: classes17.dex */
public class UnhandledException extends NestableRuntimeException {
    private static final long serialVersionUID = 1832101364842773720L;

    public UnhandledException(Throwable cause) {
        super(cause);
    }

    public UnhandledException(String message, Throwable cause) {
        super(message, cause);
    }
}
