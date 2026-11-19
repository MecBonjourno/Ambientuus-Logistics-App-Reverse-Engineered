package j$.time.format;

import j$.time.chrono.Chronology;
import j$.time.chrono.IsoChronology;
import j$.time.temporal.ChronoField;
import j$.time.temporal.TemporalField;
import j$.util.concurrent.ConcurrentHashMap;
import java.text.DateFormatSymbols;
import java.util.AbstractMap;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentMap;

/* carregado de: classes15.dex */
class DateTimeTextProvider {
    private static final ConcurrentMap<Map.Entry<TemporalField, Locale>, Object> CACHE = new ConcurrentHashMap(16, 0.75f, 2);
    private static final Comparator<Map.Entry<String, Long>> COMPARATOR = new Comparator<Map.Entry<String, Long>>() { // da classe: j$.time.format.DateTimeTextProvider.1
        @Override // java.util.Comparator
        public int compare(Map.Entry<String, Long> obj1, Map.Entry<String, Long> obj2) {
            return obj2.getKey().length() - obj1.getKey().length();
        }
    };
    private static final DateTimeTextProvider INSTANCE = new DateTimeTextProvider();

    DateTimeTextProvider() {
    }

    static DateTimeTextProvider getInstance() {
        return INSTANCE;
    }

    public String getText(TemporalField field, long value, TextStyle style, Locale locale) {
        Object store = findStore(field, locale);
        if (store instanceof LocaleStore) {
            return ((LocaleStore) store).getText(value, style);
        }
        return null;
    }

    public String getText(Chronology chrono, TemporalField field, long value, TextStyle style, Locale locale) {
        if (chrono == IsoChronology.INSTANCE || !(field instanceof ChronoField)) {
            return getText(field, value, style, locale);
        }
        return null;
    }

    public Iterator<Map.Entry<String, Long>> getTextIterator(TemporalField field, TextStyle style, Locale locale) {
        Object store = findStore(field, locale);
        if (store instanceof LocaleStore) {
            return ((LocaleStore) store).getTextIterator(style);
        }
        return null;
    }

    public Iterator<Map.Entry<String, Long>> getTextIterator(Chronology chrono, TemporalField field, TextStyle style, Locale locale) {
        if (chrono == IsoChronology.INSTANCE || !(field instanceof ChronoField)) {
            return getTextIterator(field, style, locale);
        }
        return null;
    }

    private Object findStore(TemporalField field, Locale locale) {
        Map.Entry<TemporalField, Locale> createEntry = createEntry(field, locale);
        Object store = CACHE.get(createEntry);
        if (store == null) {
            CACHE.putIfAbsent(createEntry, createStore(field, locale));
            return CACHE.get(createEntry);
        }
        return store;
    }

    private static int toWeekDay(int calWeekDay) {
        if (calWeekDay == 1) {
            return 7;
        }
        return calWeekDay - 1;
    }

    private Object createStore(TemporalField field, Locale locale) {
        Map<java.time.format.TextStyle, Map<Long, String>> styleMap = new HashMap<>();
        if (field == ChronoField.ERA) {
            DateFormatSymbols symbols = DateFormatSymbols.getInstance(locale);
            Map<Long, String> fullMap = new HashMap<>();
            Map<Long, String> narrowMap = new HashMap<>();
            String[] eraSymbols = symbols.getEras();
            for (int i = 0; i < eraSymbols.length; i++) {
                if (!eraSymbols[i].isEmpty()) {
                    fullMap.put(Long.valueOf(i), eraSymbols[i]);
                    narrowMap.put(Long.valueOf(i), firstCodePoint(eraSymbols[i]));
                }
            }
            if (!fullMap.isEmpty()) {
                styleMap.put(TextStyle.FULL, fullMap);
                styleMap.put(TextStyle.SHORT, fullMap);
                styleMap.put(TextStyle.NARROW, narrowMap);
            }
            return new LocaleStore(styleMap);
        }
        if (field == ChronoField.MONTH_OF_YEAR) {
            DateFormatSymbols symbols2 = DateFormatSymbols.getInstance(locale);
            DesugarDateTimeTextProviderHelper.populateMonthStyleMap(styleMap, symbols2, locale);
            return new LocaleStore(styleMap);
        }
        if (field == ChronoField.DAY_OF_WEEK) {
            DateFormatSymbols symbols3 = DateFormatSymbols.getInstance(locale);
            DesugarDateTimeTextProviderHelper.populateDayOfWeekStyleMap(styleMap, symbols3, locale);
            return new LocaleStore(styleMap);
        }
        if (field == ChronoField.AMPM_OF_DAY) {
            DateFormatSymbols symbols4 = DateFormatSymbols.getInstance(locale);
            Map<Long, String> fullMap2 = new HashMap<>();
            Map<Long, String> narrowMap2 = new HashMap<>();
            String[] amPmSymbols = symbols4.getAmPmStrings();
            for (int i2 = 0; i2 < amPmSymbols.length; i2++) {
                if (!amPmSymbols[i2].isEmpty()) {
                    fullMap2.put(Long.valueOf(i2), amPmSymbols[i2]);
                    narrowMap2.put(Long.valueOf(i2), firstCodePoint(amPmSymbols[i2]));
                }
            }
            if (!fullMap2.isEmpty()) {
                styleMap.put(TextStyle.FULL, fullMap2);
                styleMap.put(TextStyle.SHORT, fullMap2);
                styleMap.put(TextStyle.NARROW, narrowMap2);
            }
            return new LocaleStore(styleMap);
        }
        return "";
    }

    private static String firstCodePoint(String string) {
        return string.substring(0, Character.charCount(string.codePointAt(0)));
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public static <A, B> Map.Entry<A, B> createEntry(A text, B field) {
        return new AbstractMap.SimpleImmutableEntry(text, field);
    }

    static final class LocaleStore {
        private final Map<TextStyle, List<Map.Entry<String, Long>>> parsable;
        private final Map<TextStyle, Map<Long, String>> valueTextMap;

        /* JADX WARN: região duplicada removida para o bloco: B:7:0x003c  */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        LocaleStore(java.util.Map<j$.time.format.TextStyle, java.util.Map<java.lang.Long, java.lang.String>> r11) {
            /*
                r10 = this;
                r10.<init>()
                r10.valueTextMap = r11
                java.util.HashMap r0 = new java.util.HashMap
                r0.<init>()
                java.util.ArrayList r1 = new java.util.ArrayList
                r1.<init>()
                java.util.Set r2 = r11.entrySet()
                java.util.Iterator r2 = r2.iterator()
            L17:
                boolean r3 = r2.hasNext()
                if (r3 == 0) goto L81
                java.lang.Object r3 = r2.next()
                java.util.Map$Entry r3 = (java.util.Map.Entry) r3
                java.util.HashMap r4 = new java.util.HashMap
                r4.<init>()
                java.lang.Object r5 = r3.getValue()
                java.util.Map r5 = (java.util.Map) r5
                java.util.Set r5 = r5.entrySet()
                java.util.Iterator r5 = r5.iterator()
            L36:
                boolean r6 = r5.hasNext()
                if (r6 == 0) goto L60
                java.lang.Object r6 = r5.next()
                java.util.Map$Entry r6 = (java.util.Map.Entry) r6
                java.lang.Object r7 = r6.getValue()
                java.lang.String r7 = (java.lang.String) r7
                java.lang.Object r8 = r6.getValue()
                java.lang.String r8 = (java.lang.String) r8
                java.lang.Object r9 = r6.getKey()
                java.lang.Long r9 = (java.lang.Long) r9
                java.util.Map$Entry r8 = j$.time.format.DateTimeTextProvider.m819$$Nest$smcreateEntry(r8, r9)
                java.lang.Object r7 = r4.put(r7, r8)
                if (r7 == 0) goto L5f
                goto L36
            L5f:
                goto L36
            L60:
                java.util.ArrayList r5 = new java.util.ArrayList
                java.util.Collection r6 = r4.values()
                r5.<init>(r6)
                java.util.Comparator r6 = j$.time.format.DateTimeTextProvider.m818$$Nest$sfgetCOMPARATOR()
                java.util.Collections.sort(r5, r6)
                java.lang.Object r6 = r3.getKey()
                j$.time.format.TextStyle r6 = (j$.time.format.TextStyle) r6
                r0.put(r6, r5)
                r1.addAll(r5)
                r6 = 0
                r0.put(r6, r1)
                goto L17
            L81:
                java.util.Comparator r2 = j$.time.format.DateTimeTextProvider.m818$$Nest$sfgetCOMPARATOR()
                java.util.Collections.sort(r1, r2)
                r10.parsable = r0
                return
            */
            throw new UnsupportedOperationException("Method not decompiled: j$.time.format.DateTimeTextProvider.LocaleStore.<init>(java.util.Map):void");
        }

        String getText(long value, TextStyle style) {
            Map<Long, String> map = this.valueTextMap.get(style);
            if (map != null) {
                return map.get(Long.valueOf(value));
            }
            return null;
        }

        Iterator<Map.Entry<String, Long>> getTextIterator(TextStyle style) {
            List<Map.Entry<String, Long>> list = this.parsable.get(style);
            if (list != null) {
                return list.iterator();
            }
            return null;
        }
    }
}
