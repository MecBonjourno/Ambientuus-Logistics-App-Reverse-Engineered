package androidx.credentials.provider;

import android.app.PendingIntent;
import android.app.slice.Slice;
import android.app.slice.SliceItem;
import android.app.slice.SliceSpec;
import android.graphics.drawable.Icon;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.credentials.PasswordCredential;
import androidx.credentials.PublicKeyCredential;
import androidx.credentials.provider.utils.CryptoObjectUtils;
import com.google.android.gms.common.internal.BaseGmsClient;
import j$.time.Instant;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.TuplesKt;
import kotlin.collections.CollectionsKt;
import kotlin.collections.MapsKt;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.TypeIntrinsics;

/* compiled from: CreateEntry.kt */
@Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\r\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\b\u0002\n\u0002\u0010%\n\u0002\u0010\u000e\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b%\b\u0007\u0018\u0000 12\u00020\u0001:\u000523451Ba\b\u0000\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\n\u001a\u0004\u0018\u00010\t\u0012\u0014\u0010\u000e\u001a\u0010\u0012\u0004\u0012\u00020\f\u0012\u0006\u0012\u0004\u0018\u00010\r0\u000b\u0012\u0006\u0010\u0010\u001a\u00020\u000f\u0012\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u0011¢\u0006\u0004\b\u0013\u0010\u0014Bk\b\u0016\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0002\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\r\u0012\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\r\u0012\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\r\u0012\b\b\u0002\u0010\u0010\u001a\u00020\u000f¢\u0006\u0004\b\u0013\u0010\u0018Bw\b\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0002\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\r\u0012\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\r\u0012\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\r\u0012\b\b\u0002\u0010\u0010\u001a\u00020\u000f\u0012\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u0011¢\u0006\u0004\b\u0013\u0010\u0019J\u000f\u0010\u001a\u001a\u0004\u0018\u00010\r¢\u0006\u0004\b\u001a\u0010\u001bJ\u000f\u0010\u001c\u001a\u0004\u0018\u00010\r¢\u0006\u0004\b\u001c\u0010\u001bJ\u000f\u0010\u001d\u001a\u0004\u0018\u00010\r¢\u0006\u0004\b\u001d\u0010\u001bR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001e\u001a\u0004\b\u001f\u0010 R\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010!\u001a\u0004\b\"\u0010#R\u0019\u0010\u0007\u001a\u0004\u0018\u00010\u00068\u0006¢\u0006\f\n\u0004\b\u0007\u0010$\u001a\u0004\b%\u0010&R\u0019\u0010\b\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\b\u0010\u001e\u001a\u0004\b'\u0010 R\u0019\u0010\n\u001a\u0004\u0018\u00010\t8\u0006¢\u0006\f\n\u0004\b\n\u0010(\u001a\u0004\b)\u0010*R\"\u0010\u000e\u001a\u0010\u0012\u0004\u0012\u00020\f\u0012\u0006\u0012\u0004\u0018\u00010\r0\u000b8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010+R\u0017\u0010\u0010\u001a\u00020\u000f8\u0006¢\u0006\f\n\u0004\b\u0010\u0010,\u001a\u0004\b\u0010\u0010-R\u0019\u0010\u0012\u001a\u0004\u0018\u00010\u00118\u0006¢\u0006\f\n\u0004\b\u0012\u0010.\u001a\u0004\b/\u00100¨\u00066"}, d2 = {"Landroidx/credentials/provider/CreateEntry;", "", "", "accountName", "Landroid/app/PendingIntent;", BaseGmsClient.KEY_PENDING_INTENT, "Landroid/graphics/drawable/Icon;", "icon", "description", "j$/time/Instant", "lastUsedTime", "", "", "", "credentialCountInformationMap", "", "isAutoSelectAllowed", "Landroidx/credentials/provider/BiometricPromptData;", "biometricPromptData", "<init>", "(Ljava/lang/CharSequence;Landroid/app/PendingIntent;Landroid/graphics/drawable/Icon;Ljava/lang/CharSequence;Lj$/time/Instant;Ljava/util/Map;ZLandroidx/credentials/provider/BiometricPromptData;)V", "passwordCredentialCount", "publicKeyCredentialCount", "totalCredentialCount", "(Ljava/lang/CharSequence;Landroid/app/PendingIntent;Ljava/lang/CharSequence;Lj$/time/Instant;Landroid/graphics/drawable/Icon;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Z)V", "(Ljava/lang/CharSequence;Landroid/app/PendingIntent;Ljava/lang/CharSequence;Lj$/time/Instant;Landroid/graphics/drawable/Icon;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;ZLandroidx/credentials/provider/BiometricPromptData;)V", "getPasswordCredentialCount", "()Ljava/lang/Integer;", "getPublicKeyCredentialCount", "getTotalCredentialCount", "Ljava/lang/CharSequence;", "getAccountName", "()Ljava/lang/CharSequence;", "Landroid/app/PendingIntent;", "getPendingIntent", "()Landroid/app/PendingIntent;", "Landroid/graphics/drawable/Icon;", "getIcon", "()Landroid/graphics/drawable/Icon;", "getDescription", "Lj$/time/Instant;", "getLastUsedTime", "()Lj$/time/Instant;", "Ljava/util/Map;", "Z", "()Z", "Landroidx/credentials/provider/BiometricPromptData;", "getBiometricPromptData", "()Landroidx/credentials/provider/BiometricPromptData;", "Companion", "Api28Impl", "Api34Impl", "Api35Impl", "Builder", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* carregado de: classes.dex */
public final class CreateEntry {
    private static final String AUTO_SELECT_FALSE_STRING = "false";
    private static final String AUTO_SELECT_TRUE_STRING = "true";

    /* renomeado de: Companion, motivo: de metadados do Kotlin */
    public static final Companion INSTANCE = new Companion(null);
    private static final int DESCRIPTION_MAX_CHAR_LIMIT = 300;
    private static final String EXTRA_CREATE_ACCOUNT_NAME_PREFIX = "androidx.credentials.provider.extra.ACCOUNT_NAME_";
    private static final String EXTRA_CREATE_CREDENTIAL_COUNT_INFO_PREFIX = "androidx.credentials.provider.extra.CREDENTIAL_COUNT_INFO_";
    private static final String EXTRA_CREATE_DESCRIPTION_PREFIX = "androidx.credentials.provider.extra.DESCRIPTION_";
    private static final String EXTRA_CREATE_ENTRY_IS_AUTO_SELECT_ALLOWED_PREFIX = "androidx.credentials.provider.extra.IS_AUTO_SELECT_ALLOWED_";
    private static final String EXTRA_CREATE_ENTRY_LAST_USED_TIME_PREFIX = "androidx.credentials.provider.extra.LAST_USED_TIME_";
    private static final String EXTRA_CREATE_ENTRY_PENDING_INTENT_PREFIX = "androidx.credentials.provider.extra.PENDING_INTENT_";
    private static final String EXTRA_CREATE_ENTRY_SIZE = "androidx.credentials.provider.extra.CREATE_ENTRY_SIZE";
    private static final String EXTRA_CREATE_TYPE_ICON_PREFIX = "androidx.credentials.provider.extra.ICON_";
    private static final int REVISION_ID = 1;
    private static final String SLICE_HINT_ACCOUNT_NAME = "androidx.credentials.provider.createEntry.SLICE_HINT_USER_PROVIDER_ACCOUNT_NAME";
    private static final String SLICE_HINT_ALLOWED_AUTHENTICATORS = "androidx.credentials.provider.createEntry.SLICE_HINT_ALLOWED_AUTHENTICATORS";
    private static final String SLICE_HINT_AUTO_SELECT_ALLOWED = "androidx.credentials.provider.createEntry.SLICE_HINT_AUTO_SELECT_ALLOWED";
    private static final String SLICE_HINT_BIOMETRIC_PROMPT_DATA = "androidx.credentials.provider.createEntry.SLICE_HINT_BIOMETRIC_PROMPT_DATA";
    private static final String SLICE_HINT_CREDENTIAL_COUNT_INFORMATION = "androidx.credentials.provider.createEntry.SLICE_HINT_CREDENTIAL_COUNT_INFORMATION";
    private static final String SLICE_HINT_CRYPTO_OP_ID = "androidx.credentials.provider.createEntry.SLICE_HINT_CRYPTO_OP_ID";
    private static final String SLICE_HINT_ICON = "androidx.credentials.provider.createEntry.SLICE_HINT_PROFILE_ICON";
    private static final String SLICE_HINT_LAST_USED_TIME_MILLIS = "androidx.credentials.provider.createEntry.SLICE_HINT_LAST_USED_TIME_MILLIS";
    private static final String SLICE_HINT_NOTE = "androidx.credentials.provider.createEntry.SLICE_HINT_NOTE";
    private static final String SLICE_HINT_PENDING_INTENT = "androidx.credentials.provider.createEntry.SLICE_HINT_PENDING_INTENT";
    private static final String SLICE_SPEC_TYPE = "CreateEntry";
    private static final String TAG = "CreateEntry";
    public static final String TYPE_TOTAL_CREDENTIAL = "TOTAL_CREDENTIAL_COUNT_TYPE";
    private final CharSequence accountName;
    private final BiometricPromptData biometricPromptData;
    private final Map<String, Integer> credentialCountInformationMap;
    private final CharSequence description;
    private final Icon icon;
    private final boolean isAutoSelectAllowed;
    private final Instant lastUsedTime;
    private final PendingIntent pendingIntent;

    public CreateEntry(CharSequence accountName, PendingIntent pendingIntent, Icon icon, CharSequence description, Instant lastUsedTime, Map<String, Integer> credentialCountInformationMap, boolean isAutoSelectAllowed, BiometricPromptData biometricPromptData) {
        Intrinsics.checkNotNullParameter(accountName, "accountName");
        Intrinsics.checkNotNullParameter(pendingIntent, "pendingIntent");
        Intrinsics.checkNotNullParameter(credentialCountInformationMap, "credentialCountInformationMap");
        this.accountName = accountName;
        this.pendingIntent = pendingIntent;
        this.icon = icon;
        this.description = description;
        this.lastUsedTime = lastUsedTime;
        this.credentialCountInformationMap = credentialCountInformationMap;
        this.isAutoSelectAllowed = isAutoSelectAllowed;
        this.biometricPromptData = biometricPromptData;
        if (!(this.accountName.length() > 0)) {
            throw new IllegalArgumentException("accountName must not be empty".toString());
        }
        if (this.description == null) {
            return;
        }
        if (this.description.length() <= 300) {
        } else {
            throw new IllegalArgumentException("Description must follow a limit of 300 characters.".toString());
        }
    }

    /* JADX WARN: instruções ilegais antes da chamada do construtor */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public /* sintético */ CreateEntry(java.lang.CharSequence r11, android.app.PendingIntent r12, android.graphics.drawable.Icon r13, java.lang.CharSequence r14, j$.time.Instant r15, java.util.Map r16, boolean r17, androidx.credentials.provider.BiometricPromptData r18, int r19, kotlin.jvm.internal.DefaultConstructorMarker r20) {
        /*
            r10 = this;
            r0 = r19
            r0 = r0 & 128(0x80, float:1.8E-43)
            if (r0 == 0) goto L9
            r0 = 0
            r9 = r0
            goto Lb
        L9:
            r9 = r18
        Lb:
            r1 = r10
            r2 = r11
            r3 = r12
            r4 = r13
            r5 = r14
            r6 = r15
            r7 = r16
            r8 = r17
            r1.<init>(r2, r3, r4, r5, r6, r7, r8, r9)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.credentials.provider.CreateEntry.<init>(java.lang.CharSequence, android.app.PendingIntent, android.graphics.drawable.Icon, java.lang.CharSequence, j$.time.Instant, java.util.Map, boolean, androidx.credentials.provider.BiometricPromptData, int, kotlin.jvm.internal.DefaultConstructorMarker):void");
    }

    public final CharSequence getAccountName() {
        return this.accountName;
    }

    public final PendingIntent getPendingIntent() {
        return this.pendingIntent;
    }

    public final Icon getIcon() {
        return this.icon;
    }

    public final CharSequence getDescription() {
        return this.description;
    }

    public final Instant getLastUsedTime() {
        return this.lastUsedTime;
    }

    /* renomeado de: isAutoSelectAllowed, motivo: de getter */
    public final boolean getIsAutoSelectAllowed() {
        return this.isAutoSelectAllowed;
    }

    public final BiometricPromptData getBiometricPromptData() {
        return this.biometricPromptData;
    }

    public /* sintético */ CreateEntry(CharSequence charSequence, PendingIntent pendingIntent, CharSequence charSequence2, Instant instant, Icon icon, Integer num, Integer num2, Integer num3, boolean z, int i, DefaultConstructorMarker defaultConstructorMarker) {
        this(charSequence, pendingIntent, (i & 4) != 0 ? null : charSequence2, (i & 8) != 0 ? null : instant, (i & 16) != 0 ? null : icon, (i & 32) != 0 ? null : num, (i & 64) != 0 ? null : num2, (i & 128) != 0 ? null : num3, (i & 256) != 0 ? false : z);
    }

    /* JADX WARN: chamada 'this' movida para o topo do método (pode alterar a semântica do código) */
    public CreateEntry(CharSequence accountName, PendingIntent pendingIntent, CharSequence description, Instant lastUsedTime, Icon icon, Integer passwordCredentialCount, Integer publicKeyCredentialCount, Integer totalCredentialCount, boolean isAutoSelectAllowed) {
        this(accountName, pendingIntent, icon, description, lastUsedTime, MapsKt.mutableMapOf(TuplesKt.to(PasswordCredential.TYPE_PASSWORD_CREDENTIAL, passwordCredentialCount), TuplesKt.to(PublicKeyCredential.TYPE_PUBLIC_KEY_CREDENTIAL, publicKeyCredentialCount), TuplesKt.to(TYPE_TOTAL_CREDENTIAL, totalCredentialCount)), isAutoSelectAllowed, (BiometricPromptData) null, 128, (DefaultConstructorMarker) null);
        Intrinsics.checkNotNullParameter(accountName, "accountName");
        Intrinsics.checkNotNullParameter(pendingIntent, "pendingIntent");
    }

    public /* sintético */ CreateEntry(CharSequence charSequence, PendingIntent pendingIntent, CharSequence charSequence2, Instant instant, Icon icon, Integer num, Integer num2, Integer num3, boolean z, BiometricPromptData biometricPromptData, int i, DefaultConstructorMarker defaultConstructorMarker) {
        this(charSequence, pendingIntent, (i & 4) != 0 ? null : charSequence2, (i & 8) != 0 ? null : instant, (i & 16) != 0 ? null : icon, (i & 32) != 0 ? null : num, (i & 64) != 0 ? null : num2, (i & 128) != 0 ? null : num3, (i & 256) != 0 ? false : z, (i & 512) != 0 ? null : biometricPromptData);
    }

    /* JADX WARN: chamada 'this' movida para o topo do método (pode alterar a semântica do código) */
    public CreateEntry(CharSequence accountName, PendingIntent pendingIntent, CharSequence description, Instant lastUsedTime, Icon icon, Integer passwordCredentialCount, Integer publicKeyCredentialCount, Integer totalCredentialCount, boolean isAutoSelectAllowed, BiometricPromptData biometricPromptData) {
        this(accountName, pendingIntent, icon, description, lastUsedTime, MapsKt.mutableMapOf(TuplesKt.to(PasswordCredential.TYPE_PASSWORD_CREDENTIAL, passwordCredentialCount), TuplesKt.to(PublicKeyCredential.TYPE_PUBLIC_KEY_CREDENTIAL, publicKeyCredentialCount), TuplesKt.to(TYPE_TOTAL_CREDENTIAL, totalCredentialCount)), isAutoSelectAllowed, biometricPromptData);
        Intrinsics.checkNotNullParameter(accountName, "accountName");
        Intrinsics.checkNotNullParameter(pendingIntent, "pendingIntent");
    }

    public final Integer getPasswordCredentialCount() {
        return this.credentialCountInformationMap.get(PasswordCredential.TYPE_PASSWORD_CREDENTIAL);
    }

    public final Integer getPublicKeyCredentialCount() {
        return this.credentialCountInformationMap.get(PublicKeyCredential.TYPE_PUBLIC_KEY_CREDENTIAL);
    }

    public final Integer getTotalCredentialCount() {
        return this.credentialCountInformationMap.get(TYPE_TOTAL_CREDENTIAL);
    }

    /* compiled from: CreateEntry.kt */
    @Metadata(d1 = {"\u0000N\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\r\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010%\n\u0002\u0010\u000e\n\u0002\b\u000b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007J\u0015\u0010\n\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\b¢\u0006\u0004\b\n\u0010\u000bJ\u0015\u0010\u000e\u001a\u00020\u00002\u0006\u0010\r\u001a\u00020\f¢\u0006\u0004\b\u000e\u0010\u000fJ\u0015\u0010\u0010\u001a\u00020\u00002\u0006\u0010\r\u001a\u00020\f¢\u0006\u0004\b\u0010\u0010\u000fJ\u0015\u0010\u0011\u001a\u00020\u00002\u0006\u0010\r\u001a\u00020\f¢\u0006\u0004\b\u0011\u0010\u000fJ\u0017\u0010\u0014\u001a\u00020\u00002\b\u0010\u0013\u001a\u0004\u0018\u00010\u0012¢\u0006\u0004\b\u0014\u0010\u0015J\u0017\u0010\u0017\u001a\u00020\u00002\b\u0010\u0016\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0017\u0010\u0018J\u0017\u0010\u001b\u001a\u00020\u00002\b\u0010\u001a\u001a\u0004\u0018\u00010\u0019¢\u0006\u0004\b\u001b\u0010\u001cJ\u0019\u0010\u001f\u001a\u00020\u00002\b\u0010\u001e\u001a\u0004\u0018\u00010\u001dH\u0007¢\u0006\u0004\b\u001f\u0010 J\r\u0010\"\u001a\u00020!¢\u0006\u0004\b\"\u0010#R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010$R\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010%R$\u0010(\u001a\u0010\u0012\u0004\u0012\u00020'\u0012\u0006\u0012\u0004\u0018\u00010\f0&8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b(\u0010)R\u0018\u0010\u0013\u001a\u0004\u0018\u00010\u00128\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u0013\u0010*R\u0018\u0010\u0016\u001a\u0004\u0018\u00010\u00028\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u0016\u0010$R\u0018\u0010\u001a\u001a\u0004\u0018\u00010\u00198\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u001a\u0010+R\u0018\u0010,\u001a\u0004\u0018\u00010\f8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b,\u0010-R\u0018\u0010.\u001a\u0004\u0018\u00010\f8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b.\u0010-R\u0018\u0010/\u001a\u0004\u0018\u00010\f8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b/\u0010-R\u0016\u0010\t\u001a\u00020\b8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\t\u00100R\u0018\u0010\u001e\u001a\u0004\u0018\u00010\u001d8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u001e\u00101¨\u00062"}, d2 = {"Landroidx/credentials/provider/CreateEntry$Builder;", "", "", "accountName", "Landroid/app/PendingIntent;", BaseGmsClient.KEY_PENDING_INTENT, "<init>", "(Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V", "", "autoSelectAllowed", "setAutoSelectAllowed", "(Z)Landroidx/credentials/provider/CreateEntry$Builder;", "", "count", "setPasswordCredentialCount", "(I)Landroidx/credentials/provider/CreateEntry$Builder;", "setPublicKeyCredentialCount", "setTotalCredentialCount", "Landroid/graphics/drawable/Icon;", "icon", "setIcon", "(Landroid/graphics/drawable/Icon;)Landroidx/credentials/provider/CreateEntry$Builder;", "description", "setDescription", "(Ljava/lang/CharSequence;)Landroidx/credentials/provider/CreateEntry$Builder;", "j$/time/Instant", "lastUsedTime", "setLastUsedTime", "(Lj$/time/Instant;)Landroidx/credentials/provider/CreateEntry$Builder;", "Landroidx/credentials/provider/BiometricPromptData;", "biometricPromptData", "setBiometricPromptData", "(Landroidx/credentials/provider/BiometricPromptData;)Landroidx/credentials/provider/CreateEntry$Builder;", "Landroidx/credentials/provider/CreateEntry;", "build", "()Landroidx/credentials/provider/CreateEntry;", "Ljava/lang/CharSequence;", "Landroid/app/PendingIntent;", "", "", "credentialCountInformationMap", "Ljava/util/Map;", "Landroid/graphics/drawable/Icon;", "Lj$/time/Instant;", "passwordCredentialCount", "Ljava/lang/Integer;", "publicKeyCredentialCount", "totalCredentialCount", "Z", "Landroidx/credentials/provider/BiometricPromptData;", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    public static final class Builder {
        private final CharSequence accountName;
        private boolean autoSelectAllowed;
        private BiometricPromptData biometricPromptData;
        private Map<String, Integer> credentialCountInformationMap;
        private CharSequence description;
        private Icon icon;
        private Instant lastUsedTime;
        private Integer passwordCredentialCount;
        private final PendingIntent pendingIntent;
        private Integer publicKeyCredentialCount;
        private Integer totalCredentialCount;

        public Builder(CharSequence accountName, PendingIntent pendingIntent) {
            Intrinsics.checkNotNullParameter(accountName, "accountName");
            Intrinsics.checkNotNullParameter(pendingIntent, "pendingIntent");
            this.accountName = accountName;
            this.pendingIntent = pendingIntent;
            this.credentialCountInformationMap = new LinkedHashMap();
        }

        public final Builder setAutoSelectAllowed(boolean autoSelectAllowed) {
            this.autoSelectAllowed = autoSelectAllowed;
            return this;
        }

        public final Builder setPasswordCredentialCount(int count) {
            this.passwordCredentialCount = Integer.valueOf(count);
            this.credentialCountInformationMap.put(PasswordCredential.TYPE_PASSWORD_CREDENTIAL, Integer.valueOf(count));
            return this;
        }

        public final Builder setPublicKeyCredentialCount(int count) {
            this.publicKeyCredentialCount = Integer.valueOf(count);
            this.credentialCountInformationMap.put(PublicKeyCredential.TYPE_PUBLIC_KEY_CREDENTIAL, Integer.valueOf(count));
            return this;
        }

        public final Builder setTotalCredentialCount(int count) {
            this.totalCredentialCount = Integer.valueOf(count);
            this.credentialCountInformationMap.put(CreateEntry.TYPE_TOTAL_CREDENTIAL, Integer.valueOf(count));
            return this;
        }

        public final Builder setIcon(Icon icon) {
            this.icon = icon;
            return this;
        }

        public final Builder setDescription(CharSequence description) {
            if ((description != null ? Integer.valueOf(description.length()) : null) != null && description.length() > 300) {
                throw new IllegalArgumentException("Description must follow a limit of 300 characters.");
            }
            this.description = description;
            return this;
        }

        public final Builder setLastUsedTime(Instant lastUsedTime) {
            this.lastUsedTime = lastUsedTime;
            return this;
        }

        public final Builder setBiometricPromptData(BiometricPromptData biometricPromptData) {
            this.biometricPromptData = biometricPromptData;
            return this;
        }

        public final CreateEntry build() {
            return new CreateEntry(this.accountName, this.pendingIntent, this.icon, this.description, this.lastUsedTime, this.credentialCountInformationMap, this.autoSelectAllowed, this.biometricPromptData);
        }
    }

    /* compiled from: CreateEntry.kt */
    @Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\bÃ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0012\u0010\u0003\u001a\u0004\u0018\u00010\u00042\u0006\u0010\u0005\u001a\u00020\u0006H\u0007¨\u0006\u0007"}, d2 = {"Landroidx/credentials/provider/CreateEntry$Api34Impl;", "", "()V", "fromCreateEntry", "Landroidx/credentials/provider/CreateEntry;", "createEntry", "Landroid/service/credentials/CreateEntry;", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    private static final class Api34Impl {
        public static final Api34Impl INSTANCE = new Api34Impl();

        private Api34Impl() {
        }

        @JvmStatic
        public static final CreateEntry fromCreateEntry(android.service.credentials.CreateEntry createEntry) {
            Intrinsics.checkNotNullParameter(createEntry, "createEntry");
            Slice slice = createEntry.getSlice();
            Intrinsics.checkNotNullExpressionValue(slice, "createEntry.slice");
            return CreateEntry.INSTANCE.fromSlice(slice);
        }
    }

    /* compiled from: CreateEntry.kt */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\bÃ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0018\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\bH\u0002J\u0012\u0010\t\u001a\u0004\u0018\u00010\u00062\u0006\u0010\n\u001a\u00020\u000bH\u0007J\u0010\u0010\f\u001a\u00020\u000b2\u0006\u0010\u0005\u001a\u00020\u0006H\u0007¨\u0006\r"}, d2 = {"Landroidx/credentials/provider/CreateEntry$Api35Impl;", "", "()V", "addToSlice", "", "createEntry", "Landroidx/credentials/provider/CreateEntry;", "sliceBuilder", "Landroid/app/slice/Slice$Builder;", "fromSlice", "slice", "Landroid/app/slice/Slice;", "toSlice", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    private static final class Api35Impl {
        public static final Api35Impl INSTANCE = new Api35Impl();

        private Api35Impl() {
        }

        private final void addToSlice(CreateEntry createEntry, Slice.Builder sliceBuilder) {
            BiometricPromptData biometricPromptData = createEntry.getBiometricPromptData();
            if (biometricPromptData != null) {
                sliceBuilder.addInt(biometricPromptData.getAllowedAuthenticators(), null, CollectionsKt.listOf(CreateEntry.SLICE_HINT_ALLOWED_AUTHENTICATORS));
                if (biometricPromptData.getCryptoObject() != null) {
                    sliceBuilder.addLong(CryptoObjectUtils.INSTANCE.getOperationHandle(biometricPromptData.getCryptoObject()), null, CollectionsKt.listOf(CreateEntry.SLICE_HINT_CRYPTO_OP_ID));
                }
                Bundle biometricBundle = BiometricPromptData.INSTANCE.toBundle(biometricPromptData);
                sliceBuilder.addBundle(biometricBundle, null, CollectionsKt.listOf(CreateEntry.SLICE_HINT_BIOMETRIC_PROMPT_DATA));
            }
        }

        @JvmStatic
        public static final Slice toSlice(CreateEntry createEntry) {
            Intrinsics.checkNotNullParameter(createEntry, "createEntry");
            Slice.Builder sliceBuilder = Api28Impl.INSTANCE.addToSlice(createEntry);
            INSTANCE.addToSlice(createEntry, sliceBuilder);
            Slice build = sliceBuilder.build();
            Intrinsics.checkNotNullExpressionValue(build, "sliceBuilder.build()");
            return build;
        }

        @JvmStatic
        public static final CreateEntry fromSlice(Slice slice) {
            BiometricPromptData biometricPromptData;
            Intrinsics.checkNotNullParameter(slice, "slice");
            CreateEntry createEntry = Api28Impl.fromSlice(slice);
            if (createEntry == null) {
                return null;
            }
            Iterable items = slice.getItems();
            Intrinsics.checkNotNullExpressionValue(items, "slice.items");
            Iterable $this$forEach$iv = items;
            Bundle bundle = null;
            for (Object element$iv : $this$forEach$iv) {
                SliceItem it = (SliceItem) element$iv;
                if (it.hasHint(CredentialEntry.SLICE_HINT_BIOMETRIC_PROMPT_DATA)) {
                    bundle = it.getBundle();
                }
            }
            try {
                CharSequence accountName = createEntry.getAccountName();
                PendingIntent pendingIntent = createEntry.getPendingIntent();
                Icon icon = createEntry.getIcon();
                CharSequence description = createEntry.getDescription();
                Instant lastUsedTime = createEntry.getLastUsedTime();
                Map map = createEntry.credentialCountInformationMap;
                boolean isAutoSelectAllowed = createEntry.getIsAutoSelectAllowed();
                if (bundle != null) {
                    biometricPromptData = BiometricPromptData.INSTANCE.fromBundle(bundle);
                } else {
                    biometricPromptData = null;
                }
                return new CreateEntry(accountName, pendingIntent, icon, description, lastUsedTime, map, isAutoSelectAllowed, biometricPromptData);
            } catch (Exception e) {
                Log.i("CreateEntry", "fromSlice failed with: " + e.getMessage());
                return null;
            }
        }
    }

    /* compiled from: CreateEntry.kt */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\bÃ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u000e\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u0006J\u0012\u0010\u0007\u001a\u0004\u0018\u00010\u00062\u0006\u0010\b\u001a\u00020\tH\u0007J\u0010\u0010\n\u001a\u00020\t2\u0006\u0010\u0005\u001a\u00020\u0006H\u0007¨\u0006\u000b"}, d2 = {"Landroidx/credentials/provider/CreateEntry$Api28Impl;", "", "()V", "addToSlice", "Landroid/app/slice/Slice$Builder;", "createEntry", "Landroidx/credentials/provider/CreateEntry;", "fromSlice", "slice", "Landroid/app/slice/Slice;", "toSlice", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    private static final class Api28Impl {
        public static final Api28Impl INSTANCE = new Api28Impl();

        private Api28Impl() {
        }

        @JvmStatic
        public static final Slice toSlice(CreateEntry createEntry) {
            Intrinsics.checkNotNullParameter(createEntry, "createEntry");
            Slice.Builder sliceBuilder = INSTANCE.addToSlice(createEntry);
            Slice build = sliceBuilder.build();
            Intrinsics.checkNotNullExpressionValue(build, "sliceBuilder.build()");
            return build;
        }

        public final Slice.Builder addToSlice(CreateEntry createEntry) {
            String autoSelectAllowed;
            Intrinsics.checkNotNullParameter(createEntry, "createEntry");
            CharSequence accountName = createEntry.getAccountName();
            Icon icon = createEntry.getIcon();
            CharSequence description = createEntry.getDescription();
            Instant lastUsedTime = createEntry.getLastUsedTime();
            Map credentialCountInformationMap = createEntry.credentialCountInformationMap;
            PendingIntent pendingIntent = createEntry.getPendingIntent();
            Slice.Builder sliceBuilder = new Slice.Builder(Uri.EMPTY, new SliceSpec("CreateEntry", 1));
            if (createEntry.getIsAutoSelectAllowed()) {
                autoSelectAllowed = "true";
            } else {
                autoSelectAllowed = "false";
            }
            sliceBuilder.addText(accountName, null, CollectionsKt.listOf(CreateEntry.SLICE_HINT_ACCOUNT_NAME));
            if (lastUsedTime != null) {
                sliceBuilder.addLong(lastUsedTime.toEpochMilli(), null, CollectionsKt.listOf(CreateEntry.SLICE_HINT_LAST_USED_TIME_MILLIS));
            }
            if (description != null) {
                sliceBuilder.addText(description, null, CollectionsKt.listOf(CreateEntry.SLICE_HINT_NOTE));
            }
            if (icon != null) {
                sliceBuilder.addIcon(icon, null, CollectionsKt.listOf(CreateEntry.SLICE_HINT_ICON));
            }
            Bundle credentialCountBundle = CreateEntry.INSTANCE.convertCredentialCountInfoToBundle$credentials_release(credentialCountInformationMap);
            if (credentialCountBundle != null) {
                sliceBuilder.addBundle(CreateEntry.INSTANCE.convertCredentialCountInfoToBundle$credentials_release(credentialCountInformationMap), null, CollectionsKt.listOf(CreateEntry.SLICE_HINT_CREDENTIAL_COUNT_INFORMATION));
            }
            sliceBuilder.addAction(pendingIntent, new Slice.Builder(sliceBuilder).addHints(Collections.singletonList(CreateEntry.SLICE_HINT_PENDING_INTENT)).build(), null).addText(autoSelectAllowed, null, CollectionsKt.listOf(CreateEntry.SLICE_HINT_AUTO_SELECT_ALLOWED));
            return sliceBuilder;
        }

        /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
        /* JADX WARN: falha na inferência de tipo para: r4v16, types: [java.util.Map] */
        @JvmStatic
        public static final CreateEntry fromSlice(Slice slice) {
            Intrinsics.checkNotNullParameter(slice, "slice");
            Object credentialCountInfo = new LinkedHashMap();
            Iterable items = slice.getItems();
            Intrinsics.checkNotNullExpressionValue(items, "slice.items");
            Iterable $this$forEach$iv = items;
            CharSequence charSequence = null;
            Icon icon = null;
            PendingIntent pendingIntent = null;
            LinkedHashMap linkedHashMap = (Map) credentialCountInfo;
            CharSequence charSequence2 = null;
            Instant instant = null;
            boolean autoSelectAllowed = false;
            for (Object element$iv : $this$forEach$iv) {
                SliceItem it = (SliceItem) element$iv;
                if (it.hasHint(CreateEntry.SLICE_HINT_ACCOUNT_NAME)) {
                    charSequence = it.getText();
                } else if (it.hasHint(CreateEntry.SLICE_HINT_ICON)) {
                    icon = it.getIcon();
                } else if (it.hasHint(CreateEntry.SLICE_HINT_PENDING_INTENT)) {
                    pendingIntent = it.getAction();
                } else if (it.hasHint(CreateEntry.SLICE_HINT_CREDENTIAL_COUNT_INFORMATION)) {
                    Map<String, Integer> convertBundleToCredentialCountInfo$credentials_release = CreateEntry.INSTANCE.convertBundleToCredentialCountInfo$credentials_release(it.getBundle());
                    Intrinsics.checkNotNull(convertBundleToCredentialCountInfo$credentials_release, "null cannot be cast to non-null type kotlin.collections.MutableMap<kotlin.String, kotlin.Int?>");
                    linkedHashMap = TypeIntrinsics.asMutableMap(convertBundleToCredentialCountInfo$credentials_release);
                } else if (it.hasHint(CreateEntry.SLICE_HINT_LAST_USED_TIME_MILLIS)) {
                    instant = Instant.ofEpochMilli(it.getLong());
                } else if (it.hasHint(CreateEntry.SLICE_HINT_NOTE)) {
                    charSequence2 = it.getText();
                } else if (it.hasHint(CreateEntry.SLICE_HINT_LAST_USED_TIME_MILLIS)) {
                    instant = Instant.ofEpochMilli(it.getLong());
                } else if (it.hasHint(CreateEntry.SLICE_HINT_AUTO_SELECT_ALLOWED)) {
                    CharSequence autoSelectValue = it.getText();
                    if (Intrinsics.areEqual(autoSelectValue, "true")) {
                        autoSelectAllowed = true;
                    }
                }
            }
            try {
                Intrinsics.checkNotNull(charSequence);
                Intrinsics.checkNotNull(pendingIntent);
                return new CreateEntry(charSequence, pendingIntent, icon, charSequence2, instant, linkedHashMap, autoSelectAllowed, (BiometricPromptData) null, 128, (DefaultConstructorMarker) null);
            } catch (Exception e) {
                Log.i("CreateEntry", "fromSlice failed with: " + e.getMessage());
                return null;
            }
        }
    }

    /* compiled from: CreateEntry.kt */
    @Metadata(d1 = {"\u0000L\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0017\n\u0002\u0010$\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\u0010 \n\u0002\b\u0004\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J%\u0010\u001e\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0006\u0012\u0004\u0018\u00010\u00070\u001f2\b\u0010 \u001a\u0004\u0018\u00010!H\u0001¢\u0006\u0002\b\"J%\u0010#\u001a\u0004\u0018\u00010!2\u0014\u0010$\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0006\u0012\u0004\u0018\u00010\u00070\u001fH\u0001¢\u0006\u0002\b%J\u0012\u0010&\u001a\u0004\u0018\u00010'2\u0006\u0010(\u001a\u00020)H\u0007J\u0012\u0010*\u001a\u0004\u0018\u00010'2\u0006\u0010+\u001a\u00020,H\u0007J\u0012\u0010-\u001a\u0004\u0018\u00010,2\u0006\u0010(\u001a\u00020'H\u0007J\u001f\u0010.\u001a\u00020/*\b\u0012\u0004\u0012\u00020'002\u0006\u0010 \u001a\u00020!H\u0001¢\u0006\u0002\b1J\u0017\u00102\u001a\b\u0012\u0004\u0012\u00020'00*\u00020!H\u0001¢\u0006\u0002\b3R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\f\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u0007X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0012\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0013\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0014\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0015\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0016\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0017\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0018\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0019\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u001a\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u001b\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u001c\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u001d\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000¨\u00064"}, d2 = {"Landroidx/credentials/provider/CreateEntry$Companion;", "", "()V", "AUTO_SELECT_FALSE_STRING", "", "AUTO_SELECT_TRUE_STRING", "DESCRIPTION_MAX_CHAR_LIMIT", "", "EXTRA_CREATE_ACCOUNT_NAME_PREFIX", "EXTRA_CREATE_CREDENTIAL_COUNT_INFO_PREFIX", "EXTRA_CREATE_DESCRIPTION_PREFIX", "EXTRA_CREATE_ENTRY_IS_AUTO_SELECT_ALLOWED_PREFIX", "EXTRA_CREATE_ENTRY_LAST_USED_TIME_PREFIX", "EXTRA_CREATE_ENTRY_PENDING_INTENT_PREFIX", "EXTRA_CREATE_ENTRY_SIZE", "EXTRA_CREATE_TYPE_ICON_PREFIX", "REVISION_ID", "SLICE_HINT_ACCOUNT_NAME", "SLICE_HINT_ALLOWED_AUTHENTICATORS", "SLICE_HINT_AUTO_SELECT_ALLOWED", "SLICE_HINT_BIOMETRIC_PROMPT_DATA", "SLICE_HINT_CREDENTIAL_COUNT_INFORMATION", "SLICE_HINT_CRYPTO_OP_ID", "SLICE_HINT_ICON", "SLICE_HINT_LAST_USED_TIME_MILLIS", "SLICE_HINT_NOTE", "SLICE_HINT_PENDING_INTENT", "SLICE_SPEC_TYPE", "TAG", "TYPE_TOTAL_CREDENTIAL", "convertBundleToCredentialCountInfo", "", "bundle", "Landroid/os/Bundle;", "convertBundleToCredentialCountInfo$credentials_release", "convertCredentialCountInfoToBundle", "credentialCountInformationMap", "convertCredentialCountInfoToBundle$credentials_release", "fromCreateEntry", "Landroidx/credentials/provider/CreateEntry;", "createEntry", "Landroid/service/credentials/CreateEntry;", "fromSlice", "slice", "Landroid/app/slice/Slice;", "toSlice", "marshall", "", "", "marshall$credentials_release", "unmarshallCreateEntries", "unmarshallCreateEntries$credentials_release", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    public static final class Companion {
        public /* sintético */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        @JvmStatic
        public final Slice toSlice(CreateEntry createEntry) {
            Intrinsics.checkNotNullParameter(createEntry, "createEntry");
            if (Build.VERSION.SDK_INT >= 35) {
                return Api35Impl.toSlice(createEntry);
            }
            if (Build.VERSION.SDK_INT >= 28) {
                return Api28Impl.toSlice(createEntry);
            }
            return null;
        }

        @JvmStatic
        public final CreateEntry fromSlice(Slice slice) {
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
        public final CreateEntry fromCreateEntry(android.service.credentials.CreateEntry createEntry) {
            Intrinsics.checkNotNullParameter(createEntry, "createEntry");
            if (Build.VERSION.SDK_INT >= 34) {
                return Api34Impl.fromCreateEntry(createEntry);
            }
            return null;
        }

        @JvmStatic
        public final Map<String, Integer> convertBundleToCredentialCountInfo$credentials_release(Bundle bundle) {
            HashMap credentialCountMap = new HashMap();
            if (bundle == null) {
                return credentialCountMap;
            }
            Iterable keySet = bundle.keySet();
            Intrinsics.checkNotNullExpressionValue(keySet, "bundle.keySet()");
            Iterable $this$forEach$iv = keySet;
            for (Object element$iv : $this$forEach$iv) {
                String it = (String) element$iv;
                try {
                    Intrinsics.checkNotNullExpressionValue(it, "it");
                    credentialCountMap.put(it, Integer.valueOf(bundle.getInt(it)));
                } catch (Exception e) {
                    Log.i("CreateEntry", "Issue unpacking credential count info bundle: " + e.getMessage());
                }
            }
            return credentialCountMap;
        }

        @JvmStatic
        public final Bundle convertCredentialCountInfoToBundle$credentials_release(Map<String, Integer> credentialCountInformationMap) {
            Intrinsics.checkNotNullParameter(credentialCountInformationMap, "credentialCountInformationMap");
            boolean foundCredentialCount = false;
            Bundle bundle = new Bundle();
            for (Map.Entry element$iv : credentialCountInformationMap.entrySet()) {
                if (element$iv.getValue() != null) {
                    String key = element$iv.getKey();
                    Integer value = element$iv.getValue();
                    Intrinsics.checkNotNull(value);
                    bundle.putInt(key, value.intValue());
                    foundCredentialCount = true;
                }
            }
            if (!foundCredentialCount) {
                return null;
            }
            return bundle;
        }

        public final void marshall$credentials_release(List<CreateEntry> list, Bundle bundle) {
            Instant it;
            Intrinsics.checkNotNullParameter(list, "<this>");
            Intrinsics.checkNotNullParameter(bundle, "bundle");
            bundle.putInt(CreateEntry.EXTRA_CREATE_ENTRY_SIZE, list.size());
            List<CreateEntry> $this$forEachIndexed$iv = list;
            int index = 0;
            for (Object item$iv : $this$forEachIndexed$iv) {
                int index$iv = index + 1;
                if (index < 0) {
                    CollectionsKt.throwIndexOverflow();
                }
                CreateEntry entry = (CreateEntry) item$iv;
                bundle.putCharSequence(CreateEntry.EXTRA_CREATE_ACCOUNT_NAME_PREFIX + index, entry.getAccountName());
                bundle.putParcelable("androidx.credentials.provider.extra.PENDING_INTENT_" + index, entry.getPendingIntent());
                Icon it2 = entry.getIcon();
                if (it2 != null) {
                    bundle.putParcelable("androidx.credentials.provider.extra.ICON_" + index, it2);
                }
                CharSequence it3 = entry.getDescription();
                if (it3 != null) {
                    bundle.putCharSequence(CreateEntry.EXTRA_CREATE_DESCRIPTION_PREFIX + index, it3);
                }
                if (Build.VERSION.SDK_INT >= 26 && (it = entry.getLastUsedTime()) != null) {
                    bundle.putSerializable("androidx.credentials.provider.extra.LAST_USED_TIME_" + index, it);
                }
                Bundle countInfo = CreateEntry.INSTANCE.convertCredentialCountInfoToBundle$credentials_release(entry.credentialCountInformationMap);
                if (countInfo != null) {
                    bundle.putBundle(CreateEntry.EXTRA_CREATE_CREDENTIAL_COUNT_INFO_PREFIX + index, countInfo);
                }
                bundle.putBoolean("androidx.credentials.provider.extra.IS_AUTO_SELECT_ALLOWED_" + index, entry.getIsAutoSelectAllowed());
                index = index$iv;
            }
        }

        public final List<CreateEntry> unmarshallCreateEntries$credentials_release(Bundle $this$unmarshallCreateEntries) {
            Intrinsics.checkNotNullParameter($this$unmarshallCreateEntries, "<this>");
            try {
                List entries = new ArrayList();
                int size = $this$unmarshallCreateEntries.getInt(CreateEntry.EXTRA_CREATE_ENTRY_SIZE, 0);
                for (int index = 0; index < size; index++) {
                    CharSequence accountName = $this$unmarshallCreateEntries.getCharSequence(CreateEntry.EXTRA_CREATE_ACCOUNT_NAME_PREFIX + index);
                    if (accountName == null) {
                        return CollectionsKt.emptyList();
                    }
                    PendingIntent pendingIntent = (PendingIntent) $this$unmarshallCreateEntries.getParcelable("androidx.credentials.provider.extra.PENDING_INTENT_" + index);
                    if (pendingIntent == null) {
                        return CollectionsKt.emptyList();
                    }
                    Icon icon = (Icon) $this$unmarshallCreateEntries.getParcelable("androidx.credentials.provider.extra.ICON_" + index);
                    CharSequence description = $this$unmarshallCreateEntries.getCharSequence(CreateEntry.EXTRA_CREATE_DESCRIPTION_PREFIX + index);
                    Map countInfo = MapsKt.toMutableMap(convertBundleToCredentialCountInfo$credentials_release($this$unmarshallCreateEntries.getBundle(CreateEntry.EXTRA_CREATE_CREDENTIAL_COUNT_INFO_PREFIX + index)));
                    boolean isAutoSelectAllowed = $this$unmarshallCreateEntries.getBoolean("androidx.credentials.provider.extra.IS_AUTO_SELECT_ALLOWED_" + index, false);
                    if (Build.VERSION.SDK_INT >= 26) {
                        Instant lastUsedTime = (Instant) $this$unmarshallCreateEntries.getSerializable("androidx.credentials.provider.extra.LAST_USED_TIME_" + index);
                        entries.add(new CreateEntry(accountName, pendingIntent, icon, description, lastUsedTime, countInfo, isAutoSelectAllowed, (BiometricPromptData) null, 128, (DefaultConstructorMarker) null));
                    } else {
                        entries.add(new CreateEntry(accountName, pendingIntent, icon, description, (Instant) null, countInfo, isAutoSelectAllowed, (BiometricPromptData) null, 128, (DefaultConstructorMarker) null));
                    }
                }
                return entries;
            } catch (Exception e) {
                return CollectionsKt.emptyList();
            }
        }
    }

    @JvmStatic
    public static final Slice toSlice(CreateEntry createEntry) {
        return INSTANCE.toSlice(createEntry);
    }

    @JvmStatic
    public static final CreateEntry fromSlice(Slice slice) {
        return INSTANCE.fromSlice(slice);
    }

    @JvmStatic
    public static final CreateEntry fromCreateEntry(android.service.credentials.CreateEntry createEntry) {
        return INSTANCE.fromCreateEntry(createEntry);
    }
}
