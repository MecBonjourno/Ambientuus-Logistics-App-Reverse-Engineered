package org.apache.commons.lang.text;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/* carregado de: classes17.dex */
public class StrSubstitutor {
    public static final char DEFAULT_ESCAPE = '$';
    public static final StrMatcher DEFAULT_PREFIX = StrMatcher.stringMatcher("${");
    public static final StrMatcher DEFAULT_SUFFIX = StrMatcher.stringMatcher("}");
    private char escapeChar;
    private StrMatcher prefixMatcher;
    private StrMatcher suffixMatcher;
    private StrLookup variableResolver;

    public static String replace(Object source, Map valueMap) {
        return new StrSubstitutor(valueMap).replace(source);
    }

    public static String replace(Object source, Map valueMap, String prefix, String suffix) {
        return new StrSubstitutor(valueMap, prefix, suffix).replace(source);
    }

    public static String replaceSystemProperties(Object source) {
        return new StrSubstitutor(StrLookup.systemPropertiesLookup()).replace(source);
    }

    /* JADX WARN: chamada 'this' movida para o topo do método (pode alterar a semântica do código) */
    public StrSubstitutor() {
        this((StrLookup) null, DEFAULT_PREFIX, DEFAULT_SUFFIX, '$');
    }

    public StrSubstitutor(Map valueMap) {
        this(StrLookup.mapLookup(valueMap), DEFAULT_PREFIX, DEFAULT_SUFFIX, '$');
    }

    public StrSubstitutor(Map valueMap, String prefix, String suffix) {
        this(StrLookup.mapLookup(valueMap), prefix, suffix, '$');
    }

    public StrSubstitutor(Map valueMap, String prefix, String suffix, char escape) {
        this(StrLookup.mapLookup(valueMap), prefix, suffix, escape);
    }

    public StrSubstitutor(StrLookup variableResolver) {
        this(variableResolver, DEFAULT_PREFIX, DEFAULT_SUFFIX, '$');
    }

    public StrSubstitutor(StrLookup variableResolver, String prefix, String suffix, char escape) {
        setVariableResolver(variableResolver);
        setVariablePrefix(prefix);
        setVariableSuffix(suffix);
        setEscapeChar(escape);
    }

    public StrSubstitutor(StrLookup variableResolver, StrMatcher prefixMatcher, StrMatcher suffixMatcher, char escape) {
        setVariableResolver(variableResolver);
        setVariablePrefixMatcher(prefixMatcher);
        setVariableSuffixMatcher(suffixMatcher);
        setEscapeChar(escape);
    }

    public String replace(String source) {
        if (source == null) {
            return null;
        }
        StrBuilder buf = new StrBuilder(source);
        if (!substitute(buf, 0, source.length())) {
            return source;
        }
        return buf.toString();
    }

    public String replace(String source, int offset, int length) {
        if (source == null) {
            return null;
        }
        StrBuilder buf = new StrBuilder(length).append(source, offset, length);
        if (!substitute(buf, 0, length)) {
            return source.substring(offset, offset + length);
        }
        return buf.toString();
    }

    public String replace(char[] source) {
        if (source == null) {
            return null;
        }
        StrBuilder buf = new StrBuilder(source.length).append(source);
        substitute(buf, 0, source.length);
        return buf.toString();
    }

    public String replace(char[] source, int offset, int length) {
        if (source == null) {
            return null;
        }
        StrBuilder buf = new StrBuilder(length).append(source, offset, length);
        substitute(buf, 0, length);
        return buf.toString();
    }

    public String replace(StringBuffer source) {
        if (source == null) {
            return null;
        }
        StrBuilder buf = new StrBuilder(source.length()).append(source);
        substitute(buf, 0, buf.length());
        return buf.toString();
    }

    public String replace(StringBuffer source, int offset, int length) {
        if (source == null) {
            return null;
        }
        StrBuilder buf = new StrBuilder(length).append(source, offset, length);
        substitute(buf, 0, length);
        return buf.toString();
    }

    public String replace(StrBuilder source) {
        if (source == null) {
            return null;
        }
        StrBuilder buf = new StrBuilder(source.length()).append(source);
        substitute(buf, 0, buf.length());
        return buf.toString();
    }

    public String replace(StrBuilder source, int offset, int length) {
        if (source == null) {
            return null;
        }
        StrBuilder buf = new StrBuilder(length).append(source, offset, length);
        substitute(buf, 0, length);
        return buf.toString();
    }

    public String replace(Object source) {
        if (source == null) {
            return null;
        }
        StrBuilder buf = new StrBuilder().append(source);
        substitute(buf, 0, buf.length());
        return buf.toString();
    }

    public boolean replaceIn(StringBuffer source) {
        if (source == null) {
            return false;
        }
        return replaceIn(source, 0, source.length());
    }

    public boolean replaceIn(StringBuffer source, int offset, int length) {
        if (source == null) {
            return false;
        }
        StrBuilder buf = new StrBuilder(length).append(source, offset, length);
        if (!substitute(buf, 0, length)) {
            return false;
        }
        source.replace(offset, offset + length, buf.toString());
        return true;
    }

    public boolean replaceIn(StrBuilder source) {
        if (source == null) {
            return false;
        }
        return substitute(source, 0, source.length());
    }

    public boolean replaceIn(StrBuilder source, int offset, int length) {
        if (source == null) {
            return false;
        }
        return substitute(source, offset, length);
    }

    protected boolean substitute(StrBuilder buf, int offset, int length) {
        return substitute(buf, offset, length, null) > 0;
    }

    private int substitute(StrBuilder buf, int offset, int length, List priorVariables) {
        StrMatcher prefixMatcher;
        StrMatcher suffixMatcher;
        char escape;
        int i = offset;
        StrMatcher prefixMatcher2 = getVariablePrefixMatcher();
        StrMatcher suffixMatcher2 = getVariableSuffixMatcher();
        char escape2 = getEscapeChar();
        boolean top = priorVariables == null;
        char[] chars = buf.buffer;
        int bufEnd = i + length;
        int pos = offset;
        int bufEnd2 = bufEnd;
        char[] chars2 = chars;
        int lengthChange = 0;
        int lengthChange2 = 0;
        List priorVariables2 = priorVariables;
        while (pos < bufEnd2) {
            int startMatchLen = prefixMatcher2.isMatch(chars2, pos, i, bufEnd2);
            if (startMatchLen == 0) {
                pos++;
                prefixMatcher = prefixMatcher2;
                suffixMatcher = suffixMatcher2;
                escape = escape2;
            } else {
                if (pos > i && chars2[pos - 1] == escape2) {
                    buf.deleteCharAt(pos - 1);
                    char[] chars3 = buf.buffer;
                    lengthChange--;
                    lengthChange2 = 1;
                    bufEnd2--;
                    prefixMatcher = prefixMatcher2;
                    suffixMatcher = suffixMatcher2;
                    escape = escape2;
                    chars2 = chars3;
                }
                int startPos = pos;
                pos += startMatchLen;
                while (true) {
                    if (pos >= bufEnd2) {
                        prefixMatcher = prefixMatcher2;
                        suffixMatcher = suffixMatcher2;
                        escape = escape2;
                        break;
                    }
                    int endMatchLen = suffixMatcher2.isMatch(chars2, pos, i, bufEnd2);
                    if (endMatchLen == 0) {
                        pos++;
                    } else {
                        prefixMatcher = prefixMatcher2;
                        suffixMatcher = suffixMatcher2;
                        escape = escape2;
                        String varName = new String(chars2, startPos + startMatchLen, (pos - startPos) - startMatchLen);
                        pos += endMatchLen;
                        if (priorVariables2 == null) {
                            priorVariables2 = new ArrayList();
                            priorVariables2.add(new String(chars2, i, length));
                        }
                        checkCyclicSubstitution(varName, priorVariables2);
                        priorVariables2.add(varName);
                        String varValue = resolveVariable(varName, buf, startPos, pos);
                        if (varValue != null) {
                            int varLen = varValue.length();
                            buf.replace(startPos, pos, varValue);
                            lengthChange2 = 1;
                            int change = substitute(buf, startPos, varLen, priorVariables2) + (varLen - (pos - startPos));
                            pos += change;
                            bufEnd2 += change;
                            lengthChange += change;
                            chars2 = buf.buffer;
                        }
                        priorVariables2.remove(priorVariables2.size() - 1);
                    }
                }
            }
            i = offset;
            prefixMatcher2 = prefixMatcher;
            suffixMatcher2 = suffixMatcher;
            escape2 = escape;
        }
        if (top) {
            return lengthChange2;
        }
        return lengthChange;
    }

    private void checkCyclicSubstitution(String varName, List priorVariables) {
        if (!priorVariables.contains(varName)) {
            return;
        }
        StrBuilder buf = new StrBuilder(256);
        buf.append("Infinite loop in property interpolation of ");
        buf.append(priorVariables.remove(0));
        buf.append(": ");
        buf.appendWithSeparators(priorVariables, "->");
        throw new IllegalStateException(buf.toString());
    }

    protected String resolveVariable(String variableName, StrBuilder buf, int startPos, int endPos) {
        StrLookup resolver = getVariableResolver();
        if (resolver == null) {
            return null;
        }
        return resolver.lookup(variableName);
    }

    public char getEscapeChar() {
        return this.escapeChar;
    }

    public void setEscapeChar(char escapeCharacter) {
        this.escapeChar = escapeCharacter;
    }

    public StrMatcher getVariablePrefixMatcher() {
        return this.prefixMatcher;
    }

    public StrSubstitutor setVariablePrefixMatcher(StrMatcher prefixMatcher) {
        if (prefixMatcher == null) {
            throw new IllegalArgumentException("Variable prefix matcher must not be null!");
        }
        this.prefixMatcher = prefixMatcher;
        return this;
    }

    public StrSubstitutor setVariablePrefix(char prefix) {
        return setVariablePrefixMatcher(StrMatcher.charMatcher(prefix));
    }

    public StrSubstitutor setVariablePrefix(String prefix) {
        if (prefix == null) {
            throw new IllegalArgumentException("Variable prefix must not be null!");
        }
        return setVariablePrefixMatcher(StrMatcher.stringMatcher(prefix));
    }

    public StrMatcher getVariableSuffixMatcher() {
        return this.suffixMatcher;
    }

    public StrSubstitutor setVariableSuffixMatcher(StrMatcher suffixMatcher) {
        if (suffixMatcher == null) {
            throw new IllegalArgumentException("Variable suffix matcher must not be null!");
        }
        this.suffixMatcher = suffixMatcher;
        return this;
    }

    public StrSubstitutor setVariableSuffix(char suffix) {
        return setVariableSuffixMatcher(StrMatcher.charMatcher(suffix));
    }

    public StrSubstitutor setVariableSuffix(String suffix) {
        if (suffix == null) {
            throw new IllegalArgumentException("Variable suffix must not be null!");
        }
        return setVariableSuffixMatcher(StrMatcher.stringMatcher(suffix));
    }

    public StrLookup getVariableResolver() {
        return this.variableResolver;
    }

    public void setVariableResolver(StrLookup variableResolver) {
        this.variableResolver = variableResolver;
    }
}
