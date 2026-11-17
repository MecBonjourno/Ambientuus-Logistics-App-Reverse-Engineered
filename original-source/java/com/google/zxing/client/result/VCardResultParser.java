package com.google.zxing.client.result;

import androidx.credentials.playservices.controllers.CredentialProviderBaseController;
import com.google.zxing.Result;
import java.io.ByteArrayOutputStream;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import kotlinx.coroutines.internal.LockFreeTaskQueueCore;
import org.apache.commons.lang.CharEncoding;

/* loaded from: classes16.dex */
public final class VCardResultParser extends ResultParser {
    private static final Pattern BEGIN_VCARD = Pattern.compile("BEGIN:VCARD", 2);
    private static final Pattern VCARD_LIKE_DATE = Pattern.compile("\\d{4}-?\\d{2}-?\\d{2}");
    private static final Pattern CR_LF_SPACE_TAB = Pattern.compile("\r\n[ \t]");
    private static final Pattern NEWLINE_ESCAPE = Pattern.compile("\\\\[nN]");
    private static final Pattern VCARD_ESCAPES = Pattern.compile("\\\\([,;\\\\])");
    private static final Pattern EQUALS = Pattern.compile("=");
    private static final Pattern SEMICOLON = Pattern.compile(";");
    private static final Pattern UNESCAPED_SEMICOLONS = Pattern.compile("(?<!\\\\);+");
    private static final Pattern COMMA = Pattern.compile(",");
    private static final Pattern SEMICOLON_OR_COMMA = Pattern.compile("[;,]");

    @Override // com.google.zxing.client.result.ResultParser
    public AddressBookParsedResult parse(Result result) {
        List<String> birthday;
        String[] geo;
        String rawText = getMassagedText(result);
        Matcher m = BEGIN_VCARD.matcher(rawText);
        if (!m.find() || m.start() != 0) {
            return null;
        }
        List<List<String>> names = matchVCardPrefixedField("FN", rawText, true, false);
        if (names == null) {
            names = matchVCardPrefixedField("N", rawText, true, false);
            formatNames(names);
        }
        List<String> nicknameString = matchSingleVCardPrefixedField("NICKNAME", rawText, true, false);
        String[] nicknames = nicknameString == null ? null : COMMA.split(nicknameString.get(0));
        List<List<String>> phoneNumbers = matchVCardPrefixedField("TEL", rawText, true, false);
        List<List<String>> emails = matchVCardPrefixedField("EMAIL", rawText, true, false);
        List<String> note = matchSingleVCardPrefixedField("NOTE", rawText, false, false);
        List<List<String>> addresses = matchVCardPrefixedField("ADR", rawText, true, true);
        List<String> org2 = matchSingleVCardPrefixedField("ORG", rawText, true, true);
        List<String> birthday2 = matchSingleVCardPrefixedField("BDAY", rawText, true, false);
        if (birthday2 != null && !isLikeVCardDate(birthday2.get(0))) {
            birthday = null;
        } else {
            birthday = birthday2;
        }
        List<String> title = matchSingleVCardPrefixedField("TITLE", rawText, true, false);
        List<List<String>> urls = matchVCardPrefixedField("URL", rawText, true, false);
        List<String> instantMessenger = matchSingleVCardPrefixedField("IMPP", rawText, true, false);
        List<String> geoString = matchSingleVCardPrefixedField("GEO", rawText, true, false);
        String[] geo2 = geoString != null ? SEMICOLON_OR_COMMA.split(geoString.get(0)) : null;
        if (geo2 != null && geo2.length != 2) {
            geo = null;
        } else {
            geo = geo2;
        }
        return new AddressBookParsedResult(toPrimaryValues(names), nicknames, null, toPrimaryValues(phoneNumbers), toTypes(phoneNumbers), toPrimaryValues(emails), toTypes(emails), toPrimaryValue(instantMessenger), toPrimaryValue(note), toPrimaryValues(addresses), toTypes(addresses), toPrimaryValue(org2), toPrimaryValue(birthday), toPrimaryValue(title), toPrimaryValues(urls), geo);
    }

    static List<List<String>> matchVCardPrefixedField(CharSequence prefix, String rawText, boolean trim, boolean parseFieldDivider) {
        List<List<String>> matches;
        int i;
        int i2;
        int i3;
        int i4;
        List<List<String>> matches2;
        String element;
        int i5;
        List<List<String>> matches3 = null;
        int i6 = 0;
        int max = rawText.length();
        while (i6 < max) {
            Matcher matcher = Pattern.compile("(?:^|\n)" + ((Object) prefix) + "(?:;([^:]*))?:", 2).matcher(rawText);
            if (i6 > 0) {
                i6--;
            }
            if (!matcher.find(i6)) {
                return matches3;
            }
            int i7 = 0;
            int i8 = matcher.end(0);
            int i9 = 1;
            String metadataString = matcher.group(1);
            List<String> metadata = null;
            boolean quotedPrintable = false;
            String quotedPrintableCharset = null;
            if (metadataString == null) {
                matches = matches3;
                i = i8;
                i2 = 0;
            } else {
                String[] split = SEMICOLON.split(metadataString);
                int length = split.length;
                int i10 = 0;
                while (i10 < length) {
                    int i11 = i7;
                    String metadatum = split[i10];
                    if (metadata == null) {
                        metadata = new ArrayList<>(i9);
                    }
                    metadata.add(metadatum);
                    String[] metadatumTokens = EQUALS.split(metadatum, 2);
                    List<List<String>> matches4 = matches3;
                    if (metadatumTokens.length <= 1) {
                        i5 = i8;
                    } else {
                        String key = metadatumTokens[i11];
                        String value = metadatumTokens[1];
                        i5 = i8;
                        if ("ENCODING".equalsIgnoreCase(key) && "QUOTED-PRINTABLE".equalsIgnoreCase(value)) {
                            quotedPrintable = true;
                        } else if ("CHARSET".equalsIgnoreCase(key)) {
                            quotedPrintableCharset = value;
                        }
                    }
                    i10++;
                    i7 = i11;
                    matches3 = matches4;
                    i8 = i5;
                    i9 = 1;
                }
                matches = matches3;
                i = i8;
                i2 = i7;
            }
            int matchStart = i;
            int i12 = i;
            while (true) {
                int indexOf = rawText.indexOf(10, i12);
                i3 = indexOf;
                if (indexOf < 0) {
                    break;
                }
                if (i3 < rawText.length() - 1 && (rawText.charAt(i3 + 1) == ' ' || rawText.charAt(i3 + 1) == '\t')) {
                    i12 = i3 + 2;
                } else {
                    if (!quotedPrintable) {
                        break;
                    }
                    if (i3 >= 1) {
                        if (rawText.charAt(i3 - 1) == '=') {
                            i12 = i3 + 1;
                        }
                    }
                    if (i3 < 2) {
                        break;
                    }
                    if (rawText.charAt(i3 - 2) != '=') {
                        break;
                    }
                    i12 = i3 + 1;
                }
            }
            if (i3 < 0) {
                i6 = max;
                matches3 = matches;
            } else if (i3 > matchStart) {
                if (matches != null) {
                    i4 = 1;
                    matches2 = matches;
                } else {
                    i4 = 1;
                    matches2 = new ArrayList<>(1);
                }
                if (i3 >= i4 && rawText.charAt(i3 - 1) == '\r') {
                    i3--;
                }
                String element2 = rawText.substring(matchStart, i3);
                if (trim) {
                    element2 = element2.trim();
                }
                if (quotedPrintable) {
                    element = decodeQuotedPrintable(element2, quotedPrintableCharset);
                    if (parseFieldDivider) {
                        element = UNESCAPED_SEMICOLONS.matcher(element).replaceAll("\n").trim();
                    }
                } else {
                    if (parseFieldDivider) {
                        element2 = UNESCAPED_SEMICOLONS.matcher(element2).replaceAll("\n").trim();
                    }
                    element = VCARD_ESCAPES.matcher(NEWLINE_ESCAPE.matcher(CR_LF_SPACE_TAB.matcher(element2).replaceAll("")).replaceAll("\n")).replaceAll("$1");
                }
                if (metadata == null) {
                    List<String> match = new ArrayList<>(1);
                    match.add(element);
                    matches2.add(match);
                } else {
                    metadata.add(i2, element);
                    matches2.add(metadata);
                }
                i6 = i3 + 1;
                matches3 = matches2;
            } else {
                i6 = i3 + 1;
                matches3 = matches;
            }
        }
        return matches3;
    }

    private static String decodeQuotedPrintable(CharSequence value, String charset) {
        char nextChar;
        int length = value.length();
        StringBuilder result = new StringBuilder(length);
        ByteArrayOutputStream fragmentBuffer = new ByteArrayOutputStream();
        int i = 0;
        while (i < length) {
            char c = value.charAt(i);
            switch (c) {
                case '\n':
                case '\r':
                    break;
                case LockFreeTaskQueueCore.CLOSED_SHIFT /* 61 */:
                    if (i < length - 2 && (nextChar = value.charAt(i + 1)) != '\r' && nextChar != '\n') {
                        char nextNextChar = value.charAt(i + 2);
                        int firstDigit = parseHexDigit(nextChar);
                        int secondDigit = parseHexDigit(nextNextChar);
                        if (firstDigit >= 0 && secondDigit >= 0) {
                            fragmentBuffer.write((firstDigit << 4) + secondDigit);
                        }
                        i += 2;
                        break;
                    }
                    break;
                default:
                    maybeAppendFragment(fragmentBuffer, charset, result);
                    result.append(c);
                    break;
            }
            i++;
        }
        maybeAppendFragment(fragmentBuffer, charset, result);
        return result.toString();
    }

    private static void maybeAppendFragment(ByteArrayOutputStream fragmentBuffer, String charset, StringBuilder result) {
        String fragment;
        if (fragmentBuffer.size() > 0) {
            byte[] fragmentBytes = fragmentBuffer.toByteArray();
            if (charset == null) {
                fragment = new String(fragmentBytes, Charset.forName(CharEncoding.UTF_8));
            } else {
                try {
                    fragment = new String(fragmentBytes, charset);
                } catch (UnsupportedEncodingException e) {
                    fragment = new String(fragmentBytes, Charset.forName(CharEncoding.UTF_8));
                }
            }
            fragmentBuffer.reset();
            result.append(fragment);
        }
    }

    static List<String> matchSingleVCardPrefixedField(CharSequence prefix, String rawText, boolean trim, boolean parseFieldDivider) {
        List<List<String>> values = matchVCardPrefixedField(prefix, rawText, trim, parseFieldDivider);
        if (values == null || values.isEmpty()) {
            return null;
        }
        return values.get(0);
    }

    private static String toPrimaryValue(List<String> list) {
        if (list == null || list.isEmpty()) {
            return null;
        }
        return list.get(0);
    }

    private static String[] toPrimaryValues(Collection<List<String>> lists) {
        if (lists == null || lists.isEmpty()) {
            return null;
        }
        List<String> result = new ArrayList<>(lists.size());
        for (List<String> list : lists) {
            String value = list.get(0);
            if (value != null && !value.isEmpty()) {
                result.add(value);
            }
        }
        return (String[]) result.toArray(new String[lists.size()]);
    }

    private static String[] toTypes(Collection<List<String>> lists) {
        if (lists == null || lists.isEmpty()) {
            return null;
        }
        List<String> result = new ArrayList<>(lists.size());
        for (List<String> list : lists) {
            String type = null;
            int i = 1;
            while (true) {
                if (i >= list.size()) {
                    break;
                }
                String metadatum = list.get(i);
                int equals = metadatum.indexOf(61);
                if (equals < 0) {
                    type = metadatum;
                    break;
                }
                if (!CredentialProviderBaseController.TYPE_TAG.equalsIgnoreCase(metadatum.substring(0, equals))) {
                    i++;
                } else {
                    type = metadatum.substring(equals + 1);
                    break;
                }
            }
            result.add(type);
        }
        return (String[]) result.toArray(new String[lists.size()]);
    }

    private static boolean isLikeVCardDate(CharSequence value) {
        return value == null || VCARD_LIKE_DATE.matcher(value).matches();
    }

    private static void formatNames(Iterable<List<String>> names) {
        int end;
        if (names != null) {
            for (List<String> list : names) {
                String name = list.get(0);
                String[] components = new String[5];
                int start = 0;
                int componentIndex = 0;
                while (componentIndex < components.length - 1 && (end = name.indexOf(59, start)) >= 0) {
                    components[componentIndex] = name.substring(start, end);
                    componentIndex++;
                    start = end + 1;
                }
                components[componentIndex] = name.substring(start);
                StringBuilder newName = new StringBuilder(100);
                maybeAppendComponent(components, 3, newName);
                maybeAppendComponent(components, 1, newName);
                maybeAppendComponent(components, 2, newName);
                maybeAppendComponent(components, 0, newName);
                maybeAppendComponent(components, 4, newName);
                list.set(0, newName.toString().trim());
            }
        }
    }

    private static void maybeAppendComponent(String[] components, int i, StringBuilder newName) {
        if (components[i] != null && !components[i].isEmpty()) {
            if (newName.length() > 0) {
                newName.append(' ');
            }
            newName.append(components[i]);
        }
    }
}
