package androidx.credentials.provider;

import android.content.pm.Signature;
import android.content.pm.SigningInfo;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcelable;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.credentials.provider.utils.PrivilegedApp;
import androidx.credentials.provider.utils.RequestValidationUtil;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import kotlin.Metadata;
import kotlin.collections.ArraysKt;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.json.JSONException;
import org.json.JSONObject;

/* compiled from: CallingAppInfo.kt */
@Metadata(d1 = {"\u0000J\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\"\n\u0002\b\u0004\u0018\u0000 $2\u00020\u0001:\u0002$%B#\b\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\u0002\u0010\u0007B)\b\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\b\u001a\b\u0012\u0004\u0012\u00020\n0\t\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\u0002\u0010\u000bB+\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\f\u001a\u00020\r\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0002\u0010\u000eJ\u0013\u0010\u0017\u001a\u00020\u00182\b\u0010\u0019\u001a\u0004\u0018\u00010\u0001H\u0096\u0002J\u0010\u0010\u001a\u001a\u0004\u0018\u00010\u00032\u0006\u0010\u001b\u001a\u00020\u0003J\b\u0010\u001c\u001a\u00020\u001dH\u0016J\u0016\u0010\u001e\u001a\u00020\u00182\f\u0010\u001f\u001a\b\u0012\u0004\u0012\u00020 0\tH\u0002J\u0016\u0010\u001e\u001a\u00020\u00182\f\u0010!\u001a\b\u0012\u0004\u0012\u00020\u00030\"H\u0002J\u0006\u0010#\u001a\u00020\u0018R\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u0003X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0010R \u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0012\u001a\u00020\u00058G@BX\u0086.¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014R\u0011\u0010\f\u001a\u00020\r¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0016¨\u0006&"}, d2 = {"Landroidx/credentials/provider/CallingAppInfo;", "", "packageName", "", "signingInfo", "Landroid/content/pm/SigningInfo;", "origin", "(Ljava/lang/String;Landroid/content/pm/SigningInfo;Ljava/lang/String;)V", "signatures", "", "Landroid/content/pm/Signature;", "(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;)V", "signingInfoCompat", "Landroidx/credentials/provider/SigningInfoCompat;", "(Ljava/lang/String;Ljava/lang/String;Landroidx/credentials/provider/SigningInfoCompat;Landroid/content/pm/SigningInfo;)V", "getOrigin$credentials_release", "()Ljava/lang/String;", "getPackageName", "<set-?>", "getSigningInfo", "()Landroid/content/pm/SigningInfo;", "getSigningInfoCompat", "()Landroidx/credentials/provider/SigningInfoCompat;", "equals", "", "other", "getOrigin", "privilegedAllowlist", "hashCode", "", "isAppPrivileged", "candidateApps", "Landroidx/credentials/provider/utils/PrivilegedApp;", "candidateFingerprints", "", "isOriginPopulated", "Companion", "SignatureVerifier", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* carregado de: classes.dex */
public final class CallingAppInfo {

    /* renomeado de: Companion, motivo: de metadados do Kotlin */
    public static final Companion INSTANCE = new Companion(null);
    public static final String EXTRA_CREDENTIAL_REQUEST_ORIGIN = "androidx.credentials.provider.extra.CREDENTIAL_REQUEST_ORIGIN";
    private static final String EXTRA_CREDENTIAL_REQUEST_PACKAGE_NAME = "androidx.credentials.provider.extra.CREDENTIAL_REQUEST_PACKAGE_NAME";
    private static final String EXTRA_CREDENTIAL_REQUEST_SIGNATURES = "androidx.credentials.provider.extra.CREDENTIAL_REQUEST_SIGNATURES";
    private static final String EXTRA_CREDENTIAL_REQUEST_SIGNING_INFO = "androidx.credentials.provider.extra.CREDENTIAL_REQUEST_SIGNING_INFO";
    private final String origin;
    private final String packageName;
    private SigningInfo signingInfo;
    private final SigningInfoCompat signingInfoCompat;

    private CallingAppInfo(String packageName, String origin, SigningInfoCompat signingInfoCompat, SigningInfo signingInfo) {
        this.packageName = packageName;
        this.origin = origin;
        this.signingInfoCompat = signingInfoCompat;
        if (Build.VERSION.SDK_INT >= 28) {
            Intrinsics.checkNotNull(signingInfo);
            this.signingInfo = signingInfo;
        }
        if (!(this.packageName.length() > 0)) {
            throw new IllegalArgumentException("packageName must not be empty".toString());
        }
    }

    public final String getPackageName() {
        return this.packageName;
    }

    /* renomeado de: getOrigin$credentials_release, motivo: de getter */
    public final String getOrigin() {
        return this.origin;
    }

    public final SigningInfoCompat getSigningInfoCompat() {
        return this.signingInfoCompat;
    }

    public final SigningInfo getSigningInfo() {
        SigningInfo signingInfo = this.signingInfo;
        if (signingInfo != null) {
            return signingInfo;
        }
        Intrinsics.throwUninitializedPropertyAccessException("signingInfo");
        return null;
    }

    public /* sintético */ CallingAppInfo(String str, SigningInfo signingInfo, String str2, int i, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, signingInfo, (i & 4) != 0 ? null : str2);
    }

    /* JADX WARN: chamada 'this' movida para o topo do método (pode alterar a semântica do código) */
    public CallingAppInfo(String packageName, SigningInfo signingInfo, String origin) {
        this(packageName, origin, SigningInfoCompat.INSTANCE.fromSigningInfo(signingInfo), signingInfo);
        Intrinsics.checkNotNullParameter(packageName, "packageName");
        Intrinsics.checkNotNullParameter(signingInfo, "signingInfo");
    }

    /* JADX WARN: chamada 'this' movida para o topo do método (pode alterar a semântica do código) */
    public CallingAppInfo(String packageName, SigningInfo signingInfo) {
        this(packageName, signingInfo, (String) null, 4, (DefaultConstructorMarker) null);
        Intrinsics.checkNotNullParameter(packageName, "packageName");
        Intrinsics.checkNotNullParameter(signingInfo, "signingInfo");
    }

    public /* sintético */ CallingAppInfo(String str, List list, String str2, int i, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, (List<? extends Signature>) list, (i & 4) != 0 ? null : str2);
    }

    /* JADX WARN: chamada 'this' movida para o topo do método (pode alterar a semântica do código) */
    public CallingAppInfo(String packageName, List<? extends Signature> signatures) {
        this(packageName, signatures, (String) null, 4, (DefaultConstructorMarker) null);
        Intrinsics.checkNotNullParameter(packageName, "packageName");
        Intrinsics.checkNotNullParameter(signatures, "signatures");
    }

    /* JADX WARN: chamada 'this' movida para o topo do método (pode alterar a semântica do código) */
    public CallingAppInfo(String packageName, List<? extends Signature> signatures, String origin) {
        this(packageName, origin, SigningInfoCompat.INSTANCE.fromSignatures(signatures), null);
        Intrinsics.checkNotNullParameter(packageName, "packageName");
        Intrinsics.checkNotNullParameter(signatures, "signatures");
    }

    /* compiled from: CallingAppInfo.kt */
    @Metadata(d1 = {"\u0000@\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J$\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u00042\u0006\u0010\u000b\u001a\u00020\f2\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u0004H\u0007J*\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u00042\f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00100\u000f2\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u0004H\u0007J\u0017\u0010\u0011\u001a\u0004\u0018\u00010\t2\u0006\u0010\u0012\u001a\u00020\u0013H\u0000¢\u0006\u0002\b\u0014J\u0019\u0010\u0015\u001a\u00020\u0016*\u00020\u00132\u0006\u0010\u0017\u001a\u00020\tH\u0000¢\u0006\u0002\b\u0018R\u000e\u0010\u0003\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000¨\u0006\u0019"}, d2 = {"Landroidx/credentials/provider/CallingAppInfo$Companion;", "", "()V", "EXTRA_CREDENTIAL_REQUEST_ORIGIN", "", "EXTRA_CREDENTIAL_REQUEST_PACKAGE_NAME", "EXTRA_CREDENTIAL_REQUEST_SIGNATURES", "EXTRA_CREDENTIAL_REQUEST_SIGNING_INFO", "create", "Landroidx/credentials/provider/CallingAppInfo;", "packageName", "signingInfo", "Landroid/content/pm/SigningInfo;", "origin", "signatures", "", "Landroid/content/pm/Signature;", "extractCallingAppInfo", "bundle", "Landroid/os/Bundle;", "extractCallingAppInfo$credentials_release", "setCallingAppInfo", "", "info", "setCallingAppInfo$credentials_release", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    public static final class Companion {
        public /* sintético */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        public static /* sintético */ CallingAppInfo create$default(Companion companion, String str, SigningInfo signingInfo, String str2, int i, Object obj) {
            if ((i & 4) != 0) {
                str2 = null;
            }
            return companion.create(str, signingInfo, str2);
        }

        public final CallingAppInfo create(String packageName, SigningInfo signingInfo, String origin) {
            Intrinsics.checkNotNullParameter(packageName, "packageName");
            Intrinsics.checkNotNullParameter(signingInfo, "signingInfo");
            return new CallingAppInfo(packageName, signingInfo, origin);
        }

        public static /* sintético */ CallingAppInfo create$default(Companion companion, String str, List list, String str2, int i, Object obj) {
            if ((i & 4) != 0) {
                str2 = null;
            }
            return companion.create(str, (List<? extends Signature>) list, str2);
        }

        public final CallingAppInfo create(String packageName, List<? extends Signature> signatures, String origin) {
            Intrinsics.checkNotNullParameter(packageName, "packageName");
            Intrinsics.checkNotNullParameter(signatures, "signatures");
            return new CallingAppInfo(packageName, signatures, origin);
        }

        public final void setCallingAppInfo$credentials_release(Bundle $this$setCallingAppInfo, CallingAppInfo info) {
            Intrinsics.checkNotNullParameter($this$setCallingAppInfo, "<this>");
            Intrinsics.checkNotNullParameter(info, "info");
            $this$setCallingAppInfo.putString(CallingAppInfo.EXTRA_CREDENTIAL_REQUEST_ORIGIN, info.getOrigin());
            $this$setCallingAppInfo.putString(CallingAppInfo.EXTRA_CREDENTIAL_REQUEST_PACKAGE_NAME, info.getPackageName());
            if (Build.VERSION.SDK_INT >= 28) {
                $this$setCallingAppInfo.putParcelable(CallingAppInfo.EXTRA_CREDENTIAL_REQUEST_SIGNING_INFO, info.getSigningInfo());
            } else {
                Collection $this$toTypedArray$iv = info.getSigningInfoCompat().getSigningCertificateHistory();
                $this$setCallingAppInfo.putParcelableArray(CallingAppInfo.EXTRA_CREDENTIAL_REQUEST_SIGNATURES, (Parcelable[]) $this$toTypedArray$iv.toArray(new Signature[0]));
            }
        }

        public final CallingAppInfo extractCallingAppInfo$credentials_release(Bundle bundle) {
            Intrinsics.checkNotNullParameter(bundle, "bundle");
            String origin = bundle.getString(CallingAppInfo.EXTRA_CREDENTIAL_REQUEST_ORIGIN);
            String packageName = bundle.getString(CallingAppInfo.EXTRA_CREDENTIAL_REQUEST_PACKAGE_NAME);
            if (packageName == null) {
                return null;
            }
            if (Build.VERSION.SDK_INT >= 28) {
                SigningInfo signingInfo = (SigningInfo) bundle.getParcelable(CallingAppInfo.EXTRA_CREDENTIAL_REQUEST_SIGNING_INFO);
                if (signingInfo == null) {
                    return null;
                }
                return create(packageName, signingInfo, origin);
            }
            Object[] $this$map$iv = bundle.getParcelableArray(CallingAppInfo.EXTRA_CREDENTIAL_REQUEST_SIGNATURES);
            if ($this$map$iv == null) {
                return null;
            }
            Collection destination$iv$iv = new ArrayList($this$map$iv.length);
            for (Object item$iv$iv : $this$map$iv) {
                Intrinsics.checkNotNull(item$iv$iv, "null cannot be cast to non-null type android.content.pm.Signature");
                destination$iv$iv.add((Signature) item$iv$iv);
            }
            List signatures = (List) destination$iv$iv;
            return create(packageName, (List<? extends Signature>) signatures, origin);
        }
    }

    public final String getOrigin(String privilegedAllowlist) {
        Intrinsics.checkNotNullParameter(privilegedAllowlist, "privilegedAllowlist");
        if (!RequestValidationUtil.INSTANCE.isValidJSON(privilegedAllowlist)) {
            throw new IllegalArgumentException("privilegedAllowlist must not be empty, and must be a valid JSON");
        }
        if (this.origin == null) {
            return this.origin;
        }
        try {
            if (isAppPrivileged(PrivilegedApp.INSTANCE.extractPrivilegedApps$credentials_release(new JSONObject(privilegedAllowlist)))) {
                return this.origin;
            }
            throw new IllegalStateException("Origin is not being returned as the calling app did notmatch the privileged allowlist");
        } catch (JSONException e) {
            throw new IllegalArgumentException("privilegedAllowlist must be formatted properly");
        }
    }

    public final boolean isOriginPopulated() {
        return this.origin != null;
    }

    private final boolean isAppPrivileged(List<PrivilegedApp> candidateApps) {
        for (PrivilegedApp app : candidateApps) {
            if (Intrinsics.areEqual(app.getPackageName(), this.packageName)) {
                return isAppPrivileged(app.getFingerprints());
            }
        }
        return false;
    }

    private final boolean isAppPrivileged(Set<String> candidateFingerprints) {
        return new SignatureVerifier(this.signingInfoCompat).verifySignatureFingerprints(candidateFingerprints);
    }

    /* compiled from: CallingAppInfo.kt */
    @Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\"\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\b\u0002\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J\u001c\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u00062\f\u0010\b\u001a\b\u0012\u0004\u0012\u00020\n0\tH\u0002J\u000e\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006H\u0002J\u0014\u0010\f\u001a\u00020\r2\f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u000f"}, d2 = {"Landroidx/credentials/provider/CallingAppInfo$SignatureVerifier;", "", "signingInfoCompat", "Landroidx/credentials/provider/SigningInfoCompat;", "(Landroidx/credentials/provider/SigningInfoCompat;)V", "convertToFingerprints", "", "", "signatures", "", "Landroid/content/pm/Signature;", "getSignatureFingerprints", "verifySignatureFingerprints", "", "candidateSigFingerprints", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    private static final class SignatureVerifier {
        private final SigningInfoCompat signingInfoCompat;

        public SignatureVerifier(SigningInfoCompat signingInfoCompat) {
            Intrinsics.checkNotNullParameter(signingInfoCompat, "signingInfoCompat");
            this.signingInfoCompat = signingInfoCompat;
        }

        private final Set<String> getSignatureFingerprints() {
            Set fingerprints = new LinkedHashSet();
            List apkContentsSigners = this.signingInfoCompat.getApkContentsSigners();
            if (this.signingInfoCompat.getHasMultipleSigners() && !apkContentsSigners.isEmpty()) {
                fingerprints.addAll(convertToFingerprints(apkContentsSigners));
            } else if (!this.signingInfoCompat.getSigningCertificateHistory().isEmpty()) {
                fingerprints.addAll(convertToFingerprints(CollectionsKt.listOf(this.signingInfoCompat.getSigningCertificateHistory().get(0))));
            }
            return fingerprints;
        }

        private final Set<String> convertToFingerprints(List<? extends Signature> signatures) {
            Set fingerprints = new LinkedHashSet();
            for (Signature signature : signatures) {
                MessageDigest md = MessageDigest.getInstance("SHA-256");
                byte[] digest = md.digest(signature.toByteArray());
                Intrinsics.checkNotNullExpressionValue(digest, "digest");
                fingerprints.add(ArraysKt.joinToString$default(digest, (CharSequence) ":", (CharSequence) null, (CharSequence) null, 0, (CharSequence) null, (Function1) new Function1<Byte, CharSequence>() { // da classe: androidx.credentials.provider.CallingAppInfo$SignatureVerifier$convertToFingerprints$1
                    public final CharSequence invoke(byte it) {
                        String format = String.format("%02X", Arrays.copyOf(new Object[]{Byte.valueOf(it)}, 1));
                        Intrinsics.checkNotNullExpressionValue(format, "format(this, *args)");
                        return format;
                    }

                    @Override // kotlin.jvm.functions.Function1
                    public /* bridge */ /* sintético */ CharSequence invoke(Byte b) {
                        return invoke(b.byteValue());
                    }
                }, 30, (Object) null));
            }
            return fingerprints;
        }

        public final boolean verifySignatureFingerprints(Set<String> candidateSigFingerprints) {
            Intrinsics.checkNotNullParameter(candidateSigFingerprints, "candidateSigFingerprints");
            Set appSigFingerprints = getSignatureFingerprints();
            if (this.signingInfoCompat.getHasMultipleSigners()) {
                return candidateSigFingerprints.containsAll(appSigFingerprints);
            }
            return !CollectionsKt.intersect(candidateSigFingerprints, appSigFingerprints).isEmpty();
        }
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (other instanceof CallingAppInfo) {
            return Intrinsics.areEqual(this.packageName, ((CallingAppInfo) other).packageName) && Intrinsics.areEqual(this.origin, ((CallingAppInfo) other).origin) && Intrinsics.areEqual(this.signingInfoCompat, ((CallingAppInfo) other).signingInfoCompat);
        }
        return false;
    }

    public int hashCode() {
        int result = this.packageName.hashCode();
        int i = result * 31;
        String str = this.origin;
        int result2 = i + (str != null ? str.hashCode() : 0);
        return (result2 * 31) + this.signingInfoCompat.hashCode();
    }
}
