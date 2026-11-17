package androidx.credentials.webauthn;

import androidx.constraintlayout.widget.ConstraintLayout;
import com.google.android.gms.fido.u2f.api.common.ClientData;
import java.security.MessageDigest;
import kotlin.Metadata;
import kotlin.collections.ArraysKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;
import org.json.JSONObject;

/* compiled from: AuthenticatorAssertionResponse.kt */
@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0012\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\r\n\u0002\u0018\u0002\n\u0002\b\u000b\b\u0007\u0018\u00002\u00020\u0001B]\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\b\u001a\u00020\t\u0012\u0006\u0010\n\u001a\u00020\t\u0012\u0006\u0010\u000b\u001a\u00020\t\u0012\u0006\u0010\f\u001a\u00020\t\u0012\u0006\u0010\r\u001a\u00020\u0005\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u0005¢\u0006\u0002\u0010\u0010J\u0006\u0010\u001f\u001a\u00020\u0005J\u0006\u0010 \u001a\u00020\u0005J\b\u0010!\u001a\u00020\u0017H\u0016R\u001a\u0010\u0011\u001a\u00020\u0005X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0012\u0010\u0013\"\u0004\b\u0014\u0010\u0015R\u000e\u0010\u000b\u001a\u00020\tX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\f\u001a\u00020\tX\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\u000f\u001a\u0004\u0018\u00010\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u001a\u0010\u0016\u001a\u00020\u0017X\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0018\u0010\u0019\"\u0004\b\u001a\u0010\u001bR\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\u000e\u001a\u0004\u0018\u00010\u0007X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u001a\u0010\u001c\u001a\u00020\u0005X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u001d\u0010\u0013\"\u0004\b\u001e\u0010\u0015R\u000e\u0010\b\u001a\u00020\tX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u0005X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\tX\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\""}, d2 = {"Landroidx/credentials/webauthn/AuthenticatorAssertionResponse;", "Landroidx/credentials/webauthn/AuthenticatorResponse;", "requestOptions", "Landroidx/credentials/webauthn/PublicKeyCredentialRequestOptions;", "credentialId", "", "origin", "", "up", "", "uv", "be", "bs", "userHandle", "packageName", "clientDataHash", "(Landroidx/credentials/webauthn/PublicKeyCredentialRequestOptions;[BLjava/lang/String;ZZZZ[BLjava/lang/String;[B)V", "authenticatorData", "getAuthenticatorData", "()[B", "setAuthenticatorData", "([B)V", "clientJson", "Lorg/json/JSONObject;", "getClientJson", "()Lorg/json/JSONObject;", "setClientJson", "(Lorg/json/JSONObject;)V", "signature", "getSignature", "setSignature", "dataToSign", "defaultAuthenticatorData", "json", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* loaded from: classes.dex */
public final class AuthenticatorAssertionResponse implements AuthenticatorResponse {
    private byte[] authenticatorData;
    private final boolean be;
    private final boolean bs;
    private final byte[] clientDataHash;
    private JSONObject clientJson;
    private final byte[] credentialId;
    private final String origin;
    private final String packageName;
    private final PublicKeyCredentialRequestOptions requestOptions;
    private byte[] signature;
    private final boolean up;
    private byte[] userHandle;
    private final boolean uv;

    public AuthenticatorAssertionResponse(PublicKeyCredentialRequestOptions requestOptions, byte[] credentialId, String origin, boolean up, boolean uv, boolean be, boolean bs, byte[] userHandle, String packageName, byte[] clientDataHash) {
        Intrinsics.checkNotNullParameter(requestOptions, "requestOptions");
        Intrinsics.checkNotNullParameter(credentialId, "credentialId");
        Intrinsics.checkNotNullParameter(origin, "origin");
        Intrinsics.checkNotNullParameter(userHandle, "userHandle");
        this.requestOptions = requestOptions;
        this.credentialId = credentialId;
        this.origin = origin;
        this.up = up;
        this.uv = uv;
        this.be = be;
        this.bs = bs;
        this.userHandle = userHandle;
        this.packageName = packageName;
        this.clientDataHash = clientDataHash;
        this.clientJson = new JSONObject();
        this.signature = new byte[0];
        getClientJson().put("type", "webauthn.get");
        getClientJson().put(ClientData.KEY_CHALLENGE, WebAuthnUtils.INSTANCE.b64Encode(this.requestOptions.getChallenge()));
        getClientJson().put("origin", this.origin);
        if (this.packageName != null) {
            getClientJson().put("androidPackageName", this.packageName);
        }
        this.authenticatorData = defaultAuthenticatorData();
    }

    /* JADX WARN: Illegal instructions before constructor call */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public /* synthetic */ AuthenticatorAssertionResponse(androidx.credentials.webauthn.PublicKeyCredentialRequestOptions r2, byte[] r3, java.lang.String r4, boolean r5, boolean r6, boolean r7, boolean r8, byte[] r9, java.lang.String r10, byte[] r11, int r12, kotlin.jvm.internal.DefaultConstructorMarker r13) {
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
        throw new UnsupportedOperationException("Method not decompiled: androidx.credentials.webauthn.AuthenticatorAssertionResponse.<init>(androidx.credentials.webauthn.PublicKeyCredentialRequestOptions, byte[], java.lang.String, boolean, boolean, boolean, boolean, byte[], java.lang.String, byte[], int, kotlin.jvm.internal.DefaultConstructorMarker):void");
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

    public final byte[] getAuthenticatorData() {
        return this.authenticatorData;
    }

    public final void setAuthenticatorData(byte[] bArr) {
        Intrinsics.checkNotNullParameter(bArr, "<set-?>");
        this.authenticatorData = bArr;
    }

    public final byte[] getSignature() {
        return this.signature;
    }

    public final void setSignature(byte[] bArr) {
        Intrinsics.checkNotNullParameter(bArr, "<set-?>");
        this.signature = bArr;
    }

    public final byte[] defaultAuthenticatorData() {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] bytes = this.requestOptions.getRpId().getBytes(Charsets.UTF_8);
        Intrinsics.checkNotNullExpressionValue(bytes, "this as java.lang.String).getBytes(charset)");
        byte[] rpHash = md.digest(bytes);
        int flags = 0;
        if (this.up) {
            flags = 0 | 1;
        }
        if (this.uv) {
            flags |= 4;
        }
        if (this.be) {
            flags |= 8;
        }
        if (this.bs) {
            flags |= 16;
        }
        Intrinsics.checkNotNullExpressionValue(rpHash, "rpHash");
        byte[] ret = ArraysKt.plus(ArraysKt.plus(rpHash, new byte[]{(byte) flags}), new byte[]{0, 0, 0, 0});
        return ret;
    }

    public final byte[] dataToSign() {
        byte[] hash;
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        if (this.clientDataHash != null) {
            hash = this.clientDataHash;
        } else {
            String jSONObject = getClientJson().toString();
            Intrinsics.checkNotNullExpressionValue(jSONObject, "clientJson.toString()");
            byte[] bytes = jSONObject.getBytes(Charsets.UTF_8);
            Intrinsics.checkNotNullExpressionValue(bytes, "this as java.lang.String).getBytes(charset)");
            byte[] digest = md.digest(bytes);
            Intrinsics.checkNotNullExpressionValue(digest, "md.digest(clientJson.toString().toByteArray())");
            hash = digest;
        }
        return ArraysKt.plus(this.authenticatorData, hash);
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
        response.put("authenticatorData", WebAuthnUtils.INSTANCE.b64Encode(this.authenticatorData));
        response.put("signature", WebAuthnUtils.INSTANCE.b64Encode(this.signature));
        response.put("userHandle", WebAuthnUtils.INSTANCE.b64Encode(this.userHandle));
        return response;
    }
}
