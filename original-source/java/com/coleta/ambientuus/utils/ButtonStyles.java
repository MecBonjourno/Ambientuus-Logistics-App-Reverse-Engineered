package com.coleta.ambientuus.utils;

import android.content.Context;
import android.graphics.Typeface;
import android.util.TypedValue;
import android.view.ViewGroup;
import android.widget.Button;
import androidx.core.content.ContextCompat;
import androidx.core.content.res.ResourcesCompat;
import com.coleta.ambientuus.R;
import com.google.android.material.button.MaterialButton;

/* loaded from: classes5.dex */
public class ButtonStyles {
    public static void aplicarEstiloFullWidthColoredButton(Button buttonB, Context context) {
        MaterialButton button = (MaterialButton) buttonB;
        button.setBackgroundTintList(ContextCompat.getColorStateList(context, R.color.verde_ambietuus));
        button.setTextColor(ContextCompat.getColor(context, R.color.white));
        button.setIconTintResource(R.color.white);
        int radius = context.getResources().getDimensionPixelSize(R.dimen.borderRadiusDefault);
        button.setCornerRadius(radius);
        Typeface typeface = ResourcesCompat.getFont(context, R.font.montserrat_semibold);
        button.setTypeface(typeface);
    }

    public static void aplicarEstiloFullWidthColoredButtonDisabled(Button buttonB, Context context) {
        MaterialButton button = (MaterialButton) buttonB;
        button.setBackgroundTintList(ContextCompat.getColorStateList(context, com.google.android.material.R.color.material_dynamic_neutral90));
        button.setTextColor(ContextCompat.getColor(context, com.google.android.material.R.color.material_dynamic_neutral60));
        button.setIconTintResource(com.google.android.material.R.color.material_dynamic_neutral60);
        int radius = context.getResources().getDimensionPixelSize(R.dimen.borderRadiusDefault);
        button.setCornerRadius(radius);
        Typeface typeface = ResourcesCompat.getFont(context, R.font.montserrat_semibold);
        button.setTypeface(typeface);
    }

    private static void setLayoutParams(MaterialButton button, Context context, int heightDp) {
        ViewGroup.MarginLayoutParams params = new ViewGroup.MarginLayoutParams(-1, dpToPx(heightDp, context));
        int margin = dpToPx(4, context);
        params.setMargins(margin, margin, margin, margin);
        button.setLayoutParams(params);
    }

    private static int dpToPx(int dp, Context context) {
        return (int) TypedValue.applyDimension(1, dp, context.getResources().getDisplayMetrics());
    }
}
