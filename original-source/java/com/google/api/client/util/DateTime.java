package com.google.api.client.util;

import j$.util.DesugarTimeZone;
import java.io.Serializable;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.TimeZone;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.commons.lang.ClassUtils;

/* loaded from: classes16.dex */
public final class DateTime implements Serializable {
    private static final TimeZone GMT = DesugarTimeZone.getTimeZone("GMT");
    private static final Pattern RFC3339_PATTERN = Pattern.compile("^(\\d{4})-(\\d{2})-(\\d{2})([Tt](\\d{2}):(\\d{2}):(\\d{2})(\\.\\d+)?)?([Zz]|([+-])(\\d{2}):(\\d{2}))?");
    private static final long serialVersionUID = 1;
    private final boolean dateOnly;
    private final int tzShift;
    private final long value;

    public DateTime(Date date, TimeZone zone) {
        this(false, date.getTime(), zone == null ? null : Integer.valueOf(zone.getOffset(date.getTime()) / 60000));
    }

    public DateTime(long value) {
        this(false, value, null);
    }

    public DateTime(Date value) {
        this(value.getTime());
    }

    public DateTime(long value, int tzShift) {
        this(false, value, Integer.valueOf(tzShift));
    }

    public DateTime(boolean dateOnly, long value, Integer tzShift) {
        int offset;
        this.dateOnly = dateOnly;
        this.value = value;
        if (dateOnly) {
            offset = 0;
        } else {
            offset = tzShift == null ? TimeZone.getDefault().getOffset(value) / 60000 : tzShift.intValue();
        }
        this.tzShift = offset;
    }

    public DateTime(String value) {
        DateTime dateTime = parseRfc3339(value);
        this.dateOnly = dateTime.dateOnly;
        this.value = dateTime.value;
        this.tzShift = dateTime.tzShift;
    }

    public long getValue() {
        return this.value;
    }

    public boolean isDateOnly() {
        return this.dateOnly;
    }

    public int getTimeZoneShift() {
        return this.tzShift;
    }

    public String toStringRfc3339() {
        StringBuilder sb = new StringBuilder();
        Calendar dateTime = new GregorianCalendar(GMT);
        long localTime = this.value + (this.tzShift * 60000);
        dateTime.setTimeInMillis(localTime);
        appendInt(sb, dateTime.get(1), 4);
        sb.append('-');
        appendInt(sb, dateTime.get(2) + 1, 2);
        sb.append('-');
        appendInt(sb, dateTime.get(5), 2);
        if (!this.dateOnly) {
            sb.append('T');
            appendInt(sb, dateTime.get(11), 2);
            sb.append(':');
            appendInt(sb, dateTime.get(12), 2);
            sb.append(':');
            appendInt(sb, dateTime.get(13), 2);
            if (dateTime.isSet(14)) {
                sb.append(ClassUtils.PACKAGE_SEPARATOR_CHAR);
                appendInt(sb, dateTime.get(14), 3);
            }
            if (this.tzShift == 0) {
                sb.append('Z');
            } else {
                int absTzShift = this.tzShift;
                if (this.tzShift > 0) {
                    sb.append('+');
                } else {
                    sb.append('-');
                    absTzShift = -absTzShift;
                }
                int tzHours = absTzShift / 60;
                int tzMinutes = absTzShift % 60;
                appendInt(sb, tzHours, 2);
                sb.append(':');
                appendInt(sb, tzMinutes, 2);
            }
        }
        return sb.toString();
    }

    public String toString() {
        return toStringRfc3339();
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof DateTime)) {
            return false;
        }
        DateTime other = (DateTime) o;
        return this.dateOnly == other.dateOnly && this.value == other.value && this.tzShift == other.tzShift;
    }

    public int hashCode() {
        return Arrays.hashCode(new long[]{this.value, this.dateOnly ? 1L : 0L, this.tzShift});
    }

    public static DateTime parseRfc3339(String str) throws NumberFormatException {
        int year;
        int month;
        int day;
        int fractionDigits;
        int milliseconds;
        int second;
        int minute;
        boolean isTimeGiven;
        long value;
        int tzShift;
        Matcher matcher = RFC3339_PATTERN.matcher(str);
        if (!matcher.matches()) {
            throw new NumberFormatException("Invalid date/time format: " + str);
        }
        int year2 = Integer.parseInt(matcher.group(1));
        int month2 = Integer.parseInt(matcher.group(2)) - 1;
        int day2 = Integer.parseInt(matcher.group(3));
        boolean isTimeGiven2 = matcher.group(4) != null;
        String tzShiftRegexGroup = matcher.group(9);
        boolean isTzShiftGiven = tzShiftRegexGroup != null;
        Integer tzShiftInteger = null;
        if (isTzShiftGiven && !isTimeGiven2) {
            throw new NumberFormatException("Invalid date/time format, cannot specify time zone shift without specifying time: " + str);
        }
        if (!isTimeGiven2) {
            year = year2;
            month = month2;
            day = day2;
            fractionDigits = 0;
            milliseconds = 0;
            second = 0;
            minute = 0;
        } else {
            int hourOfDay = Integer.parseInt(matcher.group(5));
            int minute2 = Integer.parseInt(matcher.group(6));
            int second2 = Integer.parseInt(matcher.group(7));
            if (matcher.group(8) != null) {
                int milliseconds2 = Integer.parseInt(matcher.group(8).substring(1));
                int fractionDigits2 = matcher.group(8).substring(1).length() - 3;
                year = year2;
                month = month2;
                day = day2;
                fractionDigits = (int) (milliseconds2 / Math.pow(10.0d, fractionDigits2));
                milliseconds = second2;
                second = minute2;
                minute = hourOfDay;
            } else {
                year = year2;
                month = month2;
                day = day2;
                fractionDigits = 0;
                milliseconds = second2;
                second = minute2;
                minute = hourOfDay;
            }
        }
        Calendar dateTime = new GregorianCalendar(GMT);
        dateTime.set(year, month, day, minute, second, milliseconds);
        dateTime.set(14, fractionDigits);
        long value2 = dateTime.getTimeInMillis();
        if (!isTimeGiven2 || !isTzShiftGiven) {
            isTimeGiven = isTimeGiven2;
            value = value2;
        } else {
            if (Character.toUpperCase(tzShiftRegexGroup.charAt(0)) == 'Z') {
                tzShift = 0;
                isTimeGiven = isTimeGiven2;
            } else {
                tzShift = (Integer.parseInt(matcher.group(11)) * 60) + Integer.parseInt(matcher.group(12));
                if (matcher.group(10).charAt(0) == '-') {
                    tzShift = -tzShift;
                }
                isTimeGiven = isTimeGiven2;
                value2 -= tzShift * 60000;
            }
            tzShiftInteger = Integer.valueOf(tzShift);
            value = value2;
        }
        return new DateTime(!isTimeGiven, value, tzShiftInteger);
    }

    private static void appendInt(StringBuilder sb, int num, int numDigits) {
        if (num < 0) {
            sb.append('-');
            num = -num;
        }
        int x = num;
        while (x > 0) {
            x /= 10;
            numDigits--;
        }
        for (int i = 0; i < numDigits; i++) {
            sb.append('0');
        }
        if (num != 0) {
            sb.append(num);
        }
    }
}
