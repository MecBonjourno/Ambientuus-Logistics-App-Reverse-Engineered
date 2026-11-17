package androidx.credentials;

import android.os.Bundle;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.credentials.internal.FrameworkClassParsingException;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: CreateCredentialResponse.kt */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\b&\u0018\u0000 \u000b2\u00020\u0001:\u0001\u000bB\u0017\b\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0002\u0010\u0006R\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\n¨\u0006\f"}, d2 = {"Landroidx/credentials/CreateCredentialResponse;", "", "type", "", "data", "Landroid/os/Bundle;", "(Ljava/lang/String;Landroid/os/Bundle;)V", "getData", "()Landroid/os/Bundle;", "getType", "()Ljava/lang/String;", "Companion", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* loaded from: classes.dex */
public abstract class CreateCredentialResponse {

    /* renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion(null);
    private static final String EXTRA_CREATE_CREDENTIAL_RESPONSE_DATA = "androidx.credentials.provider.extra.CREATE_CREDENTIAL_REQUEST_DATA";
    private static final String EXTRA_CREATE_CREDENTIAL_RESPONSE_TYPE = "androidx.credentials.provider.extra.CREATE_CREDENTIAL_RESPONSE_TYPE";
    private final Bundle data;
    private final String type;

    public CreateCredentialResponse(String type, Bundle data) {
        Intrinsics.checkNotNullParameter(type, "type");
        Intrinsics.checkNotNullParameter(data, "data");
        this.type = type;
        this.data = data;
    }

    public final String getType() {
        return this.type;
    }

    public final Bundle getData() {
        return this.data;
    }

    /* compiled from: CreateCredentialResponse.kt */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\b\u0080\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0010\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\tH\u0007J\u0018\u0010\n\u001a\u00020\t2\u0006\u0010\u000b\u001a\u00020\u00042\u0006\u0010\f\u001a\u00020\u0007H\u0007J\u0012\u0010\r\u001a\u0004\u0018\u00010\t2\u0006\u0010\u000e\u001a\u00020\u0007H\u0007R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000¨\u0006\u000f"}, d2 = {"Landroidx/credentials/CreateCredentialResponse$Companion;", "", "()V", "EXTRA_CREATE_CREDENTIAL_RESPONSE_DATA", "", "EXTRA_CREATE_CREDENTIAL_RESPONSE_TYPE", "asBundle", "Landroid/os/Bundle;", "response", "Landroidx/credentials/CreateCredentialResponse;", "createFrom", "type", "data", "fromBundle", "bundle", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        @JvmStatic
        public final CreateCredentialResponse createFrom(String type, Bundle data) {
            CreatePublicKeyCredentialResponse createFrom$credentials_release;
            Intrinsics.checkNotNullParameter(type, "type");
            Intrinsics.checkNotNullParameter(data, "data");
            try {
                if (Intrinsics.areEqual(type, PasswordCredential.TYPE_PASSWORD_CREDENTIAL)) {
                    createFrom$credentials_release = CreatePasswordResponse.INSTANCE.createFrom$credentials_release(data);
                } else {
                    if (!Intrinsics.areEqual(type, PublicKeyCredential.TYPE_PUBLIC_KEY_CREDENTIAL)) {
                        throw new FrameworkClassParsingException();
                    }
                    createFrom$credentials_release = CreatePublicKeyCredentialResponse.INSTANCE.createFrom$credentials_release(data);
                }
                return createFrom$credentials_release;
            } catch (FrameworkClassParsingException e) {
                return new CreateCustomCredentialResponse(type, data);
            }
        }

        @JvmStatic
        public final CreateCredentialResponse fromBundle(Bundle bundle) {
            Bundle data;
            Intrinsics.checkNotNullParameter(bundle, "bundle");
            String type = bundle.getString(CreateCredentialResponse.EXTRA_CREATE_CREDENTIAL_RESPONSE_TYPE);
            if (type == null || (data = bundle.getBundle(CreateCredentialResponse.EXTRA_CREATE_CREDENTIAL_RESPONSE_DATA)) == null) {
                return null;
            }
            return createFrom(type, data);
        }

        @JvmStatic
        public final Bundle asBundle(CreateCredentialResponse response) {
            Intrinsics.checkNotNullParameter(response, "response");
            Bundle $this$asBundle_u24lambda_u240 = new Bundle();
            $this$asBundle_u24lambda_u240.putString(CreateCredentialResponse.EXTRA_CREATE_CREDENTIAL_RESPONSE_TYPE, response.getType());
            $this$asBundle_u24lambda_u240.putBundle(CreateCredentialResponse.EXTRA_CREATE_CREDENTIAL_RESPONSE_DATA, response.getData());
            return $this$asBundle_u24lambda_u240;
        }
    }

    @JvmStatic
    public static final CreateCredentialResponse createFrom(String type, Bundle data) {
        return INSTANCE.createFrom(type, data);
    }

    @JvmStatic
    public static final CreateCredentialResponse fromBundle(Bundle bundle) {
        return INSTANCE.fromBundle(bundle);
    }

    @JvmStatic
    public static final Bundle asBundle(CreateCredentialResponse response) {
        return INSTANCE.asBundle(response);
    }
}
