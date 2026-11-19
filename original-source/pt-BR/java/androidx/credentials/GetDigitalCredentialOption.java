package androidx.credentials;

import android.content.ComponentName;
import android.os.Bundle;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.credentials.internal.FrameworkClassParsingException;
import androidx.credentials.internal.RequestValidationHelper;
import java.util.Set;
import kotlin.Metadata;
import kotlin.collections.SetsKt;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: GetDigitalCredentialOption.kt */
@Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\"\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0005\b\u0007\u0018\u0000 \u00132\u00020\u0001:\u0001\u0013B\u000f\b\u0016\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004BE\b\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\b\u001a\u00020\t\u0012\u0006\u0010\n\u001a\u00020\t\u0012\f\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\r0\f\u0012\u0006\u0010\u000e\u001a\u00020\u000f¢\u0006\u0002\u0010\u0010R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012¨\u0006\u0014"}, d2 = {"Landroidx/credentials/GetDigitalCredentialOption;", "Landroidx/credentials/CredentialOption;", "requestJson", "", "(Ljava/lang/String;)V", "requestData", "Landroid/os/Bundle;", "candidateQueryData", "isSystemProviderRequired", "", "isAutoSelectAllowed", "allowedProviders", "", "Landroid/content/ComponentName;", "typePriorityHint", "", "(Ljava/lang/String;Landroid/os/Bundle;Landroid/os/Bundle;ZZLjava/util/Set;I)V", "getRequestJson", "()Ljava/lang/String;", "Companion", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* carregado de: classes.dex */
public final class GetDigitalCredentialOption extends CredentialOption {
    public static final String BUNDLE_KEY_REQUEST_JSON = "androidx.credentials.BUNDLE_KEY_REQUEST_JSON";

    /* renomeado de: Companion, motivo: de metadados do Kotlin */
    public static final Companion INSTANCE = new Companion(null);
    private final String requestJson;

    public final String getRequestJson() {
        return this.requestJson;
    }

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    public GetDigitalCredentialOption(String requestJson, Bundle requestData, Bundle candidateQueryData, boolean isSystemProviderRequired, boolean isAutoSelectAllowed, Set<ComponentName> allowedProviders, int typePriorityHint) {
        super(DigitalCredential.TYPE_DIGITAL_CREDENTIAL, requestData, candidateQueryData, isSystemProviderRequired, isAutoSelectAllowed, allowedProviders, typePriorityHint);
        Intrinsics.checkNotNullParameter(requestJson, "requestJson");
        Intrinsics.checkNotNullParameter(requestData, "requestData");
        Intrinsics.checkNotNullParameter(candidateQueryData, "candidateQueryData");
        Intrinsics.checkNotNullParameter(allowedProviders, "allowedProviders");
        this.requestJson = requestJson;
        if (RequestValidationHelper.INSTANCE.isValidJSON(this.requestJson)) {
        } else {
            throw new IllegalArgumentException("credentialJson must not be empty, and must be a valid JSON".toString());
        }
    }

    /* JADX WARN: chamada 'this' movida para o topo do método (pode alterar a semântica do código) */
    public GetDigitalCredentialOption(String requestJson) {
        this(requestJson, INSTANCE.toBundle$credentials_release(requestJson), INSTANCE.toBundle$credentials_release(requestJson), false, false, SetsKt.emptySet(), 100);
        Intrinsics.checkNotNullParameter(requestJson, "requestJson");
    }

    /* compiled from: GetDigitalCredentialOption.kt */
    @Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\"\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0080\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J3\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\b2\u0006\u0010\n\u001a\u00020\u000b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u000e0\rH\u0001¢\u0006\u0002\b\u000fJ\u0015\u0010\u0010\u001a\u00020\b2\u0006\u0010\u0011\u001a\u00020\u0004H\u0001¢\u0006\u0002\b\u0012R\u000e\u0010\u0003\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000¨\u0006\u0013"}, d2 = {"Landroidx/credentials/GetDigitalCredentialOption$Companion;", "", "()V", "BUNDLE_KEY_REQUEST_JSON", "", "createFrom", "Landroidx/credentials/GetDigitalCredentialOption;", "requestData", "Landroid/os/Bundle;", "candidateQueryData", "requireSystemProvider", "", "allowedProviders", "", "Landroid/content/ComponentName;", "createFrom$credentials_release", "toBundle", "requestJson", "toBundle$credentials_release", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    public static final class Companion {
        public /* sintético */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        @JvmStatic
        public final Bundle toBundle$credentials_release(String requestJson) {
            Intrinsics.checkNotNullParameter(requestJson, "requestJson");
            Bundle bundle = new Bundle();
            bundle.putString("androidx.credentials.BUNDLE_KEY_REQUEST_JSON", requestJson);
            return bundle;
        }

        @JvmStatic
        public final GetDigitalCredentialOption createFrom$credentials_release(Bundle requestData, Bundle candidateQueryData, boolean requireSystemProvider, Set<ComponentName> allowedProviders) {
            String requestJson;
            Intrinsics.checkNotNullParameter(requestData, "requestData");
            Intrinsics.checkNotNullParameter(candidateQueryData, "candidateQueryData");
            Intrinsics.checkNotNullParameter(allowedProviders, "allowedProviders");
            try {
                requestJson = requestData.getString("androidx.credentials.BUNDLE_KEY_REQUEST_JSON");
                Intrinsics.checkNotNull(requestJson);
            } catch (Exception e) {
            }
            try {
                return new GetDigitalCredentialOption(requestJson, requestData, candidateQueryData, requireSystemProvider, requestData.getBoolean("androidx.credentials.BUNDLE_KEY_IS_AUTO_SELECT_ALLOWED", false), allowedProviders, requestData.getInt(CredentialOption.BUNDLE_KEY_TYPE_PRIORITY_VALUE, 100));
            } catch (Exception e2) {
                throw new FrameworkClassParsingException();
            }
        }
    }
}
