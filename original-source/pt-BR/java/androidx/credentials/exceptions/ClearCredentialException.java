package androidx.credentials.exceptions;

import android.os.Bundle;
import androidx.constraintlayout.widget.ConstraintLayout;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: ClearCredentialException.kt */
@Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\r\n\u0002\b\u0007\b&\u0018\u0000 \f2\u00060\u0001j\u0002`\u0002:\u0001\fB\u001b\b\u0001\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\u0002\u0010\u0007R\u0018\u0010\u0005\u001a\u0004\u0018\u00010\u00068\u0017X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0016\u0010\u0003\u001a\u00020\u00048\u0017X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\r"}, d2 = {"Landroidx/credentials/exceptions/ClearCredentialException;", "Ljava/lang/Exception;", "Lkotlin/Exception;", "type", "", "errorMessage", "", "(Ljava/lang/String;Ljava/lang/CharSequence;)V", "getErrorMessage", "()Ljava/lang/CharSequence;", "getType", "()Ljava/lang/String;", "Companion", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* carregado de: classes.dex */
public abstract class ClearCredentialException extends Exception {

    /* renomeado de: Companion, motivo: de metadados do Kotlin */
    public static final Companion INSTANCE = new Companion(null);
    private static final String EXTRA_CLEAR_CREDENTIAL_EXCEPTION_MESSAGE = "androidx.credentials.provider.extra.CLEAR_CREDENTIAL_EXCEPTION_MESSAGE";
    private static final String EXTRA_CLEAR_CREDENTIAL_EXCEPTION_TYPE = "androidx.credentials.provider.extra.CLEAR_CREDENTIAL_EXCEPTION_TYPE";
    private final CharSequence errorMessage;
    private final String type;

    public /* sintético */ ClearCredentialException(String str, CharSequence charSequence, int i, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, (i & 2) != 0 ? null : charSequence);
    }

    public String getType() {
        return this.type;
    }

    public CharSequence getErrorMessage() {
        return this.errorMessage;
    }

    /* compiled from: ClearCredentialException.kt */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0010\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\tH\u0007J\u0010\u0010\n\u001a\u00020\t2\u0006\u0010\u000b\u001a\u00020\u0007H\u0007R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000¨\u0006\f"}, d2 = {"Landroidx/credentials/exceptions/ClearCredentialException$Companion;", "", "()V", "EXTRA_CLEAR_CREDENTIAL_EXCEPTION_MESSAGE", "", "EXTRA_CLEAR_CREDENTIAL_EXCEPTION_TYPE", "asBundle", "Landroid/os/Bundle;", "ex", "Landroidx/credentials/exceptions/ClearCredentialException;", "fromBundle", "bundle", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    public static final class Companion {
        public /* sintético */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        @JvmStatic
        public final Bundle asBundle(ClearCredentialException ex) {
            Intrinsics.checkNotNullParameter(ex, "ex");
            Bundle bundle = new Bundle();
            bundle.putString(ClearCredentialException.EXTRA_CLEAR_CREDENTIAL_EXCEPTION_TYPE, ex.getType());
            CharSequence it = ex.getErrorMessage();
            if (it != null) {
                bundle.putCharSequence(ClearCredentialException.EXTRA_CLEAR_CREDENTIAL_EXCEPTION_MESSAGE, it);
            }
            return bundle;
        }

        /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue
        java.lang.NullPointerException: Cannot invoke "java.util.List.iterator()" because the return value of "jadx.core.dex.visitors.regions.SwitchOverStringVisitor$SwitchData.getNewCases()" is null
        	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.restoreSwitchOverString(SwitchOverStringVisitor.java:109)
        	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.visitRegion(SwitchOverStringVisitor.java:66)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:77)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:82)
         */
        @JvmStatic
        public final ClearCredentialException fromBundle(Bundle bundle) {
            Intrinsics.checkNotNullParameter(bundle, "bundle");
            String type = bundle.getString(ClearCredentialException.EXTRA_CLEAR_CREDENTIAL_EXCEPTION_TYPE);
            if (type == null) {
                throw new IllegalArgumentException("Bundle was missing exception type.");
            }
            CharSequence msg = bundle.getCharSequence(ClearCredentialException.EXTRA_CLEAR_CREDENTIAL_EXCEPTION_MESSAGE);
            switch (type.hashCode()) {
                case -404396566:
                    if (type.equals(ClearCredentialInterruptedException.TYPE_CLEAR_CREDENTIAL_INTERRUPTED_EXCEPTION)) {
                        return new ClearCredentialInterruptedException(msg);
                    }
                    break;
                case 1050953245:
                    if (type.equals(ClearCredentialUnsupportedException.TYPE_CLEAR_CREDENTIAL_UNSUPPORTED_EXCEPTION)) {
                        return new ClearCredentialUnsupportedException(msg);
                    }
                    break;
                case 1202393376:
                    if (type.equals(ClearCredentialProviderConfigurationException.TYPE_CLEAR_CREDENTIAL_PROVIDER_CONFIGURATION_EXCEPTION)) {
                        return new ClearCredentialProviderConfigurationException(msg);
                    }
                    break;
                case 1859614946:
                    if (type.equals(ClearCredentialUnknownException.TYPE_CLEAR_CREDENTIAL_UNKNOWN_EXCEPTION)) {
                        return new ClearCredentialUnknownException(msg);
                    }
                    break;
            }
            return new ClearCredentialCustomException(type, msg);
        }
    }

    /* JADX WARN: chamada 'this' movida para o topo do método (pode alterar a semântica do código) */
    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    public ClearCredentialException(String type) {
        this(type, null, 2, 0 == true ? 1 : 0);
        Intrinsics.checkNotNullParameter(type, "type");
    }

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    public ClearCredentialException(String type, CharSequence errorMessage) {
        super(errorMessage != null ? errorMessage.toString() : null);
        Intrinsics.checkNotNullParameter(type, "type");
        this.type = type;
        this.errorMessage = errorMessage;
    }

    @JvmStatic
    public static final Bundle asBundle(ClearCredentialException ex) {
        return INSTANCE.asBundle(ex);
    }

    @JvmStatic
    public static final ClearCredentialException fromBundle(Bundle bundle) {
        return INSTANCE.fromBundle(bundle);
    }
}
