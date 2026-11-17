package com.google.api.client.googleapis.notifications;

import java.io.IOException;
import java.io.Serializable;

/* loaded from: classes16.dex */
public interface UnparsedNotificationCallback extends Serializable {
    void onNotification(StoredChannel storedChannel, UnparsedNotification unparsedNotification) throws IOException;
}
