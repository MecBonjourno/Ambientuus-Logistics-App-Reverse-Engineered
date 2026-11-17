package com.google.zxing;

import com.google.zxing.aztec.AztecWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.datamatrix.DataMatrixWriter;
import com.google.zxing.oned.CodaBarWriter;
import com.google.zxing.oned.Code128Writer;
import com.google.zxing.oned.Code39Writer;
import com.google.zxing.oned.EAN13Writer;
import com.google.zxing.oned.EAN8Writer;
import com.google.zxing.oned.ITFWriter;
import com.google.zxing.oned.UPCAWriter;
import com.google.zxing.pdf417.PDF417Writer;
import com.google.zxing.qrcode.QRCodeWriter;
import java.util.Map;

/* loaded from: classes16.dex */
public final class MultiFormatWriter implements Writer {
    @Override // com.google.zxing.Writer
    public BitMatrix encode(String contents, BarcodeFormat format, int width, int height) throws WriterException {
        return encode(contents, format, width, height, null);
    }

    @Override // com.google.zxing.Writer
    public BitMatrix encode(String contents, BarcodeFormat format, int width, int height, Map<EncodeHintType, ?> hints) throws WriterException {
        Writer writer;
        switch (format) {
            case EAN_8:
                Writer writer2 = new EAN8Writer();
                writer = writer2;
                break;
            case EAN_13:
                Writer writer3 = new EAN13Writer();
                writer = writer3;
                break;
            case UPC_A:
                Writer writer4 = new UPCAWriter();
                writer = writer4;
                break;
            case QR_CODE:
                Writer writer5 = new QRCodeWriter();
                writer = writer5;
                break;
            case CODE_39:
                Writer writer6 = new Code39Writer();
                writer = writer6;
                break;
            case CODE_128:
                Writer writer7 = new Code128Writer();
                writer = writer7;
                break;
            case ITF:
                Writer writer8 = new ITFWriter();
                writer = writer8;
                break;
            case PDF_417:
                Writer writer9 = new PDF417Writer();
                writer = writer9;
                break;
            case CODABAR:
                Writer writer10 = new CodaBarWriter();
                writer = writer10;
                break;
            case DATA_MATRIX:
                Writer writer11 = new DataMatrixWriter();
                writer = writer11;
                break;
            case AZTEC:
                Writer writer12 = new AztecWriter();
                writer = writer12;
                break;
            default:
                throw new IllegalArgumentException("No encoder available for format " + format);
        }
        return writer.encode(contents, format, width, height, hints);
    }
}
