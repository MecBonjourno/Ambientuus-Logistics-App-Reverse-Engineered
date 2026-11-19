package com.google.zxing.client.result;

import androidx.camera.video.AudioStats;
import com.google.zxing.Result;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* carregado de: classes16.dex */
public final class GeoResultParser extends ResultParser {
    private static final Pattern GEO_URL_PATTERN = Pattern.compile("geo:([\\-0-9.]+),([\\-0-9.]+)(?:,([\\-0-9.]+))?(?:\\?(.*))?", 2);

    @Override // com.google.zxing.client.result.ResultParser
    public GeoParsedResult parse(Result result) {
        double altitude;
        CharSequence rawText = getMassagedText(result);
        Matcher matcher = GEO_URL_PATTERN.matcher(rawText);
        if (!matcher.matches()) {
            return null;
        }
        String query = matcher.group(4);
        try {
            double latitude = Double.parseDouble(matcher.group(1));
            if (latitude <= 90.0d && latitude >= -90.0d) {
                double longitude = Double.parseDouble(matcher.group(2));
                if (longitude <= 180.0d && longitude >= -180.0d) {
                    try {
                        if (matcher.group(3) == null) {
                            altitude = AudioStats.AUDIO_AMPLITUDE_NONE;
                        } else {
                            double altitude2 = Double.parseDouble(matcher.group(3));
                            if (altitude2 < AudioStats.AUDIO_AMPLITUDE_NONE) {
                                return null;
                            }
                            altitude = altitude2;
                        }
                        return new GeoParsedResult(latitude, longitude, altitude, query);
                    } catch (NumberFormatException e) {
                        return null;
                    }
                }
                return null;
            }
            return null;
        } catch (NumberFormatException e2) {
        }
    }
}
