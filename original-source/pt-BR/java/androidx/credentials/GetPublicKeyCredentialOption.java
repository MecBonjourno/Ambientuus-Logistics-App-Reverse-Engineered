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

/* compiled from: GetPublicKeyCredentialOption.kt */
@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0012\n\u0000\n\u0002\u0010\"\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0007\u0018\u0000 \u00142\u00020\u0001:\u0001\u0014B+\b\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u000e\b\u0002\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\b0\u0007¢\u0006\u0002\u0010\tBA\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\f\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\b0\u0007\u0012\u0006\u0010\n\u001a\u00020\u000b\u0012\u0006\u0010\f\u001a\u00020\u000b\u0012\b\b\u0002\u0010\r\u001a\u00020\u000e¢\u0006\u0002\u0010\u000fR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013¨\u0006\u0015"}, d2 = {"Landroidx/credentials/GetPublicKeyCredentialOption;", "Landroidx/credentials/CredentialOption;", "requestJson", "", "clientDataHash", "", "allowedProviders", "", "Landroid/content/ComponentName;", "(Ljava/lang/String;[BLjava/util/Set;)V", "requestData", "Landroid/os/Bundle;", "candidateQueryData", "typePriorityCategory", "", "(Ljava/lang/String;[BLjava/util/Set;Landroid/os/Bundle;Landroid/os/Bundle;I)V", "getClientDataHash", "()[B", "getRequestJson", "()Ljava/lang/String;", "Companion", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* carregado de: classes.dex */
public final class GetPublicKeyCredentialOption extends CredentialOption {
    public static final String BUNDLE_KEY_CLIENT_DATA_HASH = "androidx.credentials.BUNDLE_KEY_CLIENT_DATA_HASH";
    public static final String BUNDLE_KEY_REQUEST_JSON = "androidx.credentials.BUNDLE_KEY_REQUEST_JSON";
    public static final String BUNDLE_VALUE_SUBTYPE_GET_PUBLIC_KEY_CREDENTIAL_OPTION = "androidx.credentials.BUNDLE_VALUE_SUBTYPE_GET_PUBLIC_KEY_CREDENTIAL_OPTION";

    /* renomeado de: Companion, motivo: de metadados do Kotlin */
    public static final Companion INSTANCE = new Companion(null);
    private final byte[] clientDataHash;
    private final String requestJson;

    public /* sintético */ GetPublicKeyCredentialOption(String str, byte[] bArr, Set set, Bundle bundle, Bundle bundle2, int i, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, bArr, set, bundle, bundle2, i);
    }

    /* JADX WARN: instruções ilegais antes da chamada do construtor */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    /* sintético */ GetPublicKeyCredentialOption(java.lang.String r8, byte[] r9, java.util.Set r10, android.os.Bundle r11, android.os.Bundle r12, int r13, int r14, kotlin.jvm.internal.DefaultConstructorMarker r15) {
        /*
            r7 = this;
            r14 = r14 & 32
            if (r14 == 0) goto L8
            r13 = 100
            r6 = r13
            goto L9
        L8:
            r6 = r13
        L9:
            r0 = r7
            r1 = r8
            r2 = r9
            r3 = r10
            r4 = r11
            r5 = r12
            r0.<init>(r1, r2, r3, r4, r5, r6)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.credentials.GetPublicKeyCredentialOption.<init>(java.lang.String, byte[], java.util.Set, android.os.Bundle, android.os.Bundle, int, int, kotlin.jvm.internal.DefaultConstructorMarker):void");
    }

    public final String getRequestJson() {
        return this.requestJson;
    }

    public final byte[] getClientDataHash() {
        return this.clientDataHash;
    }

    private GetPublicKeyCredentialOption(String requestJson, byte[] clientDataHash, Set<ComponentName> set, Bundle requestData, Bundle candidateQueryData, int typePriorityCategory) {
        super(PublicKeyCredential.TYPE_PUBLIC_KEY_CREDENTIAL, requestData, candidateQueryData, false, true, set, typePriorityCategory);
        this.requestJson = requestJson;
        this.clientDataHash = clientDataHash;
        if (RequestValidationHelper.INSTANCE.isValidJSON(this.requestJson)) {
        } else {
            throw new IllegalArgumentException("requestJson must not be empty, and must be a valid JSON".toString());
        }
    }

    public /* sintético */ GetPublicKeyCredentialOption(String str, byte[] bArr, Set set, int i, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, (i & 2) != 0 ? null : bArr, (i & 4) != 0 ? SetsKt.emptySet() : set);
    }

    /* JADX WARN: chamada 'this' movida para o topo do método (pode alterar a semântica do código) */
    public GetPublicKeyCredentialOption(String requestJson, byte[] clientDataHash, Set<ComponentName> allowedProviders) {
        this(requestJson, clientDataHash, allowedProviders, INSTANCE.toRequestDataBundle$credentials_release(requestJson, clientDataHash), INSTANCE.toRequestDataBundle$credentials_release(requestJson, clientDataHash), 0, 32, null);
        Intrinsics.checkNotNullParameter(requestJson, "requestJson");
        Intrinsics.checkNotNullParameter(allowedProviders, "allowedProviders");
    }

    /* JADX WARN: chamada 'this' movida para o topo do método (pode alterar a semântica do código) */
    public GetPublicKeyCredentialOption(String requestJson) {
        this(requestJson, null, null, 6, null);
        Intrinsics.checkNotNullParameter(requestJson, "requestJson");
    }

    /* JADX WARN: chamada 'this' movida para o topo do método (pode alterar a semântica do código) */
    public GetPublicKeyCredentialOption(String requestJson, byte[] clientDataHash) {
        this(requestJson, clientDataHash, null, 4, null);
        Intrinsics.checkNotNullParameter(requestJson, "requestJson");
    }

    /* compiled from: GetPublicKeyCredentialOption.kt */
    @Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\"\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0012\n\u0002\b\u0002\b\u0080\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J+\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\n2\f\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\r0\f2\u0006\u0010\u000e\u001a\u00020\nH\u0001¢\u0006\u0002\b\u000fJ\u001f\u0010\u0010\u001a\u00020\n2\u0006\u0010\u0011\u001a\u00020\u00042\b\u0010\u0012\u001a\u0004\u0018\u00010\u0013H\u0001¢\u0006\u0002\b\u0014R\u000e\u0010\u0003\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000¨\u0006\u0015"}, d2 = {"Landroidx/credentials/GetPublicKeyCredentialOption$Companion;", "", "()V", "BUNDLE_KEY_CLIENT_DATA_HASH", "", "BUNDLE_KEY_REQUEST_JSON", "BUNDLE_VALUE_SUBTYPE_GET_PUBLIC_KEY_CREDENTIAL_OPTION", "createFrom", "Landroidx/credentials/GetPublicKeyCredentialOption;", "data", "Landroid/os/Bundle;", "allowedProviders", "", "Landroid/content/ComponentName;", "candidateQueryData", "createFrom$credentials_release", "toRequestDataBundle", "requestJson", "clientDataHash", "", "toRequestDataBundle$credentials_release", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    public static final class Companion {
        public /* sintético */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        @JvmStatic
        public final Bundle toRequestDataBundle$credentials_release(String requestJson, byte[] clientDataHash) {
            Intrinsics.checkNotNullParameter(requestJson, "requestJson");
            Bundle bundle = new Bundle();
            bundle.putString(PublicKeyCredential.BUNDLE_KEY_SUBTYPE, GetPublicKeyCredentialOption.BUNDLE_VALUE_SUBTYPE_GET_PUBLIC_KEY_CREDENTIAL_OPTION);
            bundle.putString("androidx.credentials.BUNDLE_KEY_REQUEST_JSON", requestJson);
            bundle.putByteArray("androidx.credentials.BUNDLE_KEY_CLIENT_DATA_HASH", clientDataHash);
            return bundle;
        }

        @JvmStatic
        public final GetPublicKeyCredentialOption createFrom$credentials_release(Bundle data, Set<ComponentName> allowedProviders, Bundle candidateQueryData) {
            String requestJson;
            byte[] clientDataHash;
            Intrinsics.checkNotNullParameter(data, "data");
            Intrinsics.checkNotNullParameter(allowedProviders, "allowedProviders");
            Intrinsics.checkNotNullParameter(candidateQueryData, "candidateQueryData");
            try {
                requestJson = data.getString("androidx.credentials.BUNDLE_KEY_REQUEST_JSON");
                clientDataHash = data.getByteArray("androidx.credentials.BUNDLE_KEY_CLIENT_DATA_HASH");
                Intrinsics.checkNotNull(requestJson);
            } catch (Exception e) {
            }
            try {
                return new GetPublicKeyCredentialOption(requestJson, clientDataHash, allowedProviders, data, candidateQueryData, data.getInt(CredentialOption.BUNDLE_KEY_TYPE_PRIORITY_VALUE, 100), null);
            } catch (Exception e2) {
                throw new FrameworkClassParsingException();
            }
        }
    }
}
