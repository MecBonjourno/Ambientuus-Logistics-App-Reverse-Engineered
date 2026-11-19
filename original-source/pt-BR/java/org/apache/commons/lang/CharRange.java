package org.apache.commons.lang;

import java.io.Serializable;

/* carregado de: classes17.dex */
public final class CharRange implements Serializable {
    private static final long serialVersionUID = 8270183163158333422L;
    private final char end;
    private transient String iToString;
    private final boolean negated;
    private final char start;

    public CharRange(char ch) {
        this(ch, ch, false);
    }

    public CharRange(char ch, boolean negated) {
        this(ch, ch, negated);
    }

    public CharRange(char start, char end) {
        this(start, end, false);
    }

    public CharRange(char start, char end, boolean negated) {
        if (start > end) {
            start = end;
            end = start;
        }
        this.start = start;
        this.end = end;
        this.negated = negated;
    }

    public char getStart() {
        return this.start;
    }

    public char getEnd() {
        return this.end;
    }

    public boolean isNegated() {
        return this.negated;
    }

    public boolean contains(char ch) {
        return (ch >= this.start && ch <= this.end) != this.negated;
    }

    public boolean contains(CharRange range) {
        if (range != null) {
            return this.negated ? range.negated ? this.start >= range.start && this.end <= range.end : range.end < this.start || range.start > this.end : range.negated ? this.start == 0 && this.end == 65535 : this.start <= range.start && this.end >= range.end;
        }
        throw new IllegalArgumentException("The Range must not be null");
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof CharRange)) {
            return false;
        }
        CharRange other = (CharRange) obj;
        return this.start == other.start && this.end == other.end && this.negated == other.negated;
    }

    public int hashCode() {
        return this.start + 'S' + (this.end * 7) + (this.negated ? 1 : 0);
    }

    public String toString() {
        if (this.iToString == null) {
            StringBuffer buf = new StringBuffer(4);
            if (isNegated()) {
                buf.append('^');
            }
            buf.append(this.start);
            if (this.start != this.end) {
                buf.append('-');
                buf.append(this.end);
            }
            this.iToString = buf.toString();
        }
        return this.iToString;
    }
}
