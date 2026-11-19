package org.apache.commons.lang.time;

import androidx.appcompat.app.AppCompatDelegate;
import androidx.core.location.LocationRequestCompat;
import com.google.zxing.pdf417.PDF417Common;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.text.DateFormat;
import java.text.DateFormatSymbols;
import java.text.FieldPosition;
import java.text.Format;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;
import org.apache.commons.lang.Validate;

/* carregado de: classes17.dex */
public class FastDateFormat extends Format {
    public static final int FULL = 0;
    public static final int LONG = 1;
    public static final int MEDIUM = 2;
    public static final int SHORT = 3;
    private static String cDefaultPattern = null;
    private static final long serialVersionUID = 1;
    private final Locale mLocale;
    private final boolean mLocaleForced;
    private transient int mMaxLengthEstimate;
    private final String mPattern;
    private transient Rule[] mRules;
    private final TimeZone mTimeZone;
    private final boolean mTimeZoneForced;
    private static final Map cInstanceCache = new HashMap(7);
    private static final Map cDateInstanceCache = new HashMap(7);
    private static final Map cTimeInstanceCache = new HashMap(7);
    private static final Map cDateTimeInstanceCache = new HashMap(7);
    private static final Map cTimeZoneDisplayCache = new HashMap(7);

    private interface NumberRule extends Rule {
        void appendTo(StringBuffer stringBuffer, int i);
    }

    private interface Rule {
        void appendTo(StringBuffer stringBuffer, Calendar calendar);

        int estimateLength();
    }

    public static FastDateFormat getInstance() {
        return getInstance(getDefaultPattern(), null, null);
    }

    public static FastDateFormat getInstance(String pattern) {
        return getInstance(pattern, null, null);
    }

    public static FastDateFormat getInstance(String pattern, TimeZone timeZone) {
        return getInstance(pattern, timeZone, null);
    }

    public static FastDateFormat getInstance(String pattern, Locale locale) {
        return getInstance(pattern, null, locale);
    }

    public static synchronized FastDateFormat getInstance(String pattern, TimeZone timeZone, Locale locale) {
        FastDateFormat format;
        synchronized (FastDateFormat.class) {
            FastDateFormat emptyFormat = new FastDateFormat(pattern, timeZone, locale);
            format = (FastDateFormat) cInstanceCache.get(emptyFormat);
            if (format == null) {
                format = emptyFormat;
                format.init();
                cInstanceCache.put(format, format);
            }
        }
        return format;
    }

    public static FastDateFormat getDateInstance(int style) {
        return getDateInstance(style, null, null);
    }

    public static FastDateFormat getDateInstance(int style, Locale locale) {
        return getDateInstance(style, null, locale);
    }

    public static FastDateFormat getDateInstance(int style, TimeZone timeZone) {
        return getDateInstance(style, timeZone, null);
    }

    public static synchronized FastDateFormat getDateInstance(int style, TimeZone timeZone, Locale locale) {
        FastDateFormat format;
        synchronized (FastDateFormat.class) {
            Object key = new Integer(style);
            if (timeZone != null) {
                key = new Pair(key, timeZone);
            }
            if (locale == null) {
                locale = Locale.getDefault();
            }
            Pair pair = new Pair(key, locale);
            format = (FastDateFormat) cDateInstanceCache.get(pair);
            if (format == null) {
                try {
                    SimpleDateFormat formatter = (SimpleDateFormat) DateFormat.getDateInstance(style, locale);
                    String pattern = formatter.toPattern();
                    format = getInstance(pattern, timeZone, locale);
                    cDateInstanceCache.put(pair, format);
                } catch (ClassCastException e) {
                    throw new IllegalArgumentException(new StringBuffer().append("No date pattern for locale: ").append(locale).toString());
                }
            }
        }
        return format;
    }

    public static FastDateFormat getTimeInstance(int style) {
        return getTimeInstance(style, null, null);
    }

    public static FastDateFormat getTimeInstance(int style, Locale locale) {
        return getTimeInstance(style, null, locale);
    }

    public static FastDateFormat getTimeInstance(int style, TimeZone timeZone) {
        return getTimeInstance(style, timeZone, null);
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    /* JADX WARN: falha na inferência de tipo para: r2v5, types: [org.apache.commons.lang.time.FastDateFormat$Pair] */
    /* JADX WARN: falha na inferência de tipo para: r2v6, types: [org.apache.commons.lang.time.FastDateFormat$Pair] */
    public static synchronized FastDateFormat getTimeInstance(int style, TimeZone timeZone, Locale locale) {
        FastDateFormat format;
        synchronized (FastDateFormat.class) {
            Integer num = new Integer(style);
            if (timeZone != null) {
                num = new Pair(num, timeZone);
            }
            if (locale != null) {
                num = new Pair(num, locale);
            }
            format = (FastDateFormat) cTimeInstanceCache.get(num);
            if (format == null) {
                if (locale == null) {
                    locale = Locale.getDefault();
                }
                try {
                    SimpleDateFormat formatter = (SimpleDateFormat) DateFormat.getTimeInstance(style, locale);
                    String pattern = formatter.toPattern();
                    format = getInstance(pattern, timeZone, locale);
                    cTimeInstanceCache.put(num, format);
                } catch (ClassCastException e) {
                    throw new IllegalArgumentException(new StringBuffer().append("No date pattern for locale: ").append(locale).toString());
                }
            }
        }
        return format;
    }

    public static FastDateFormat getDateTimeInstance(int dateStyle, int timeStyle) {
        return getDateTimeInstance(dateStyle, timeStyle, null, null);
    }

    public static FastDateFormat getDateTimeInstance(int dateStyle, int timeStyle, Locale locale) {
        return getDateTimeInstance(dateStyle, timeStyle, null, locale);
    }

    public static FastDateFormat getDateTimeInstance(int dateStyle, int timeStyle, TimeZone timeZone) {
        return getDateTimeInstance(dateStyle, timeStyle, timeZone, null);
    }

    public static synchronized FastDateFormat getDateTimeInstance(int dateStyle, int timeStyle, TimeZone timeZone, Locale locale) {
        FastDateFormat format;
        synchronized (FastDateFormat.class) {
            Object key = new Pair(new Integer(dateStyle), new Integer(timeStyle));
            if (timeZone != null) {
                key = new Pair(key, timeZone);
            }
            if (locale == null) {
                locale = Locale.getDefault();
            }
            Pair pair = new Pair(key, locale);
            format = (FastDateFormat) cDateTimeInstanceCache.get(pair);
            if (format == null) {
                try {
                    SimpleDateFormat formatter = (SimpleDateFormat) DateFormat.getDateTimeInstance(dateStyle, timeStyle, locale);
                    String pattern = formatter.toPattern();
                    format = getInstance(pattern, timeZone, locale);
                    cDateTimeInstanceCache.put(pair, format);
                } catch (ClassCastException e) {
                    throw new IllegalArgumentException(new StringBuffer().append("No date time pattern for locale: ").append(locale).toString());
                }
            }
        }
        return format;
    }

    static synchronized String getTimeZoneDisplay(TimeZone tz, boolean daylight, int style, Locale locale) {
        String value;
        synchronized (FastDateFormat.class) {
            TimeZoneDisplayKey timeZoneDisplayKey = new TimeZoneDisplayKey(tz, daylight, style, locale);
            value = (String) cTimeZoneDisplayCache.get(timeZoneDisplayKey);
            if (value == null) {
                value = tz.getDisplayName(daylight, style, locale);
                cTimeZoneDisplayCache.put(timeZoneDisplayKey, value);
            }
        }
        return value;
    }

    private static synchronized String getDefaultPattern() {
        String str;
        synchronized (FastDateFormat.class) {
            if (cDefaultPattern == null) {
                cDefaultPattern = new SimpleDateFormat().toPattern();
            }
            str = cDefaultPattern;
        }
        return str;
    }

    protected FastDateFormat(String pattern, TimeZone timeZone, Locale locale) {
        if (pattern == null) {
            throw new IllegalArgumentException("The pattern must not be null");
        }
        this.mPattern = pattern;
        this.mTimeZoneForced = timeZone != null;
        this.mTimeZone = timeZone == null ? TimeZone.getDefault() : timeZone;
        this.mLocaleForced = locale != null;
        this.mLocale = locale == null ? Locale.getDefault() : locale;
    }

    protected void init() {
        List rulesList = parsePattern();
        this.mRules = (Rule[]) rulesList.toArray(new Rule[rulesList.size()]);
        int len = 0;
        int i = this.mRules.length;
        while (true) {
            i--;
            if (i >= 0) {
                len += this.mRules[i].estimateLength();
            } else {
                this.mMaxLengthEstimate = len;
                return;
            }
        }
    }

    protected List parsePattern() {
        DateFormatSymbols symbols;
        String[] weekdays;
        String[] shortWeekdays;
        boolean z;
        Rule rule;
        DateFormatSymbols symbols2 = new DateFormatSymbols(this.mLocale);
        List rules = new ArrayList();
        String[] ERAs = symbols2.getEras();
        String[] months = symbols2.getMonths();
        String[] shortMonths = symbols2.getShortMonths();
        String[] weekdays2 = symbols2.getWeekdays();
        String[] shortWeekdays2 = symbols2.getShortWeekdays();
        String[] AmPmStrings = symbols2.getAmPmStrings();
        int length = this.mPattern.length();
        int[] indexRef = new int[1];
        int i = 0;
        while (i < length) {
            indexRef[0] = i;
            String token = parseToken(this.mPattern, indexRef);
            int i2 = indexRef[0];
            int tokenLen = token.length();
            if (tokenLen != 0) {
                char c = token.charAt(0);
                switch (c) {
                    case '\'':
                        symbols = symbols2;
                        weekdays = weekdays2;
                        shortWeekdays = shortWeekdays2;
                        z = true;
                        String sub = token.substring(1);
                        if (sub.length() == 1) {
                            rule = new CharacterLiteral(sub.charAt(0));
                            break;
                        } else {
                            rule = new StringLiteral(sub);
                            break;
                        }
                    case 'D':
                        symbols = symbols2;
                        weekdays = weekdays2;
                        shortWeekdays = shortWeekdays2;
                        rule = selectNumberRule(6, tokenLen);
                        z = true;
                        break;
                    case 'E':
                        symbols = symbols2;
                        weekdays = weekdays2;
                        shortWeekdays = shortWeekdays2;
                        rule = new TextField(7, tokenLen < 4 ? shortWeekdays : weekdays);
                        z = true;
                        break;
                    case 'F':
                        symbols = symbols2;
                        weekdays = weekdays2;
                        shortWeekdays = shortWeekdays2;
                        rule = selectNumberRule(8, tokenLen);
                        z = true;
                        break;
                    case 'G':
                        symbols = symbols2;
                        weekdays = weekdays2;
                        shortWeekdays = shortWeekdays2;
                        rule = new TextField(0, ERAs);
                        z = true;
                        break;
                    case 'H':
                        symbols = symbols2;
                        weekdays = weekdays2;
                        shortWeekdays = shortWeekdays2;
                        rule = selectNumberRule(11, tokenLen);
                        z = true;
                        break;
                    case 'K':
                        symbols = symbols2;
                        weekdays = weekdays2;
                        shortWeekdays = shortWeekdays2;
                        rule = selectNumberRule(10, tokenLen);
                        z = true;
                        break;
                    case 'M':
                        symbols = symbols2;
                        weekdays = weekdays2;
                        shortWeekdays = shortWeekdays2;
                        if (tokenLen >= 4) {
                            rule = new TextField(2, months);
                            z = true;
                            break;
                        } else if (tokenLen == 3) {
                            rule = new TextField(2, shortMonths);
                            z = true;
                            break;
                        } else if (tokenLen == 2) {
                            rule = TwoDigitMonthField.INSTANCE;
                            z = true;
                            break;
                        } else {
                            rule = UnpaddedMonthField.INSTANCE;
                            z = true;
                            break;
                        }
                    case 'S':
                        symbols = symbols2;
                        weekdays = weekdays2;
                        shortWeekdays = shortWeekdays2;
                        rule = selectNumberRule(14, tokenLen);
                        z = true;
                        break;
                    case 'W':
                        symbols = symbols2;
                        weekdays = weekdays2;
                        shortWeekdays = shortWeekdays2;
                        rule = selectNumberRule(4, tokenLen);
                        z = true;
                        break;
                    case PDF417Common.MAX_ROWS_IN_BARCODE /* 90 */:
                        symbols = symbols2;
                        weekdays = weekdays2;
                        shortWeekdays = shortWeekdays2;
                        if (tokenLen == 1) {
                            rule = TimeZoneNumberRule.INSTANCE_NO_COLON;
                            z = true;
                            break;
                        } else {
                            rule = TimeZoneNumberRule.INSTANCE_COLON;
                            z = true;
                            break;
                        }
                    case 'a':
                        symbols = symbols2;
                        weekdays = weekdays2;
                        shortWeekdays = shortWeekdays2;
                        rule = new TextField(9, AmPmStrings);
                        z = true;
                        break;
                    case 'd':
                        symbols = symbols2;
                        weekdays = weekdays2;
                        shortWeekdays = shortWeekdays2;
                        rule = selectNumberRule(5, tokenLen);
                        z = true;
                        break;
                    case LocationRequestCompat.QUALITY_LOW_POWER /* 104 */:
                        symbols = symbols2;
                        weekdays = weekdays2;
                        shortWeekdays = shortWeekdays2;
                        rule = new TwelveHourField(selectNumberRule(10, tokenLen));
                        z = true;
                        break;
                    case 'k':
                        symbols = symbols2;
                        weekdays = weekdays2;
                        shortWeekdays = shortWeekdays2;
                        rule = new TwentyFourHourField(selectNumberRule(11, tokenLen));
                        z = true;
                        break;
                    case AppCompatDelegate.FEATURE_SUPPORT_ACTION_BAR_OVERLAY /* 109 */:
                        symbols = symbols2;
                        weekdays = weekdays2;
                        shortWeekdays = shortWeekdays2;
                        rule = selectNumberRule(12, tokenLen);
                        z = true;
                        break;
                    case 's':
                        symbols = symbols2;
                        weekdays = weekdays2;
                        shortWeekdays = shortWeekdays2;
                        rule = selectNumberRule(13, tokenLen);
                        z = true;
                        break;
                    case 'w':
                        symbols = symbols2;
                        weekdays = weekdays2;
                        shortWeekdays = shortWeekdays2;
                        rule = selectNumberRule(3, tokenLen);
                        z = true;
                        break;
                    case 'y':
                        symbols = symbols2;
                        weekdays = weekdays2;
                        shortWeekdays = shortWeekdays2;
                        if (tokenLen >= 4) {
                            z = true;
                            rule = selectNumberRule(1, tokenLen);
                            break;
                        } else {
                            rule = TwoDigitYearField.INSTANCE;
                            z = true;
                            break;
                        }
                    case 'z':
                        if (tokenLen >= 4) {
                            symbols = symbols2;
                            weekdays = weekdays2;
                            shortWeekdays = shortWeekdays2;
                            rule = new TimeZoneNameRule(this.mTimeZone, this.mTimeZoneForced, this.mLocale, 1);
                            z = true;
                            break;
                        } else {
                            symbols = symbols2;
                            weekdays = weekdays2;
                            shortWeekdays = shortWeekdays2;
                            rule = new TimeZoneNameRule(this.mTimeZone, this.mTimeZoneForced, this.mLocale, 0);
                            z = true;
                            break;
                        }
                    default:
                        throw new IllegalArgumentException(new StringBuffer().append("Illegal pattern component: ").append(token).toString());
                }
                rules.add(rule);
                i = i2 + 1;
                symbols2 = symbols;
                weekdays2 = weekdays;
                shortWeekdays2 = shortWeekdays;
            } else {
                return rules;
            }
        }
        return rules;
    }

    protected String parseToken(String pattern, int[] indexRef) {
        boolean z;
        StringBuffer buf = new StringBuffer();
        int i = indexRef[0];
        int length = pattern.length();
        char c = pattern.charAt(i);
        if ((c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z')) {
            buf.append(c);
            while (i + 1 < length) {
                char peek = pattern.charAt(i + 1);
                if (peek != c) {
                    break;
                }
                buf.append(c);
                i++;
            }
        } else {
            buf.append('\'');
            boolean inLiteral = false;
            while (i < length) {
                char c2 = pattern.charAt(i);
                if (c2 == '\'') {
                    if (i + 1 < length && pattern.charAt(i + 1) == '\'') {
                        i++;
                        buf.append(c2);
                    } else {
                        if (inLiteral) {
                            z = false;
                        } else {
                            z = true;
                        }
                        inLiteral = z;
                    }
                } else {
                    if (!inLiteral && ((c2 >= 'A' && c2 <= 'Z') || (c2 >= 'a' && c2 <= 'z'))) {
                        i--;
                        break;
                    }
                    buf.append(c2);
                }
                i++;
            }
        }
        indexRef[0] = i;
        return buf.toString();
    }

    protected NumberRule selectNumberRule(int field, int padding) {
        switch (padding) {
            case 1:
                return new UnpaddedNumberField(field);
            case 2:
                return new TwoDigitNumberField(field);
            default:
                return new PaddedNumberField(field, padding);
        }
    }

    @Override // java.text.Format
    public StringBuffer format(Object obj, StringBuffer toAppendTo, FieldPosition pos) {
        if (obj instanceof Date) {
            return format((Date) obj, toAppendTo);
        }
        if (obj instanceof Calendar) {
            return format((Calendar) obj, toAppendTo);
        }
        if (obj instanceof Long) {
            return format(((Long) obj).longValue(), toAppendTo);
        }
        throw new IllegalArgumentException(new StringBuffer().append("Unknown class: ").append(obj == null ? "<null>" : obj.getClass().getName()).toString());
    }

    public String format(long millis) {
        return format(new Date(millis));
    }

    public String format(Date date) {
        Calendar c = new GregorianCalendar(this.mTimeZone);
        c.setTime(date);
        return applyRules(c, new StringBuffer(this.mMaxLengthEstimate)).toString();
    }

    public String format(Calendar calendar) {
        return format(calendar, new StringBuffer(this.mMaxLengthEstimate)).toString();
    }

    public StringBuffer format(long millis, StringBuffer buf) {
        return format(new Date(millis), buf);
    }

    public StringBuffer format(Date date, StringBuffer buf) {
        Calendar c = new GregorianCalendar(this.mTimeZone);
        c.setTime(date);
        return applyRules(c, buf);
    }

    public StringBuffer format(Calendar calendar, StringBuffer buf) {
        if (this.mTimeZoneForced) {
            calendar = (Calendar) calendar.clone();
            calendar.setTimeZone(this.mTimeZone);
        }
        return applyRules(calendar, buf);
    }

    protected StringBuffer applyRules(Calendar calendar, StringBuffer buf) {
        Rule[] rules = this.mRules;
        int len = this.mRules.length;
        for (int i = 0; i < len; i++) {
            rules[i].appendTo(buf, calendar);
        }
        return buf;
    }

    @Override // java.text.Format
    public Object parseObject(String source, ParsePosition pos) {
        pos.setIndex(0);
        pos.setErrorIndex(0);
        return null;
    }

    public String getPattern() {
        return this.mPattern;
    }

    public TimeZone getTimeZone() {
        return this.mTimeZone;
    }

    public boolean getTimeZoneOverridesCalendar() {
        return this.mTimeZoneForced;
    }

    public Locale getLocale() {
        return this.mLocale;
    }

    public int getMaxLengthEstimate() {
        return this.mMaxLengthEstimate;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof FastDateFormat)) {
            return false;
        }
        FastDateFormat other = (FastDateFormat) obj;
        return (this.mPattern == other.mPattern || this.mPattern.equals(other.mPattern)) && (this.mTimeZone == other.mTimeZone || this.mTimeZone.equals(other.mTimeZone)) && ((this.mLocale == other.mLocale || this.mLocale.equals(other.mLocale)) && this.mTimeZoneForced == other.mTimeZoneForced && this.mLocaleForced == other.mLocaleForced);
    }

    public int hashCode() {
        return 0 + this.mPattern.hashCode() + this.mTimeZone.hashCode() + (this.mTimeZoneForced ? 1 : 0) + this.mLocale.hashCode() + (this.mLocaleForced ? 1 : 0);
    }

    public String toString() {
        return new StringBuffer().append("FastDateFormat[").append(this.mPattern).append("]").toString();
    }

    private void readObject(ObjectInputStream in) throws IOException, ClassNotFoundException {
        in.defaultReadObject();
        init();
    }

    private static class CharacterLiteral implements Rule {
        private final char mValue;

        CharacterLiteral(char value) {
            this.mValue = value;
        }

        @Override // org.apache.commons.lang.time.FastDateFormat.Rule
        public int estimateLength() {
            return 1;
        }

        @Override // org.apache.commons.lang.time.FastDateFormat.Rule
        public void appendTo(StringBuffer buffer, Calendar calendar) {
            buffer.append(this.mValue);
        }
    }

    private static class StringLiteral implements Rule {
        private final String mValue;

        StringLiteral(String value) {
            this.mValue = value;
        }

        @Override // org.apache.commons.lang.time.FastDateFormat.Rule
        public int estimateLength() {
            return this.mValue.length();
        }

        @Override // org.apache.commons.lang.time.FastDateFormat.Rule
        public void appendTo(StringBuffer buffer, Calendar calendar) {
            buffer.append(this.mValue);
        }
    }

    private static class TextField implements Rule {
        private final int mField;
        private final String[] mValues;

        TextField(int field, String[] values) {
            this.mField = field;
            this.mValues = values;
        }

        @Override // org.apache.commons.lang.time.FastDateFormat.Rule
        public int estimateLength() {
            int max = 0;
            int i = this.mValues.length;
            while (true) {
                i--;
                if (i >= 0) {
                    int len = this.mValues[i].length();
                    if (len > max) {
                        max = len;
                    }
                } else {
                    return max;
                }
            }
        }

        @Override // org.apache.commons.lang.time.FastDateFormat.Rule
        public void appendTo(StringBuffer buffer, Calendar calendar) {
            buffer.append(this.mValues[calendar.get(this.mField)]);
        }
    }

    private static class UnpaddedNumberField implements NumberRule {
        static final UnpaddedNumberField INSTANCE_YEAR = new UnpaddedNumberField(1);
        private final int mField;

        UnpaddedNumberField(int field) {
            this.mField = field;
        }

        @Override // org.apache.commons.lang.time.FastDateFormat.Rule
        public int estimateLength() {
            return 4;
        }

        @Override // org.apache.commons.lang.time.FastDateFormat.Rule
        public void appendTo(StringBuffer buffer, Calendar calendar) {
            appendTo(buffer, calendar.get(this.mField));
        }

        @Override // org.apache.commons.lang.time.FastDateFormat.NumberRule
        public final void appendTo(StringBuffer buffer, int value) {
            if (value < 10) {
                buffer.append((char) (value + 48));
            } else if (value < 100) {
                buffer.append((char) ((value / 10) + 48));
                buffer.append((char) ((value % 10) + 48));
            } else {
                buffer.append(Integer.toString(value));
            }
        }
    }

    private static class UnpaddedMonthField implements NumberRule {
        static final UnpaddedMonthField INSTANCE = new UnpaddedMonthField();

        UnpaddedMonthField() {
        }

        @Override // org.apache.commons.lang.time.FastDateFormat.Rule
        public int estimateLength() {
            return 2;
        }

        @Override // org.apache.commons.lang.time.FastDateFormat.Rule
        public void appendTo(StringBuffer buffer, Calendar calendar) {
            appendTo(buffer, calendar.get(2) + 1);
        }

        @Override // org.apache.commons.lang.time.FastDateFormat.NumberRule
        public final void appendTo(StringBuffer buffer, int value) {
            if (value < 10) {
                buffer.append((char) (value + 48));
            } else {
                buffer.append((char) ((value / 10) + 48));
                buffer.append((char) ((value % 10) + 48));
            }
        }
    }

    private static class PaddedNumberField implements NumberRule {
        private final int mField;
        private final int mSize;

        PaddedNumberField(int field, int size) {
            if (size < 3) {
                throw new IllegalArgumentException();
            }
            this.mField = field;
            this.mSize = size;
        }

        @Override // org.apache.commons.lang.time.FastDateFormat.Rule
        public int estimateLength() {
            return 4;
        }

        @Override // org.apache.commons.lang.time.FastDateFormat.Rule
        public void appendTo(StringBuffer buffer, Calendar calendar) {
            appendTo(buffer, calendar.get(this.mField));
        }

        @Override // org.apache.commons.lang.time.FastDateFormat.NumberRule
        public final void appendTo(StringBuffer buffer, int value) {
            int digits;
            if (value < 100) {
                int i = this.mSize;
                while (true) {
                    i--;
                    if (i >= 2) {
                        buffer.append('0');
                    } else {
                        int i2 = value / 10;
                        buffer.append((char) (i2 + 48));
                        buffer.append((char) ((value % 10) + 48));
                        return;
                    }
                }
            } else {
                if (value < 1000) {
                    digits = 3;
                } else {
                    Validate.isTrue(value > -1, "Negative values should not be possible", value);
                    digits = Integer.toString(value).length();
                }
                int i3 = this.mSize;
                while (true) {
                    i3--;
                    if (i3 >= digits) {
                        buffer.append('0');
                    } else {
                        buffer.append(Integer.toString(value));
                        return;
                    }
                }
            }
        }
    }

    private static class TwoDigitNumberField implements NumberRule {
        private final int mField;

        TwoDigitNumberField(int field) {
            this.mField = field;
        }

        @Override // org.apache.commons.lang.time.FastDateFormat.Rule
        public int estimateLength() {
            return 2;
        }

        @Override // org.apache.commons.lang.time.FastDateFormat.Rule
        public void appendTo(StringBuffer buffer, Calendar calendar) {
            appendTo(buffer, calendar.get(this.mField));
        }

        @Override // org.apache.commons.lang.time.FastDateFormat.NumberRule
        public final void appendTo(StringBuffer buffer, int value) {
            if (value < 100) {
                buffer.append((char) ((value / 10) + 48));
                buffer.append((char) ((value % 10) + 48));
            } else {
                buffer.append(Integer.toString(value));
            }
        }
    }

    private static class TwoDigitYearField implements NumberRule {
        static final TwoDigitYearField INSTANCE = new TwoDigitYearField();

        TwoDigitYearField() {
        }

        @Override // org.apache.commons.lang.time.FastDateFormat.Rule
        public int estimateLength() {
            return 2;
        }

        @Override // org.apache.commons.lang.time.FastDateFormat.Rule
        public void appendTo(StringBuffer buffer, Calendar calendar) {
            appendTo(buffer, calendar.get(1) % 100);
        }

        @Override // org.apache.commons.lang.time.FastDateFormat.NumberRule
        public final void appendTo(StringBuffer buffer, int value) {
            buffer.append((char) ((value / 10) + 48));
            buffer.append((char) ((value % 10) + 48));
        }
    }

    private static class TwoDigitMonthField implements NumberRule {
        static final TwoDigitMonthField INSTANCE = new TwoDigitMonthField();

        TwoDigitMonthField() {
        }

        @Override // org.apache.commons.lang.time.FastDateFormat.Rule
        public int estimateLength() {
            return 2;
        }

        @Override // org.apache.commons.lang.time.FastDateFormat.Rule
        public void appendTo(StringBuffer buffer, Calendar calendar) {
            appendTo(buffer, calendar.get(2) + 1);
        }

        @Override // org.apache.commons.lang.time.FastDateFormat.NumberRule
        public final void appendTo(StringBuffer buffer, int value) {
            buffer.append((char) ((value / 10) + 48));
            buffer.append((char) ((value % 10) + 48));
        }
    }

    private static class TwelveHourField implements NumberRule {
        private final NumberRule mRule;

        TwelveHourField(NumberRule rule) {
            this.mRule = rule;
        }

        @Override // org.apache.commons.lang.time.FastDateFormat.Rule
        public int estimateLength() {
            return this.mRule.estimateLength();
        }

        @Override // org.apache.commons.lang.time.FastDateFormat.Rule
        public void appendTo(StringBuffer buffer, Calendar calendar) {
            int value = calendar.get(10);
            if (value == 0) {
                value = calendar.getLeastMaximum(10) + 1;
            }
            this.mRule.appendTo(buffer, value);
        }

        @Override // org.apache.commons.lang.time.FastDateFormat.NumberRule
        public void appendTo(StringBuffer buffer, int value) {
            this.mRule.appendTo(buffer, value);
        }
    }

    private static class TwentyFourHourField implements NumberRule {
        private final NumberRule mRule;

        TwentyFourHourField(NumberRule rule) {
            this.mRule = rule;
        }

        @Override // org.apache.commons.lang.time.FastDateFormat.Rule
        public int estimateLength() {
            return this.mRule.estimateLength();
        }

        @Override // org.apache.commons.lang.time.FastDateFormat.Rule
        public void appendTo(StringBuffer buffer, Calendar calendar) {
            int value = calendar.get(11);
            if (value == 0) {
                value = calendar.getMaximum(11) + 1;
            }
            this.mRule.appendTo(buffer, value);
        }

        @Override // org.apache.commons.lang.time.FastDateFormat.NumberRule
        public void appendTo(StringBuffer buffer, int value) {
            this.mRule.appendTo(buffer, value);
        }
    }

    private static class TimeZoneNameRule implements Rule {
        private final String mDaylight;
        private final Locale mLocale;
        private final String mStandard;
        private final int mStyle;
        private final TimeZone mTimeZone;
        private final boolean mTimeZoneForced;

        TimeZoneNameRule(TimeZone timeZone, boolean timeZoneForced, Locale locale, int style) {
            this.mTimeZone = timeZone;
            this.mTimeZoneForced = timeZoneForced;
            this.mLocale = locale;
            this.mStyle = style;
            if (timeZoneForced) {
                this.mStandard = FastDateFormat.getTimeZoneDisplay(timeZone, false, style, locale);
                this.mDaylight = FastDateFormat.getTimeZoneDisplay(timeZone, true, style, locale);
            } else {
                this.mStandard = null;
                this.mDaylight = null;
            }
        }

        @Override // org.apache.commons.lang.time.FastDateFormat.Rule
        public int estimateLength() {
            if (this.mTimeZoneForced) {
                return Math.max(this.mStandard.length(), this.mDaylight.length());
            }
            if (this.mStyle == 0) {
                return 4;
            }
            return 40;
        }

        @Override // org.apache.commons.lang.time.FastDateFormat.Rule
        public void appendTo(StringBuffer buffer, Calendar calendar) {
            if (this.mTimeZoneForced) {
                if (this.mTimeZone.useDaylightTime() && calendar.get(16) != 0) {
                    buffer.append(this.mDaylight);
                    return;
                } else {
                    buffer.append(this.mStandard);
                    return;
                }
            }
            TimeZone timeZone = calendar.getTimeZone();
            if (timeZone.useDaylightTime() && calendar.get(16) != 0) {
                buffer.append(FastDateFormat.getTimeZoneDisplay(timeZone, true, this.mStyle, this.mLocale));
            } else {
                buffer.append(FastDateFormat.getTimeZoneDisplay(timeZone, false, this.mStyle, this.mLocale));
            }
        }
    }

    private static class TimeZoneNumberRule implements Rule {
        static final TimeZoneNumberRule INSTANCE_COLON = new TimeZoneNumberRule(true);
        static final TimeZoneNumberRule INSTANCE_NO_COLON = new TimeZoneNumberRule(false);
        final boolean mColon;

        TimeZoneNumberRule(boolean colon) {
            this.mColon = colon;
        }

        @Override // org.apache.commons.lang.time.FastDateFormat.Rule
        public int estimateLength() {
            return 5;
        }

        @Override // org.apache.commons.lang.time.FastDateFormat.Rule
        public void appendTo(StringBuffer buffer, Calendar calendar) {
            int offset = calendar.get(15) + calendar.get(16);
            if (offset < 0) {
                buffer.append('-');
                offset = -offset;
            } else {
                buffer.append('+');
            }
            int hours = offset / DateUtils.MILLIS_IN_HOUR;
            buffer.append((char) ((hours / 10) + 48));
            buffer.append((char) ((hours % 10) + 48));
            if (this.mColon) {
                buffer.append(':');
            }
            int minutes = (offset / 60000) - (hours * 60);
            buffer.append((char) ((minutes / 10) + 48));
            buffer.append((char) ((minutes % 10) + 48));
        }
    }

    private static class TimeZoneDisplayKey {
        private final Locale mLocale;
        private final int mStyle;
        private final TimeZone mTimeZone;

        TimeZoneDisplayKey(TimeZone timeZone, boolean daylight, int style, Locale locale) {
            this.mTimeZone = timeZone;
            this.mStyle = daylight ? style | Integer.MIN_VALUE : style;
            this.mLocale = locale;
        }

        public int hashCode() {
            return (this.mStyle * 31) + this.mLocale.hashCode();
        }

        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof TimeZoneDisplayKey)) {
                return false;
            }
            TimeZoneDisplayKey other = (TimeZoneDisplayKey) obj;
            return this.mTimeZone.equals(other.mTimeZone) && this.mStyle == other.mStyle && this.mLocale.equals(other.mLocale);
        }
    }

    private static class Pair {
        private final Object mObj1;
        private final Object mObj2;

        public Pair(Object obj1, Object obj2) {
            this.mObj1 = obj1;
            this.mObj2 = obj2;
        }

        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Pair)) {
                return false;
            }
            Pair key = (Pair) obj;
            if (this.mObj1 != null ? this.mObj1.equals(key.mObj1) : key.mObj1 == null) {
                if (this.mObj2 == null) {
                    if (key.mObj2 == null) {
                        return true;
                    }
                } else if (this.mObj2.equals(key.mObj2)) {
                    return true;
                }
            }
            return false;
        }

        public int hashCode() {
            return (this.mObj1 == null ? 0 : this.mObj1.hashCode()) + (this.mObj2 != null ? this.mObj2.hashCode() : 0);
        }

        public String toString() {
            return new StringBuffer().append("[").append(this.mObj1).append(':').append(this.mObj2).append(']').toString();
        }
    }
}
