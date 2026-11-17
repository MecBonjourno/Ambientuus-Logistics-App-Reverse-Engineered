package com.coleta.ambientuus.utils;

import android.bluetooth.BluetoothSocket;
import java.io.IOException;
import java.io.InputStream;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/* loaded from: classes5.dex */
public class BluetoothReader {
    private boolean bStop = false;
    private final ExecutorService executor = Executors.newSingleThreadExecutor();
    private final BluetoothSocket mBTSocket;

    public interface OnReadListener {
        void onError(Exception exc);

        void onRead(String str);
    }

    public BluetoothReader(BluetoothSocket socket) {
        this.mBTSocket = socket;
    }

    public void startReading(final OnReadListener listener) {
        this.bStop = false;
        this.executor.execute(new Runnable() { // from class: com.coleta.ambientuus.utils.BluetoothReader$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                BluetoothReader.this.lambda$startReading$0(listener);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$startReading$0(OnReadListener listener) {
        int bytesRead;
        InputStream inputStream = null;
        try {
            try {
                try {
                    inputStream = this.mBTSocket.getInputStream();
                    byte[] buffer = new byte[150];
                    while (!this.bStop && !Thread.currentThread().isInterrupted()) {
                        if (inputStream.available() > 0 && (bytesRead = inputStream.read(buffer)) > 0) {
                            String rawInput = new String(buffer, 0, bytesRead);
                            String cleaned = rawInput.replace(".", ",").replaceAll("[^\\d,]", " ").trim();
                            listener.onRead(cleaned);
                            this.bStop = true;
                        }
                        Thread.sleep(1000L);
                        this.mBTSocket.getOutputStream().write(4);
                    }
                    if (inputStream != null) {
                        inputStream.close();
                    }
                    if (this.mBTSocket != null) {
                        this.mBTSocket.close();
                    }
                } catch (Exception e) {
                    listener.onError(e);
                    if (inputStream != null) {
                        inputStream.close();
                    }
                    if (this.mBTSocket != null) {
                        this.mBTSocket.close();
                    }
                }
            } catch (IOException e2) {
                listener.onError(e2);
            }
        } catch (Throwable th) {
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e3) {
                    listener.onError(e3);
                    throw th;
                }
            }
            if (this.mBTSocket != null) {
                this.mBTSocket.close();
            }
            throw th;
        }
    }

    public void stopReading() {
        this.bStop = true;
        this.executor.shutdownNow();
    }
}
