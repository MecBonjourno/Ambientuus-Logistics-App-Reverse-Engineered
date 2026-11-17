package androidx.credentials.provider;

import android.app.slice.Slice;
import android.app.slice.SliceSpec;
import android.os.Build;
import android.os.Bundle;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.credentials.PasswordCredential;
import androidx.credentials.PublicKeyCredential;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: CredentialEntry.kt */
@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\r\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0010\b&\u0018\u0000 \u001b2\u00020\u0001:\u0004\u0018\u0019\u001a\u001bB?\b\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\b\u001a\u00020\t\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\f¢\u0006\u0002\u0010\rR\u0013\u0010\n\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0013\u0010\u000b\u001a\u0004\u0018\u00010\f¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u000fR\u0011\u0010\b\u001a\u00020\t¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\u0015R\u0016\u0010\u0002\u001a\u00020\u00038\u0017X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017¨\u0006\u001c"}, d2 = {"Landroidx/credentials/provider/CredentialEntry;", "", "type", "", "beginGetCredentialOption", "Landroidx/credentials/provider/BeginGetCredentialOption;", "entryGroupId", "", "isDefaultIconPreferredAsSingleProvider", "", "affiliatedDomain", "biometricPromptData", "Landroidx/credentials/provider/BiometricPromptData;", "(Ljava/lang/String;Landroidx/credentials/provider/BeginGetCredentialOption;Ljava/lang/CharSequence;ZLjava/lang/CharSequence;Landroidx/credentials/provider/BiometricPromptData;)V", "getAffiliatedDomain", "()Ljava/lang/CharSequence;", "getBeginGetCredentialOption", "()Landroidx/credentials/provider/BeginGetCredentialOption;", "getBiometricPromptData", "()Landroidx/credentials/provider/BiometricPromptData;", "getEntryGroupId", "()Z", "getType", "()Ljava/lang/String;", "Api28Impl", "Api34Impl", "Api35Impl", "Companion", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* loaded from: classes.dex */
public abstract class CredentialEntry {

    /* renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion(null);
    public static final String EXTRA_CREDENTIAL_ENTRY_AFFILIATED_DOMAIN_PREFIX = "androidx.credentials.provider.extra.CREDENTIAL_ENTRY_AFFILIATED_DOMAIN_";
    public static final String EXTRA_CREDENTIAL_ENTRY_ENTRY_GROUP_ID_PREFIX = "androidx.credentials.provider.extra.CREDENTIAL_ENTRY_ENTRY_GROUP_ID_";
    public static final String EXTRA_CREDENTIAL_ENTRY_ENTRY_TYPE_PREFIX = "androidx.credentials.provider.extra.CREDENTIAL_ENTRY_TYPE_";
    public static final String EXTRA_CREDENTIAL_ENTRY_HAS_DEFAULT_ICON_PREFIX = "androidx.credentials.provider.extra.HAS_DEFAULT_ICON_";
    public static final String EXTRA_CREDENTIAL_ENTRY_IS_AUTO_SELECT_ALLOWED_FROM_OPTION_PREFIX = "androidx.credentials.provider.extra.IS_AUTO_SELECT_ALLOWED_FROM_OPTION_";
    public static final String EXTRA_CREDENTIAL_ENTRY_IS_AUTO_SELECT_ALLOWED_PREFIX = "androidx.credentials.provider.extra.IS_AUTO_SELECT_ALLOWED_";
    public static final String EXTRA_CREDENTIAL_ENTRY_IS_DEFAULT_ICON_PREFERRED_AS_SINGLE_PROV_PREFIX = "androidx.credentials.provider.extra.CREDENTIAL_ENTRY_IS_DEFAULT_ICON_PREFERRED_AS_SINGLE_PROV_";
    public static final String EXTRA_CREDENTIAL_ENTRY_LAST_USED_TIME_PREFIX = "androidx.credentials.provider.extra.LAST_USED_TIME_";
    public static final String EXTRA_CREDENTIAL_ENTRY_OPTION_DATA_PREFIX = "androidx.credentials.provider.extra.CREDENTIAL_OPTION_DATA_";
    public static final String EXTRA_CREDENTIAL_ENTRY_OPTION_ID_PREFIX = "androidx.credentials.provider.extra.CREDENTIAL_OPTION_ID_";
    public static final String EXTRA_CREDENTIAL_ENTRY_OPTION_TYPE_PREFIX = "androidx.credentials.provider.extra.CREDENTIAL_OPTION_TYPE_";
    public static final String EXTRA_CREDENTIAL_ENTRY_PENDING_INTENT_PREFIX = "androidx.credentials.provider.extra.PENDING_INTENT_";
    public static final String EXTRA_CREDENTIAL_ENTRY_SIZE = "androidx.credentials.provider.extra.CREDENTIAL_ENTRY_SIZE";
    public static final String EXTRA_CREDENTIAL_SUBTITLE_PREFIX = "androidx.credentials.provider.extra.SUBTITLE_";
    public static final String EXTRA_CREDENTIAL_TITLE_PREFIX = "androidx.credentials.provider.extra.TITLE_";
    public static final String EXTRA_CREDENTIAL_TYPE_DISPLAY_NAME_PREFIX = "androidx.credentials.provider.extra.TYPE_DISPLAY_NAME_";
    public static final String EXTRA_CREDENTIAL_TYPE_ICON_PREFIX = "androidx.credentials.provider.extra.ICON_";
    public static final String FALSE_STRING = "false";
    public static final int REVISION_ID = 1;
    public static final String SLICE_HINT_AFFILIATED_DOMAIN = "androidx.credentials.provider.credentialEntry.SLICE_HINT_AFFILIATED_DOMAIN";
    public static final String SLICE_HINT_ALLOWED_AUTHENTICATORS = "androidx.credentials.provider.credentialEntry.SLICE_HINT_ALLOWED_AUTHENTICATORS";
    public static final String SLICE_HINT_AUTO_ALLOWED = "androidx.credentials.provider.credentialEntry.SLICE_HINT_AUTO_ALLOWED";
    public static final String SLICE_HINT_AUTO_SELECT_FROM_OPTION = "androidx.credentials.provider.credentialEntry.SLICE_HINT_AUTO_SELECT_FROM_OPTION";
    public static final String SLICE_HINT_BIOMETRIC_PROMPT_DATA = "androidx.credentials.provider.credentialEntry.SLICE_HINT_BIOMETRIC_PROMPT_DATA";
    public static final String SLICE_HINT_CRYPTO_OP_ID = "androidx.credentials.provider.credentialEntry.SLICE_HINT_CRYPTO_OP_ID";
    public static final String SLICE_HINT_DEDUPLICATION_ID = "androidx.credentials.provider.credentialEntry.SLICE_HINT_DEDUPLICATION_ID";
    public static final String SLICE_HINT_DEFAULT_ICON_RES_ID = "androidx.credentials.provider.credentialEntry.SLICE_HINT_DEFAULT_ICON_RES_ID";
    public static final String SLICE_HINT_ICON = "androidx.credentials.provider.credentialEntry.SLICE_HINT_PROFILE_ICON";
    public static final String SLICE_HINT_IS_DEFAULT_ICON_PREFERRED = "androidx.credentials.provider.credentialEntry.SLICE_HINT_IS_DEFAULT_ICON_PREFERRED";
    public static final String SLICE_HINT_LAST_USED_TIME_MILLIS = "androidx.credentials.provider.credentialEntry.SLICE_HINT_LAST_USED_TIME_MILLIS";
    public static final String SLICE_HINT_OPTION_ID = "androidx.credentials.provider.credentialEntry.SLICE_HINT_OPTION_ID";
    public static final String SLICE_HINT_PENDING_INTENT = "androidx.credentials.provider.credentialEntry.SLICE_HINT_PENDING_INTENT";
    public static final String SLICE_HINT_SUBTITLE = "androidx.credentials.provider.credentialEntry.SLICE_HINT_CREDENTIAL_TYPE_DISPLAY_NAME";
    public static final String SLICE_HINT_TITLE = "androidx.credentials.provider.credentialEntry.SLICE_HINT_USER_NAME";
    public static final String SLICE_HINT_TYPE_DISPLAY_NAME = "androidx.credentials.provider.credentialEntry.SLICE_HINT_TYPE_DISPLAY_NAME";
    public static final String TRUE_STRING = "true";
    private final CharSequence affiliatedDomain;
    private final BeginGetCredentialOption beginGetCredentialOption;
    private final BiometricPromptData biometricPromptData;
    private final CharSequence entryGroupId;
    private final boolean isDefaultIconPreferredAsSingleProvider;
    private final String type;

    public CredentialEntry(String type, BeginGetCredentialOption beginGetCredentialOption, CharSequence entryGroupId, boolean isDefaultIconPreferredAsSingleProvider, CharSequence affiliatedDomain, BiometricPromptData biometricPromptData) {
        Intrinsics.checkNotNullParameter(type, "type");
        Intrinsics.checkNotNullParameter(beginGetCredentialOption, "beginGetCredentialOption");
        Intrinsics.checkNotNullParameter(entryGroupId, "entryGroupId");
        this.type = type;
        this.beginGetCredentialOption = beginGetCredentialOption;
        this.entryGroupId = entryGroupId;
        this.isDefaultIconPreferredAsSingleProvider = isDefaultIconPreferredAsSingleProvider;
        this.affiliatedDomain = affiliatedDomain;
        this.biometricPromptData = biometricPromptData;
    }

    /* JADX WARN: Illegal instructions before constructor call */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public /* synthetic */ CredentialEntry(java.lang.String r2, androidx.credentials.provider.BeginGetCredentialOption r3, java.lang.CharSequence r4, boolean r5, java.lang.CharSequence r6, androidx.credentials.provider.BiometricPromptData r7, int r8, kotlin.jvm.internal.DefaultConstructorMarker r9) {
        /*
            r1 = this;
            r9 = r8 & 16
            r0 = 0
            if (r9 == 0) goto L6
            r6 = r0
        L6:
            r8 = r8 & 32
            if (r8 == 0) goto Lc
            r8 = r0
            goto Ld
        Lc:
            r8 = r7
        Ld:
            r7 = r6
            r6 = r5
            r5 = r4
            r4 = r3
            r3 = r2
            r2 = r1
            r2.<init>(r3, r4, r5, r6, r7, r8)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.credentials.provider.CredentialEntry.<init>(java.lang.String, androidx.credentials.provider.BeginGetCredentialOption, java.lang.CharSequence, boolean, java.lang.CharSequence, androidx.credentials.provider.BiometricPromptData, int, kotlin.jvm.internal.DefaultConstructorMarker):void");
    }

    public String getType() {
        return this.type;
    }

    public final BeginGetCredentialOption getBeginGetCredentialOption() {
        return this.beginGetCredentialOption;
    }

    public final CharSequence getEntryGroupId() {
        return this.entryGroupId;
    }

    /* renamed from: isDefaultIconPreferredAsSingleProvider, reason: from getter */
    public final boolean getIsDefaultIconPreferredAsSingleProvider() {
        return this.isDefaultIconPreferredAsSingleProvider;
    }

    public final CharSequence getAffiliatedDomain() {
        return this.affiliatedDomain;
    }

    public final BiometricPromptData getBiometricPromptData() {
        return this.biometricPromptData;
    }

    /* compiled from: CredentialEntry.kt */
    @Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\bÃ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0012\u0010\u0003\u001a\u0004\u0018\u00010\u00042\u0006\u0010\u0005\u001a\u00020\u0006H\u0007¨\u0006\u0007"}, d2 = {"Landroidx/credentials/provider/CredentialEntry$Api34Impl;", "", "()V", "fromCredentialEntry", "Landroidx/credentials/provider/CredentialEntry;", "credentialEntry", "Landroid/service/credentials/CredentialEntry;", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    private static final class Api34Impl {
        public static final Api34Impl INSTANCE = new Api34Impl();

        private Api34Impl() {
        }

        @JvmStatic
        public static final CredentialEntry fromCredentialEntry(android.service.credentials.CredentialEntry credentialEntry) {
            Intrinsics.checkNotNullParameter(credentialEntry, "credentialEntry");
            Slice slice = credentialEntry.getSlice();
            Intrinsics.checkNotNullExpressionValue(slice, "credentialEntry.slice");
            return CredentialEntry.INSTANCE.fromSlice$credentials_release(slice);
        }
    }

    /* compiled from: CredentialEntry.kt */
    @Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\bÁ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0012\u0010\u0003\u001a\u0004\u0018\u00010\u00042\u0006\u0010\u0005\u001a\u00020\u0006H\u0007J\u0012\u0010\u0007\u001a\u0004\u0018\u00010\u00062\u0006\u0010\b\u001a\u00020\u0004H\u0007¨\u0006\t"}, d2 = {"Landroidx/credentials/provider/CredentialEntry$Api35Impl;", "", "()V", "fromSlice", "Landroidx/credentials/provider/CredentialEntry;", "slice", "Landroid/app/slice/Slice;", "toSlice", "entry", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    public static final class Api35Impl {
        public static final Api35Impl INSTANCE = new Api35Impl();

        private Api35Impl() {
        }

        @JvmStatic
        public static final Slice toSlice(CredentialEntry entry) {
            Intrinsics.checkNotNullParameter(entry, "entry");
            if (entry instanceof PasswordCredentialEntry) {
                return PasswordCredentialEntry.INSTANCE.toSlice((PasswordCredentialEntry) entry);
            }
            if (entry instanceof PublicKeyCredentialEntry) {
                return PublicKeyCredentialEntry.INSTANCE.toSlice((PublicKeyCredentialEntry) entry);
            }
            if (entry instanceof CustomCredentialEntry) {
                return CustomCredentialEntry.INSTANCE.toSlice((CustomCredentialEntry) entry);
            }
            return null;
        }

        @JvmStatic
        public static final CredentialEntry fromSlice(Slice slice) {
            Intrinsics.checkNotNullParameter(slice, "slice");
            try {
                SliceSpec spec = slice.getSpec();
                String type = spec != null ? spec.getType() : null;
                if (Intrinsics.areEqual(type, PasswordCredential.TYPE_PASSWORD_CREDENTIAL)) {
                    PasswordCredentialEntry fromSlice = PasswordCredentialEntry.INSTANCE.fromSlice(slice);
                    Intrinsics.checkNotNull(fromSlice);
                    return fromSlice;
                }
                if (Intrinsics.areEqual(type, PublicKeyCredential.TYPE_PUBLIC_KEY_CREDENTIAL)) {
                    PublicKeyCredentialEntry fromSlice2 = PublicKeyCredentialEntry.INSTANCE.fromSlice(slice);
                    Intrinsics.checkNotNull(fromSlice2);
                    return fromSlice2;
                }
                CustomCredentialEntry fromSlice3 = CustomCredentialEntry.INSTANCE.fromSlice(slice);
                Intrinsics.checkNotNull(fromSlice3);
                return fromSlice3;
            } catch (Exception e) {
                return CustomCredentialEntry.INSTANCE.fromSlice(slice);
            }
        }
    }

    /* compiled from: CredentialEntry.kt */
    @Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\bÁ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0012\u0010\u0003\u001a\u0004\u0018\u00010\u00042\u0006\u0010\u0005\u001a\u00020\u0006H\u0007J\u0012\u0010\u0007\u001a\u0004\u0018\u00010\u00062\u0006\u0010\b\u001a\u00020\u0004H\u0007¨\u0006\t"}, d2 = {"Landroidx/credentials/provider/CredentialEntry$Api28Impl;", "", "()V", "fromSlice", "Landroidx/credentials/provider/CredentialEntry;", "slice", "Landroid/app/slice/Slice;", "toSlice", "entry", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    public static final class Api28Impl {
        public static final Api28Impl INSTANCE = new Api28Impl();

        private Api28Impl() {
        }

        @JvmStatic
        public static final Slice toSlice(CredentialEntry entry) {
            Intrinsics.checkNotNullParameter(entry, "entry");
            if (entry instanceof PasswordCredentialEntry) {
                return PasswordCredentialEntry.INSTANCE.toSlice((PasswordCredentialEntry) entry);
            }
            if (entry instanceof PublicKeyCredentialEntry) {
                return PublicKeyCredentialEntry.INSTANCE.toSlice((PublicKeyCredentialEntry) entry);
            }
            if (entry instanceof CustomCredentialEntry) {
                return CustomCredentialEntry.INSTANCE.toSlice((CustomCredentialEntry) entry);
            }
            return null;
        }

        @JvmStatic
        public static final CredentialEntry fromSlice(Slice slice) {
            Intrinsics.checkNotNullParameter(slice, "slice");
            try {
                SliceSpec spec = slice.getSpec();
                String type = spec != null ? spec.getType() : null;
                if (Intrinsics.areEqual(type, PasswordCredential.TYPE_PASSWORD_CREDENTIAL)) {
                    PasswordCredentialEntry fromSlice = PasswordCredentialEntry.INSTANCE.fromSlice(slice);
                    Intrinsics.checkNotNull(fromSlice);
                    return fromSlice;
                }
                if (Intrinsics.areEqual(type, PublicKeyCredential.TYPE_PUBLIC_KEY_CREDENTIAL)) {
                    PublicKeyCredentialEntry fromSlice2 = PublicKeyCredentialEntry.INSTANCE.fromSlice(slice);
                    Intrinsics.checkNotNull(fromSlice2);
                    return fromSlice2;
                }
                CustomCredentialEntry fromSlice3 = CustomCredentialEntry.INSTANCE.fromSlice(slice);
                Intrinsics.checkNotNull(fromSlice3);
                return fromSlice3;
            } catch (Exception e) {
                return CustomCredentialEntry.INSTANCE.fromSlice(slice);
            }
        }
    }

    /* compiled from: CredentialEntry.kt */
    @Metadata(d1 = {"\u0000D\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0012\n\u0002\u0010\b\n\u0002\b\u0012\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0002\n\u0002\u0010 \n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0012\u0010)\u001a\u0004\u0018\u00010*2\u0006\u0010+\u001a\u00020,H\u0007J\u0017\u0010-\u001a\u0004\u0018\u00010*2\u0006\u0010.\u001a\u00020/H\u0001¢\u0006\u0002\b0J\u0017\u00101\u001a\u0004\u0018\u00010/2\u0006\u00102\u001a\u00020*H\u0001¢\u0006\u0002\b3J\u001f\u00104\u001a\u000205*\b\u0012\u0004\u0012\u00020*062\u0006\u00107\u001a\u000208H\u0001¢\u0006\u0002\b9J!\u0010:\u001a\u000205*\u00020*2\u0006\u00107\u001a\u0002082\u0006\u0010;\u001a\u00020\u0017H\u0000¢\u0006\u0002\b<J\u0017\u0010=\u001a\b\u0012\u0004\u0012\u00020*06*\u000208H\u0001¢\u0006\u0002\b>R\u000e\u0010\u0003\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000R\u000e\u0010\f\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000R\u000e\u0010\u0012\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000R\u000e\u0010\u0013\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000R\u000e\u0010\u0014\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000R\u000e\u0010\u0015\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000R\u000e\u0010\u0016\u001a\u00020\u0017X\u0080T¢\u0006\u0002\n\u0000R\u000e\u0010\u0018\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000R\u000e\u0010\u0019\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000R\u000e\u0010\u001a\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000R\u000e\u0010\u001b\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000R\u000e\u0010\u001c\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000R\u000e\u0010\u001d\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000R\u000e\u0010\u001e\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000R\u000e\u0010\u001f\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000R\u000e\u0010 \u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000R\u000e\u0010!\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000R\u000e\u0010\"\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000R\u000e\u0010#\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000R\u000e\u0010$\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000R\u000e\u0010%\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000R\u000e\u0010&\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000R\u000e\u0010'\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000R\u000e\u0010(\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000¨\u0006?"}, d2 = {"Landroidx/credentials/provider/CredentialEntry$Companion;", "", "()V", "EXTRA_CREDENTIAL_ENTRY_AFFILIATED_DOMAIN_PREFIX", "", "EXTRA_CREDENTIAL_ENTRY_ENTRY_GROUP_ID_PREFIX", "EXTRA_CREDENTIAL_ENTRY_ENTRY_TYPE_PREFIX", "EXTRA_CREDENTIAL_ENTRY_HAS_DEFAULT_ICON_PREFIX", "EXTRA_CREDENTIAL_ENTRY_IS_AUTO_SELECT_ALLOWED_FROM_OPTION_PREFIX", "EXTRA_CREDENTIAL_ENTRY_IS_AUTO_SELECT_ALLOWED_PREFIX", "EXTRA_CREDENTIAL_ENTRY_IS_DEFAULT_ICON_PREFERRED_AS_SINGLE_PROV_PREFIX", "EXTRA_CREDENTIAL_ENTRY_LAST_USED_TIME_PREFIX", "EXTRA_CREDENTIAL_ENTRY_OPTION_DATA_PREFIX", "EXTRA_CREDENTIAL_ENTRY_OPTION_ID_PREFIX", "EXTRA_CREDENTIAL_ENTRY_OPTION_TYPE_PREFIX", "EXTRA_CREDENTIAL_ENTRY_PENDING_INTENT_PREFIX", "EXTRA_CREDENTIAL_ENTRY_SIZE", "EXTRA_CREDENTIAL_SUBTITLE_PREFIX", "EXTRA_CREDENTIAL_TITLE_PREFIX", "EXTRA_CREDENTIAL_TYPE_DISPLAY_NAME_PREFIX", "EXTRA_CREDENTIAL_TYPE_ICON_PREFIX", "FALSE_STRING", "REVISION_ID", "", "SLICE_HINT_AFFILIATED_DOMAIN", "SLICE_HINT_ALLOWED_AUTHENTICATORS", "SLICE_HINT_AUTO_ALLOWED", "SLICE_HINT_AUTO_SELECT_FROM_OPTION", "SLICE_HINT_BIOMETRIC_PROMPT_DATA", "SLICE_HINT_CRYPTO_OP_ID", "SLICE_HINT_DEDUPLICATION_ID", "SLICE_HINT_DEFAULT_ICON_RES_ID", "SLICE_HINT_ICON", "SLICE_HINT_IS_DEFAULT_ICON_PREFERRED", "SLICE_HINT_LAST_USED_TIME_MILLIS", "SLICE_HINT_OPTION_ID", "SLICE_HINT_PENDING_INTENT", "SLICE_HINT_SUBTITLE", "SLICE_HINT_TITLE", "SLICE_HINT_TYPE_DISPLAY_NAME", "TRUE_STRING", "fromCredentialEntry", "Landroidx/credentials/provider/CredentialEntry;", "credentialEntry", "Landroid/service/credentials/CredentialEntry;", "fromSlice", "slice", "Landroid/app/slice/Slice;", "fromSlice$credentials_release", "toSlice", "entry", "toSlice$credentials_release", "marshall", "", "", "bundle", "Landroid/os/Bundle;", "marshall$credentials_release", "marshallCommonProperties", "index", "marshallCommonProperties$credentials_release", "unmarshallCredentialEntries", "unmarshallCredentialEntries$credentials_release", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        @JvmStatic
        public final CredentialEntry fromCredentialEntry(android.service.credentials.CredentialEntry credentialEntry) {
            Intrinsics.checkNotNullParameter(credentialEntry, "credentialEntry");
            if (Build.VERSION.SDK_INT >= 34) {
                return Api34Impl.fromCredentialEntry(credentialEntry);
            }
            return null;
        }

        @JvmStatic
        public final CredentialEntry fromSlice$credentials_release(Slice slice) {
            Intrinsics.checkNotNullParameter(slice, "slice");
            if (Build.VERSION.SDK_INT >= 35) {
                return Api35Impl.fromSlice(slice);
            }
            if (Build.VERSION.SDK_INT >= 28) {
                return Api28Impl.fromSlice(slice);
            }
            return null;
        }

        @JvmStatic
        public final Slice toSlice$credentials_release(CredentialEntry entry) {
            Intrinsics.checkNotNullParameter(entry, "entry");
            if (Build.VERSION.SDK_INT >= 35) {
                return Api35Impl.toSlice(entry);
            }
            if (Build.VERSION.SDK_INT >= 28) {
                return Api28Impl.toSlice(entry);
            }
            return null;
        }

        public final void marshall$credentials_release(List<? extends CredentialEntry> list, Bundle bundle) {
            Intrinsics.checkNotNullParameter(list, "<this>");
            Intrinsics.checkNotNullParameter(bundle, "bundle");
            bundle.putInt(CredentialEntry.EXTRA_CREDENTIAL_ENTRY_SIZE, list.size());
            int size = list.size();
            for (int i = 0; i < size; i++) {
                CredentialEntry entry = list.get(i);
                if (entry instanceof PasswordCredentialEntry) {
                    PasswordCredentialEntry.INSTANCE.marshall$credentials_release((PasswordCredentialEntry) entry, bundle, i);
                } else if (entry instanceof PublicKeyCredentialEntry) {
                    PublicKeyCredentialEntry.INSTANCE.marshall$credentials_release((PublicKeyCredentialEntry) entry, bundle, i);
                } else if (entry instanceof CustomCredentialEntry) {
                    CustomCredentialEntry.INSTANCE.marshall$credentials_release((CustomCredentialEntry) entry, bundle, i);
                }
            }
        }

        public final void marshallCommonProperties$credentials_release(CredentialEntry $this$marshallCommonProperties, Bundle bundle, int index) {
            Intrinsics.checkNotNullParameter($this$marshallCommonProperties, "<this>");
            Intrinsics.checkNotNullParameter(bundle, "bundle");
            bundle.putString(CredentialEntry.EXTRA_CREDENTIAL_ENTRY_ENTRY_TYPE_PREFIX + index, $this$marshallCommonProperties.getType());
            bundle.putString(CredentialEntry.EXTRA_CREDENTIAL_ENTRY_OPTION_ID_PREFIX + index, $this$marshallCommonProperties.getBeginGetCredentialOption().getId());
            bundle.putString(CredentialEntry.EXTRA_CREDENTIAL_ENTRY_OPTION_TYPE_PREFIX + index, $this$marshallCommonProperties.getBeginGetCredentialOption().getType());
            bundle.putBundle(CredentialEntry.EXTRA_CREDENTIAL_ENTRY_OPTION_DATA_PREFIX + index, $this$marshallCommonProperties.getBeginGetCredentialOption().getCandidateQueryData());
            bundle.putCharSequence(CredentialEntry.EXTRA_CREDENTIAL_ENTRY_ENTRY_GROUP_ID_PREFIX + index, $this$marshallCommonProperties.getEntryGroupId());
            bundle.putBoolean(CredentialEntry.EXTRA_CREDENTIAL_ENTRY_IS_DEFAULT_ICON_PREFERRED_AS_SINGLE_PROV_PREFIX + index, $this$marshallCommonProperties.getIsDefaultIconPreferredAsSingleProvider());
            CharSequence it = $this$marshallCommonProperties.getAffiliatedDomain();
            if (it != null) {
                bundle.putCharSequence(CredentialEntry.EXTRA_CREDENTIAL_ENTRY_AFFILIATED_DOMAIN_PREFIX + index, it);
            }
        }

        public final List<CredentialEntry> unmarshallCredentialEntries$credentials_release(Bundle $this$unmarshallCredentialEntries) {
            CredentialEntry entry;
            Intrinsics.checkNotNullParameter($this$unmarshallCredentialEntries, "<this>");
            List entries = new ArrayList();
            int size = $this$unmarshallCredentialEntries.getInt(CredentialEntry.EXTRA_CREDENTIAL_ENTRY_SIZE, 0);
            for (int index = 0; index < size; index++) {
                String type = $this$unmarshallCredentialEntries.getString(CredentialEntry.EXTRA_CREDENTIAL_ENTRY_ENTRY_TYPE_PREFIX + index);
                if (type == null) {
                    return CollectionsKt.emptyList();
                }
                if (Intrinsics.areEqual(type, PasswordCredential.TYPE_PASSWORD_CREDENTIAL)) {
                    entry = PasswordCredentialEntry.INSTANCE.unmarshall$credentials_release($this$unmarshallCredentialEntries, index);
                } else if (Intrinsics.areEqual(type, PublicKeyCredential.TYPE_PUBLIC_KEY_CREDENTIAL)) {
                    entry = PublicKeyCredentialEntry.INSTANCE.unmarshall$credentials_release($this$unmarshallCredentialEntries, index);
                } else {
                    entry = CustomCredentialEntry.INSTANCE.unmarshall$credentials_release($this$unmarshallCredentialEntries, index, type);
                }
                if (entry == null) {
                    return CollectionsKt.emptyList();
                }
                entries.add(entry);
            }
            return entries;
        }
    }

    @JvmStatic
    public static final CredentialEntry fromCredentialEntry(android.service.credentials.CredentialEntry credentialEntry) {
        return INSTANCE.fromCredentialEntry(credentialEntry);
    }
}
