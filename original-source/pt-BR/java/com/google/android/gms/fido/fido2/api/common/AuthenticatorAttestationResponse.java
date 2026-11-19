package com.google.android.gms.fido.fido2.api.common;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.Objects;
import com.google.android.gms.common.internal.Preconditions;
import com.google.android.gms.common.internal.safeparcel.SafeParcelWriter;
import com.google.android.gms.common.internal.safeparcel.SafeParcelableSerializer;
import com.google.android.gms.fido.u2f.api.common.SignResponseData;
import com.google.android.gms.internal.fido.zzbi;
import com.google.android.gms.internal.fido.zzbj;
import com.google.android.gms.internal.fido.zzgf;
import com.google.android.gms.internal.fido.zzgx;
import java.util.Arrays;

/* compiled from: com.google.android.gms:play-services-fido@@21.0.0 */
/* carregado de: classes16.dex */
public class AuthenticatorAttestationResponse extends AuthenticatorResponse {
    public static final Parcelable.Creator<AuthenticatorAttestationResponse> CREATOR = new zzk();
    private final zzgx zza;
    private final zzgx zzb;
    private final zzgx zzc;
    private final String[] zzd;

    AuthenticatorAttestationResponse(byte[] bArr, byte[] bArr2, byte[] bArr3, String[] strArr) {
        byte[] bArr4 = (byte[]) Preconditions.checkNotNull(bArr);
        zzgx zzgxVar = zzgx.zzb;
        zzgx zzl = zzgx.zzl(bArr4, 0, bArr4.length);
        byte[] bArr5 = (byte[]) Preconditions.checkNotNull(bArr2);
        zzgx zzl2 = zzgx.zzl(bArr5, 0, bArr5.length);
        byte[] bArr6 = (byte[]) Preconditions.checkNotNull(bArr3);
        zzgx zzl3 = zzgx.zzl(bArr6, 0, bArr6.length);
        this.zza = (zzgx) Preconditions.checkNotNull(zzl);
        this.zzb = (zzgx) Preconditions.checkNotNull(zzl2);
        this.zzc = (zzgx) Preconditions.checkNotNull(zzl3);
        this.zzd = (String[]) Preconditions.checkNotNull(strArr);
    }

    public static AuthenticatorAttestationResponse deserializeFromBytes(byte[] serializedBytes) {
        return (AuthenticatorAttestationResponse) SafeParcelableSerializer.deserializeFromBytes(serializedBytes, CREATOR);
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof AuthenticatorAttestationResponse)) {
            return false;
        }
        AuthenticatorAttestationResponse authenticatorAttestationResponse = (AuthenticatorAttestationResponse) obj;
        return Objects.equal(this.zza, authenticatorAttestationResponse.zza) && Objects.equal(this.zzb, authenticatorAttestationResponse.zzb) && Objects.equal(this.zzc, authenticatorAttestationResponse.zzc);
    }

    public byte[] getAttestationObject() {
        return this.zzc.zzm();
    }

    public zzgx getAttestationObjectAsByteString() {
        return this.zzc;
    }

    @Override // com.google.android.gms.fido.fido2.api.common.AuthenticatorResponse
    public byte[] getClientDataJSON() {
        return this.zzb.zzm();
    }

    public zzgx getClientDataJSONAsByteString() {
        return this.zzb;
    }

    @Deprecated
    public byte[] getKeyHandle() {
        return this.zza.zzm();
    }

    public zzgx getKeyHandleAsByteString() {
        return this.zza;
    }

    public String[] getTransports() {
        return this.zzd;
    }

    public int hashCode() {
        return Objects.hashCode(Integer.valueOf(Objects.hashCode(this.zza)), Integer.valueOf(Objects.hashCode(this.zzb)), Integer.valueOf(Objects.hashCode(this.zzc)));
    }

    @Override // com.google.android.gms.fido.fido2.api.common.AuthenticatorResponse
    public byte[] serializeToBytes() {
        return SafeParcelableSerializer.serializeToBytes(this);
    }

    public String toString() {
        zzbi zza = zzbj.zza(this);
        zzgf zzf = zzgf.zzf();
        byte[] keyHandle = getKeyHandle();
        zza.zzb(SignResponseData.JSON_RESPONSE_DATA_KEY_HANDLE, zzf.zzg(keyHandle, 0, keyHandle.length));
        zzgf zzf2 = zzgf.zzf();
        byte[] clientDataJSON = getClientDataJSON();
        zza.zzb("clientDataJSON", zzf2.zzg(clientDataJSON, 0, clientDataJSON.length));
        zzgf zzf3 = zzgf.zzf();
        byte[] attestationObject = getAttestationObject();
        zza.zzb("attestationObject", zzf3.zzg(attestationObject, 0, attestationObject.length));
        zza.zzb("transports", Arrays.toString(this.zzd));
        return zza.toString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int i) {
        int beginObjectHeader = SafeParcelWriter.beginObjectHeader(dest);
        SafeParcelWriter.writeByteArray(dest, 2, getKeyHandle(), false);
        SafeParcelWriter.writeByteArray(dest, 3, getClientDataJSON(), false);
        SafeParcelWriter.writeByteArray(dest, 4, getAttestationObject(), false);
        SafeParcelWriter.writeStringArray(dest, 5, getTransports(), false);
        SafeParcelWriter.finishObjectHeader(dest, beginObjectHeader);
    }

    /* JADX WARN: região duplicada removida para o bloco: B:47:0x01fc A[Catch: JSONException -> 0x0253, TRY_LEAVE, TryCatch #1 {JSONException -> 0x0253, blocks: (B:3:0x0002, B:5:0x000b, B:6:0x0018, B:8:0x001c, B:9:0x0029, B:10:0x0030, B:12:0x0035, B:14:0x0043, B:16:0x0050, B:17:0x0049, B:20:0x0053, B:22:0x005c, B:24:0x0064, B:26:0x0076, B:27:0x007e, B:29:0x0082, B:31:0x0094, B:33:0x00b2, B:34:0x00ca, B:39:0x00f0, B:45:0x01e8, B:47:0x01fc, B:50:0x0110, B:52:0x0122, B:57:0x0139, B:60:0x015b, B:62:0x0171, B:64:0x0177, B:65:0x0193, B:66:0x0198, B:67:0x0199, B:68:0x019e, B:73:0x01a9, B:75:0x01b9, B:77:0x01c7, B:78:0x01dc, B:79:0x01e1, B:80:0x01e2, B:81:0x01e7, B:82:0x0206, B:83:0x020b, B:85:0x020d, B:86:0x0214, B:87:0x0215, B:88:0x021a, B:92:0x021e, B:93:0x0225, B:95:0x0226, B:96:0x022d, B:98:0x022f, B:99:0x0236, B:100:0x0237, B:101:0x023e, B:103:0x0240, B:104:0x0247, B:108:0x024b, B:109:0x0252), top: B:2:0x0002, inners: #3, #5, #6 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final org.json.JSONObject zza() {
        /*
            Method dump skipped, instructions count: 604
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.fido.fido2.api.common.AuthenticatorAttestationResponse.zza():org.json.JSONObject");
    }
}
