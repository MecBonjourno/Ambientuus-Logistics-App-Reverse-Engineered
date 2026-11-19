package org.apache.commons.lang;

/* carregado de: classes17.dex */
public class NullArgumentException extends IllegalArgumentException {
    private static final long serialVersionUID = 1174360235354917591L;

    public NullArgumentException(String argName) {
        super(new StringBuffer().append(argName == null ? "Argument" : argName).append(" must not be null.").toString());
    }
}
