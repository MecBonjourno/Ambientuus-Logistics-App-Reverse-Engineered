package org.apache.commons.lang.time;

import androidx.appcompat.app.AppCompatDelegate;
import androidx.exifinterface.media.ExifInterface;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.TimeZone;
import org.apache.commons.lang.StringUtils;

/* carregado de: classes17.dex */
public class DurationFormatUtils {
    public static final String ISO_EXTENDED_FORMAT_PATTERN = "'P'yyyy'Y'M'M'd'DT'H'H'm'M's.S'S'";
    static final Object y = "y";
    static final Object M = "M";
    static final Object d = "d";
    static final Object H = "H";
    static final Object m = "m";
    static final Object s = "s";
    static final Object S = ExifInterface.LATITUDE_SOUTH;

    public static String formatDurationHMS(long durationMillis) {
        return formatDuration(durationMillis, "H:mm:ss.SSS");
    }

    public static String formatDurationISO(long durationMillis) {
        return formatDuration(durationMillis, ISO_EXTENDED_FORMAT_PATTERN, false);
    }

    public static String formatDuration(long durationMillis, String format) {
        return formatDuration(durationMillis, format, true);
    }

    public static String formatDuration(long durationMillis, String format, boolean padWithZeros) {
        int seconds;
        int milliseconds;
        Token[] tokens = lexx(format);
        int days = 0;
        int hours = 0;
        int minutes = 0;
        if (Token.containsTokenWithValue(tokens, d)) {
            days = (int) (durationMillis / DateUtils.MILLIS_PER_DAY);
            durationMillis -= days * DateUtils.MILLIS_PER_DAY;
        }
        if (Token.containsTokenWithValue(tokens, H)) {
            hours = (int) (durationMillis / DateUtils.MILLIS_PER_HOUR);
            durationMillis -= hours * DateUtils.MILLIS_PER_HOUR;
        }
        if (Token.containsTokenWithValue(tokens, m)) {
            minutes = (int) (durationMillis / 60000);
            durationMillis -= minutes * 60000;
        }
        if (!Token.containsTokenWithValue(tokens, s)) {
            seconds = 0;
        } else {
            int seconds2 = (int) (durationMillis / 1000);
            durationMillis -= seconds2 * 1000;
            seconds = seconds2;
        }
        if (!Token.containsTokenWithValue(tokens, S)) {
            milliseconds = 0;
        } else {
            int milliseconds2 = (int) durationMillis;
            milliseconds = milliseconds2;
        }
        int milliseconds3 = minutes;
        int minutes2 = days;
        return format(tokens, 0, 0, minutes2, hours, milliseconds3, seconds, milliseconds, padWithZeros);
    }

    public static String formatDurationWords(long durationMillis, boolean suppressLeadingZeroElements, boolean suppressTrailingZeroElements) {
        String duration = formatDuration(durationMillis, "d' days 'H' hours 'm' minutes 's' seconds'");
        if (suppressLeadingZeroElements) {
            duration = new StringBuffer().append(" ").append(duration).toString();
            String tmp = StringUtils.replaceOnce(duration, " 0 days", "");
            if (tmp.length() != duration.length()) {
                duration = tmp;
                String tmp2 = StringUtils.replaceOnce(duration, " 0 hours", "");
                if (tmp2.length() != duration.length()) {
                    String tmp3 = StringUtils.replaceOnce(tmp2, " 0 minutes", "");
                    duration = tmp3;
                    if (tmp3.length() != duration.length()) {
                        duration = StringUtils.replaceOnce(tmp3, " 0 seconds", "");
                    }
                }
            }
            if (duration.length() != 0) {
                duration = duration.substring(1);
            }
        }
        if (suppressTrailingZeroElements) {
            String tmp4 = StringUtils.replaceOnce(duration, " 0 seconds", "");
            if (tmp4.length() != duration.length()) {
                duration = tmp4;
                String tmp5 = StringUtils.replaceOnce(duration, " 0 minutes", "");
                if (tmp5.length() != duration.length()) {
                    duration = tmp5;
                    String tmp6 = StringUtils.replaceOnce(duration, " 0 hours", "");
                    if (tmp6.length() != duration.length()) {
                        duration = StringUtils.replaceOnce(tmp6, " 0 days", "");
                    }
                }
            }
        }
        return StringUtils.replaceOnce(StringUtils.replaceOnce(StringUtils.replaceOnce(StringUtils.replaceOnce(new StringBuffer().append(" ").append(duration).toString(), " 1 seconds", " 1 second"), " 1 minutes", " 1 minute"), " 1 hours", " 1 hour"), " 1 days", " 1 day").trim();
    }

    public static String formatPeriodISO(long startMillis, long endMillis) {
        return formatPeriod(startMillis, endMillis, ISO_EXTENDED_FORMAT_PATTERN, false, TimeZone.getDefault());
    }

    public static String formatPeriod(long startMillis, long endMillis, String format) {
        return formatPeriod(startMillis, endMillis, format, true, TimeZone.getDefault());
    }

    public static String formatPeriod(long startMillis, long endMillis, String format, boolean padWithZeros, TimeZone timezone) {
        int milliseconds;
        int milliseconds2;
        int years;
        int milliseconds3;
        int milliseconds4;
        Token[] tokens = lexx(format);
        Calendar start = Calendar.getInstance(timezone);
        start.setTime(new Date(startMillis));
        Calendar end = Calendar.getInstance(timezone);
        end.setTime(new Date(endMillis));
        int milliseconds5 = end.get(14) - start.get(14);
        int seconds = end.get(13) - start.get(13);
        int minutes = end.get(12) - start.get(12);
        int hours = end.get(11) - start.get(11);
        int days = end.get(5) - start.get(5);
        int months = end.get(2) - start.get(2);
        int years2 = end.get(1) - start.get(1);
        while (milliseconds5 < 0) {
            milliseconds5 += 1000;
            seconds--;
        }
        while (seconds < 0) {
            seconds += 60;
            minutes--;
        }
        while (minutes < 0) {
            minutes += 60;
            hours--;
        }
        while (hours < 0) {
            hours += 24;
            days--;
        }
        if (Token.containsTokenWithValue(tokens, M)) {
            while (days < 0) {
                days += start.getActualMaximum(5);
                months--;
                start.add(2, 1);
            }
            while (months < 0) {
                months += 12;
                years2--;
            }
            if (!Token.containsTokenWithValue(tokens, y) && years2 != 0) {
                while (years2 != 0) {
                    months += years2 * 12;
                    years2 = 0;
                }
                milliseconds = milliseconds5;
                milliseconds2 = months;
                years = years2;
            } else {
                milliseconds = milliseconds5;
                milliseconds2 = months;
                years = years2;
            }
        } else {
            if (Token.containsTokenWithValue(tokens, y)) {
                milliseconds = milliseconds5;
            } else {
                int target = end.get(1);
                if (months < 0) {
                    target--;
                }
                while (start.get(1) != target) {
                    int days2 = days + (start.getActualMaximum(6) - start.get(6));
                    if (!(start instanceof GregorianCalendar)) {
                        milliseconds3 = milliseconds5;
                    } else {
                        milliseconds3 = milliseconds5;
                        int milliseconds6 = start.get(2);
                        if (milliseconds6 == 1 && start.get(5) == 29) {
                            days2++;
                        }
                    }
                    start.add(1, 1);
                    days = days2 + start.get(6);
                    milliseconds5 = milliseconds3;
                }
                milliseconds = milliseconds5;
                years2 = 0;
            }
            while (start.get(2) != end.get(2)) {
                days += start.getActualMaximum(5);
                start.add(2, 1);
            }
            int months2 = 0;
            while (days < 0) {
                days += start.getActualMaximum(5);
                months2--;
                start.add(2, 1);
            }
            milliseconds2 = months2;
            years = years2;
        }
        if (!Token.containsTokenWithValue(tokens, d)) {
            hours += days * 24;
            days = 0;
        }
        if (!Token.containsTokenWithValue(tokens, H)) {
            minutes += hours * 60;
            hours = 0;
        }
        if (!Token.containsTokenWithValue(tokens, m)) {
            seconds += minutes * 60;
            minutes = 0;
        }
        if (Token.containsTokenWithValue(tokens, s)) {
            milliseconds4 = milliseconds;
        } else {
            milliseconds4 = milliseconds + (seconds * 1000);
            seconds = 0;
        }
        int days3 = days;
        int days4 = seconds;
        int hours2 = hours;
        int hours3 = minutes;
        return format(tokens, years, milliseconds2, days3, hours2, hours3, days4, milliseconds4, padWithZeros);
    }

    static String format(Token[] tokens, int years, int months, int days, int hours, int minutes, int seconds, int milliseconds, boolean padWithZeros) {
        StringBuffer buffer = new StringBuffer();
        boolean lastOutputSeconds = false;
        int milliseconds2 = milliseconds;
        for (Token token : tokens) {
            Object value = token.getValue();
            int count = token.getCount();
            if (value instanceof StringBuffer) {
                buffer.append(value.toString());
            } else if (value == y) {
                String num = Integer.toString(years);
                if (padWithZeros) {
                    num = StringUtils.leftPad(num, count, '0');
                }
                buffer.append(num);
                lastOutputSeconds = false;
            } else if (value == M) {
                String num2 = Integer.toString(months);
                if (padWithZeros) {
                    num2 = StringUtils.leftPad(num2, count, '0');
                }
                buffer.append(num2);
                lastOutputSeconds = false;
            } else if (value == d) {
                String num3 = Integer.toString(days);
                if (padWithZeros) {
                    num3 = StringUtils.leftPad(num3, count, '0');
                }
                buffer.append(num3);
                lastOutputSeconds = false;
            } else if (value == H) {
                String num4 = Integer.toString(hours);
                if (padWithZeros) {
                    num4 = StringUtils.leftPad(num4, count, '0');
                }
                buffer.append(num4);
                lastOutputSeconds = false;
            } else if (value == m) {
                String num5 = Integer.toString(minutes);
                if (padWithZeros) {
                    num5 = StringUtils.leftPad(num5, count, '0');
                }
                buffer.append(num5);
                lastOutputSeconds = false;
            } else if (value == s) {
                String num6 = Integer.toString(seconds);
                if (padWithZeros) {
                    num6 = StringUtils.leftPad(num6, count, '0');
                }
                buffer.append(num6);
                lastOutputSeconds = true;
            } else if (value == S) {
                if (lastOutputSeconds) {
                    milliseconds2 += 1000;
                    String str = Integer.toString(milliseconds2);
                    if (padWithZeros) {
                        str = StringUtils.leftPad(str, count, '0');
                    }
                    buffer.append(str.substring(1));
                } else {
                    String str2 = Integer.toString(milliseconds2);
                    if (padWithZeros) {
                        str2 = StringUtils.leftPad(str2, count, '0');
                    }
                    buffer.append(str2);
                }
                lastOutputSeconds = false;
            }
        }
        return buffer.toString();
    }

    static Token[] lexx(String format) {
        char[] array = format.toCharArray();
        ArrayList list = new ArrayList(array.length);
        boolean inLiteral = false;
        StringBuffer buffer = null;
        Token previous = null;
        for (char ch : array) {
            if (inLiteral && ch != '\'') {
                buffer.append(ch);
            } else {
                Object value = null;
                switch (ch) {
                    case '\'':
                        if (inLiteral) {
                            buffer = null;
                            inLiteral = false;
                            break;
                        } else {
                            buffer = new StringBuffer();
                            list.add(new Token(buffer));
                            inLiteral = true;
                            break;
                        }
                    case 'H':
                        value = H;
                        break;
                    case 'M':
                        value = M;
                        break;
                    case 'S':
                        value = S;
                        break;
                    case 'd':
                        value = d;
                        break;
                    case AppCompatDelegate.FEATURE_SUPPORT_ACTION_BAR_OVERLAY /* 109 */:
                        value = m;
                        break;
                    case 's':
                        value = s;
                        break;
                    case 'y':
                        value = y;
                        break;
                    default:
                        if (buffer == null) {
                            buffer = new StringBuffer();
                            list.add(new Token(buffer));
                        }
                        buffer.append(ch);
                        break;
                }
                if (value != null) {
                    if (previous != null && previous.getValue() == value) {
                        previous.increment();
                    } else {
                        Token token = new Token(value);
                        list.add(token);
                        previous = token;
                    }
                    buffer = null;
                }
            }
        }
        int i = list.size();
        return (Token[]) list.toArray(new Token[i]);
    }

    static class Token {
        private int count;
        private Object value;

        static boolean containsTokenWithValue(Token[] tokens, Object value) {
            for (Token token : tokens) {
                if (token.getValue() == value) {
                    return true;
                }
            }
            return false;
        }

        Token(Object value) {
            this.value = value;
            this.count = 1;
        }

        Token(Object value, int count) {
            this.value = value;
            this.count = count;
        }

        void increment() {
            this.count++;
        }

        int getCount() {
            return this.count;
        }

        Object getValue() {
            return this.value;
        }

        public boolean equals(Object obj2) {
            if (!(obj2 instanceof Token)) {
                return false;
            }
            Token tok2 = (Token) obj2;
            if (this.value.getClass() != tok2.value.getClass() || this.count != tok2.count) {
                return false;
            }
            if (this.value instanceof StringBuffer) {
                return this.value.toString().equals(tok2.value.toString());
            }
            if (this.value instanceof Number) {
                return this.value.equals(tok2.value);
            }
            return this.value == tok2.value;
        }

        public int hashCode() {
            return this.value.hashCode();
        }

        public String toString() {
            return StringUtils.repeat(this.value.toString(), this.count);
        }
    }
}
