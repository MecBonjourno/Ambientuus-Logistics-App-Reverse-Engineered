package androidx.appcompat.widget;

import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.content.res.XmlResourceParser;
import android.graphics.Movie;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import java.io.IOException;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import org.xmlpull.v1.XmlPullParserException;

/* carregado de: classes.dex */
public class VectorEnabledTintResources extends ResourcesWrapper {
    public static final int MAX_SDK_WHERE_REQUIRED = 20;
    private static boolean sCompatVectorFromResourcesEnabled = false;
    private final WeakReference<Context> mContextRef;

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ XmlResourceParser getAnimation(int i) throws Resources.NotFoundException {
        return super.getAnimation(i);
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ boolean getBoolean(int i) throws Resources.NotFoundException {
        return super.getBoolean(i);
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ int getColor(int i) throws Resources.NotFoundException {
        return super.getColor(i);
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ ColorStateList getColorStateList(int i) throws Resources.NotFoundException {
        return super.getColorStateList(i);
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ Configuration getConfiguration() {
        return super.getConfiguration();
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ float getDimension(int i) throws Resources.NotFoundException {
        return super.getDimension(i);
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ int getDimensionPixelOffset(int i) throws Resources.NotFoundException {
        return super.getDimensionPixelOffset(i);
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ int getDimensionPixelSize(int i) throws Resources.NotFoundException {
        return super.getDimensionPixelSize(i);
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ DisplayMetrics getDisplayMetrics() {
        return super.getDisplayMetrics();
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ Drawable getDrawable(int i, Resources.Theme theme) throws Resources.NotFoundException {
        return super.getDrawable(i, theme);
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ Drawable getDrawableForDensity(int i, int i2) throws Resources.NotFoundException {
        return super.getDrawableForDensity(i, i2);
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ Drawable getDrawableForDensity(int i, int i2, Resources.Theme theme) {
        return super.getDrawableForDensity(i, i2, theme);
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ float getFraction(int i, int i2, int i3) {
        return super.getFraction(i, i2, i3);
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ int getIdentifier(String str, String str2, String str3) {
        return super.getIdentifier(str, str2, str3);
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ int[] getIntArray(int i) throws Resources.NotFoundException {
        return super.getIntArray(i);
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ int getInteger(int i) throws Resources.NotFoundException {
        return super.getInteger(i);
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ XmlResourceParser getLayout(int i) throws Resources.NotFoundException {
        return super.getLayout(i);
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ Movie getMovie(int i) throws Resources.NotFoundException {
        return super.getMovie(i);
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ String getQuantityString(int i, int i2) throws Resources.NotFoundException {
        return super.getQuantityString(i, i2);
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ String getQuantityString(int i, int i2, Object[] objArr) throws Resources.NotFoundException {
        return super.getQuantityString(i, i2, objArr);
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ CharSequence getQuantityText(int i, int i2) throws Resources.NotFoundException {
        return super.getQuantityText(i, i2);
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ String getResourceEntryName(int i) throws Resources.NotFoundException {
        return super.getResourceEntryName(i);
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ String getResourceName(int i) throws Resources.NotFoundException {
        return super.getResourceName(i);
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ String getResourcePackageName(int i) throws Resources.NotFoundException {
        return super.getResourcePackageName(i);
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ String getResourceTypeName(int i) throws Resources.NotFoundException {
        return super.getResourceTypeName(i);
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ String getString(int i) throws Resources.NotFoundException {
        return super.getString(i);
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ String getString(int i, Object[] objArr) throws Resources.NotFoundException {
        return super.getString(i, objArr);
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ String[] getStringArray(int i) throws Resources.NotFoundException {
        return super.getStringArray(i);
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ CharSequence getText(int i) throws Resources.NotFoundException {
        return super.getText(i);
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ CharSequence getText(int i, CharSequence charSequence) {
        return super.getText(i, charSequence);
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ CharSequence[] getTextArray(int i) throws Resources.NotFoundException {
        return super.getTextArray(i);
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ void getValue(int i, TypedValue typedValue, boolean z) throws Resources.NotFoundException {
        super.getValue(i, typedValue, z);
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ void getValue(String str, TypedValue typedValue, boolean z) throws Resources.NotFoundException {
        super.getValue(str, typedValue, z);
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ void getValueForDensity(int i, int i2, TypedValue typedValue, boolean z) throws Resources.NotFoundException {
        super.getValueForDensity(i, i2, typedValue, z);
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ XmlResourceParser getXml(int i) throws Resources.NotFoundException {
        return super.getXml(i);
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ TypedArray obtainAttributes(AttributeSet attributeSet, int[] iArr) {
        return super.obtainAttributes(attributeSet, iArr);
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ TypedArray obtainTypedArray(int i) throws Resources.NotFoundException {
        return super.obtainTypedArray(i);
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ InputStream openRawResource(int i) throws Resources.NotFoundException {
        return super.openRawResource(i);
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ InputStream openRawResource(int i, TypedValue typedValue) throws Resources.NotFoundException {
        return super.openRawResource(i, typedValue);
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ AssetFileDescriptor openRawResourceFd(int i) throws Resources.NotFoundException {
        return super.openRawResourceFd(i);
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ void parseBundleExtra(String str, AttributeSet attributeSet, Bundle bundle) throws XmlPullParserException {
        super.parseBundleExtra(str, attributeSet, bundle);
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ void parseBundleExtras(XmlResourceParser xmlResourceParser, Bundle bundle) throws XmlPullParserException, IOException {
        super.parseBundleExtras(xmlResourceParser, bundle);
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public /* bridge */ /* sintético */ void updateConfiguration(Configuration configuration, DisplayMetrics displayMetrics) {
        super.updateConfiguration(configuration, displayMetrics);
    }

    public static boolean shouldBeUsed() {
        isCompatVectorFromResourcesEnabled();
        return false;
    }

    public VectorEnabledTintResources(Context context, Resources res) {
        super(res);
        this.mContextRef = new WeakReference<>(context);
    }

    @Override // androidx.appcompat.widget.ResourcesWrapper, android.content.res.Resources
    public Drawable getDrawable(int id) throws Resources.NotFoundException {
        Context context = this.mContextRef.get();
        if (context != null) {
            return ResourceManagerInternal.get().onDrawableLoadedFromResources(context, this, id);
        }
        return getDrawableCanonical(id);
    }

    public static void setCompatVectorFromResourcesEnabled(boolean enabled) {
        sCompatVectorFromResourcesEnabled = enabled;
    }

    public static boolean isCompatVectorFromResourcesEnabled() {
        return sCompatVectorFromResourcesEnabled;
    }
}
