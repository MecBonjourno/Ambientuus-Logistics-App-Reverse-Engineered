package org.chromium.net.apihelpers;

import java.nio.charset.Charset;
import java.util.List;
import java.util.Map;
import org.chromium.net.UrlResponseInfo;
import org.chromium.net.apihelpers.ContentTypeParametersParser;

/* carregado de: classes17.dex */
public abstract class StringCronetCallback extends InMemoryTransformCronetCallback<String> {
    private static final String CONTENT_TYPE_HEADER_NAME = "Content-Type";

    StringCronetCallback() {
    }

    @Override // org.chromium.net.apihelpers.InMemoryTransformCronetCallback
    public StringCronetCallback addCompletionListener(CronetRequestCompletionListener<? super String> listener) {
        super.addCompletionListener((CronetRequestCompletionListener) listener);
        return this;
    }

    /* JADX INFO: modificadores de acesso alterados de: protected */
    @Override // org.chromium.net.apihelpers.InMemoryTransformCronetCallback
    public String transformBodyBytes(UrlResponseInfo info, byte[] bodyBytes) {
        return new String(bodyBytes, getCharsetFromHeaders(info));
    }

    private Charset getCharsetFromHeaders(UrlResponseInfo info) {
        List<String> contentTypeHeaders = info.getAllHeaders().get("Content-Type");
        String charset = null;
        for (String header : contentTypeHeaders) {
            ContentTypeParametersParser parser = new ContentTypeParametersParser(header);
            while (parser.hasMore()) {
                try {
                    Map.Entry<String, String> parameter = parser.getNextParameter();
                    parameter.getKey();
                    String parameterValue = parameter.getValue();
                    if (charset != null && !parameterValue.equalsIgnoreCase(charset)) {
                        throw new IllegalArgumentException("Multiple charsets provided: " + parameterValue + " and " + charset);
                    }
                    charset = parameterValue;
                } catch (ContentTypeParametersParser.ContentTypeParametersParserException e) {
                }
            }
        }
        if (charset != null) {
            return Charset.forName(charset);
        }
        return Charset.defaultCharset();
    }
}
