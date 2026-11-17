package com.coleta.ambientuus.fragments;

import android.app.DatePickerDialog;
import android.app.Dialog;
import android.content.Context;
import android.os.Bundle;
import android.widget.DatePicker;
import androidx.fragment.app.DialogFragment;
import com.google.android.material.timepicker.TimeModel;
import java.util.Calendar;

/* loaded from: classes12.dex */
public class DatePickerFragment extends DialogFragment implements DatePickerDialog.OnDateSetListener {
    private OnDateSelectedListener listener;

    public interface OnDateSelectedListener {
        void onDateSelected(String str, String str2, String str3);
    }

    @Override // androidx.fragment.app.DialogFragment
    public Dialog onCreateDialog(Bundle savedInstanceState) {
        Calendar c = Calendar.getInstance();
        int year = c.get(1);
        int month = c.get(2);
        int day = c.get(5);
        return new DatePickerDialog(requireContext(), this, year, month, day);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // androidx.fragment.app.DialogFragment, androidx.fragment.app.Fragment
    public void onAttach(Context context) {
        super.onAttach(context);
        if (context instanceof OnDateSelectedListener) {
            this.listener = (OnDateSelectedListener) context;
            return;
        }
        throw new RuntimeException("Erro");
    }

    @Override // android.app.DatePickerDialog.OnDateSetListener
    public void onDateSet(DatePicker datePicker, int year, int month, int day) {
        if (this.listener != null) {
            this.listener.onDateSelected(String.valueOf(year), String.format(TimeModel.ZERO_LEADING_NUMBER_FORMAT, Integer.valueOf(month + 1)), String.format(TimeModel.ZERO_LEADING_NUMBER_FORMAT, Integer.valueOf(day)));
        }
    }
}
