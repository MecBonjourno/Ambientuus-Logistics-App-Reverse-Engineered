package com.google.android.material.transition;

import android.animation.Animator;
import android.view.View;
import android.view.ViewGroup;
import androidx.transition.TransitionValues;

/* carregado de: classes16.dex */
public final class MaterialElevationScale extends MaterialVisibility<ScaleProvider> {
    private static final float DEFAULT_SCALE = 0.85f;
    private final boolean growing;

    @Override // com.google.android.material.transition.MaterialVisibility
    public /* bridge */ /* sintético */ void addAdditionalAnimatorProvider(VisibilityAnimatorProvider visibilityAnimatorProvider) {
        super.addAdditionalAnimatorProvider(visibilityAnimatorProvider);
    }

    @Override // com.google.android.material.transition.MaterialVisibility
    public /* bridge */ /* sintético */ void clearAdditionalAnimatorProvider() {
        super.clearAdditionalAnimatorProvider();
    }

    /* JADX WARN: falha na inferência de tipo para: r0v0, types: [com.google.android.material.transition.ScaleProvider, com.google.android.material.transition.VisibilityAnimatorProvider] */
    @Override // com.google.android.material.transition.MaterialVisibility
    public /* bridge */ /* sintético */ ScaleProvider getPrimaryAnimatorProvider() {
        return super.getPrimaryAnimatorProvider();
    }

    @Override // com.google.android.material.transition.MaterialVisibility
    public /* bridge */ /* sintético */ VisibilityAnimatorProvider getSecondaryAnimatorProvider() {
        return super.getSecondaryAnimatorProvider();
    }

    @Override // com.google.android.material.transition.MaterialVisibility, androidx.transition.Transition
    public /* bridge */ /* sintético */ boolean isSeekingSupported() {
        return super.isSeekingSupported();
    }

    @Override // com.google.android.material.transition.MaterialVisibility, androidx.transition.Visibility
    public /* bridge */ /* sintético */ Animator onAppear(ViewGroup viewGroup, View view, TransitionValues transitionValues, TransitionValues transitionValues2) {
        return super.onAppear(viewGroup, view, transitionValues, transitionValues2);
    }

    @Override // com.google.android.material.transition.MaterialVisibility, androidx.transition.Visibility
    public /* bridge */ /* sintético */ Animator onDisappear(ViewGroup viewGroup, View view, TransitionValues transitionValues, TransitionValues transitionValues2) {
        return super.onDisappear(viewGroup, view, transitionValues, transitionValues2);
    }

    @Override // com.google.android.material.transition.MaterialVisibility
    public /* bridge */ /* sintético */ boolean removeAdditionalAnimatorProvider(VisibilityAnimatorProvider visibilityAnimatorProvider) {
        return super.removeAdditionalAnimatorProvider(visibilityAnimatorProvider);
    }

    @Override // com.google.android.material.transition.MaterialVisibility
    public /* bridge */ /* sintético */ void setSecondaryAnimatorProvider(VisibilityAnimatorProvider visibilityAnimatorProvider) {
        super.setSecondaryAnimatorProvider(visibilityAnimatorProvider);
    }

    public MaterialElevationScale(boolean growing) {
        super(createPrimaryAnimatorProvider(growing), createSecondaryAnimatorProvider());
        this.growing = growing;
    }

    public boolean isGrowing() {
        return this.growing;
    }

    private static ScaleProvider createPrimaryAnimatorProvider(boolean growing) {
        ScaleProvider scaleProvider = new ScaleProvider(growing);
        scaleProvider.setOutgoingEndScale(DEFAULT_SCALE);
        scaleProvider.setIncomingStartScale(DEFAULT_SCALE);
        return scaleProvider;
    }

    private static VisibilityAnimatorProvider createSecondaryAnimatorProvider() {
        return new FadeProvider();
    }
}
