package org.apache.commons.lang.text;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.ListIterator;
import java.util.NoSuchElementException;

/* loaded from: classes17.dex */
public class StrTokenizer implements ListIterator, Cloneable {
    private static final StrTokenizer CSV_TOKENIZER_PROTOTYPE = new StrTokenizer();
    private static final StrTokenizer TSV_TOKENIZER_PROTOTYPE;
    private char[] chars;
    private StrMatcher delimMatcher;
    private boolean emptyAsNull;
    private boolean ignoreEmptyTokens;
    private StrMatcher ignoredMatcher;
    private StrMatcher quoteMatcher;
    private int tokenPos;
    private String[] tokens;
    private StrMatcher trimmerMatcher;

    static {
        CSV_TOKENIZER_PROTOTYPE.setDelimiterMatcher(StrMatcher.commaMatcher());
        CSV_TOKENIZER_PROTOTYPE.setQuoteMatcher(StrMatcher.doubleQuoteMatcher());
        CSV_TOKENIZER_PROTOTYPE.setIgnoredMatcher(StrMatcher.noneMatcher());
        CSV_TOKENIZER_PROTOTYPE.setTrimmerMatcher(StrMatcher.trimMatcher());
        CSV_TOKENIZER_PROTOTYPE.setEmptyTokenAsNull(false);
        CSV_TOKENIZER_PROTOTYPE.setIgnoreEmptyTokens(false);
        TSV_TOKENIZER_PROTOTYPE = new StrTokenizer();
        TSV_TOKENIZER_PROTOTYPE.setDelimiterMatcher(StrMatcher.tabMatcher());
        TSV_TOKENIZER_PROTOTYPE.setQuoteMatcher(StrMatcher.doubleQuoteMatcher());
        TSV_TOKENIZER_PROTOTYPE.setIgnoredMatcher(StrMatcher.noneMatcher());
        TSV_TOKENIZER_PROTOTYPE.setTrimmerMatcher(StrMatcher.trimMatcher());
        TSV_TOKENIZER_PROTOTYPE.setEmptyTokenAsNull(false);
        TSV_TOKENIZER_PROTOTYPE.setIgnoreEmptyTokens(false);
    }

    private static StrTokenizer getCSVClone() {
        return (StrTokenizer) CSV_TOKENIZER_PROTOTYPE.clone();
    }

    public static StrTokenizer getCSVInstance() {
        return getCSVClone();
    }

    public static StrTokenizer getCSVInstance(String input) {
        StrTokenizer tok = getCSVClone();
        tok.reset(input);
        return tok;
    }

    public static StrTokenizer getCSVInstance(char[] input) {
        StrTokenizer tok = getCSVClone();
        tok.reset(input);
        return tok;
    }

    private static StrTokenizer getTSVClone() {
        return (StrTokenizer) TSV_TOKENIZER_PROTOTYPE.clone();
    }

    public static StrTokenizer getTSVInstance() {
        return getTSVClone();
    }

    public static StrTokenizer getTSVInstance(String input) {
        StrTokenizer tok = getTSVClone();
        tok.reset(input);
        return tok;
    }

    public static StrTokenizer getTSVInstance(char[] input) {
        StrTokenizer tok = getTSVClone();
        tok.reset(input);
        return tok;
    }

    public StrTokenizer() {
        this.delimMatcher = StrMatcher.splitMatcher();
        this.quoteMatcher = StrMatcher.noneMatcher();
        this.ignoredMatcher = StrMatcher.noneMatcher();
        this.trimmerMatcher = StrMatcher.noneMatcher();
        this.emptyAsNull = false;
        this.ignoreEmptyTokens = true;
        this.chars = null;
    }

    public StrTokenizer(String input) {
        this.delimMatcher = StrMatcher.splitMatcher();
        this.quoteMatcher = StrMatcher.noneMatcher();
        this.ignoredMatcher = StrMatcher.noneMatcher();
        this.trimmerMatcher = StrMatcher.noneMatcher();
        this.emptyAsNull = false;
        this.ignoreEmptyTokens = true;
        if (input != null) {
            this.chars = input.toCharArray();
        } else {
            this.chars = null;
        }
    }

    public StrTokenizer(String input, char delim) {
        this(input);
        setDelimiterChar(delim);
    }

    public StrTokenizer(String input, String delim) {
        this(input);
        setDelimiterString(delim);
    }

    public StrTokenizer(String input, StrMatcher delim) {
        this(input);
        setDelimiterMatcher(delim);
    }

    public StrTokenizer(String input, char delim, char quote) {
        this(input, delim);
        setQuoteChar(quote);
    }

    public StrTokenizer(String input, StrMatcher delim, StrMatcher quote) {
        this(input, delim);
        setQuoteMatcher(quote);
    }

    public StrTokenizer(char[] input) {
        this.delimMatcher = StrMatcher.splitMatcher();
        this.quoteMatcher = StrMatcher.noneMatcher();
        this.ignoredMatcher = StrMatcher.noneMatcher();
        this.trimmerMatcher = StrMatcher.noneMatcher();
        this.emptyAsNull = false;
        this.ignoreEmptyTokens = true;
        this.chars = input;
    }

    public StrTokenizer(char[] input, char delim) {
        this(input);
        setDelimiterChar(delim);
    }

    public StrTokenizer(char[] input, String delim) {
        this(input);
        setDelimiterString(delim);
    }

    public StrTokenizer(char[] input, StrMatcher delim) {
        this(input);
        setDelimiterMatcher(delim);
    }

    public StrTokenizer(char[] input, char delim, char quote) {
        this(input, delim);
        setQuoteChar(quote);
    }

    public StrTokenizer(char[] input, StrMatcher delim, StrMatcher quote) {
        this(input, delim);
        setQuoteMatcher(quote);
    }

    public int size() {
        checkTokenized();
        return this.tokens.length;
    }

    public String nextToken() {
        if (hasNext()) {
            String[] strArr = this.tokens;
            int i = this.tokenPos;
            this.tokenPos = i + 1;
            return strArr[i];
        }
        return null;
    }

    public String previousToken() {
        if (hasPrevious()) {
            String[] strArr = this.tokens;
            int i = this.tokenPos - 1;
            this.tokenPos = i;
            return strArr[i];
        }
        return null;
    }

    public String[] getTokenArray() {
        checkTokenized();
        return (String[]) this.tokens.clone();
    }

    public List getTokenList() {
        checkTokenized();
        List list = new ArrayList(this.tokens.length);
        for (int i = 0; i < this.tokens.length; i++) {
            list.add(this.tokens[i]);
        }
        return list;
    }

    public StrTokenizer reset() {
        this.tokenPos = 0;
        this.tokens = null;
        return this;
    }

    public StrTokenizer reset(String input) {
        reset();
        if (input != null) {
            this.chars = input.toCharArray();
        } else {
            this.chars = null;
        }
        return this;
    }

    public StrTokenizer reset(char[] input) {
        reset();
        this.chars = input;
        return this;
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public boolean hasNext() {
        checkTokenized();
        return this.tokenPos < this.tokens.length;
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public Object next() {
        if (hasNext()) {
            String[] strArr = this.tokens;
            int i = this.tokenPos;
            this.tokenPos = i + 1;
            return strArr[i];
        }
        throw new NoSuchElementException();
    }

    @Override // java.util.ListIterator
    public int nextIndex() {
        return this.tokenPos;
    }

    @Override // java.util.ListIterator
    public boolean hasPrevious() {
        checkTokenized();
        return this.tokenPos > 0;
    }

    @Override // java.util.ListIterator
    public Object previous() {
        if (hasPrevious()) {
            String[] strArr = this.tokens;
            int i = this.tokenPos - 1;
            this.tokenPos = i;
            return strArr[i];
        }
        throw new NoSuchElementException();
    }

    @Override // java.util.ListIterator
    public int previousIndex() {
        return this.tokenPos - 1;
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public void remove() {
        throw new UnsupportedOperationException("remove() is unsupported");
    }

    @Override // java.util.ListIterator
    public void set(Object obj) {
        throw new UnsupportedOperationException("set() is unsupported");
    }

    @Override // java.util.ListIterator
    public void add(Object obj) {
        throw new UnsupportedOperationException("add() is unsupported");
    }

    private void checkTokenized() {
        if (this.tokens == null) {
            if (this.chars == null) {
                List split = tokenize(null, 0, 0);
                this.tokens = (String[]) split.toArray(new String[split.size()]);
            } else {
                List split2 = tokenize(this.chars, 0, this.chars.length);
                this.tokens = (String[]) split2.toArray(new String[split2.size()]);
            }
        }
    }

    protected List tokenize(char[] chars, int offset, int count) {
        if (chars != null && count != 0) {
            StrBuilder buf = new StrBuilder();
            List tokens = new ArrayList();
            int pos = offset;
            while (pos >= 0 && pos < count) {
                char[] chars2 = chars;
                int count2 = count;
                pos = readNextToken(chars2, pos, count2, buf, tokens);
                if (pos >= count2) {
                    addToken(tokens, "");
                }
                chars = chars2;
                count = count2;
            }
            return tokens;
        }
        return Collections.EMPTY_LIST;
    }

    private void addToken(List list, String tok) {
        if (tok == null || tok.length() == 0) {
            if (isIgnoreEmptyTokens()) {
                return;
            }
            if (isEmptyTokenAsNull()) {
                tok = null;
            }
        }
        list.add(tok);
    }

    private int readNextToken(char[] chars, int start, int len, StrBuilder workArea, List tokens) {
        int start2 = start;
        while (start2 < len) {
            int removeLen = Math.max(getIgnoredMatcher().isMatch(chars, start2, start2, len), getTrimmerMatcher().isMatch(chars, start2, start2, len));
            if (removeLen == 0 || getDelimiterMatcher().isMatch(chars, start2, start2, len) > 0 || getQuoteMatcher().isMatch(chars, start2, start2, len) > 0) {
                break;
            }
            start2 += removeLen;
        }
        if (start2 >= len) {
            addToken(tokens, "");
            return -1;
        }
        int delimLen = getDelimiterMatcher().isMatch(chars, start2, start2, len);
        if (delimLen > 0) {
            addToken(tokens, "");
            return start2 + delimLen;
        }
        int quoteLen = getQuoteMatcher().isMatch(chars, start2, start2, len);
        if (quoteLen > 0) {
            int start3 = start2;
            return readWithQuotes(chars, start3 + quoteLen, len, workArea, tokens, start3, quoteLen);
        }
        return readWithQuotes(chars, start2, len, workArea, tokens, 0, 0);
    }

    private int readWithQuotes(char[] chars, int start, int len, StrBuilder workArea, List tokens, int quoteStart, int quoteLen) {
        int pos;
        int i = len;
        workArea.clear();
        boolean quoting = quoteLen > 0;
        boolean quoting2 = quoting;
        int trimStart = 0;
        int pos2 = start;
        while (pos2 < i) {
            if (!quoting2) {
                int pos3 = pos2;
                int delimLen = getDelimiterMatcher().isMatch(chars, pos3, start, i);
                if (delimLen > 0) {
                    addToken(tokens, workArea.substring(0, trimStart));
                    return pos3 + delimLen;
                }
                if (quoteLen > 0) {
                    pos = pos3;
                    if (isQuote(chars, pos, i, quoteStart, quoteLen)) {
                        quoting2 = true;
                        pos2 = pos + quoteLen;
                    }
                } else {
                    pos = pos3;
                }
                int ignoredLen = getIgnoredMatcher().isMatch(chars, pos, start, i);
                if (ignoredLen <= 0) {
                    int trimmedLen = getTrimmerMatcher().isMatch(chars, pos, start, i);
                    if (trimmedLen > 0) {
                        workArea.append(chars, pos, trimmedLen);
                        pos2 = pos + trimmedLen;
                    } else {
                        workArea.append(chars[pos]);
                        trimStart = workArea.size();
                        pos2 = pos + 1;
                    }
                } else {
                    pos2 = pos + ignoredLen;
                }
            } else {
                int pos4 = pos2;
                if (isQuote(chars, pos2, i, quoteStart, quoteLen)) {
                    i = len;
                    if (isQuote(chars, pos4 + quoteLen, i, quoteStart, quoteLen)) {
                        workArea.append(chars, pos4, quoteLen);
                        pos2 = (quoteLen * 2) + pos4;
                        trimStart = workArea.size();
                    } else {
                        quoting2 = false;
                        pos2 = pos4 + quoteLen;
                    }
                } else {
                    i = len;
                    pos2 = pos4 + 1;
                    workArea.append(chars[pos4]);
                    trimStart = workArea.size();
                }
            }
        }
        addToken(tokens, workArea.substring(0, trimStart));
        return -1;
    }

    private boolean isQuote(char[] chars, int pos, int len, int quoteStart, int quoteLen) {
        for (int i = 0; i < quoteLen; i++) {
            if (pos + i >= len || chars[pos + i] != chars[quoteStart + i]) {
                return false;
            }
        }
        return true;
    }

    public StrMatcher getDelimiterMatcher() {
        return this.delimMatcher;
    }

    public StrTokenizer setDelimiterMatcher(StrMatcher delim) {
        if (delim == null) {
            this.delimMatcher = StrMatcher.noneMatcher();
        } else {
            this.delimMatcher = delim;
        }
        return this;
    }

    public StrTokenizer setDelimiterChar(char delim) {
        return setDelimiterMatcher(StrMatcher.charMatcher(delim));
    }

    public StrTokenizer setDelimiterString(String delim) {
        return setDelimiterMatcher(StrMatcher.stringMatcher(delim));
    }

    public StrMatcher getQuoteMatcher() {
        return this.quoteMatcher;
    }

    public StrTokenizer setQuoteMatcher(StrMatcher quote) {
        if (quote != null) {
            this.quoteMatcher = quote;
        }
        return this;
    }

    public StrTokenizer setQuoteChar(char quote) {
        return setQuoteMatcher(StrMatcher.charMatcher(quote));
    }

    public StrMatcher getIgnoredMatcher() {
        return this.ignoredMatcher;
    }

    public StrTokenizer setIgnoredMatcher(StrMatcher ignored) {
        if (ignored != null) {
            this.ignoredMatcher = ignored;
        }
        return this;
    }

    public StrTokenizer setIgnoredChar(char ignored) {
        return setIgnoredMatcher(StrMatcher.charMatcher(ignored));
    }

    public StrMatcher getTrimmerMatcher() {
        return this.trimmerMatcher;
    }

    public StrTokenizer setTrimmerMatcher(StrMatcher trimmer) {
        if (trimmer != null) {
            this.trimmerMatcher = trimmer;
        }
        return this;
    }

    public boolean isEmptyTokenAsNull() {
        return this.emptyAsNull;
    }

    public StrTokenizer setEmptyTokenAsNull(boolean emptyAsNull) {
        this.emptyAsNull = emptyAsNull;
        return this;
    }

    public boolean isIgnoreEmptyTokens() {
        return this.ignoreEmptyTokens;
    }

    public StrTokenizer setIgnoreEmptyTokens(boolean ignoreEmptyTokens) {
        this.ignoreEmptyTokens = ignoreEmptyTokens;
        return this;
    }

    public String getContent() {
        if (this.chars == null) {
            return null;
        }
        return new String(this.chars);
    }

    public Object clone() {
        try {
            return cloneReset();
        } catch (CloneNotSupportedException e) {
            return null;
        }
    }

    Object cloneReset() throws CloneNotSupportedException {
        StrTokenizer cloned = (StrTokenizer) super.clone();
        if (cloned.chars != null) {
            cloned.chars = (char[]) cloned.chars.clone();
        }
        cloned.reset();
        return cloned;
    }

    public String toString() {
        if (this.tokens == null) {
            return "StrTokenizer[not tokenized yet]";
        }
        return new StringBuffer().append("StrTokenizer").append(getTokenList()).toString();
    }
}
