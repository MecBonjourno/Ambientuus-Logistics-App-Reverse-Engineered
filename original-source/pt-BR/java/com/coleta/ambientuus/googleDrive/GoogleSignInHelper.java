package com.coleta.ambientuus.googleDrive;

import android.app.Activity;
import android.content.Context;
import android.os.CancellationSignal;
import android.os.Looper;
import android.util.Log;
import androidx.core.os.HandlerCompat;
import androidx.credentials.Credential;
import androidx.credentials.CredentialManager;
import androidx.credentials.CredentialManagerCallback;
import androidx.credentials.GetCredentialRequest;
import androidx.credentials.GetCredentialResponse;
import androidx.credentials.exceptions.GetCredentialCancellationException;
import androidx.credentials.exceptions.GetCredentialException;
import androidx.credentials.exceptions.NoCredentialException;
import com.coleta.ambientuus.BuildConfig;
import com.google.android.libraries.identity.googleid.GetGoogleIdOption;
import com.google.android.libraries.identity.googleid.GoogleIdTokenCredential;
import java.util.concurrent.Executors;

/* carregado de: classes6.dex */
public class GoogleSignInHelper {
    public static final String TAG = "GoogleSignInHelper";
    private GoogleSignInCallback callback;
    private final CredentialManager credentialManager;

    public interface GoogleSignInCallback {
        void onCancelled();

        void onError(String str);

        void onSuccess(String str, String str2, String str3);
    }

    public GoogleSignInHelper(Context context) {
        this.credentialManager = CredentialManager.CC.create(context);
    }

    public void setCallback(GoogleSignInCallback callback) {
        this.callback = callback;
    }

    public void signIn(Activity activity) {
        Exception e;
        try {
            if (activity != null) {
                try {
                    if (!activity.isFinishing()) {
                        if (activity.isDestroyed()) {
                            notifyError("Atividade Invalida");
                        }
                        GetGoogleIdOption googleIdOption = new GetGoogleIdOption.Builder().setServerClientId(BuildConfig.ServerClientIdGoogleAuth).setFilterByAuthorizedAccounts(false).setAutoSelectEnabled(false).build();
                        GetCredentialRequest request = new GetCredentialRequest.Builder().addCredentialOption(googleIdOption).build();
                        this.credentialManager.getCredentialAsync(activity, request, (CancellationSignal) null, Executors.newSingleThreadExecutor(), new CredentialManagerCallback<GetCredentialResponse, GetCredentialException>() { // da classe: com.coleta.ambientuus.googleDrive.GoogleSignInHelper.1
                            @Override // androidx.credentials.CredentialManagerCallback
                            public void onResult(GetCredentialResponse response) {
                                GoogleSignInHelper.this.handleSignInResult(response);
                            }

                            @Override // androidx.credentials.CredentialManagerCallback
                            public void onError(GetCredentialException e2) {
                                GoogleSignInHelper.this.handleSignInError(e2);
                            }
                        });
                        return;
                    }
                } catch (Exception e2) {
                    e = e2;
                    notifyError("Inicializacao do Login falhou: " + e.getMessage());
                    return;
                }
            }
            notifyError("Atividade Invalida");
        } catch (Exception e3) {
            e = e3;
        }
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public void handleSignInResult(GetCredentialResponse response) {
        try {
            Credential credential = response.getCredential();
            if (GoogleIdTokenCredential.TYPE_GOOGLE_ID_TOKEN_CREDENTIAL.equals(credential.getType())) {
                GoogleIdTokenCredential googleCredential = GoogleIdTokenCredential.createFrom(credential.getData());
                notifySuccess(googleCredential.getZza(), googleCredential.getZzc(), googleCredential.getZzb());
            } else {
                Log.e(TAG, "Tipo de credential não esperado: " + credential.getType());
                notifyError("Credencial inesperada recebida");
            }
        } catch (Exception e) {
            notifyError("Falha ao processar retorno do Login: " + e.getMessage());
        }
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public void handleSignInError(GetCredentialException e) {
        Log.e(TAG, "Erro classe: " + e.getClass().getSimpleName(), e);
        if (e instanceof GetCredentialCancellationException) {
            notifyCancelled();
        } else if (e instanceof NoCredentialException) {
            notifyError("Nenhuma conta do Google encontrada");
        } else {
            notifyError("Login falhou: " + e.getMessage());
        }
    }

    private void notifySuccess(final String id, final String displayName, final String idToken) {
        if (this.callback != null) {
            HandlerCompat.createAsync(Looper.getMainLooper()).post(new Runnable() { // da classe: com.coleta.ambientuus.googleDrive.GoogleSignInHelper$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    GoogleSignInHelper.this.lambda$notifySuccess$0(id, displayName, idToken);
                }
            });
        }
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$notifySuccess$0(String id, String displayName, String idToken) {
        this.callback.onSuccess(id, displayName, idToken);
    }

    private void notifyError(final String error) {
        if (this.callback != null) {
            HandlerCompat.createAsync(Looper.getMainLooper()).post(new Runnable() { // da classe: com.coleta.ambientuus.googleDrive.GoogleSignInHelper$$ExternalSyntheticLambda2
                @Override // java.lang.Runnable
                public final void run() {
                    GoogleSignInHelper.this.lambda$notifyError$1(error);
                }
            });
        }
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$notifyError$1(String error) {
        this.callback.onError(error);
    }

    private void notifyCancelled() {
        if (this.callback != null) {
            HandlerCompat.createAsync(Looper.getMainLooper()).post(new Runnable() { // da classe: com.coleta.ambientuus.googleDrive.GoogleSignInHelper$$ExternalSyntheticLambda1
                @Override // java.lang.Runnable
                public final void run() {
                    GoogleSignInHelper.this.lambda$notifyCancelled$2();
                }
            });
        }
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$notifyCancelled$2() {
        this.callback.onCancelled();
    }
}
