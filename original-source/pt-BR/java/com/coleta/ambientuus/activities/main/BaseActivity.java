package com.coleta.ambientuus.activities.main;

import android.graphics.Rect;
import android.os.Bundle;
import android.view.MotionEvent;
import android.view.View;
import android.view.Window;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.app.AppCompatDelegate;
import androidx.core.view.ViewCompat;
import androidx.core.view.accessibility.AccessibilityEventCompat;

/* carregado de: classes13.dex */
public class BaseActivity extends AppCompatActivity {
    public static final String ARQUIVO_PREFERENCIA = "ArquivoPreferencia";

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        AppCompatDelegate.setDefaultNightMode(1);
        Window window = getWindow();
        window.clearFlags(AccessibilityEventCompat.TYPE_VIEW_TARGETED_BY_SCROLL);
        window.addFlags(Integer.MIN_VALUE);
        window.setStatusBarColor(ViewCompat.MEASURED_STATE_MASK);
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public boolean dispatchTouchEvent(MotionEvent ev) {
        if (ev.getAction() == 0) {
            View view = getCurrentFocus();
            if (view instanceof EditText) {
                Rect outRect = new Rect();
                view.getGlobalVisibleRect(outRect);
                if (!outRect.contains((int) ev.getRawX(), (int) ev.getRawY())) {
                    view.clearFocus();
                    InputMethodManager imm = (InputMethodManager) getSystemService("input_method");
                    if (imm != null) {
                        imm.hideSoftInputFromWindow(view.getWindowToken(), 0);
                    }
                }
            }
        }
        return super.dispatchTouchEvent(ev);
    }
}
