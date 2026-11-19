package com.google.zxing.aztec.decoder;

import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.credentials.exceptions.publickeycredential.DomExceptionUtils;
import androidx.exifinterface.media.ExifInterface;
import com.google.zxing.FormatException;
import com.google.zxing.aztec.AztecDetectorResult;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.DecoderResult;
import com.google.zxing.common.reedsolomon.GenericGF;
import com.google.zxing.common.reedsolomon.ReedSolomonDecoder;
import com.google.zxing.common.reedsolomon.ReedSolomonException;
import java.util.Arrays;
import kotlin.io.encoding.Base64;
import org.chromium.base.BaseSwitches;

/* carregado de: classes16.dex */
public final class Decoder {
    private AztecDetectorResult ddata;
    private static final String[] UPPER_TABLE = {"CTRL_PS", " ", ExifInterface.GPS_MEASUREMENT_IN_PROGRESS, "B", "C", "D", ExifInterface.LONGITUDE_EAST, "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", ExifInterface.LATITUDE_SOUTH, ExifInterface.GPS_DIRECTION_TRUE, "U", ExifInterface.GPS_MEASUREMENT_INTERRUPTED, ExifInterface.LONGITUDE_WEST, "X", "Y", "Z", "CTRL_LL", "CTRL_ML", "CTRL_DL", "CTRL_BS"};
    private static final String[] LOWER_TABLE = {"CTRL_PS", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", BaseSwitches.V, "w", "x", "y", "z", "CTRL_US", "CTRL_ML", "CTRL_DL", "CTRL_BS"};
    private static final String[] MIXED_TABLE = {"CTRL_PS", " ", "\u0001", "\u0002", "\u0003", "\u0004", "\u0005", "\u0006", "\u0007", "\b", "\t", "\n", "\u000b", "\f", "\r", "\u001b", "\u001c", "\u001d", "\u001e", "\u001f", "@", "\\", "^", "_", "`", "|", "~", "\u007f", "CTRL_LL", "CTRL_UL", "CTRL_PL", "CTRL_BS"};
    private static final String[] PUNCT_TABLE = {"", "\r", "\r\n", ". ", ", ", ": ", "!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", DomExceptionUtils.SEPARATOR, ":", ";", "<", "=", ">", "?", "[", "]", "{", "}", "CTRL_UL"};
    private static final String[] DIGIT_TABLE = {"CTRL_PS", " ", "0", "1", ExifInterface.GPS_MEASUREMENT_2D, ExifInterface.GPS_MEASUREMENT_3D, "4", "5", "6", "7", "8", "9", ",", ".", "CTRL_UL", "CTRL_US"};

    private enum Table {
        UPPER,
        LOWER,
        MIXED,
        DIGIT,
        PUNCT,
        BINARY
    }

    public DecoderResult decode(AztecDetectorResult detectorResult) throws FormatException {
        this.ddata = detectorResult;
        BitMatrix matrix = detectorResult.getBits();
        boolean[] rawbits = extractBits(matrix);
        boolean[] correctedBits = correctBits(rawbits);
        String result = getEncodedData(correctedBits);
        return new DecoderResult(null, result, null, null);
    }

    public static String highLevelDecode(boolean[] correctedBits) {
        return getEncodedData(correctedBits);
    }

    private static String getEncodedData(boolean[] correctedBits) {
        int endIndex = correctedBits.length;
        Table latchTable = Table.UPPER;
        Table shiftTable = Table.UPPER;
        StringBuilder result = new StringBuilder(20);
        int index = 0;
        while (index < endIndex) {
            if (shiftTable == Table.BINARY) {
                if (endIndex - index < 5) {
                    break;
                }
                int length = readCode(correctedBits, index, 5);
                index += 5;
                if (length == 0) {
                    if (endIndex - index < 11) {
                        break;
                    }
                    length = readCode(correctedBits, index, 11) + 31;
                    index += 11;
                }
                int charCount = 0;
                while (true) {
                    if (charCount >= length) {
                        break;
                    }
                    if (endIndex - index < 8) {
                        index = endIndex;
                        break;
                    }
                    int code = readCode(correctedBits, index, 8);
                    result.append((char) code);
                    index += 8;
                    charCount++;
                }
                shiftTable = latchTable;
            } else {
                int size = shiftTable == Table.DIGIT ? 4 : 5;
                if (endIndex - index < size) {
                    break;
                }
                int code2 = readCode(correctedBits, index, size);
                index += size;
                String str = getCharacter(shiftTable, code2);
                if (str.startsWith("CTRL_")) {
                    shiftTable = getTable(str.charAt(5));
                    if (str.charAt(6) == 'L') {
                        latchTable = shiftTable;
                    }
                } else {
                    result.append(str);
                    shiftTable = latchTable;
                }
            }
        }
        return result.toString();
    }

    private static Table getTable(char t) {
        switch (t) {
            case ConstraintLayout.LayoutParams.Table.LAYOUT_WRAP_BEHAVIOR_IN_PARENT /* 66 */:
                return Table.BINARY;
            case 'D':
                return Table.DIGIT;
            case Base64.mimeLineLength /* 76 */:
                return Table.LOWER;
            case 'M':
                return Table.MIXED;
            case 'P':
                return Table.PUNCT;
            default:
                return Table.UPPER;
        }
    }

    private static String getCharacter(Table table, int code) {
        switch (table) {
            case UPPER:
                return UPPER_TABLE[code];
            case LOWER:
                return LOWER_TABLE[code];
            case MIXED:
                return MIXED_TABLE[code];
            case PUNCT:
                return PUNCT_TABLE[code];
            case DIGIT:
                return DIGIT_TABLE[code];
            default:
                throw new IllegalStateException("Bad table");
        }
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    private boolean[] correctBits(boolean[] zArr) throws FormatException {
        GenericGF genericGF;
        int i;
        int i2;
        if (this.ddata.getNbLayers() <= 2) {
            genericGF = GenericGF.AZTEC_DATA_6;
            i = 6;
        } else if (this.ddata.getNbLayers() <= 8) {
            genericGF = GenericGF.AZTEC_DATA_8;
            i = 8;
        } else if (this.ddata.getNbLayers() <= 22) {
            genericGF = GenericGF.AZTEC_DATA_10;
            i = 10;
        } else {
            genericGF = GenericGF.AZTEC_DATA_12;
            i = 12;
        }
        int nbDatablocks = this.ddata.getNbDatablocks();
        int length = zArr.length / i;
        if (length < nbDatablocks) {
            throw FormatException.getFormatInstance();
        }
        int i3 = length - nbDatablocks;
        int[] iArr = new int[length];
        int length2 = zArr.length % i;
        int i4 = 0;
        while (i4 < length) {
            iArr[i4] = readCode(zArr, length2, i);
            i4++;
            length2 += i;
        }
        try {
            new ReedSolomonDecoder(genericGF).decode(iArr, i3);
            int i5 = 1;
            int i6 = (1 << i) - 1;
            int i7 = 0;
            for (int i8 = 0; i8 < nbDatablocks; i8++) {
                int i9 = iArr[i8];
                if (i9 == 0 || i9 == i6) {
                    throw FormatException.getFormatInstance();
                }
                if (i9 == 1 || i9 == i6 - 1) {
                    i7++;
                }
            }
            boolean[] zArr2 = new boolean[(nbDatablocks * i) - i7];
            int i10 = 0;
            int i11 = 0;
            while (i11 < nbDatablocks) {
                int i12 = iArr[i11];
                if (i12 != i5) {
                    i2 = i5;
                    if (i12 != i6 - 1) {
                        int i13 = i - 1;
                        while (i13 >= 0) {
                            int i14 = i10 + 1;
                            zArr2[i10] = (i12 & (i2 << i13)) != 0 ? i2 : false;
                            i13--;
                            i10 = i14;
                        }
                        i11++;
                        i5 = 1;
                    }
                } else {
                    i2 = i5;
                }
                int i15 = (i10 + i) - 1;
                int i16 = i2;
                boolean z = i16;
                if (i12 <= i16) {
                    z = 0;
                }
                Arrays.fill(zArr2, i10, i15, z);
                i10 += i - 1;
                i11++;
                i5 = 1;
            }
            return zArr2;
        } catch (ReedSolomonException e) {
            throw FormatException.getFormatInstance(e);
        }
    }

    boolean[] extractBits(BitMatrix matrix) {
        boolean compact = this.ddata.isCompact();
        int layers = this.ddata.getNbLayers();
        int i = layers * 4;
        int baseMatrixSize = compact ? i + 11 : i + 14;
        int[] alignmentMap = new int[baseMatrixSize];
        boolean[] rawbits = new boolean[totalBitsInLayer(layers, compact)];
        int i2 = 2;
        if (!compact) {
            int matrixSize = baseMatrixSize + 1 + ((((baseMatrixSize / 2) - 1) / 15) * 2);
            int origCenter = baseMatrixSize / 2;
            int center = matrixSize / 2;
            for (int i3 = 0; i3 < origCenter; i3++) {
                int newOffset = (i3 / 15) + i3;
                alignmentMap[(origCenter - i3) - 1] = (center - newOffset) - 1;
                alignmentMap[origCenter + i3] = center + newOffset + 1;
            }
        } else {
            for (int i4 = 0; i4 < alignmentMap.length; i4++) {
                alignmentMap[i4] = i4;
            }
        }
        int i5 = 0;
        int rowOffset = 0;
        while (i5 < layers) {
            int i6 = (layers - i5) * 4;
            int rowSize = compact ? i6 + 9 : i6 + 12;
            int low = i5 * 2;
            int high = (baseMatrixSize - 1) - low;
            int j = 0;
            while (j < rowSize) {
                int columnOffset = j * 2;
                int k = 0;
                while (k < i2) {
                    rawbits[rowOffset + columnOffset + k] = matrix.get(alignmentMap[low + k], alignmentMap[low + j]);
                    rawbits[(rowSize * 2) + rowOffset + columnOffset + k] = matrix.get(alignmentMap[low + j], alignmentMap[high - k]);
                    rawbits[(rowSize * 4) + rowOffset + columnOffset + k] = matrix.get(alignmentMap[high - k], alignmentMap[high - j]);
                    rawbits[(rowSize * 6) + rowOffset + columnOffset + k] = matrix.get(alignmentMap[high - j], alignmentMap[low + k]);
                    k++;
                    i2 = 2;
                }
                j++;
                i2 = 2;
            }
            rowOffset += rowSize * 8;
            i5++;
            i2 = 2;
        }
        return rawbits;
    }

    private static int readCode(boolean[] rawbits, int startIndex, int length) {
        int res = 0;
        for (int i = startIndex; i < startIndex + length; i++) {
            res <<= 1;
            if (rawbits[i]) {
                res |= 1;
            }
        }
        return res;
    }

    private static int totalBitsInLayer(int layers, boolean compact) {
        return ((compact ? 88 : 112) + (layers * 16)) * layers;
    }
}
