package org.apache.commons.lang.text;

import java.text.Format;
import java.text.MessageFormat;
import java.text.ParsePosition;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;
import org.apache.commons.lang.Validate;

/* loaded from: classes17.dex */
public class ExtendedMessageFormat extends MessageFormat {
    private static final String DUMMY_PATTERN = "";
    private static final char END_FE = '}';
    private static final String ESCAPED_QUOTE = "''";
    private static final char QUOTE = '\'';
    private static final char START_FE = '{';
    private static final char START_FMT = ',';
    private static final long serialVersionUID = -2362048321261811743L;
    private Map registry;
    private String toPattern;

    public ExtendedMessageFormat(String pattern) {
        this(pattern, Locale.getDefault());
    }

    public ExtendedMessageFormat(String pattern, Locale locale) {
        this(pattern, locale, null);
    }

    public ExtendedMessageFormat(String pattern, Map registry) {
        this(pattern, Locale.getDefault(), registry);
    }

    public ExtendedMessageFormat(String pattern, Locale locale, Map registry) {
        super("");
        setLocale(locale);
        this.registry = registry;
        applyPattern(pattern);
    }

    @Override // java.text.MessageFormat
    public String toPattern() {
        return this.toPattern;
    }

    @Override // java.text.MessageFormat
    public final void applyPattern(String pattern) {
        if (this.registry == null) {
            super.applyPattern(pattern);
            this.toPattern = super.toPattern();
            return;
        }
        ArrayList foundFormats = new ArrayList();
        ArrayList foundDescriptions = new ArrayList();
        StringBuffer stripCustom = new StringBuffer(pattern.length());
        ParsePosition pos = new ParsePosition(0);
        char[] c = pattern.toCharArray();
        int fmtCount = 0;
        while (pos.getIndex() < pattern.length()) {
            switch (c[pos.getIndex()]) {
                case '\'':
                    appendQuotedString(pattern, pos, stripCustom, true);
                    continue;
                case '{':
                    fmtCount++;
                    seekNonWs(pattern, pos);
                    int start = pos.getIndex();
                    int index = readArgumentIndex(pattern, next(pos));
                    stripCustom.append(START_FE).append(index);
                    seekNonWs(pattern, pos);
                    Format format = null;
                    String formatDescription = null;
                    if (c[pos.getIndex()] == ',' && (format = getFormat((formatDescription = parseFormatDescription(pattern, next(pos))))) == null) {
                        stripCustom.append(START_FMT).append(formatDescription);
                    }
                    foundFormats.add(format);
                    foundDescriptions.add(format == null ? null : formatDescription);
                    Validate.isTrue(foundFormats.size() == fmtCount);
                    Validate.isTrue(foundDescriptions.size() == fmtCount);
                    if (c[pos.getIndex()] != '}') {
                        throw new IllegalArgumentException(new StringBuffer().append("Unreadable format element at position ").append(start).toString());
                    }
                    break;
            }
            stripCustom.append(c[pos.getIndex()]);
            next(pos);
        }
        super.applyPattern(stripCustom.toString());
        this.toPattern = insertFormats(super.toPattern(), foundDescriptions);
        if (containsElements(foundFormats)) {
            Format[] origFormats = getFormats();
            int i = 0;
            Iterator it = foundFormats.iterator();
            while (it.hasNext()) {
                Format f = (Format) it.next();
                if (f != null) {
                    origFormats[i] = f;
                }
                i++;
            }
            super.setFormats(origFormats);
        }
    }

    @Override // java.text.MessageFormat
    public void setFormat(int formatElementIndex, Format newFormat) {
        throw new UnsupportedOperationException();
    }

    @Override // java.text.MessageFormat
    public void setFormatByArgumentIndex(int argumentIndex, Format newFormat) {
        throw new UnsupportedOperationException();
    }

    @Override // java.text.MessageFormat
    public void setFormats(Format[] newFormats) {
        throw new UnsupportedOperationException();
    }

    @Override // java.text.MessageFormat
    public void setFormatsByArgumentIndex(Format[] newFormats) {
        throw new UnsupportedOperationException();
    }

    private Format getFormat(String desc) {
        if (this.registry != null) {
            String name = desc;
            String args = null;
            int i = desc.indexOf(44);
            if (i > 0) {
                name = desc.substring(0, i).trim();
                args = desc.substring(i + 1).trim();
            }
            FormatFactory factory = (FormatFactory) this.registry.get(name);
            if (factory != null) {
                return factory.getFormat(name, args, getLocale());
            }
            return null;
        }
        return null;
    }

    private int readArgumentIndex(String pattern, ParsePosition pos) {
        int start = pos.getIndex();
        seekNonWs(pattern, pos);
        StringBuffer result = new StringBuffer();
        boolean error = false;
        while (!error && pos.getIndex() < pattern.length()) {
            char c = pattern.charAt(pos.getIndex());
            if (Character.isWhitespace(c)) {
                seekNonWs(pattern, pos);
                c = pattern.charAt(pos.getIndex());
                if (c != ',' && c != '}') {
                    error = true;
                    next(pos);
                }
            }
            if ((c == ',' || c == '}') && result.length() > 0) {
                try {
                    return Integer.parseInt(result.toString());
                } catch (NumberFormatException e) {
                }
            }
            boolean error2 = !Character.isDigit(c);
            result.append(c);
            error = error2;
            next(pos);
        }
        if (error) {
            throw new IllegalArgumentException(new StringBuffer().append("Invalid format argument index at position ").append(start).append(": ").append(pattern.substring(start, pos.getIndex())).toString());
        }
        throw new IllegalArgumentException(new StringBuffer().append("Unterminated format element at position ").append(start).toString());
    }

    private String parseFormatDescription(String pattern, ParsePosition pos) {
        int start = pos.getIndex();
        seekNonWs(pattern, pos);
        int text = pos.getIndex();
        int depth = 1;
        while (pos.getIndex() < pattern.length()) {
            switch (pattern.charAt(pos.getIndex())) {
                case '\'':
                    getQuotedString(pattern, pos, false);
                    break;
                case '{':
                    depth++;
                    break;
                case '}':
                    depth--;
                    if (depth != 0) {
                        break;
                    } else {
                        return pattern.substring(text, pos.getIndex());
                    }
            }
            next(pos);
        }
        throw new IllegalArgumentException(new StringBuffer().append("Unterminated format element at position ").append(start).toString());
    }

    private String insertFormats(String pattern, ArrayList customPatterns) {
        if (!containsElements(customPatterns)) {
            return pattern;
        }
        StringBuffer sb = new StringBuffer(pattern.length() * 2);
        ParsePosition pos = new ParsePosition(0);
        int fe = -1;
        int depth = 0;
        while (pos.getIndex() < pattern.length()) {
            char c = pattern.charAt(pos.getIndex());
            switch (c) {
                case '\'':
                    appendQuotedString(pattern, pos, sb, false);
                    continue;
                case '{':
                    depth++;
                    if (depth == 1) {
                        fe++;
                        sb.append(START_FE).append(readArgumentIndex(pattern, next(pos)));
                        String customPattern = (String) customPatterns.get(fe);
                        if (customPattern == null) {
                            break;
                        } else {
                            sb.append(START_FMT).append(customPattern);
                            break;
                        }
                    } else {
                        continue;
                    }
                case '}':
                    depth--;
                    break;
            }
            sb.append(c);
            next(pos);
        }
        return sb.toString();
    }

    private void seekNonWs(String pattern, ParsePosition pos) {
        char[] buffer = pattern.toCharArray();
        do {
            int len = StrMatcher.splitMatcher().isMatch(buffer, pos.getIndex());
            pos.setIndex(pos.getIndex() + len);
            if (len <= 0) {
                return;
            }
        } while (pos.getIndex() < pattern.length());
    }

    private ParsePosition next(ParsePosition pos) {
        pos.setIndex(pos.getIndex() + 1);
        return pos;
    }

    private StringBuffer appendQuotedString(String pattern, ParsePosition pos, StringBuffer appendTo, boolean escapingOn) {
        int start = pos.getIndex();
        char[] c = pattern.toCharArray();
        if (escapingOn && c[start] == '\'') {
            if (appendTo == null) {
                return null;
            }
            return appendTo.append(QUOTE);
        }
        int lastHold = start;
        for (int i = pos.getIndex(); i < pattern.length(); i++) {
            if (escapingOn && pattern.substring(i).startsWith(ESCAPED_QUOTE)) {
                appendTo.append(c, lastHold, pos.getIndex() - lastHold).append(QUOTE);
                pos.setIndex(ESCAPED_QUOTE.length() + i);
                lastHold = pos.getIndex();
            } else {
                switch (c[pos.getIndex()]) {
                    case '\'':
                        next(pos);
                        if (appendTo == null) {
                            return null;
                        }
                        return appendTo.append(c, lastHold, pos.getIndex() - lastHold);
                    default:
                        next(pos);
                        break;
                }
            }
        }
        throw new IllegalArgumentException(new StringBuffer().append("Unterminated quoted string at position ").append(start).toString());
    }

    private void getQuotedString(String pattern, ParsePosition pos, boolean escapingOn) {
        appendQuotedString(pattern, pos, null, escapingOn);
    }

    private boolean containsElements(Collection coll) {
        if (coll == null || coll.size() == 0) {
            return false;
        }
        Iterator iter = coll.iterator();
        while (iter.hasNext()) {
            if (iter.next() != null) {
                return true;
            }
        }
        return false;
    }
}
