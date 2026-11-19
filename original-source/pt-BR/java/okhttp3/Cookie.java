package okhttp3;

import androidx.credentials.CredentialOption;
import androidx.credentials.exceptions.publickeycredential.DomExceptionUtils;
import com.google.common.net.HttpHeaders;
import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.annotation.Nullable;
import okhttp3.internal.Util;
import okhttp3.internal.http.HttpDate;
import okhttp3.internal.publicsuffix.PublicSuffixDatabase;

/* carregado de: classes17.dex */
public final class Cookie {
    private final String domain;
    private final long expiresAt;
    private final boolean hostOnly;
    private final boolean httpOnly;
    private final String name;
    private final String path;
    private final boolean persistent;
    private final boolean secure;
    private final String value;
    private static final Pattern YEAR_PATTERN = Pattern.compile("(\\d{2,4})[^\\d]*");
    private static final Pattern MONTH_PATTERN = Pattern.compile("(?i)(jan|feb|mar|apr|may|jun|jul|aug|sep|oct|nov|dec).*");
    private static final Pattern DAY_OF_MONTH_PATTERN = Pattern.compile("(\\d{1,2})[^\\d]*");
    private static final Pattern TIME_PATTERN = Pattern.compile("(\\d{1,2}):(\\d{1,2}):(\\d{1,2})[^\\d]*");

    private Cookie(String name, String value, long expiresAt, String domain, String path, boolean secure, boolean httpOnly, boolean hostOnly, boolean persistent) {
        this.name = name;
        this.value = value;
        this.expiresAt = expiresAt;
        this.domain = domain;
        this.path = path;
        this.secure = secure;
        this.httpOnly = httpOnly;
        this.hostOnly = hostOnly;
        this.persistent = persistent;
    }

    Cookie(Builder builder) {
        if (builder.name == null) {
            throw new NullPointerException("builder.name == null");
        }
        if (builder.value == null) {
            throw new NullPointerException("builder.value == null");
        }
        if (builder.domain == null) {
            throw new NullPointerException("builder.domain == null");
        }
        this.name = builder.name;
        this.value = builder.value;
        this.expiresAt = builder.expiresAt;
        this.domain = builder.domain;
        this.path = builder.path;
        this.secure = builder.secure;
        this.httpOnly = builder.httpOnly;
        this.persistent = builder.persistent;
        this.hostOnly = builder.hostOnly;
    }

    public String name() {
        return this.name;
    }

    public String value() {
        return this.value;
    }

    public boolean persistent() {
        return this.persistent;
    }

    public long expiresAt() {
        return this.expiresAt;
    }

    public boolean hostOnly() {
        return this.hostOnly;
    }

    public String domain() {
        return this.domain;
    }

    public String path() {
        return this.path;
    }

    public boolean httpOnly() {
        return this.httpOnly;
    }

    public boolean secure() {
        return this.secure;
    }

    public boolean matches(HttpUrl url) {
        boolean domainMatch;
        if (this.hostOnly) {
            domainMatch = url.host().equals(this.domain);
        } else {
            domainMatch = domainMatch(url.host(), this.domain);
        }
        if (!domainMatch || !pathMatch(url, this.path)) {
            return false;
        }
        if (this.secure && !url.isHttps()) {
            return false;
        }
        return true;
    }

    private static boolean domainMatch(String urlHost, String domain) {
        if (urlHost.equals(domain)) {
            return true;
        }
        return urlHost.endsWith(domain) && urlHost.charAt((urlHost.length() - domain.length()) - 1) == '.' && !Util.verifyAsIpAddress(urlHost);
    }

    private static boolean pathMatch(HttpUrl url, String path) {
        String urlPath = url.encodedPath();
        if (urlPath.equals(path)) {
            return true;
        }
        if (urlPath.startsWith(path)) {
            return path.endsWith(DomExceptionUtils.SEPARATOR) || urlPath.charAt(path.length()) == '/';
        }
        return false;
    }

    @Nullable
    public static Cookie parse(HttpUrl url, String setCookie) {
        return parse(System.currentTimeMillis(), url, setCookie);
    }

    @Nullable
    static Cookie parse(long currentTimeMillis, HttpUrl url, String setCookie) {
        long deltaMilliseconds;
        String str;
        int limit;
        String attributeValue = setCookie;
        int limit2 = attributeValue.length();
        char c = ';';
        int cookiePairEnd = Util.delimiterOffset(attributeValue, 0, limit2, ';');
        char c2 = '=';
        int pairEqualsSign = Util.delimiterOffset(attributeValue, 0, cookiePairEnd, '=');
        Cookie cookie = null;
        if (pairEqualsSign == cookiePairEnd) {
            return null;
        }
        String cookieName = Util.trimSubstring(attributeValue, 0, pairEqualsSign);
        if (!cookieName.isEmpty() && Util.indexOfControlOrNonAscii(cookieName) == -1) {
            String cookieValue = Util.trimSubstring(attributeValue, pairEqualsSign + 1, cookiePairEnd);
            if (Util.indexOfControlOrNonAscii(cookieValue) != -1) {
                return null;
            }
            String domain = null;
            String path = null;
            boolean secureOnly = false;
            boolean httpOnly = false;
            boolean hostOnly = true;
            int pos = cookiePairEnd + 1;
            boolean persistent = false;
            long deltaSeconds = -1;
            long expiresAt = 253402300799999L;
            int pos2 = pos;
            while (pos2 < limit2) {
                Cookie cookie2 = cookie;
                int attributePairEnd = Util.delimiterOffset(attributeValue, pos2, limit2, c);
                int attributeEqualsSign = Util.delimiterOffset(attributeValue, pos2, attributePairEnd, c2);
                String attributeName = Util.trimSubstring(attributeValue, pos2, attributeEqualsSign);
                if (attributeEqualsSign < attributePairEnd) {
                    str = Util.trimSubstring(attributeValue, attributeEqualsSign + 1, attributePairEnd);
                } else {
                    str = "";
                }
                String attributeValue2 = str;
                if (attributeName.equalsIgnoreCase("expires")) {
                    try {
                        int length = attributeValue2.length();
                        limit = limit2;
                        try {
                            long expiresAt2 = parseExpires(attributeValue2, 0, length);
                            persistent = true;
                            expiresAt = expiresAt2;
                        } catch (IllegalArgumentException e) {
                        }
                    } catch (IllegalArgumentException e2) {
                        limit = limit2;
                    }
                } else {
                    limit = limit2;
                    if (attributeName.equalsIgnoreCase("max-age")) {
                        try {
                            long deltaSeconds2 = parseMaxAge(attributeValue2);
                            persistent = true;
                            deltaSeconds = deltaSeconds2;
                        } catch (NumberFormatException e3) {
                        }
                    } else if (attributeName.equalsIgnoreCase("domain")) {
                        try {
                            String domain2 = parseDomain(attributeValue2);
                            domain = domain2;
                            hostOnly = false;
                        } catch (IllegalArgumentException e4) {
                        }
                    } else if (attributeName.equalsIgnoreCase("path")) {
                        path = attributeValue2;
                    } else if (attributeName.equalsIgnoreCase("secure")) {
                        secureOnly = true;
                    } else if (attributeName.equalsIgnoreCase("httponly")) {
                        httpOnly = true;
                    }
                }
                pos2 = attributePairEnd + 1;
                attributeValue = setCookie;
                cookie = cookie2;
                limit2 = limit;
                c = ';';
                c2 = '=';
            }
            Cookie cookie3 = cookie;
            if (deltaSeconds == Long.MIN_VALUE) {
                expiresAt = Long.MIN_VALUE;
            } else if (deltaSeconds != -1) {
                if (deltaSeconds <= 9223372036854775L) {
                    deltaMilliseconds = 1000 * deltaSeconds;
                } else {
                    deltaMilliseconds = Long.MAX_VALUE;
                }
                expiresAt = currentTimeMillis + deltaMilliseconds;
                if (expiresAt < currentTimeMillis || expiresAt > HttpDate.MAX_DATE) {
                    expiresAt = HttpDate.MAX_DATE;
                }
            }
            String urlHost = url.host();
            if (domain == null) {
                domain = urlHost;
            } else if (!domainMatch(urlHost, domain)) {
                return cookie3;
            }
            if (urlHost.length() != domain.length() && PublicSuffixDatabase.get().getEffectiveTldPlusOne(domain) == null) {
                return cookie3;
            }
            String str2 = DomExceptionUtils.SEPARATOR;
            if (path == null || !path.startsWith(DomExceptionUtils.SEPARATOR)) {
                String encodedPath = url.encodedPath();
                int lastSlash = encodedPath.lastIndexOf(47);
                if (lastSlash != 0) {
                    str2 = encodedPath.substring(0, lastSlash);
                }
                path = str2;
            }
            boolean hostOnly2 = hostOnly;
            boolean hostOnly3 = persistent;
            String domain3 = domain;
            String domain4 = path;
            boolean secureOnly2 = secureOnly;
            boolean secureOnly3 = httpOnly;
            return new Cookie(cookieName, cookieValue, expiresAt, domain3, domain4, secureOnly2, secureOnly3, hostOnly2, hostOnly3);
        }
        return null;
    }

    private static long parseExpires(String s, int pos, int limit) {
        int pos2 = dateCharacterOffset(s, pos, limit, false);
        int hour = -1;
        int minute = -1;
        int second = -1;
        int dayOfMonth = -1;
        int month = -1;
        int year = -1;
        Matcher matcher = TIME_PATTERN.matcher(s);
        while (pos2 < limit) {
            int end = dateCharacterOffset(s, pos2 + 1, limit, true);
            matcher.region(pos2, end);
            if (hour == -1 && matcher.usePattern(TIME_PATTERN).matches()) {
                hour = Integer.parseInt(matcher.group(1));
                minute = Integer.parseInt(matcher.group(2));
                second = Integer.parseInt(matcher.group(3));
            } else if (dayOfMonth == -1 && matcher.usePattern(DAY_OF_MONTH_PATTERN).matches()) {
                dayOfMonth = Integer.parseInt(matcher.group(1));
            } else if (month == -1 && matcher.usePattern(MONTH_PATTERN).matches()) {
                String monthString = matcher.group(1).toLowerCase(Locale.US);
                int month2 = MONTH_PATTERN.pattern().indexOf(monthString) / 4;
                month = month2;
            } else if (year == -1 && matcher.usePattern(YEAR_PATTERN).matches()) {
                year = Integer.parseInt(matcher.group(1));
            }
            pos2 = dateCharacterOffset(s, end + 1, limit, false);
        }
        if (year >= 70 && year <= 99) {
            year += 1900;
        }
        if (year >= 0 && year <= 69) {
            year += CredentialOption.PRIORITY_DEFAULT;
        }
        if (year < 1601) {
            throw new IllegalArgumentException();
        }
        if (month == -1) {
            throw new IllegalArgumentException();
        }
        if (dayOfMonth < 1 || dayOfMonth > 31) {
            throw new IllegalArgumentException();
        }
        if (hour < 0 || hour > 23) {
            throw new IllegalArgumentException();
        }
        if (minute < 0 || minute > 59) {
            throw new IllegalArgumentException();
        }
        if (second < 0 || second > 59) {
            throw new IllegalArgumentException();
        }
        Calendar calendar = new GregorianCalendar(Util.UTC);
        calendar.setLenient(false);
        calendar.set(1, year);
        calendar.set(2, month - 1);
        calendar.set(5, dayOfMonth);
        calendar.set(11, hour);
        calendar.set(12, minute);
        calendar.set(13, second);
        calendar.set(14, 0);
        return calendar.getTimeInMillis();
    }

    private static int dateCharacterOffset(String input, int pos, int limit, boolean invert) {
        for (int i = pos; i < limit; i++) {
            int c = input.charAt(i);
            boolean dateCharacter = (c < 32 && c != 9) || c >= 127 || (c >= 48 && c <= 57) || ((c >= 97 && c <= 122) || ((c >= 65 && c <= 90) || c == 58));
            if (dateCharacter == (!invert)) {
                return i;
            }
        }
        return limit;
    }

    private static long parseMaxAge(String s) {
        try {
            long parsed = Long.parseLong(s);
            if (parsed <= 0) {
                return Long.MIN_VALUE;
            }
            return parsed;
        } catch (NumberFormatException e) {
            if (s.matches("-?\\d+")) {
                return s.startsWith("-") ? Long.MIN_VALUE : Long.MAX_VALUE;
            }
            throw e;
        }
    }

    private static String parseDomain(String s) {
        if (s.endsWith(".")) {
            throw new IllegalArgumentException();
        }
        if (s.startsWith(".")) {
            s = s.substring(1);
        }
        String canonicalDomain = Util.canonicalizeHost(s);
        if (canonicalDomain == null) {
            throw new IllegalArgumentException();
        }
        return canonicalDomain;
    }

    public static List<Cookie> parseAll(HttpUrl url, Headers headers) {
        List<String> cookieStrings = headers.values(HttpHeaders.SET_COOKIE);
        List<Cookie> cookies = null;
        int size = cookieStrings.size();
        for (int i = 0; i < size; i++) {
            Cookie cookie = parse(url, cookieStrings.get(i));
            if (cookie != null) {
                if (cookies == null) {
                    cookies = new ArrayList<>();
                }
                cookies.add(cookie);
            }
        }
        if (cookies != null) {
            return DesugarCollections.unmodifiableList(cookies);
        }
        return Collections.emptyList();
    }

    public static final class Builder {

        @Nullable
        String domain;
        boolean hostOnly;
        boolean httpOnly;

        @Nullable
        String name;
        boolean persistent;
        boolean secure;

        @Nullable
        String value;
        long expiresAt = HttpDate.MAX_DATE;
        String path = DomExceptionUtils.SEPARATOR;

        public Builder name(String name) {
            if (name == null) {
                throw new NullPointerException("name == null");
            }
            if (!name.trim().equals(name)) {
                throw new IllegalArgumentException("name is not trimmed");
            }
            this.name = name;
            return this;
        }

        public Builder value(String value) {
            if (value == null) {
                throw new NullPointerException("value == null");
            }
            if (!value.trim().equals(value)) {
                throw new IllegalArgumentException("value is not trimmed");
            }
            this.value = value;
            return this;
        }

        public Builder expiresAt(long expiresAt) {
            if (expiresAt <= 0) {
                expiresAt = Long.MIN_VALUE;
            }
            if (expiresAt > HttpDate.MAX_DATE) {
                expiresAt = HttpDate.MAX_DATE;
            }
            this.expiresAt = expiresAt;
            this.persistent = true;
            return this;
        }

        public Builder domain(String domain) {
            return domain(domain, false);
        }

        public Builder hostOnlyDomain(String domain) {
            return domain(domain, true);
        }

        private Builder domain(String domain, boolean hostOnly) {
            if (domain == null) {
                throw new NullPointerException("domain == null");
            }
            String canonicalDomain = Util.canonicalizeHost(domain);
            if (canonicalDomain == null) {
                throw new IllegalArgumentException("unexpected domain: " + domain);
            }
            this.domain = canonicalDomain;
            this.hostOnly = hostOnly;
            return this;
        }

        public Builder path(String path) {
            if (!path.startsWith(DomExceptionUtils.SEPARATOR)) {
                throw new IllegalArgumentException("path must start with '/'");
            }
            this.path = path;
            return this;
        }

        public Builder secure() {
            this.secure = true;
            return this;
        }

        public Builder httpOnly() {
            this.httpOnly = true;
            return this;
        }

        public Cookie build() {
            return new Cookie(this);
        }
    }

    public String toString() {
        return toString(false);
    }

    String toString(boolean forObsoleteRfc2965) {
        StringBuilder result = new StringBuilder();
        result.append(this.name);
        result.append('=');
        result.append(this.value);
        if (this.persistent) {
            if (this.expiresAt == Long.MIN_VALUE) {
                result.append("; max-age=0");
            } else {
                result.append("; expires=").append(HttpDate.format(new Date(this.expiresAt)));
            }
        }
        if (!this.hostOnly) {
            result.append("; domain=");
            if (forObsoleteRfc2965) {
                result.append(".");
            }
            result.append(this.domain);
        }
        result.append("; path=").append(this.path);
        if (this.secure) {
            result.append("; secure");
        }
        if (this.httpOnly) {
            result.append("; httponly");
        }
        return result.toString();
    }

    public boolean equals(@Nullable Object other) {
        if (!(other instanceof Cookie)) {
            return false;
        }
        Cookie that = (Cookie) other;
        return that.name.equals(this.name) && that.value.equals(this.value) && that.domain.equals(this.domain) && that.path.equals(this.path) && that.expiresAt == this.expiresAt && that.secure == this.secure && that.httpOnly == this.httpOnly && that.persistent == this.persistent && that.hostOnly == this.hostOnly;
    }

    public int hashCode() {
        return (((((((((((((((((17 * 31) + this.name.hashCode()) * 31) + this.value.hashCode()) * 31) + this.domain.hashCode()) * 31) + this.path.hashCode()) * 31) + ((int) (this.expiresAt ^ (this.expiresAt >>> 32)))) * 31) + (!this.secure ? 1 : 0)) * 31) + (!this.httpOnly ? 1 : 0)) * 31) + (!this.persistent ? 1 : 0)) * 31) + (!this.hostOnly ? 1 : 0);
    }
}
