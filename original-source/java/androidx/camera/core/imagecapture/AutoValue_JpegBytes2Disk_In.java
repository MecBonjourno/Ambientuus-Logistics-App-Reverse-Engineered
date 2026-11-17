package androidx.camera.core.imagecapture;

import androidx.camera.core.ImageCapture;
import androidx.camera.core.imagecapture.JpegBytes2Disk;
import androidx.camera.core.processing.Packet;

/* loaded from: classes.dex */
final class AutoValue_JpegBytes2Disk_In extends JpegBytes2Disk.In {
    private final ImageCapture.OutputFileOptions outputFileOptions;
    private final Packet<byte[]> packet;

    AutoValue_JpegBytes2Disk_In(Packet<byte[]> packet, ImageCapture.OutputFileOptions outputFileOptions) {
        if (packet == null) {
            throw new NullPointerException("Null packet");
        }
        this.packet = packet;
        if (outputFileOptions == null) {
            throw new NullPointerException("Null outputFileOptions");
        }
        this.outputFileOptions = outputFileOptions;
    }

    @Override // androidx.camera.core.imagecapture.JpegBytes2Disk.In
    Packet<byte[]> getPacket() {
        return this.packet;
    }

    @Override // androidx.camera.core.imagecapture.JpegBytes2Disk.In
    ImageCapture.OutputFileOptions getOutputFileOptions() {
        return this.outputFileOptions;
    }

    public String toString() {
        return "In{packet=" + this.packet + ", outputFileOptions=" + this.outputFileOptions + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof JpegBytes2Disk.In)) {
            return false;
        }
        JpegBytes2Disk.In that = (JpegBytes2Disk.In) o;
        return this.packet.equals(that.getPacket()) && this.outputFileOptions.equals(that.getOutputFileOptions());
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((h$ ^ this.packet.hashCode()) * 1000003) ^ this.outputFileOptions.hashCode();
    }
}
