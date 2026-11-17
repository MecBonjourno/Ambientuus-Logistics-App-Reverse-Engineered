package com.coleta.ambientuus.ui;

import android.app.Activity;
import android.app.AlertDialog;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.coleta.ambientuus.R;

/* loaded from: classes7.dex */
public class ProgressDialogHelper {
    private AlertDialog dialog;
    private TextView messageText;

    public void showProgress(Activity activity, String title, String message) {
        AlertDialog.Builder builder = new AlertDialog.Builder(activity);
        LayoutInflater inflater = activity.getLayoutInflater();
        View dialogView = inflater.inflate(R.layout.progress_dialog, (ViewGroup) null);
        this.messageText = (TextView) dialogView.findViewById(R.id.progress_message);
        this.messageText.setText(message);
        builder.setTitle(title).setView(dialogView).setCancelable(false);
        this.dialog = builder.create();
        this.dialog.show();
    }

    public void updateMessage(String newMessage) {
        if (this.messageText != null) {
            this.messageText.setText(newMessage);
        }
    }

    public void dismissProgress() {
        if (this.dialog != null && this.dialog.isShowing()) {
            this.dialog.dismiss();
        }
    }
}
