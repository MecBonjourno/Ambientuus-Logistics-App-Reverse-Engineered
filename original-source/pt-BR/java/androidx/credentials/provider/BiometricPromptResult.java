package androidx.credentials.provider;

import androidx.constraintlayout.widget.ConstraintLayout;
import j$.util.Objects;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: BiometricPromptResult.kt */
@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\b\n\u0000\u0018\u00002\u00020\u0001B\u000f\b\u0016\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004B\u000f\b\u0016\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0002\u0010\u0007B\u001f\b\u0000\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0002\u0010\bJ\u0013\u0010\u0010\u001a\u00020\u000e2\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001H\u0096\u0002J\b\u0010\u0012\u001a\u00020\u0013H\u0016R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\r\u001a\u00020\u000e¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000f¨\u0006\u0014"}, d2 = {"Landroidx/credentials/provider/BiometricPromptResult;", "", "authenticationError", "Landroidx/credentials/provider/AuthenticationError;", "(Landroidx/credentials/provider/AuthenticationError;)V", "authenticationResult", "Landroidx/credentials/provider/AuthenticationResult;", "(Landroidx/credentials/provider/AuthenticationResult;)V", "(Landroidx/credentials/provider/AuthenticationResult;Landroidx/credentials/provider/AuthenticationError;)V", "getAuthenticationError", "()Landroidx/credentials/provider/AuthenticationError;", "getAuthenticationResult", "()Landroidx/credentials/provider/AuthenticationResult;", "isSuccessful", "", "()Z", "equals", "other", "hashCode", "", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* carregado de: classes.dex */
public final class BiometricPromptResult {
    private final AuthenticationError authenticationError;
    private final AuthenticationResult authenticationResult;
    private final boolean isSuccessful;

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    public BiometricPromptResult() {
        this(null, 0 == true ? 1 : 0, 3, 0 == true ? 1 : 0);
    }

    public BiometricPromptResult(AuthenticationResult authenticationResult, AuthenticationError authenticationError) {
        this.authenticationResult = authenticationResult;
        this.authenticationError = authenticationError;
        this.isSuccessful = this.authenticationResult != null;
    }

    public /* sintético */ BiometricPromptResult(AuthenticationResult authenticationResult, AuthenticationError authenticationError, int i, DefaultConstructorMarker defaultConstructorMarker) {
        this((i & 1) != 0 ? null : authenticationResult, (i & 2) != 0 ? null : authenticationError);
    }

    public final AuthenticationResult getAuthenticationResult() {
        return this.authenticationResult;
    }

    public final AuthenticationError getAuthenticationError() {
        return this.authenticationError;
    }

    /* renomeado de: isSuccessful, motivo: de getter */
    public final boolean getIsSuccessful() {
        return this.isSuccessful;
    }

    /* JADX WARN: chamada 'this' movida para o topo do método (pode alterar a semântica do código) */
    public BiometricPromptResult(AuthenticationError authenticationError) {
        this(null, authenticationError);
        Intrinsics.checkNotNullParameter(authenticationError, "authenticationError");
    }

    /* JADX WARN: chamada 'this' movida para o topo do método (pode alterar a semântica do código) */
    public BiometricPromptResult(AuthenticationResult authenticationResult) {
        this(authenticationResult, null);
        Intrinsics.checkNotNullParameter(authenticationResult, "authenticationResult");
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (other instanceof BiometricPromptResult) {
            return this.isSuccessful == ((BiometricPromptResult) other).isSuccessful && Intrinsics.areEqual(this.authenticationResult, ((BiometricPromptResult) other).authenticationResult) && Intrinsics.areEqual(this.authenticationError, ((BiometricPromptResult) other).authenticationError);
        }
        return false;
    }

    public int hashCode() {
        return Objects.hash(Boolean.valueOf(this.isSuccessful), this.authenticationResult, this.authenticationError);
    }
}
