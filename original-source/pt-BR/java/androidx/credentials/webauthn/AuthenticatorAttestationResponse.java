package androidx.credentials.webauthn;

import androidx.constraintlayout.widget.ConstraintLayout;
import com.google.android.gms.fido.fido2.api.common.DevicePublicKeyStringDef;
import com.google.android.gms.fido.u2f.api.common.ClientData;
import java.security.MessageDigest;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Metadata;
import kotlin.collections.ArraysKt;
import kotlin.collections.CollectionsKt;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;
import org.json.JSONArray;
import org.json.JSONObject;

/* compiled from: AuthenticatorAttestationResponse.kt */
@Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0012\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\f\n\u0002\u0018\u0002\n\u0002\b\t\b\u0007\u0018\u00002\u00020\u0001B]\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\u0007\u001a\u00020\b\u0012\u0006\u0010\t\u001a\u00020\n\u0012\u0006\u0010\u000b\u001a\u00020\n\u0012\u0006\u0010\f\u001a\u00020\n\u0012\u0006\u0010\r\u001a\u00020\n\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\b\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u0005¢\u0006\u0002\u0010\u0010J\b\u0010\u001c\u001a\u00020\u0005H\u0002J\r\u0010\u001d\u001a\u00020\u0005H\u0000¢\u0006\u0002\b\u001eJ\b\u0010\u001f\u001a\u00020\u0017H\u0016R\u001a\u0010\u0011\u001a\u00020\u0005X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0012\u0010\u0013\"\u0004\b\u0014\u0010\u0015R\u000e\u0010\f\u001a\u00020\nX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\nX\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\u000f\u001a\u0004\u0018\u00010\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u001a\u0010\u0016\u001a\u00020\u0017X\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0018\u0010\u0019\"\u0004\b\u001a\u0010\u001bR\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\bX\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\u000e\u001a\u0004\u0018\u00010\bX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\nX\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006 "}, d2 = {"Landroidx/credentials/webauthn/AuthenticatorAttestationResponse;", "Landroidx/credentials/webauthn/AuthenticatorResponse;", "requestOptions", "Landroidx/credentials/webauthn/PublicKeyCredentialCreationOptions;", "credentialId", "", "credentialPublicKey", "origin", "", "up", "", "uv", "be", "bs", "packageName", "clientDataHash", "(Landroidx/credentials/webauthn/PublicKeyCredentialCreationOptions;[B[BLjava/lang/String;ZZZZLjava/lang/String;[B)V", "attestationObject", "getAttestationObject", "()[B", "setAttestationObject", "([B)V", "clientJson", "Lorg/json/JSONObject;", "getClientJson", "()Lorg/json/JSONObject;", "setClientJson", "(Lorg/json/JSONObject;)V", "authData", "defaultAttestationObject", "defaultAttestationObject$credentials_release", "json", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* carregado de: classes.dex */
public final class AuthenticatorAttestationResponse implements AuthenticatorResponse {
    private byte[] attestationObject;
    private final boolean be;
    private final boolean bs;
    private final byte[] clientDataHash;
    private JSONObject clientJson;
    private final byte[] credentialId;
    private final byte[] credentialPublicKey;
    private final String origin;
    private final String packageName;
    private final PublicKeyCredentialCreationOptions requestOptions;
    private final boolean up;
    private final boolean uv;

    public AuthenticatorAttestationResponse(PublicKeyCredentialCreationOptions requestOptions, byte[] credentialId, byte[] credentialPublicKey, String origin, boolean up, boolean uv, boolean be, boolean bs, String packageName, byte[] clientDataHash) {
        Intrinsics.checkNotNullParameter(requestOptions, "requestOptions");
        Intrinsics.checkNotNullParameter(credentialId, "credentialId");
        Intrinsics.checkNotNullParameter(credentialPublicKey, "credentialPublicKey");
        Intrinsics.checkNotNullParameter(origin, "origin");
        this.requestOptions = requestOptions;
        this.credentialId = credentialId;
        this.credentialPublicKey = credentialPublicKey;
        this.origin = origin;
        this.up = up;
        this.uv = uv;
        this.be = be;
        this.bs = bs;
        this.packageName = packageName;
        this.clientDataHash = clientDataHash;
        this.clientJson = new JSONObject();
        getClientJson().put("type", "webauthn.create");
        getClientJson().put(ClientData.KEY_CHALLENGE, WebAuthnUtils.INSTANCE.b64Encode(this.requestOptions.getChallenge()));
        getClientJson().put("origin", this.origin);
        if (this.packageName != null) {
            getClientJson().put("androidPackageName", this.packageName);
        }
        this.attestationObject = defaultAttestationObject$credentials_release();
    }

    /* JADX WARN: instruções ilegais antes da chamada do construtor */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public /* sintético */ AuthenticatorAttestationResponse(androidx.credentials.webauthn.PublicKeyCredentialCreationOptions r2, byte[] r3, byte[] r4, java.lang.String r5, boolean r6, boolean r7, boolean r8, boolean r9, java.lang.String r10, byte[] r11, int r12, kotlin.jvm.internal.DefaultConstructorMarker r13) {
        /*
            r1 = this;
            r13 = r12 & 256(0x100, float:3.59E-43)
            r0 = 0
            if (r13 == 0) goto L6
            r10 = r0
        L6:
            r12 = r12 & 512(0x200, float:7.17E-43)
            if (r12 == 0) goto Lc
            r12 = r0
            goto Ld
        Lc:
            r12 = r11
        Ld:
            r11 = r10
            r10 = r9
            r9 = r8
            r8 = r7
            r7 = r6
            r6 = r5
            r5 = r4
            r4 = r3
            r3 = r2
            r2 = r1
            r2.<init>(r3, r4, r5, r6, r7, r8, r9, r10, r11, r12)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.credentials.webauthn.AuthenticatorAttestationResponse.<init>(androidx.credentials.webauthn.PublicKeyCredentialCreationOptions, byte[], byte[], java.lang.String, boolean, boolean, boolean, boolean, java.lang.String, byte[], int, kotlin.jvm.internal.DefaultConstructorMarker):void");
    }

    @Override // androidx.credentials.webauthn.AuthenticatorResponse
    public JSONObject getClientJson() {
        return this.clientJson;
    }

    @Override // androidx.credentials.webauthn.AuthenticatorResponse
    public void setClientJson(JSONObject jSONObject) {
        Intrinsics.checkNotNullParameter(jSONObject, "<set-?>");
        this.clientJson = jSONObject;
    }

    public final byte[] getAttestationObject() {
        return this.attestationObject;
    }

    public final void setAttestationObject(byte[] bArr) {
        Intrinsics.checkNotNullParameter(bArr, "<set-?>");
        this.attestationObject = bArr;
    }

    private final byte[] authData() {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] bytes = this.requestOptions.getRp().getId().getBytes(Charsets.UTF_8);
        Intrinsics.checkNotNullExpressionValue(bytes, "this as java.lang.String).getBytes(charset)");
        byte[] rpHash = md.digest(bytes);
        int flags = this.up ? 0 | 1 : 0;
        if (this.uv) {
            flags |= 4;
        }
        if (this.be) {
            flags |= 8;
        }
        if (this.bs) {
            flags |= 16;
        }
        int flags2 = flags | 64;
        byte[] aaguid = new byte[16];
        for (int i = 0; i < 16; i++) {
            aaguid[i] = 0;
        }
        byte[] credIdLen = {(byte) (this.credentialId.length >> 8), (byte) this.credentialId.length};
        Intrinsics.checkNotNullExpressionValue(rpHash, "rpHash");
        byte[] ret = ArraysKt.plus(ArraysKt.plus(ArraysKt.plus(ArraysKt.plus(ArraysKt.plus(ArraysKt.plus(rpHash, new byte[]{(byte) flags2}), new byte[]{0, 0, 0, 0}), aaguid), credIdLen), this.credentialId), this.credentialPublicKey);
        return ret;
    }

    public final byte[] defaultAttestationObject$credentials_release() {
        Map ao = new LinkedHashMap();
        ao.put("fmt", DevicePublicKeyStringDef.NONE);
        ao.put("attStmt", MapsKt.emptyMap());
        ao.put("authData", authData());
        return new Cbor().encode(ao);
    }

    @Override // androidx.credentials.webauthn.AuthenticatorResponse
    public JSONObject json() {
        String jSONObject = getClientJson().toString();
        Intrinsics.checkNotNullExpressionValue(jSONObject, "clientJson.toString()");
        byte[] clientData = jSONObject.getBytes(Charsets.UTF_8);
        Intrinsics.checkNotNullExpressionValue(clientData, "this as java.lang.String).getBytes(charset)");
        JSONObject response = new JSONObject();
        if (this.clientDataHash == null) {
            response.put("clientDataJSON", WebAuthnUtils.INSTANCE.b64Encode(clientData));
        }
        response.put("attestationObject", WebAuthnUtils.INSTANCE.b64Encode(this.attestationObject));
        response.put("transports", new JSONArray((Collection) CollectionsKt.listOf((Object[]) new String[]{"internal", "hybrid"})));
        return response;
    }
}
