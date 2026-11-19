package com.google.zxing.pdf417.decoder;

import com.fasterxml.jackson.core.JsonPointer;
import com.google.zxing.FormatException;
import com.google.zxing.common.CharacterSetECI;
import com.google.zxing.common.DecoderResult;
import com.google.zxing.pdf417.PDF417ResultMetadata;
import java.math.BigInteger;
import java.nio.charset.Charset;
import java.util.Arrays;
import kotlin.text.Typography;
import org.apache.commons.lang.CharEncoding;
import org.apache.commons.lang.CharUtils;
import org.apache.commons.lang.ClassUtils;

/* carregado de: classes16.dex */
final class DecodedBitStreamParser {
    private static final int AL = 28;
    private static final int AS = 27;
    private static final int BEGIN_MACRO_PDF417_CONTROL_BLOCK = 928;
    private static final int BEGIN_MACRO_PDF417_OPTIONAL_FIELD = 923;
    private static final int BYTE_COMPACTION_MODE_LATCH = 901;
    private static final int BYTE_COMPACTION_MODE_LATCH_6 = 924;
    private static final int ECI_CHARSET = 927;
    private static final int ECI_GENERAL_PURPOSE = 926;
    private static final int ECI_USER_DEFINED = 925;
    private static final int LL = 27;
    private static final int MACRO_PDF417_TERMINATOR = 922;
    private static final int MAX_NUMERIC_CODEWORDS = 15;
    private static final int ML = 28;
    private static final int MODE_SHIFT_TO_BYTE_COMPACTION_MODE = 913;
    private static final int NUMBER_OF_SEQUENCE_CODEWORDS = 2;
    private static final int NUMERIC_COMPACTION_MODE_LATCH = 902;
    private static final int PAL = 29;
    private static final int PL = 25;
    private static final int PS = 29;
    private static final int TEXT_COMPACTION_MODE_LATCH = 900;
    private static final char[] PUNCT_CHARS = {';', Typography.less, Typography.greater, '@', '[', '\\', ']', '_', '`', '~', '!', CharUtils.CR, '\t', ',', ':', '\n', '-', ClassUtils.PACKAGE_SEPARATOR_CHAR, '$', JsonPointer.SEPARATOR, Typography.quote, '|', '*', '(', ')', '?', '{', '}', '\''};
    private static final char[] MIXED_CHARS = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', Typography.amp, CharUtils.CR, '\t', ',', ':', '#', '-', ClassUtils.PACKAGE_SEPARATOR_CHAR, '$', JsonPointer.SEPARATOR, '+', '%', '*', '=', '^'};
    private static final Charset DEFAULT_ENCODING = Charset.forName(CharEncoding.ISO_8859_1);
    private static final BigInteger[] EXP900 = new BigInteger[16];

    private enum Mode {
        ALPHA,
        LOWER,
        MIXED,
        PUNCT,
        ALPHA_SHIFT,
        PUNCT_SHIFT
    }

    static {
        EXP900[0] = BigInteger.ONE;
        BigInteger nineHundred = BigInteger.valueOf(900L);
        EXP900[1] = nineHundred;
        for (int i = 2; i < EXP900.length; i++) {
            EXP900[i] = EXP900[i - 1].multiply(nineHundred);
        }
    }

    private DecodedBitStreamParser() {
    }

    static DecoderResult decode(int[] iArr, String str) throws FormatException {
        int textCompaction;
        StringBuilder sb = new StringBuilder(iArr.length * 2);
        Charset charset = DEFAULT_ENCODING;
        int i = iArr[1];
        PDF417ResultMetadata pDF417ResultMetadata = new PDF417ResultMetadata();
        for (int i2 = 2; i2 < iArr[0]; i2 = textCompaction + 1) {
            switch (i) {
                case 900:
                    textCompaction = textCompaction(iArr, i2, sb);
                    break;
                case 901:
                case BYTE_COMPACTION_MODE_LATCH_6 /* 924 */:
                    textCompaction = byteCompaction(i, iArr, charset, i2, sb);
                    break;
                case 902:
                    textCompaction = numericCompaction(iArr, i2, sb);
                    break;
                case MODE_SHIFT_TO_BYTE_COMPACTION_MODE /* 913 */:
                    sb.append((char) iArr[i2]);
                    textCompaction = i2 + 1;
                    break;
                case MACRO_PDF417_TERMINATOR /* 922 */:
                case BEGIN_MACRO_PDF417_OPTIONAL_FIELD /* 923 */:
                    throw FormatException.getFormatInstance();
                case ECI_USER_DEFINED /* 925 */:
                    textCompaction = i2 + 1;
                    break;
                case ECI_GENERAL_PURPOSE /* 926 */:
                    textCompaction = i2 + 2;
                    break;
                case ECI_CHARSET /* 927 */:
                    int i3 = i2 + 1;
                    Charset forName = Charset.forName(CharacterSetECI.getCharacterSetECIByValue(iArr[i2]).name());
                    textCompaction = i3;
                    charset = forName;
                    break;
                case 928:
                    textCompaction = decodeMacroBlock(iArr, i2, pDF417ResultMetadata);
                    break;
                default:
                    textCompaction = textCompaction(iArr, i2 - 1, sb);
                    break;
            }
            if (textCompaction < iArr.length) {
                i = iArr[textCompaction];
            } else {
                throw FormatException.getFormatInstance();
            }
        }
        if (sb.length() == 0) {
            throw FormatException.getFormatInstance();
        }
        DecoderResult decoderResult = new DecoderResult(null, sb.toString(), null, str);
        decoderResult.setOther(pDF417ResultMetadata);
        return decoderResult;
    }

    private static int decodeMacroBlock(int[] codewords, int codeIndex, PDF417ResultMetadata resultMetadata) throws FormatException {
        if (codeIndex + 2 > codewords[0]) {
            throw FormatException.getFormatInstance();
        }
        int[] segmentIndexArray = new int[2];
        int i = 0;
        while (i < 2) {
            segmentIndexArray[i] = codewords[codeIndex];
            i++;
            codeIndex++;
        }
        resultMetadata.setSegmentIndex(Integer.parseInt(decodeBase900toBase10(segmentIndexArray, 2)));
        StringBuilder fileId = new StringBuilder();
        int codeIndex2 = textCompaction(codewords, codeIndex, fileId);
        resultMetadata.setFileId(fileId.toString());
        if (codewords[codeIndex2] == BEGIN_MACRO_PDF417_OPTIONAL_FIELD) {
            int code = codeIndex2 + 1;
            int[] additionalOptionCodeWords = new int[codewords[0] - code];
            int additionalOptionCodeWordsIndex = 0;
            boolean end = false;
            while (code < codewords[0] && !end) {
                int codeIndex3 = code + 1;
                int code2 = codewords[code];
                if (code2 < 900) {
                    additionalOptionCodeWords[additionalOptionCodeWordsIndex] = code2;
                    additionalOptionCodeWordsIndex++;
                    code = codeIndex3;
                } else {
                    switch (code2) {
                        case MACRO_PDF417_TERMINATOR /* 922 */:
                            resultMetadata.setLastSegment(true);
                            end = true;
                            code = codeIndex3 + 1;
                            break;
                        default:
                            throw FormatException.getFormatInstance();
                    }
                }
            }
            resultMetadata.setOptionalData(Arrays.copyOf(additionalOptionCodeWords, additionalOptionCodeWordsIndex));
            return code;
        }
        if (codewords[codeIndex2] == MACRO_PDF417_TERMINATOR) {
            resultMetadata.setLastSegment(true);
            return codeIndex2 + 1;
        }
        return codeIndex2;
    }

    private static int textCompaction(int[] codewords, int code, StringBuilder result) {
        int[] textCompactionData = new int[(codewords[0] - code) * 2];
        int[] byteCompactionData = new int[(codewords[0] - code) * 2];
        int index = 0;
        boolean end = false;
        while (code < codewords[0] && !end) {
            int codeIndex = code + 1;
            int code2 = codewords[code];
            if (code2 >= 900) {
                switch (code2) {
                    case 900:
                        textCompactionData[index] = 900;
                        code = codeIndex;
                        index++;
                        break;
                    case 901:
                    case 902:
                    case MACRO_PDF417_TERMINATOR /* 922 */:
                    case BEGIN_MACRO_PDF417_OPTIONAL_FIELD /* 923 */:
                    case BYTE_COMPACTION_MODE_LATCH_6 /* 924 */:
                    case 928:
                        end = true;
                        code = codeIndex - 1;
                        break;
                    case MODE_SHIFT_TO_BYTE_COMPACTION_MODE /* 913 */:
                        textCompactionData[index] = MODE_SHIFT_TO_BYTE_COMPACTION_MODE;
                        byteCompactionData[index] = codewords[codeIndex];
                        index++;
                        code = codeIndex + 1;
                        break;
                    default:
                        code = codeIndex;
                        break;
                }
            } else {
                textCompactionData[index] = code2 / 30;
                textCompactionData[index + 1] = code2 % 30;
                index += 2;
                code = codeIndex;
            }
        }
        decodeTextCompaction(textCompactionData, byteCompactionData, index, result);
        return code;
    }

    private static void decodeTextCompaction(int[] textCompactionData, int[] byteCompactionData, int length, StringBuilder result) {
        Mode subMode = Mode.ALPHA;
        Mode priorToShiftMode = Mode.ALPHA;
        for (int i = 0; i < length; i++) {
            int subModeCh = textCompactionData[i];
            char ch = 0;
            switch (subMode) {
                case ALPHA:
                    if (subModeCh < 26) {
                        ch = (char) (subModeCh + 65);
                        break;
                    } else if (subModeCh == 26) {
                        ch = ' ';
                        break;
                    } else if (subModeCh == 27) {
                        subMode = Mode.LOWER;
                        break;
                    } else if (subModeCh == 28) {
                        subMode = Mode.MIXED;
                        break;
                    } else if (subModeCh == 29) {
                        priorToShiftMode = subMode;
                        subMode = Mode.PUNCT_SHIFT;
                        break;
                    } else if (subModeCh == MODE_SHIFT_TO_BYTE_COMPACTION_MODE) {
                        result.append((char) byteCompactionData[i]);
                        break;
                    } else if (subModeCh == 900) {
                        subMode = Mode.ALPHA;
                        break;
                    }
                    break;
                case LOWER:
                    if (subModeCh < 26) {
                        ch = (char) (subModeCh + 97);
                        break;
                    } else if (subModeCh == 26) {
                        ch = ' ';
                        break;
                    } else if (subModeCh == 27) {
                        priorToShiftMode = subMode;
                        subMode = Mode.ALPHA_SHIFT;
                        break;
                    } else if (subModeCh == 28) {
                        subMode = Mode.MIXED;
                        break;
                    } else if (subModeCh == 29) {
                        priorToShiftMode = subMode;
                        subMode = Mode.PUNCT_SHIFT;
                        break;
                    } else if (subModeCh == MODE_SHIFT_TO_BYTE_COMPACTION_MODE) {
                        result.append((char) byteCompactionData[i]);
                        break;
                    } else if (subModeCh == 900) {
                        subMode = Mode.ALPHA;
                        break;
                    }
                    break;
                case MIXED:
                    if (subModeCh < 25) {
                        ch = MIXED_CHARS[subModeCh];
                        break;
                    } else if (subModeCh == 25) {
                        subMode = Mode.PUNCT;
                        break;
                    } else if (subModeCh == 26) {
                        ch = ' ';
                        break;
                    } else if (subModeCh == 27) {
                        subMode = Mode.LOWER;
                        break;
                    } else if (subModeCh == 28) {
                        subMode = Mode.ALPHA;
                        break;
                    } else if (subModeCh == 29) {
                        priorToShiftMode = subMode;
                        subMode = Mode.PUNCT_SHIFT;
                        break;
                    } else if (subModeCh == MODE_SHIFT_TO_BYTE_COMPACTION_MODE) {
                        result.append((char) byteCompactionData[i]);
                        break;
                    } else if (subModeCh == 900) {
                        subMode = Mode.ALPHA;
                        break;
                    }
                    break;
                case PUNCT:
                    if (subModeCh < 29) {
                        ch = PUNCT_CHARS[subModeCh];
                        break;
                    } else if (subModeCh == 29) {
                        subMode = Mode.ALPHA;
                        break;
                    } else if (subModeCh == MODE_SHIFT_TO_BYTE_COMPACTION_MODE) {
                        result.append((char) byteCompactionData[i]);
                        break;
                    } else if (subModeCh == 900) {
                        subMode = Mode.ALPHA;
                        break;
                    }
                    break;
                case ALPHA_SHIFT:
                    subMode = priorToShiftMode;
                    if (subModeCh < 26) {
                        ch = (char) (subModeCh + 65);
                        break;
                    } else if (subModeCh == 26) {
                        ch = ' ';
                        break;
                    } else if (subModeCh == 900) {
                        subMode = Mode.ALPHA;
                        break;
                    }
                    break;
                case PUNCT_SHIFT:
                    subMode = priorToShiftMode;
                    if (subModeCh < 29) {
                        ch = PUNCT_CHARS[subModeCh];
                        break;
                    } else if (subModeCh == 29) {
                        subMode = Mode.ALPHA;
                        break;
                    } else if (subModeCh == MODE_SHIFT_TO_BYTE_COMPACTION_MODE) {
                        result.append((char) byteCompactionData[i]);
                        break;
                    } else if (subModeCh == 900) {
                        subMode = Mode.ALPHA;
                        break;
                    }
                    break;
            }
            if (ch != 0) {
                result.append(ch);
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:89:0x00e6, code lost:
    
        if (r2 == com.google.zxing.pdf417.decoder.DecodedBitStreamParser.MACRO_PDF417_TERMINATOR) goto L63;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static int byteCompaction(int r26, int[] r27, java.nio.charset.Charset r28, int r29, java.lang.StringBuilder r30) {
        /*
            Method dump skipped, instructions count: 310
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.zxing.pdf417.decoder.DecodedBitStreamParser.byteCompaction(int, int[], java.nio.charset.Charset, int, java.lang.StringBuilder):int");
    }

    private static int numericCompaction(int[] codewords, int code, StringBuilder result) throws FormatException {
        int count = 0;
        boolean end = false;
        int[] numericCodewords = new int[15];
        while (code < codewords[0] && !end) {
            int codeIndex = code + 1;
            int code2 = codewords[code];
            if (codeIndex == codewords[0]) {
                end = true;
            }
            if (code2 < 900) {
                numericCodewords[count] = code2;
                count++;
            } else if (code2 == 900 || code2 == 901 || code2 == BYTE_COMPACTION_MODE_LATCH_6 || code2 == 928 || code2 == BEGIN_MACRO_PDF417_OPTIONAL_FIELD || code2 == MACRO_PDF417_TERMINATOR) {
                codeIndex--;
                end = true;
            }
            if ((count % 15 == 0 || code2 == 902 || end) && count > 0) {
                String s = decodeBase900toBase10(numericCodewords, count);
                result.append(s);
                count = 0;
            }
            code = codeIndex;
        }
        return code;
    }

    private static String decodeBase900toBase10(int[] codewords, int count) throws FormatException {
        BigInteger result = BigInteger.ZERO;
        for (int i = 0; i < count; i++) {
            result = result.add(EXP900[(count - i) - 1].multiply(BigInteger.valueOf(codewords[i])));
        }
        String resultString = result.toString();
        if (resultString.charAt(0) != '1') {
            throw FormatException.getFormatInstance();
        }
        return resultString.substring(1);
    }
}
