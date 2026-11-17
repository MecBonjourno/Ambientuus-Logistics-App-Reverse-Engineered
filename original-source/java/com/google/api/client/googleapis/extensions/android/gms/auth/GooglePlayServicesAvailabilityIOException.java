package com.google.api.client.googleapis.extensions.android.gms.auth;

import com.google.android.gms.auth.GooglePlayServicesAvailabilityException;

/* loaded from: classes16.dex */
public class GooglePlayServicesAvailabilityIOException extends UserRecoverableAuthIOException {
    private static final long serialVersionUID = 1;

    public GooglePlayServicesAvailabilityIOException(GooglePlayServicesAvailabilityException wrapped) {
        super(wrapped);
    }

    @Override // com.google.api.client.googleapis.extensions.android.gms.auth.UserRecoverableAuthIOException, com.google.api.client.googleapis.extensions.android.gms.auth.GoogleAuthIOException, java.lang.Throwable
    public GooglePlayServicesAvailabilityException getCause() {
        return (GooglePlayServicesAvailabilityException) super.getCause();
    }

    public final int getConnectionStatusCode() {
        return getCause().getConnectionStatusCode();
    }
}
