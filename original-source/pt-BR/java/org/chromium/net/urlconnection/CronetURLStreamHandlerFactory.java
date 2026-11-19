package org.chromium.net.urlconnection;

import java.net.URLStreamHandler;
import java.net.URLStreamHandlerFactory;
import org.chromium.net.ExperimentalCronetEngine;

/* carregado de: classes17.dex */
public class CronetURLStreamHandlerFactory implements URLStreamHandlerFactory {
    private final ExperimentalCronetEngine mCronetEngine;

    public CronetURLStreamHandlerFactory(ExperimentalCronetEngine cronetEngine) {
        if (cronetEngine == null) {
            throw new NullPointerException("CronetEngine is null.");
        }
        this.mCronetEngine = cronetEngine;
    }

    @Override // java.net.URLStreamHandlerFactory
    public URLStreamHandler createURLStreamHandler(String protocol) {
        if ("http".equals(protocol) || "https".equals(protocol)) {
            return new CronetHttpURLStreamHandler(this.mCronetEngine);
        }
        return null;
    }
}
