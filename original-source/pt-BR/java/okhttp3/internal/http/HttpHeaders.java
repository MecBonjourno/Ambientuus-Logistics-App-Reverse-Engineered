package okhttp3.internal.http;

import com.google.api.client.http.HttpMethods;
import j$.util.Objects;
import java.io.EOFException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import kotlin.io.encoding.Base64;
import okhttp3.Challenge;
import okhttp3.Cookie;
import okhttp3.CookieJar;
import okhttp3.Headers;
import okhttp3.HttpUrl;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.internal.Util;
import okio.Buffer;
import okio.ByteString;

/* carregado de: classes17.dex */
public final class HttpHeaders {
    private static final ByteString QUOTED_STRING_DELIMITERS = ByteString.encodeUtf8("\"\\");
    private static final ByteString TOKEN_DELIMITERS = ByteString.encodeUtf8("\t ,=");

    private HttpHeaders() {
    }

    public static long contentLength(Response response) {
        return contentLength(response.headers());
    }

    public static long contentLength(Headers headers) {
        return stringToLong(headers.get(com.google.common.net.HttpHeaders.CONTENT_LENGTH));
    }

    private static long stringToLong(String s) {
        if (s == null) {
            return -1L;
        }
        try {
            return Long.parseLong(s);
        } catch (NumberFormatException e) {
            return -1L;
        }
    }

    public static boolean varyMatches(Response cachedResponse, Headers cachedRequest, Request newRequest) {
        for (String field : varyFields(cachedResponse)) {
            if (!Objects.equals(cachedRequest.values(field), newRequest.headers(field))) {
                return false;
            }
        }
        return true;
    }

    public static boolean hasVaryAll(Response response) {
        return hasVaryAll(response.headers());
    }

    public static boolean hasVaryAll(Headers responseHeaders) {
        return varyFields(responseHeaders).contains("*");
    }

    private static Set<String> varyFields(Response response) {
        return varyFields(response.headers());
    }

    public static Set<String> varyFields(Headers responseHeaders) {
        Set<String> result = Collections.emptySet();
        int size = responseHeaders.size();
        for (int i = 0; i < size; i++) {
            if (com.google.common.net.HttpHeaders.VARY.equalsIgnoreCase(responseHeaders.name(i))) {
                String value = responseHeaders.value(i);
                if (result.isEmpty()) {
                    result = new TreeSet((Comparator<? super String>) String.CASE_INSENSITIVE_ORDER);
                }
                for (String varyField : value.split(",")) {
                    result.add(varyField.trim());
                }
            }
        }
        return result;
    }

    public static Headers varyHeaders(Response response) {
        Headers requestHeaders = response.networkResponse().request().headers();
        Headers responseHeaders = response.headers();
        return varyHeaders(requestHeaders, responseHeaders);
    }

    public static Headers varyHeaders(Headers requestHeaders, Headers responseHeaders) {
        Set<String> varyFields = varyFields(responseHeaders);
        if (varyFields.isEmpty()) {
            return Util.EMPTY_HEADERS;
        }
        Headers.Builder result = new Headers.Builder();
        int size = requestHeaders.size();
        for (int i = 0; i < size; i++) {
            String fieldName = requestHeaders.name(i);
            if (varyFields.contains(fieldName)) {
                result.add(fieldName, requestHeaders.value(i));
            }
        }
        return result.build();
    }

    public static List<Challenge> parseChallenges(Headers responseHeaders, String headerName) {
        List<Challenge> result = new ArrayList<>();
        for (int h = 0; h < responseHeaders.size(); h++) {
            if (headerName.equalsIgnoreCase(responseHeaders.name(h))) {
                Buffer header = new Buffer().writeUtf8(responseHeaders.value(h));
                parseChallengeHeader(result, header);
            }
        }
        return result;
    }

    private static void parseChallengeHeader(List<Challenge> result, Buffer header) {
        String parameterValue;
        String peek = null;
        while (true) {
            if (peek == null) {
                skipWhitespaceAndCommas(header);
                peek = readToken(header);
                if (peek == null) {
                    return;
                }
            }
            String schemeName = peek;
            boolean commaPrefixed = skipWhitespaceAndCommas(header);
            peek = readToken(header);
            if (peek == null) {
                if (header.exhausted()) {
                    result.add(new Challenge(schemeName, (Map<String, String>) Collections.emptyMap()));
                    return;
                }
                return;
            }
            int eqCount = skipAll(header, Base64.padSymbol);
            boolean commaSuffixed = skipWhitespaceAndCommas(header);
            if (!commaPrefixed && (commaSuffixed || header.exhausted())) {
                result.add(new Challenge(schemeName, (Map<String, String>) Collections.singletonMap(null, peek + repeat('=', eqCount))));
                peek = null;
            } else {
                Map<String, String> parameters = new LinkedHashMap<>();
                int eqCount2 = eqCount + skipAll(header, Base64.padSymbol);
                while (true) {
                    if (peek == null) {
                        peek = readToken(header);
                        if (skipWhitespaceAndCommas(header)) {
                            break;
                        } else {
                            eqCount2 = skipAll(header, Base64.padSymbol);
                        }
                    }
                    if (eqCount2 == 0) {
                        break;
                    }
                    if (eqCount2 > 1 || skipWhitespaceAndCommas(header)) {
                        return;
                    }
                    if (!header.exhausted() && header.getByte(0L) == 34) {
                        parameterValue = readQuotedString(header);
                    } else {
                        parameterValue = readToken(header);
                    }
                    if (parameterValue == null) {
                        return;
                    }
                    String replaced = parameters.put(peek, parameterValue);
                    peek = null;
                    if (replaced != null) {
                        return;
                    }
                    if (!skipWhitespaceAndCommas(header) && !header.exhausted()) {
                        return;
                    }
                }
                result.add(new Challenge(schemeName, parameters));
            }
        }
    }

    private static boolean skipWhitespaceAndCommas(Buffer buffer) {
        boolean commaFound = false;
        while (!buffer.exhausted()) {
            byte b = buffer.getByte(0L);
            if (b == 44) {
                buffer.readByte();
                commaFound = true;
            } else {
                if (b != 32 && b != 9) {
                    break;
                }
                buffer.readByte();
            }
        }
        return commaFound;
    }

    private static int skipAll(Buffer buffer, byte b) {
        int count = 0;
        while (!buffer.exhausted() && buffer.getByte(0L) == b) {
            count++;
            buffer.readByte();
        }
        return count;
    }

    private static String readQuotedString(Buffer buffer) {
        if (buffer.readByte() != 34) {
            throw new IllegalArgumentException();
        }
        Buffer result = new Buffer();
        while (true) {
            long i = buffer.indexOfElement(QUOTED_STRING_DELIMITERS);
            if (i == -1) {
                return null;
            }
            if (buffer.getByte(i) == 34) {
                result.write(buffer, i);
                buffer.readByte();
                return result.readUtf8();
            }
            if (buffer.size() == i + 1) {
                return null;
            }
            result.write(buffer, i);
            buffer.readByte();
            result.write(buffer, 1L);
        }
    }

    private static String readToken(Buffer buffer) {
        try {
            long tokenSize = buffer.indexOfElement(TOKEN_DELIMITERS);
            if (tokenSize == -1) {
                tokenSize = buffer.size();
            }
            if (tokenSize != 0) {
                return buffer.readUtf8(tokenSize);
            }
            return null;
        } catch (EOFException e) {
            throw new AssertionError();
        }
    }

    private static String repeat(char c, int count) {
        char[] array = new char[count];
        Arrays.fill(array, c);
        return new String(array);
    }

    public static void receiveHeaders(CookieJar cookieJar, HttpUrl url, Headers headers) {
        if (cookieJar == CookieJar.NO_COOKIES) {
            return;
        }
        List<Cookie> cookies = Cookie.parseAll(url, headers);
        if (cookies.isEmpty()) {
            return;
        }
        cookieJar.saveFromResponse(url, cookies);
    }

    public static boolean hasBody(Response response) {
        if (response.request().method().equals(HttpMethods.HEAD)) {
            return false;
        }
        int responseCode = response.code();
        return (((responseCode >= 100 && responseCode < 200) || responseCode == 204 || responseCode == 304) && contentLength(response) == -1 && !"chunked".equalsIgnoreCase(response.header(com.google.common.net.HttpHeaders.TRANSFER_ENCODING))) ? false : true;
    }

    public static int skipUntil(String input, int pos, String characters) {
        while (pos < input.length() && characters.indexOf(input.charAt(pos)) == -1) {
            pos++;
        }
        return pos;
    }

    public static int skipWhitespace(String input, int pos) {
        char c;
        while (pos < input.length() && ((c = input.charAt(pos)) == ' ' || c == '\t')) {
            pos++;
        }
        return pos;
    }

    public static int parseSeconds(String value, int defaultValue) {
        try {
            long seconds = Long.parseLong(value);
            if (seconds > 2147483647L) {
                return Integer.MAX_VALUE;
            }
            if (seconds < 0) {
                return 0;
            }
            return (int) seconds;
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }
}
