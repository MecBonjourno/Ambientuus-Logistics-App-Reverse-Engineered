package com.google.api.client.googleapis.testing;

import com.google.common.base.Splitter;
import com.google.common.collect.Lists;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import kotlin.text.Typography;

/* carregado de: classes16.dex */
public final class TestUtils {
    private static final String UTF_8 = "UTF-8";

    public static Map<String, String> parseQuery(String query) throws IOException {
        Map<String, String> map = new HashMap<>();
        Iterable<String> entries = Splitter.on(Typography.amp).split(query);
        for (String entry : entries) {
            List<String> sides = Lists.newArrayList(Splitter.on('=').split(entry));
            if (sides.size() != 2) {
                throw new IOException("Invalid Query String");
            }
            String key = URLDecoder.decode(sides.get(0), "UTF-8");
            String value = URLDecoder.decode(sides.get(1), "UTF-8");
            map.put(key, value);
        }
        return map;
    }

    private TestUtils() {
    }
}
