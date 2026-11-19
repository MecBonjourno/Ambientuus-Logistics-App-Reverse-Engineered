package androidx.credentials.provider;

import android.content.ComponentName;
import android.os.Bundle;
import android.os.Parcelable;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.credentials.CredentialOption;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;
import kotlin.Metadata;
import kotlin.collections.CollectionsKt;
import kotlin.collections.SetsKt;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.apache.commons.lang.ClassUtils;

/* compiled from: ProviderGetCredentialRequest.kt */
@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000b\u0018\u0000 \u00152\u00020\u0001:\u0001\u0015B)\b\u0017\u0012\f\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\b¢\u0006\u0002\u0010\tB1\b\u0007\u0012\f\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\b\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u000b¢\u0006\u0002\u0010\fR\u0013\u0010\u0007\u001a\u0004\u0018\u00010\b¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0017\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u0015\u0010\n\u001a\u0004\u0018\u00010\u000b8\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014¨\u0006\u0016"}, d2 = {"Landroidx/credentials/provider/ProviderGetCredentialRequest;", "", "credentialOptions", "", "Landroidx/credentials/CredentialOption;", "callingAppInfo", "Landroidx/credentials/provider/CallingAppInfo;", "biometricPromptResult", "Landroidx/credentials/provider/BiometricPromptResult;", "(Ljava/util/List;Landroidx/credentials/provider/CallingAppInfo;Landroidx/credentials/provider/BiometricPromptResult;)V", "sourceBundle", "Landroid/os/Bundle;", "(Ljava/util/List;Landroidx/credentials/provider/CallingAppInfo;Landroidx/credentials/provider/BiometricPromptResult;Landroid/os/Bundle;)V", "getBiometricPromptResult", "()Landroidx/credentials/provider/BiometricPromptResult;", "getCallingAppInfo", "()Landroidx/credentials/provider/CallingAppInfo;", "getCredentialOptions", "()Ljava/util/List;", "getSourceBundle", "()Landroid/os/Bundle;", "Companion", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* carregado de: classes.dex */
public final class ProviderGetCredentialRequest {

    /* renomeado de: Companion, motivo: de metadados do Kotlin */
    public static final Companion INSTANCE = new Companion(null);
    private static final String EXTRA_CREDENTIAL_OPTION_ALLOWED_PROVIDERS_PREFIX = "androidx.credentials.provider.extra.CREDENTIAL_OPTION_ALLOWED_PROVIDERS_";
    private static final String EXTRA_CREDENTIAL_OPTION_CANDIDATE_QUERY_DATA_PREFIX = "androidx.credentials.provider.extra.CREDENTIAL_OPTION_CANDIDATE_QUERY_DATA_";
    private static final String EXTRA_CREDENTIAL_OPTION_CREDENTIAL_RETRIEVAL_DATA_PREFIX = "androidx.credentials.provider.extra.CREDENTIAL_OPTION_CREDENTIAL_RETRIEVAL_DATA_";
    private static final String EXTRA_CREDENTIAL_OPTION_IS_SYSTEM_PROVIDER_REQUIRED_PREFIX = "androidx.credentials.provider.extra.CREDENTIAL_OPTION_IS_SYSTEM_PROVIDER_REQUIRED_";
    private static final String EXTRA_CREDENTIAL_OPTION_SIZE = "androidx.credentials.provider.extra.CREDENTIAL_OPTION_SIZE";
    private static final String EXTRA_CREDENTIAL_OPTION_TYPE_PREFIX = "androidx.credentials.provider.extra.CREDENTIAL_OPTION_TYPE_";
    private final BiometricPromptResult biometricPromptResult;
    private final CallingAppInfo callingAppInfo;
    private final List<CredentialOption> credentialOptions;
    private final Bundle sourceBundle;

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    public ProviderGetCredentialRequest(List<? extends CredentialOption> credentialOptions, CallingAppInfo callingAppInfo, BiometricPromptResult biometricPromptResult, Bundle sourceBundle) {
        Intrinsics.checkNotNullParameter(credentialOptions, "credentialOptions");
        Intrinsics.checkNotNullParameter(callingAppInfo, "callingAppInfo");
        this.credentialOptions = credentialOptions;
        this.callingAppInfo = callingAppInfo;
        this.biometricPromptResult = biometricPromptResult;
        this.sourceBundle = sourceBundle;
    }

    public final List<CredentialOption> getCredentialOptions() {
        return this.credentialOptions;
    }

    public final CallingAppInfo getCallingAppInfo() {
        return this.callingAppInfo;
    }

    public final BiometricPromptResult getBiometricPromptResult() {
        return this.biometricPromptResult;
    }

    public final Bundle getSourceBundle() {
        return this.sourceBundle;
    }

    public /* sintético */ ProviderGetCredentialRequest(List list, CallingAppInfo callingAppInfo, BiometricPromptResult biometricPromptResult, int i, DefaultConstructorMarker defaultConstructorMarker) {
        this(list, callingAppInfo, (i & 4) != 0 ? null : biometricPromptResult);
    }

    /* JADX WARN: chamada 'this' movida para o topo do método (pode alterar a semântica do código) */
    public ProviderGetCredentialRequest(List<? extends CredentialOption> credentialOptions, CallingAppInfo callingAppInfo) {
        this(credentialOptions, callingAppInfo, null, 4, null);
        Intrinsics.checkNotNullParameter(credentialOptions, "credentialOptions");
        Intrinsics.checkNotNullParameter(callingAppInfo, "callingAppInfo");
    }

    /* JADX WARN: chamada 'this' movida para o topo do método (pode alterar a semântica do código) */
    public ProviderGetCredentialRequest(List<? extends CredentialOption> credentialOptions, CallingAppInfo callingAppInfo, BiometricPromptResult biometricPromptResult) {
        this(credentialOptions, callingAppInfo, biometricPromptResult, null);
        Intrinsics.checkNotNullParameter(credentialOptions, "credentialOptions");
        Intrinsics.checkNotNullParameter(callingAppInfo, "callingAppInfo");
    }

    /* compiled from: ProviderGetCredentialRequest.kt */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0010\u0010\n\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\rH\u0007J9\u0010\u000e\u001a\u00020\r2\f\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u00110\u00102\u0006\u0010\u0012\u001a\u00020\u00132\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u000bH\u0001¢\u0006\u0002\b\u0017J\u0010\u0010\u0018\u001a\u00020\r2\u0006\u0010\u0019\u001a\u00020\u000bH\u0007R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000¨\u0006\u001a"}, d2 = {"Landroidx/credentials/provider/ProviderGetCredentialRequest$Companion;", "", "()V", "EXTRA_CREDENTIAL_OPTION_ALLOWED_PROVIDERS_PREFIX", "", "EXTRA_CREDENTIAL_OPTION_CANDIDATE_QUERY_DATA_PREFIX", "EXTRA_CREDENTIAL_OPTION_CREDENTIAL_RETRIEVAL_DATA_PREFIX", "EXTRA_CREDENTIAL_OPTION_IS_SYSTEM_PROVIDER_REQUIRED_PREFIX", "EXTRA_CREDENTIAL_OPTION_SIZE", "EXTRA_CREDENTIAL_OPTION_TYPE_PREFIX", "asBundle", "Landroid/os/Bundle;", "request", "Landroidx/credentials/provider/ProviderGetCredentialRequest;", "createFrom", "options", "", "Landroidx/credentials/CredentialOption;", "callingAppInfo", "Landroidx/credentials/provider/CallingAppInfo;", "biometricPromptResult", "Landroidx/credentials/provider/BiometricPromptResult;", "sourceBundle", "createFrom$credentials_release", "fromBundle", "bundle", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    public static final class Companion {
        public /* sintético */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        public static /* sintético */ ProviderGetCredentialRequest createFrom$credentials_release$default(Companion companion, List list, CallingAppInfo callingAppInfo, BiometricPromptResult biometricPromptResult, Bundle bundle, int i, Object obj) {
            if ((i & 4) != 0) {
                biometricPromptResult = null;
            }
            return companion.createFrom$credentials_release(list, callingAppInfo, biometricPromptResult, bundle);
        }

        @JvmStatic
        public final ProviderGetCredentialRequest createFrom$credentials_release(List<? extends CredentialOption> options, CallingAppInfo callingAppInfo, BiometricPromptResult biometricPromptResult, Bundle sourceBundle) {
            Intrinsics.checkNotNullParameter(options, "options");
            Intrinsics.checkNotNullParameter(callingAppInfo, "callingAppInfo");
            return new ProviderGetCredentialRequest(options, callingAppInfo, biometricPromptResult, sourceBundle);
        }

        @JvmStatic
        public final Bundle asBundle(ProviderGetCredentialRequest request) {
            Intrinsics.checkNotNullParameter(request, "request");
            Bundle bundle = new Bundle();
            int optionSize = request.getCredentialOptions().size();
            bundle.putInt(ProviderGetCredentialRequest.EXTRA_CREDENTIAL_OPTION_SIZE, optionSize);
            for (int i = 0; i < optionSize; i++) {
                CredentialOption option = request.getCredentialOptions().get(i);
                bundle.putString("androidx.credentials.provider.extra.CREDENTIAL_OPTION_TYPE_" + i, option.getType());
                bundle.putBundle(ProviderGetCredentialRequest.EXTRA_CREDENTIAL_OPTION_CANDIDATE_QUERY_DATA_PREFIX + i, option.getCandidateQueryData());
                bundle.putBundle(ProviderGetCredentialRequest.EXTRA_CREDENTIAL_OPTION_CREDENTIAL_RETRIEVAL_DATA_PREFIX + i, option.getRequestData());
                bundle.putBoolean(ProviderGetCredentialRequest.EXTRA_CREDENTIAL_OPTION_IS_SYSTEM_PROVIDER_REQUIRED_PREFIX + i, option.getIsSystemProviderRequired());
                String str = ProviderGetCredentialRequest.EXTRA_CREDENTIAL_OPTION_ALLOWED_PROVIDERS_PREFIX + i;
                Collection $this$toTypedArray$iv = option.getAllowedProviders();
                bundle.putParcelableArray(str, (Parcelable[]) $this$toTypedArray$iv.toArray(new ComponentName[0]));
            }
            CallingAppInfo.INSTANCE.setCallingAppInfo$credentials_release(bundle, request.getCallingAppInfo());
            return bundle;
        }

        @JvmStatic
        public final ProviderGetCredentialRequest fromBundle(Bundle bundle) {
            Set allowedProviders;
            Object[] $this$mapNotNull$iv;
            Set emptySet;
            int i;
            Intrinsics.checkNotNullParameter(bundle, "bundle");
            CallingAppInfo callingAppInfo = CallingAppInfo.INSTANCE.extractCallingAppInfo$credentials_release(bundle);
            if (callingAppInfo == null) {
                throw new IllegalArgumentException("Bundle was missing CallingAppInfo.");
            }
            int optionSize = bundle.getInt(ProviderGetCredentialRequest.EXTRA_CREDENTIAL_OPTION_SIZE, -1);
            if (optionSize < 0) {
                throw new IllegalArgumentException("Bundle had invalid option size as " + optionSize + ClassUtils.PACKAGE_SEPARATOR_CHAR);
            }
            List options = new ArrayList();
            for (int i2 = 0; i2 < optionSize; i2++) {
                String type = bundle.getString("androidx.credentials.provider.extra.CREDENTIAL_OPTION_TYPE_" + i2);
                if (type == null) {
                    throw new IllegalArgumentException("Bundle was missing option type at index " + optionSize + ClassUtils.PACKAGE_SEPARATOR_CHAR);
                }
                Bundle candidateQueryData = bundle.getBundle(ProviderGetCredentialRequest.EXTRA_CREDENTIAL_OPTION_CANDIDATE_QUERY_DATA_PREFIX + i2);
                if (candidateQueryData == null) {
                    throw new IllegalArgumentException("Bundle was missing candidate query data at index " + optionSize + ClassUtils.PACKAGE_SEPARATOR_CHAR);
                }
                Bundle requestData = bundle.getBundle(ProviderGetCredentialRequest.EXTRA_CREDENTIAL_OPTION_CREDENTIAL_RETRIEVAL_DATA_PREFIX + i2);
                if (requestData == null) {
                    throw new IllegalArgumentException("Bundle was missing request data at index " + optionSize + ClassUtils.PACKAGE_SEPARATOR_CHAR);
                }
                boolean isSystemProviderRequired = bundle.getBoolean(ProviderGetCredentialRequest.EXTRA_CREDENTIAL_OPTION_IS_SYSTEM_PROVIDER_REQUIRED_PREFIX + i2, false);
                try {
                    $this$mapNotNull$iv = bundle.getParcelableArray(ProviderGetCredentialRequest.EXTRA_CREDENTIAL_OPTION_ALLOWED_PROVIDERS_PREFIX + i2);
                } catch (Exception e) {
                    allowedProviders = SetsKt.emptySet();
                }
                if ($this$mapNotNull$iv != null) {
                    Collection destination$iv$iv = new ArrayList();
                    int length = $this$mapNotNull$iv.length;
                    int i3 = 0;
                    while (i3 < length) {
                        Object element$iv$iv$iv = $this$mapNotNull$iv[i3];
                        ComponentName componentName = (ComponentName) element$iv$iv$iv;
                        if (componentName != null) {
                            i = i3;
                            destination$iv$iv.add(componentName);
                        } else {
                            i = i3;
                        }
                        i3 = i + 1;
                    }
                    emptySet = CollectionsKt.toSet((List) destination$iv$iv);
                    if (emptySet != null) {
                        allowedProviders = emptySet;
                        options.add(CredentialOption.INSTANCE.createFrom(type, requestData, candidateQueryData, isSystemProviderRequired, allowedProviders));
                    }
                }
                emptySet = SetsKt.emptySet();
                allowedProviders = emptySet;
                options.add(CredentialOption.INSTANCE.createFrom(type, requestData, candidateQueryData, isSystemProviderRequired, allowedProviders));
            }
            return createFrom$credentials_release(options, callingAppInfo, null, bundle);
        }
    }

    @JvmStatic
    public static final Bundle asBundle(ProviderGetCredentialRequest request) {
        return INSTANCE.asBundle(request);
    }

    @JvmStatic
    public static final ProviderGetCredentialRequest fromBundle(Bundle bundle) {
        return INSTANCE.fromBundle(bundle);
    }
}
