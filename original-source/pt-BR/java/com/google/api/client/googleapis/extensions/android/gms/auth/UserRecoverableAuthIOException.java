package com.google.api.client.googleapis.extensions.android.gms.auth;

import android.content.Intent;
import com.google.android.gms.auth.UserRecoverableAuthException;

/* carregado de: classes16.dex */
public class UserRecoverableAuthIOException extends GoogleAuthIOException {
    private static final long serialVersionUID = 1;

    public UserRecoverableAuthIOException(UserRecoverableAuthException wrapped) {
        super(wrapped);
    }

    @Override // com.google.api.client.googleapis.extensions.android.gms.auth.GoogleAuthIOException, java.lang.Throwable
    public UserRecoverableAuthException getCause() {
        return (UserRecoverableAuthException) super.getCause();
    }

    public final Intent getIntent() {
        return getCause().getIntent();
    }
}
