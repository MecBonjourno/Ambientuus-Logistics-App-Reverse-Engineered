package org.chromium.net;

import org.chromium.net.BidirectionalStream;

@Deprecated
/* loaded from: classes17.dex */
public abstract class ExperimentalBidirectionalStream extends BidirectionalStream {

    @Deprecated
    public static abstract class Builder extends BidirectionalStream.Builder {
        @Override // org.chromium.net.BidirectionalStream.Builder
        public abstract Builder addHeader(String str, String str2);

        @Override // org.chromium.net.BidirectionalStream.Builder
        public abstract ExperimentalBidirectionalStream build();

        @Override // org.chromium.net.BidirectionalStream.Builder
        public abstract Builder delayRequestHeadersUntilFirstFlush(boolean z);

        @Override // org.chromium.net.BidirectionalStream.Builder
        public abstract Builder setHttpMethod(String str);

        @Override // org.chromium.net.BidirectionalStream.Builder
        public abstract Builder setPriority(int i);

        @Override // org.chromium.net.BidirectionalStream.Builder
        public Builder addRequestAnnotation(Object annotation) {
            return this;
        }

        @Override // org.chromium.net.BidirectionalStream.Builder
        public Builder setTrafficStatsTag(int tag) {
            return this;
        }

        @Override // org.chromium.net.BidirectionalStream.Builder
        public Builder setTrafficStatsUid(int uid) {
            return this;
        }
    }
}
