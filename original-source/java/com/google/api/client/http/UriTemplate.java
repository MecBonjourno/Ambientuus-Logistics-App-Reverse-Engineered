package com.google.api.client.http;

import androidx.credentials.exceptions.publickeycredential.DomExceptionUtils;
import com.fasterxml.jackson.core.JsonPointer;
import com.google.api.client.util.Data;
import com.google.api.client.util.FieldInfo;
import com.google.api.client.util.Preconditions;
import com.google.api.client.util.Types;
import com.google.api.client.util.escape.CharEscapers;
import com.google.common.base.Splitter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.ListIterator;
import java.util.Map;
import kotlin.text.Typography;
import org.apache.commons.lang.ClassUtils;

/* loaded from: classes16.dex */
public class UriTemplate {
    private static final String COMPOSITE_NON_EXPLODE_JOINER = ",";
    static final Map<Character, CompositeOutput> COMPOSITE_PREFIXES = new HashMap();

    static {
        CompositeOutput.values();
    }

    private enum CompositeOutput {
        PLUS('+', "", UriTemplate.COMPOSITE_NON_EXPLODE_JOINER, false, true),
        HASH('#', "#", UriTemplate.COMPOSITE_NON_EXPLODE_JOINER, false, true),
        DOT(Character.valueOf(ClassUtils.PACKAGE_SEPARATOR_CHAR), ".", ".", false, false),
        FORWARD_SLASH(Character.valueOf(JsonPointer.SEPARATOR), DomExceptionUtils.SEPARATOR, DomExceptionUtils.SEPARATOR, false, false),
        SEMI_COLON(';', ";", ";", true, false),
        QUERY('?', "?", "&", true, false),
        AMP(Character.valueOf(Typography.amp), "&", "&", true, false),
        SIMPLE(null, "", UriTemplate.COMPOSITE_NON_EXPLODE_JOINER, false, false);

        private final String explodeJoiner;
        private final String outputPrefix;
        private final Character propertyPrefix;
        private final boolean requiresVarAssignment;
        private final boolean reservedExpansion;

        CompositeOutput(Character propertyPrefix, String outputPrefix, String explodeJoiner, boolean requiresVarAssignment, boolean reservedExpansion) {
            this.propertyPrefix = propertyPrefix;
            this.outputPrefix = (String) Preconditions.checkNotNull(outputPrefix);
            this.explodeJoiner = (String) Preconditions.checkNotNull(explodeJoiner);
            this.requiresVarAssignment = requiresVarAssignment;
            this.reservedExpansion = reservedExpansion;
            if (propertyPrefix != null) {
                UriTemplate.COMPOSITE_PREFIXES.put(propertyPrefix, this);
            }
        }

        String getOutputPrefix() {
            return this.outputPrefix;
        }

        String getExplodeJoiner() {
            return this.explodeJoiner;
        }

        boolean requiresVarAssignment() {
            return this.requiresVarAssignment;
        }

        int getVarNameStartIndex() {
            return this.propertyPrefix == null ? 0 : 1;
        }

        String getEncodedValue(String value) {
            if (this.reservedExpansion) {
                String encodedValue = CharEscapers.escapeUriPath(value);
                return encodedValue;
            }
            String encodedValue2 = CharEscapers.escapeUri(value);
            return encodedValue2;
        }

        boolean getReservedExpansion() {
            return this.reservedExpansion;
        }
    }

    static CompositeOutput getCompositeOutput(String propertyName) {
        CompositeOutput compositeOutput = COMPOSITE_PREFIXES.get(Character.valueOf(propertyName.charAt(0)));
        return compositeOutput == null ? CompositeOutput.SIMPLE : compositeOutput;
    }

    private static Map<String, Object> getMap(Object obj) {
        Map<String, Object> map = new LinkedHashMap<>();
        for (Map.Entry<String, Object> entry : Data.mapOf(obj).entrySet()) {
            Object value = entry.getValue();
            if (value != null && !Data.isNull(value)) {
                map.put(entry.getKey(), value);
            }
        }
        return map;
    }

    public static String expand(String baseUrl, String uriTemplate, Object parameters, boolean addUnusedParamsAsQueryParams) {
        String pathUri;
        if (uriTemplate.startsWith(DomExceptionUtils.SEPARATOR)) {
            GenericUrl url = new GenericUrl(baseUrl);
            url.setRawPath(null);
            pathUri = url.build() + uriTemplate;
        } else if (uriTemplate.startsWith("http://") || uriTemplate.startsWith("https://")) {
            pathUri = uriTemplate;
        } else {
            pathUri = baseUrl + uriTemplate;
        }
        return expand(pathUri, parameters, addUnusedParamsAsQueryParams);
    }

    public static String expand(String pathUri, Object parameters, boolean addUnusedParamsAsQueryParams) {
        Map<String, Object> variableMap;
        int varNameEndIndex;
        char c;
        Map<String, Object> variableMap2;
        Object value;
        Object value2;
        Object value3;
        Object value4;
        String str = pathUri;
        Map<String, Object> variableMap3 = getMap(parameters);
        StringBuilder pathBuf = new StringBuilder();
        int cur = 0;
        int length = str.length();
        while (true) {
            if (cur >= length) {
                variableMap = variableMap3;
                break;
            }
            int next = str.indexOf(123, cur);
            if (next == -1) {
                if (cur == 0 && !addUnusedParamsAsQueryParams) {
                    return str;
                }
                pathBuf.append(str.substring(cur));
                variableMap = variableMap3;
            } else {
                pathBuf.append(str.substring(cur, next));
                int close = str.indexOf(125, next + 2);
                cur = close + 1;
                String templates = str.substring(next + 1, close);
                CompositeOutput compositeOutput = getCompositeOutput(templates);
                ListIterator<String> templateIterator = Splitter.on(',').splitToList(templates).listIterator();
                boolean isFirstParameter = true;
                while (templateIterator.hasNext()) {
                    String template = templateIterator.next();
                    boolean containsExplodeModifier = template.endsWith("*");
                    int varNameStartIndex = templateIterator.nextIndex() == 1 ? compositeOutput.getVarNameStartIndex() : 0;
                    int varNameEndIndex2 = template.length();
                    if (!containsExplodeModifier) {
                        varNameEndIndex = varNameEndIndex2;
                        c = 0;
                    } else {
                        varNameEndIndex = varNameEndIndex2 - 1;
                        c = 0;
                    }
                    String varName = template.substring(varNameStartIndex, varNameEndIndex);
                    Object value5 = variableMap3.remove(varName);
                    if (value5 != null) {
                        if (!isFirstParameter) {
                            variableMap2 = variableMap3;
                            pathBuf.append(compositeOutput.getExplodeJoiner());
                        } else {
                            variableMap2 = variableMap3;
                            pathBuf.append(compositeOutput.getOutputPrefix());
                            isFirstParameter = false;
                        }
                        if (value5 instanceof Iterator) {
                            Iterator<?> iterator = (Iterator) value5;
                            value2 = getListPropertyValue(varName, iterator, containsExplodeModifier, compositeOutput);
                        } else {
                            if (value5 instanceof Iterable) {
                                value = value5;
                            } else if (value5.getClass().isArray()) {
                                value = value5;
                            } else if (value5.getClass().isEnum()) {
                                String name = FieldInfo.of((Enum<?>) value5).getName();
                                if (name == null) {
                                    value2 = value5;
                                } else {
                                    if (!compositeOutput.requiresVarAssignment()) {
                                        value4 = value5;
                                    } else {
                                        Object[] objArr = new Object[2];
                                        objArr[c] = varName;
                                        objArr[1] = value5;
                                        value4 = String.format("%s=%s", objArr);
                                    }
                                    value2 = CharEscapers.escapeUriPath(value4.toString());
                                }
                            } else if (!Data.isValueOfPrimitiveType(value5)) {
                                Map<String, Object> map = getMap(value5);
                                value2 = getMapPropertyValue(varName, map, containsExplodeModifier, compositeOutput);
                            } else {
                                if (!compositeOutput.requiresVarAssignment()) {
                                    value3 = value5;
                                } else {
                                    Object[] objArr2 = new Object[2];
                                    objArr2[c] = varName;
                                    objArr2[1] = value5;
                                    value3 = String.format("%s=%s", objArr2);
                                }
                                if (compositeOutput.getReservedExpansion()) {
                                    value2 = CharEscapers.escapeUriPathWithoutReserved(value3.toString());
                                } else {
                                    value2 = CharEscapers.escapeUriPath(value3.toString());
                                }
                            }
                            Iterator<?> iterator2 = Types.iterableOf(value).iterator();
                            value2 = getListPropertyValue(varName, iterator2, containsExplodeModifier, compositeOutput);
                        }
                        pathBuf.append(value2);
                        variableMap3 = variableMap2;
                    }
                }
                str = pathUri;
            }
        }
        if (addUnusedParamsAsQueryParams) {
            GenericUrl.addQueryParams(variableMap.entrySet(), pathBuf);
        }
        return pathBuf.toString();
    }

    private static String getListPropertyValue(String varName, Iterator<?> iterator, boolean containsExplodeModifier, CompositeOutput compositeOutput) {
        String joiner;
        if (!iterator.hasNext()) {
            return "";
        }
        StringBuilder retBuf = new StringBuilder();
        if (containsExplodeModifier) {
            joiner = compositeOutput.getExplodeJoiner();
        } else {
            joiner = COMPOSITE_NON_EXPLODE_JOINER;
            if (compositeOutput.requiresVarAssignment()) {
                retBuf.append(CharEscapers.escapeUriPath(varName));
                retBuf.append("=");
            }
        }
        while (iterator.hasNext()) {
            if (containsExplodeModifier && compositeOutput.requiresVarAssignment()) {
                retBuf.append(CharEscapers.escapeUriPath(varName));
                retBuf.append("=");
            }
            retBuf.append(compositeOutput.getEncodedValue(iterator.next().toString()));
            if (iterator.hasNext()) {
                retBuf.append(joiner);
            }
        }
        return retBuf.toString();
    }

    private static String getMapPropertyValue(String varName, Map<String, Object> map, boolean containsExplodeModifier, CompositeOutput compositeOutput) {
        String joiner;
        String mapElementsJoiner;
        if (map.isEmpty()) {
            return "";
        }
        StringBuilder retBuf = new StringBuilder();
        if (containsExplodeModifier) {
            joiner = compositeOutput.getExplodeJoiner();
            mapElementsJoiner = "=";
        } else {
            joiner = COMPOSITE_NON_EXPLODE_JOINER;
            mapElementsJoiner = COMPOSITE_NON_EXPLODE_JOINER;
            if (compositeOutput.requiresVarAssignment()) {
                retBuf.append(CharEscapers.escapeUriPath(varName));
                retBuf.append("=");
            }
        }
        Iterator<Map.Entry<String, Object>> mapIterator = map.entrySet().iterator();
        while (mapIterator.hasNext()) {
            Map.Entry<String, Object> entry = mapIterator.next();
            String encodedKey = compositeOutput.getEncodedValue(entry.getKey());
            String encodedValue = compositeOutput.getEncodedValue(entry.getValue().toString());
            retBuf.append(encodedKey);
            retBuf.append(mapElementsJoiner);
            retBuf.append(encodedValue);
            if (mapIterator.hasNext()) {
                retBuf.append(joiner);
            }
        }
        return retBuf.toString();
    }
}
