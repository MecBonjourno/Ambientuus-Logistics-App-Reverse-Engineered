package org.chromium.net.apihelpers;

import java.text.ParseException;
import java.util.AbstractMap;
import java.util.Map;

/* carregado de: classes17.dex */
final class ContentTypeParametersParser {
    private static final String TOKEN_ALLOWED_SPECIAL_CHARS = "!#$%&'*+-.^_`|~";
    private int mCurrentPosition;
    private final String mHeaderValue;

    ContentTypeParametersParser(String mHeaderValue) {
        this.mHeaderValue = mHeaderValue;
        int semicolonIndex = mHeaderValue.indexOf(59);
        this.mCurrentPosition = semicolonIndex != -1 ? semicolonIndex + 1 : mHeaderValue.length();
    }

    Map.Entry<String, String> getNextParameter() throws ContentTypeParametersParserException {
        String parameterValue;
        int i = this.mCurrentPosition;
        optionallySkipWhitespace();
        String parameterName = getNextToken();
        if (currentChar() != '=') {
            throw new ContentTypeParametersParserException("Invalid parameter format: expected = at " + this.mCurrentPosition + ": [" + this.mHeaderValue + "]", this.mCurrentPosition);
        }
        advance();
        if (currentChar() == '\"') {
            parameterValue = getNextQuotedString();
        } else {
            parameterValue = getNextToken();
        }
        optionallySkipWhitespace();
        if (hasMore()) {
            if (currentChar() != ';') {
                throw new ContentTypeParametersParserException("Invalid parameter format: expected ; at " + this.mCurrentPosition + ": [" + this.mHeaderValue + "]", this.mCurrentPosition);
            }
            advance();
        }
        return new AbstractMap.SimpleEntry(parameterName, parameterValue);
    }

    private String getNextQuotedString() throws ContentTypeParametersParserException {
        int start = this.mCurrentPosition;
        if (currentChar() != '\"') {
            throw new ContentTypeParametersParserException("Not a quoted string: expected \" at " + this.mCurrentPosition + ": [" + this.mHeaderValue + "]", this.mCurrentPosition);
        }
        advance();
        StringBuilder sb = new StringBuilder();
        boolean escapeNext = false;
        while (hasMore()) {
            if (escapeNext) {
                if (!isQuotedPairChar(currentChar())) {
                    throw new ContentTypeParametersParserException("Invalid character at " + this.mCurrentPosition + ": [" + this.mHeaderValue + "]", this.mCurrentPosition);
                }
                escapeNext = false;
                sb.append(currentChar());
                advance();
            } else {
                if (currentChar() == '\"') {
                    advance();
                    return sb.toString();
                }
                if (currentChar() == '\\') {
                    escapeNext = true;
                    advance();
                } else {
                    if (!isQdtextChar(currentChar())) {
                        throw new ContentTypeParametersParserException("Invalid character at " + this.mCurrentPosition + ": [" + this.mHeaderValue + "]", this.mCurrentPosition);
                    }
                    sb.append(currentChar());
                    advance();
                }
            }
        }
        throw new ContentTypeParametersParserException("Unterminated quoted string at " + start + ": [" + this.mHeaderValue + "]", start);
    }

    private String getNextToken() throws ContentTypeParametersParserException {
        int start = this.mCurrentPosition;
        while (hasMore() && isTokenCharacter(currentChar())) {
            advance();
        }
        if (start == this.mCurrentPosition) {
            throw new ContentTypeParametersParserException("Token not found at position " + start + ": [" + this.mHeaderValue + "]", start);
        }
        return this.mHeaderValue.substring(start, this.mCurrentPosition);
    }

    boolean hasMore() {
        return this.mCurrentPosition < this.mHeaderValue.length();
    }

    private char currentChar() throws ContentTypeParametersParserException {
        if (!hasMore()) {
            throw new ContentTypeParametersParserException("End of header reached", this.mCurrentPosition);
        }
        return this.mHeaderValue.charAt(this.mCurrentPosition);
    }

    private void advance() throws ContentTypeParametersParserException {
        if (!hasMore()) {
            throw new ContentTypeParametersParserException("End of header reached", this.mCurrentPosition);
        }
        this.mCurrentPosition++;
    }

    private void optionallySkipWhitespace() throws ContentTypeParametersParserException {
        while (hasMore() && isWhitespace(currentChar())) {
            advance();
        }
    }

    private static boolean isQdtextChar(char c) {
        return (c == '\\' || c == '\"' || !isQuotedPairChar(c)) ? false : true;
    }

    private static boolean isQuotedPairChar(char c) {
        return isWhitespace(c) || ('!' <= c && c <= 255 && c != 127);
    }

    private static boolean isTokenCharacter(char ch) {
        return isAscii(ch) && (Character.isLetterOrDigit(ch) || TOKEN_ALLOWED_SPECIAL_CHARS.indexOf(ch) != -1);
    }

    private static boolean isAscii(char ch) {
        return ch >= 0 && ch <= 127;
    }

    private static boolean isWhitespace(char c) {
        return c == '\t' || c == ' ';
    }

    static class ContentTypeParametersParserException extends ParseException {
        ContentTypeParametersParserException(String reason, int offset) {
            super(reason, offset);
        }
    }
}
