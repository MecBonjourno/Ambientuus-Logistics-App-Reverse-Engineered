package org.apache.commons.lang;

import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

/* loaded from: classes17.dex */
public class LocaleUtils {
    private static final List cAvailableLocaleList;
    private static Set cAvailableLocaleSet;
    private static final Map cLanguagesByCountry = DesugarCollections.synchronizedMap(new HashMap());
    private static final Map cCountriesByLanguage = DesugarCollections.synchronizedMap(new HashMap());

    static {
        List list = Arrays.asList(Locale.getAvailableLocales());
        cAvailableLocaleList = DesugarCollections.unmodifiableList(list);
    }

    public static Locale toLocale(String str) {
        if (str == null) {
            return null;
        }
        int len = str.length();
        if (len != 2 && len != 5 && len < 7) {
            throw new IllegalArgumentException(new StringBuffer().append("Invalid locale format: ").append(str).toString());
        }
        char ch0 = str.charAt(0);
        char ch1 = str.charAt(1);
        if (ch0 < 'a' || ch0 > 'z' || ch1 < 'a' || ch1 > 'z') {
            throw new IllegalArgumentException(new StringBuffer().append("Invalid locale format: ").append(str).toString());
        }
        if (len == 2) {
            return new Locale(str, "");
        }
        if (str.charAt(2) != '_') {
            throw new IllegalArgumentException(new StringBuffer().append("Invalid locale format: ").append(str).toString());
        }
        char ch3 = str.charAt(3);
        if (ch3 == '_') {
            return new Locale(str.substring(0, 2), "", str.substring(4));
        }
        char ch4 = str.charAt(4);
        if (ch3 < 'A' || ch3 > 'Z' || ch4 < 'A' || ch4 > 'Z') {
            throw new IllegalArgumentException(new StringBuffer().append("Invalid locale format: ").append(str).toString());
        }
        if (len == 5) {
            return new Locale(str.substring(0, 2), str.substring(3, 5));
        }
        if (str.charAt(5) != '_') {
            throw new IllegalArgumentException(new StringBuffer().append("Invalid locale format: ").append(str).toString());
        }
        return new Locale(str.substring(0, 2), str.substring(3, 5), str.substring(6));
    }

    public static List localeLookupList(Locale locale) {
        return localeLookupList(locale, locale);
    }

    public static List localeLookupList(Locale locale, Locale defaultLocale) {
        List list = new ArrayList(4);
        if (locale != null) {
            list.add(locale);
            if (locale.getVariant().length() > 0) {
                list.add(new Locale(locale.getLanguage(), locale.getCountry()));
            }
            if (locale.getCountry().length() > 0) {
                list.add(new Locale(locale.getLanguage(), ""));
            }
            if (!list.contains(defaultLocale)) {
                list.add(defaultLocale);
            }
        }
        return DesugarCollections.unmodifiableList(list);
    }

    public static List availableLocaleList() {
        return cAvailableLocaleList;
    }

    public static Set availableLocaleSet() {
        Set set = cAvailableLocaleSet;
        if (set == null) {
            Set set2 = DesugarCollections.unmodifiableSet(new HashSet(availableLocaleList()));
            cAvailableLocaleSet = set2;
            return set2;
        }
        return set;
    }

    public static boolean isAvailableLocale(Locale locale) {
        return availableLocaleList().contains(locale);
    }

    public static List languagesByCountry(String countryCode) {
        List locales = (List) cLanguagesByCountry.get(countryCode);
        if (locales == null) {
            if (countryCode != null) {
                List langs = new ArrayList();
                List locales2 = availableLocaleList();
                for (int i = 0; i < locales2.size(); i++) {
                    Locale locale = (Locale) locales2.get(i);
                    if (countryCode.equals(locale.getCountry()) && locale.getVariant().length() == 0) {
                        langs.add(locale);
                    }
                }
                locales = DesugarCollections.unmodifiableList(langs);
            } else {
                locales = Collections.EMPTY_LIST;
            }
            cLanguagesByCountry.put(countryCode, locales);
        }
        return locales;
    }

    public static List countriesByLanguage(String languageCode) {
        List locales = (List) cCountriesByLanguage.get(languageCode);
        if (locales == null) {
            if (languageCode != null) {
                List countries = new ArrayList();
                List locales2 = availableLocaleList();
                for (int i = 0; i < locales2.size(); i++) {
                    Locale locale = (Locale) locales2.get(i);
                    if (languageCode.equals(locale.getLanguage()) && locale.getCountry().length() != 0 && locale.getVariant().length() == 0) {
                        countries.add(locale);
                    }
                }
                locales = DesugarCollections.unmodifiableList(countries);
            } else {
                locales = Collections.EMPTY_LIST;
            }
            cCountriesByLanguage.put(languageCode, locales);
        }
        return locales;
    }
}
