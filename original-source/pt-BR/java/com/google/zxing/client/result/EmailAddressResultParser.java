package com.google.zxing.client.result;

import androidx.constraintlayout.core.motion.utils.TypedValues;
import androidx.core.net.MailTo;
import com.google.zxing.Result;
import java.util.Map;
import java.util.regex.Pattern;

/* carregado de: classes16.dex */
public final class EmailAddressResultParser extends ResultParser {
    private static final Pattern COMMA = Pattern.compile(",");

    @Override // com.google.zxing.client.result.ResultParser
    public EmailAddressParsedResult parse(Result result) {
        String[] tos;
        String[] ccs;
        String[] bccs;
        String subject;
        String body;
        String tosString;
        String rawText = getMassagedText(result);
        if (rawText.startsWith(MailTo.MAILTO_SCHEME) || rawText.startsWith("MAILTO:")) {
            String hostEmail = rawText.substring(7);
            int queryStart = hostEmail.indexOf(63);
            if (queryStart >= 0) {
                hostEmail = hostEmail.substring(0, queryStart);
            }
            String hostEmail2 = urlDecode(hostEmail);
            String[] tos2 = null;
            if (!hostEmail2.isEmpty()) {
                tos2 = COMMA.split(hostEmail2);
            }
            Map<String, String> nameValues = parseNameValuePairs(rawText);
            String[] ccs2 = null;
            String[] bccs2 = null;
            if (nameValues == null) {
                tos = tos2;
                ccs = null;
                bccs = null;
                subject = null;
                body = null;
            } else {
                if (tos2 == null && (tosString = nameValues.get(TypedValues.TransitionType.S_TO)) != null) {
                    tos2 = COMMA.split(tosString);
                }
                String ccString = nameValues.get("cc");
                if (ccString != null) {
                    ccs2 = COMMA.split(ccString);
                }
                String bccString = nameValues.get("bcc");
                if (bccString != null) {
                    bccs2 = COMMA.split(bccString);
                }
                String subject2 = nameValues.get("subject");
                String subject3 = subject2;
                String body2 = nameValues.get("body");
                tos = tos2;
                ccs = ccs2;
                bccs = bccs2;
                subject = subject3;
                body = body2;
            }
            return new EmailAddressParsedResult(tos, ccs, bccs, subject, body);
        }
        if (!EmailDoCoMoResultParser.isBasicallyValidEmailAddress(rawText)) {
            return null;
        }
        return new EmailAddressParsedResult(rawText);
    }
}
