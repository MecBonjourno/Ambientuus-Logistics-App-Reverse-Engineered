package com.google.android.material.color.utilities;

import androidx.camera.video.AudioStats;
import j$.util.function.Function$CC;
import java.util.function.Function;

/* carregado de: classes16.dex */
public final class MaterialDynamicColors {
    private final boolean isExtendedFidelity;

    public MaterialDynamicColors() {
        this.isExtendedFidelity = false;
    }

    public MaterialDynamicColors(boolean isExtendedFidelity) {
        this.isExtendedFidelity = isExtendedFidelity;
    }

    public DynamicColor highestSurface(DynamicScheme s) {
        return s.isDark ? surfaceBright() : surfaceDim();
    }

    public DynamicColor primaryPaletteKeyColor() {
        return DynamicColor.fromPalette("primary_palette_key_color", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda72
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).primaryPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda73
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(((DynamicScheme) obj).primaryPalette.getKeyColor().getTone());
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        });
    }

    public DynamicColor secondaryPaletteKeyColor() {
        return DynamicColor.fromPalette("secondary_palette_key_color", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda79
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).secondaryPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda80
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(((DynamicScheme) obj).secondaryPalette.getKeyColor().getTone());
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        });
    }

    public DynamicColor tertiaryPaletteKeyColor() {
        return DynamicColor.fromPalette("tertiary_palette_key_color", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda91
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).tertiaryPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda92
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(((DynamicScheme) obj).tertiaryPalette.getKeyColor().getTone());
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        });
    }

    public DynamicColor neutralPaletteKeyColor() {
        return DynamicColor.fromPalette("neutral_palette_key_color", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda11
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).neutralPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda22
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(((DynamicScheme) obj).neutralPalette.getKeyColor().getTone());
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        });
    }

    public DynamicColor neutralVariantPaletteKeyColor() {
        return DynamicColor.fromPalette("neutral_variant_palette_key_color", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda144
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).neutralVariantPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda145
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(((DynamicScheme) obj).neutralVariantPalette.getKeyColor().getTone());
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        });
    }

    public DynamicColor background() {
        return new DynamicColor("background", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda100
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).neutralPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda101
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(s.isDark ? 6.0d : 98.0d);
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, true, null, null, null, null);
    }

    public DynamicColor onBackground() {
        return new DynamicColor("on_background", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda104
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).neutralPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda105
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(s.isDark ? 90.0d : 10.0d);
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, false, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda106
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m674x24678954((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, null, new ContrastCurve(3.0d, 3.0d, 4.5d, 7.0d), null);
    }

    /* renomeado de: lambda$onBackground$14$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ DynamicColor m674x24678954(DynamicScheme s) {
        return background();
    }

    public DynamicColor surface() {
        return new DynamicColor("surface", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda0
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).neutralPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda74
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(s.isDark ? 6.0d : 98.0d);
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, true, null, null, null, null);
    }

    public DynamicColor surfaceDim() {
        return new DynamicColor("surface_dim", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda33
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).neutralPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda44
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(s.isDark ? 6.0d : new ContrastCurve(87.0d, 87.0d, 80.0d, 75.0d).get(((DynamicScheme) obj).contrastLevel));
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, true, null, null, null, null);
    }

    public DynamicColor surfaceBright() {
        return new DynamicColor("surface_bright", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda110
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).neutralPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda111
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(s.isDark ? new ContrastCurve(24.0d, 24.0d, 29.0d, 34.0d).get(((DynamicScheme) obj).contrastLevel) : 98.0d);
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, true, null, null, null, null);
    }

    public DynamicColor surfaceContainerLowest() {
        return new DynamicColor("surface_container_lowest", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda7
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).neutralPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda8
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(s.isDark ? new ContrastCurve(4.0d, 4.0d, 2.0d, AudioStats.AUDIO_AMPLITUDE_NONE).get(((DynamicScheme) obj).contrastLevel) : 100.0d);
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, true, null, null, null, null);
    }

    public DynamicColor surfaceContainerLow() {
        return new DynamicColor("surface_container_low", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda81
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).neutralPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda82
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.lambda$surfaceContainerLow$24((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, true, null, null, null, null);
    }

    static /* sintético */ Double lambda$surfaceContainerLow$24(DynamicScheme s) {
        double d;
        if (s.isDark) {
            d = new ContrastCurve(10.0d, 10.0d, 11.0d, 12.0d).get(s.contrastLevel);
        } else {
            d = new ContrastCurve(96.0d, 96.0d, 96.0d, 95.0d).get(s.contrastLevel);
        }
        return Double.valueOf(d);
    }

    public DynamicColor surfaceContainer() {
        return new DynamicColor("surface_container", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda38
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).neutralPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda39
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.lambda$surfaceContainer$26((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, true, null, null, null, null);
    }

    static /* sintético */ Double lambda$surfaceContainer$26(DynamicScheme s) {
        double d;
        if (s.isDark) {
            d = new ContrastCurve(12.0d, 12.0d, 16.0d, 20.0d).get(s.contrastLevel);
        } else {
            d = new ContrastCurve(94.0d, 94.0d, 92.0d, 90.0d).get(s.contrastLevel);
        }
        return Double.valueOf(d);
    }

    public DynamicColor surfaceContainerHigh() {
        return new DynamicColor("surface_container_high", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda102
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).neutralPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda103
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.lambda$surfaceContainerHigh$28((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, true, null, null, null, null);
    }

    static /* sintético */ Double lambda$surfaceContainerHigh$28(DynamicScheme s) {
        double d;
        if (s.isDark) {
            d = new ContrastCurve(17.0d, 17.0d, 21.0d, 25.0d).get(s.contrastLevel);
        } else {
            d = new ContrastCurve(92.0d, 92.0d, 88.0d, 85.0d).get(s.contrastLevel);
        }
        return Double.valueOf(d);
    }

    public DynamicColor surfaceContainerHighest() {
        return new DynamicColor("surface_container_highest", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda150
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).neutralPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda152
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.lambda$surfaceContainerHighest$30((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, true, null, null, null, null);
    }

    static /* sintético */ Double lambda$surfaceContainerHighest$30(DynamicScheme s) {
        double d;
        if (s.isDark) {
            d = new ContrastCurve(22.0d, 22.0d, 26.0d, 30.0d).get(s.contrastLevel);
        } else {
            d = new ContrastCurve(90.0d, 90.0d, 84.0d, 80.0d).get(s.contrastLevel);
        }
        return Double.valueOf(d);
    }

    public DynamicColor onSurface() {
        return new DynamicColor("on_surface", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda140
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).neutralPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda151
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(s.isDark ? 90.0d : 10.0d);
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, false, new MaterialDynamicColors$$ExternalSyntheticLambda162(this), null, new ContrastCurve(4.5d, 7.0d, 11.0d, 21.0d), null);
    }

    public DynamicColor surfaceVariant() {
        return new DynamicColor("surface_variant", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda142
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).neutralVariantPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda143
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(s.isDark ? 30.0d : 90.0d);
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, true, null, null, null, null);
    }

    public DynamicColor onSurfaceVariant() {
        return new DynamicColor("on_surface_variant", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda40
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).neutralVariantPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda41
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(s.isDark ? 80.0d : 30.0d);
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, false, new MaterialDynamicColors$$ExternalSyntheticLambda162(this), null, new ContrastCurve(3.0d, 4.5d, 7.0d, 11.0d), null);
    }

    public DynamicColor inverseSurface() {
        return new DynamicColor("inverse_surface", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda42
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).neutralPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda43
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(s.isDark ? 90.0d : 20.0d);
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, false, null, null, null, null);
    }

    public DynamicColor inverseOnSurface() {
        return new DynamicColor("inverse_on_surface", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda18
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).neutralPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda19
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(s.isDark ? 20.0d : 95.0d);
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, false, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda20
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m672xcbcaf83d((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, null, new ContrastCurve(4.5d, 7.0d, 11.0d, 21.0d), null);
    }

    /* renomeado de: lambda$inverseOnSurface$41$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ DynamicColor m672xcbcaf83d(DynamicScheme s) {
        return inverseSurface();
    }

    public DynamicColor outline() {
        return new DynamicColor("outline", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda9
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).neutralVariantPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda10
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(s.isDark ? 60.0d : 50.0d);
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, false, new MaterialDynamicColors$$ExternalSyntheticLambda162(this), null, new ContrastCurve(1.5d, 3.0d, 4.5d, 7.0d), null);
    }

    public DynamicColor outlineVariant() {
        return new DynamicColor("outline_variant", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda108
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).neutralVariantPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda109
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(s.isDark ? 30.0d : 80.0d);
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, false, new MaterialDynamicColors$$ExternalSyntheticLambda162(this), null, new ContrastCurve(1.0d, 1.0d, 3.0d, 4.5d), null);
    }

    public DynamicColor shadow() {
        return new DynamicColor("shadow", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda148
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).neutralPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda149
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(AudioStats.AUDIO_AMPLITUDE_NONE);
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, false, null, null, null, null);
    }

    public DynamicColor scrim() {
        return new DynamicColor("scrim", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda60
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).neutralPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda61
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(AudioStats.AUDIO_AMPLITUDE_NONE);
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, false, null, null, null, null);
    }

    public DynamicColor surfaceTint() {
        return new DynamicColor("surface_tint", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda12
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).primaryPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda13
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(s.isDark ? 80.0d : 40.0d);
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, true, null, null, null, null);
    }

    public DynamicColor primary() {
        return new DynamicColor("primary", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda57
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).primaryPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda58
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.lambda$primary$53((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, true, new MaterialDynamicColors$$ExternalSyntheticLambda162(this), null, new ContrastCurve(3.0d, 4.5d, 7.0d, 7.0d), new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda59
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m698x39203b5((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        });
    }

    static /* sintético */ Double lambda$primary$53(DynamicScheme s) {
        if (isMonochrome(s)) {
            return Double.valueOf(s.isDark ? 100.0d : AudioStats.AUDIO_AMPLITUDE_NONE);
        }
        return Double.valueOf(s.isDark ? 80.0d : 40.0d);
    }

    /* renomeado de: lambda$primary$54$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ ToneDeltaPair m698x39203b5(DynamicScheme s) {
        return new ToneDeltaPair(primaryContainer(), primary(), 10.0d, TonePolarity.NEARER, false);
    }

    public DynamicColor onPrimary() {
        return new DynamicColor("on_primary", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda112
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).primaryPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda113
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.lambda$onPrimary$56((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, false, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda114
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m677x16f20f37((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, null, new ContrastCurve(4.5d, 7.0d, 11.0d, 21.0d), null);
    }

    static /* sintético */ Double lambda$onPrimary$56(DynamicScheme s) {
        if (isMonochrome(s)) {
            return Double.valueOf(s.isDark ? 10.0d : 90.0d);
        }
        return Double.valueOf(s.isDark ? 20.0d : 100.0d);
    }

    /* renomeado de: lambda$onPrimary$57$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ DynamicColor m677x16f20f37(DynamicScheme s) {
        return primary();
    }

    public DynamicColor primaryContainer() {
        return new DynamicColor("primary_container", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda97
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).primaryPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda98
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m699x9fd70f23((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, true, new MaterialDynamicColors$$ExternalSyntheticLambda162(this), null, new ContrastCurve(1.0d, 1.0d, 3.0d, 4.5d), new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda99
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m700x8277b1b9((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        });
    }

    /* renomeado de: lambda$primaryContainer$59$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ Double m699x9fd70f23(DynamicScheme s) {
        if (isFidelity(s)) {
            return Double.valueOf(s.sourceColorHct.getTone());
        }
        if (isMonochrome(s)) {
            return Double.valueOf(s.isDark ? 85.0d : 25.0d);
        }
        return Double.valueOf(s.isDark ? 30.0d : 90.0d);
    }

    /* renomeado de: lambda$primaryContainer$60$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ ToneDeltaPair m700x8277b1b9(DynamicScheme s) {
        return new ToneDeltaPair(primaryContainer(), primary(), 10.0d, TonePolarity.NEARER, false);
    }

    public DynamicColor onPrimaryContainer() {
        return new DynamicColor("on_primary_container", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda135
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).primaryPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda136
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m678x617ce7dc((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, false, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda137
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m679x3d3e639d((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, null, new ContrastCurve(3.0d, 4.5d, 7.0d, 11.0d), null);
    }

    /* renomeado de: lambda$onPrimaryContainer$62$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ Double m678x617ce7dc(DynamicScheme s) {
        if (isFidelity(s)) {
            return Double.valueOf(DynamicColor.foregroundTone(primaryContainer().tone.apply(s).doubleValue(), 4.5d));
        }
        if (isMonochrome(s)) {
            return Double.valueOf(s.isDark ? AudioStats.AUDIO_AMPLITUDE_NONE : 100.0d);
        }
        return Double.valueOf(s.isDark ? 90.0d : 30.0d);
    }

    /* renomeado de: lambda$onPrimaryContainer$63$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ DynamicColor m679x3d3e639d(DynamicScheme s) {
        return primaryContainer();
    }

    public DynamicColor inversePrimary() {
        return new DynamicColor("inverse_primary", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda115
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).primaryPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda116
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(s.isDark ? 40.0d : 80.0d);
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, false, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda117
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m673x6f94cccc((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, null, new ContrastCurve(3.0d, 4.5d, 7.0d, 7.0d), null);
    }

    /* renomeado de: lambda$inversePrimary$66$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ DynamicColor m673x6f94cccc(DynamicScheme s) {
        return inverseSurface();
    }

    public DynamicColor secondary() {
        return new DynamicColor("secondary", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda4
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).secondaryPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda5
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(s.isDark ? 80.0d : 40.0d);
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, true, new MaterialDynamicColors$$ExternalSyntheticLambda162(this), null, new ContrastCurve(3.0d, 4.5d, 7.0d, 7.0d), new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda6
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m703x991d7367((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        });
    }

    /* renomeado de: lambda$secondary$69$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ ToneDeltaPair m703x991d7367(DynamicScheme s) {
        return new ToneDeltaPair(secondaryContainer(), secondary(), 10.0d, TonePolarity.NEARER, false);
    }

    public DynamicColor onSecondary() {
        return new DynamicColor("on_secondary", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda1
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).secondaryPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda2
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.lambda$onSecondary$71((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, false, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda3
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m684x1ad791fe((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, null, new ContrastCurve(4.5d, 7.0d, 11.0d, 21.0d), null);
    }

    static /* sintético */ Double lambda$onSecondary$71(DynamicScheme s) {
        if (isMonochrome(s)) {
            return Double.valueOf(s.isDark ? 10.0d : 100.0d);
        }
        return Double.valueOf(s.isDark ? 20.0d : 100.0d);
    }

    /* renomeado de: lambda$onSecondary$72$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ DynamicColor m684x1ad791fe(DynamicScheme s) {
        return secondary();
    }

    public DynamicColor secondaryContainer() {
        return new DynamicColor("secondary_container", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda83
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).secondaryPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda84
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m704x6c9b544e((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, true, new MaterialDynamicColors$$ExternalSyntheticLambda162(this), null, new ContrastCurve(1.0d, 1.0d, 3.0d, 4.5d), new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda86
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m705x485cd00f((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        });
    }

    /* renomeado de: lambda$secondaryContainer$74$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ Double m704x6c9b544e(DynamicScheme s) {
        double initialTone = s.isDark ? 30.0d : 90.0d;
        if (isMonochrome(s)) {
            return Double.valueOf(s.isDark ? 30.0d : 85.0d);
        }
        if (!isFidelity(s)) {
            return Double.valueOf(initialTone);
        }
        return Double.valueOf(findDesiredChromaByTone(s.secondaryPalette.getHue(), s.secondaryPalette.getChroma(), initialTone, !s.isDark));
    }

    /* renomeado de: lambda$secondaryContainer$75$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ ToneDeltaPair m705x485cd00f(DynamicScheme s) {
        return new ToneDeltaPair(secondaryContainer(), secondary(), 10.0d, TonePolarity.NEARER, false);
    }

    public DynamicColor onSecondaryContainer() {
        return new DynamicColor("on_secondary_container", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda25
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).secondaryPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda26
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m685x4fcce1f2((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, false, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda27
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m686x2b8e5db3((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, null, new ContrastCurve(3.0d, 4.5d, 7.0d, 11.0d), null);
    }

    /* renomeado de: lambda$onSecondaryContainer$77$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ Double m685x4fcce1f2(DynamicScheme s) {
        if (isMonochrome(s)) {
            return Double.valueOf(s.isDark ? 90.0d : 10.0d);
        }
        if (isFidelity(s)) {
            return Double.valueOf(DynamicColor.foregroundTone(secondaryContainer().tone.apply(s).doubleValue(), 4.5d));
        }
        return Double.valueOf(s.isDark ? 90.0d : 30.0d);
    }

    /* renomeado de: lambda$onSecondaryContainer$78$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ DynamicColor m686x2b8e5db3(DynamicScheme s) {
        return secondaryContainer();
    }

    public DynamicColor tertiary() {
        return new DynamicColor("tertiary", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda67
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).tertiaryPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda68
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.lambda$tertiary$80((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, true, new MaterialDynamicColors$$ExternalSyntheticLambda162(this), null, new ContrastCurve(3.0d, 4.5d, 7.0d, 7.0d), new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda69
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m708x1f6aa165((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        });
    }

    static /* sintético */ Double lambda$tertiary$80(DynamicScheme s) {
        if (isMonochrome(s)) {
            return Double.valueOf(s.isDark ? 90.0d : 25.0d);
        }
        return Double.valueOf(s.isDark ? 80.0d : 40.0d);
    }

    /* renomeado de: lambda$tertiary$81$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ ToneDeltaPair m708x1f6aa165(DynamicScheme s) {
        return new ToneDeltaPair(tertiaryContainer(), tertiary(), 10.0d, TonePolarity.NEARER, false);
    }

    public DynamicColor onTertiary() {
        return new DynamicColor("on_tertiary", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda107
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).tertiaryPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda118
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.lambda$onTertiary$83((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, false, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda129
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m691x36068449((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, null, new ContrastCurve(4.5d, 7.0d, 11.0d, 21.0d), null);
    }

    static /* sintético */ Double lambda$onTertiary$83(DynamicScheme s) {
        if (isMonochrome(s)) {
            return Double.valueOf(s.isDark ? 10.0d : 90.0d);
        }
        return Double.valueOf(s.isDark ? 20.0d : 100.0d);
    }

    /* renomeado de: lambda$onTertiary$84$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ DynamicColor m691x36068449(DynamicScheme s) {
        return tertiary();
    }

    public DynamicColor tertiaryContainer() {
        return new DynamicColor("tertiary_container", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda159
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).tertiaryPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda160
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m709x59bc65e7((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, true, new MaterialDynamicColors$$ExternalSyntheticLambda162(this), null, new ContrastCurve(1.0d, 1.0d, 3.0d, 4.5d), new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda161
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m710x357de1a8((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        });
    }

    /* renomeado de: lambda$tertiaryContainer$86$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ Double m709x59bc65e7(DynamicScheme s) {
        if (isMonochrome(s)) {
            return Double.valueOf(s.isDark ? 60.0d : 49.0d);
        }
        if (!isFidelity(s)) {
            return Double.valueOf(s.isDark ? 30.0d : 90.0d);
        }
        Hct proposedHct = s.tertiaryPalette.getHct(s.sourceColorHct.getTone());
        return Double.valueOf(DislikeAnalyzer.fixIfDisliked(proposedHct).getTone());
    }

    /* renomeado de: lambda$tertiaryContainer$87$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ ToneDeltaPair m710x357de1a8(DynamicScheme s) {
        return new ToneDeltaPair(tertiaryContainer(), tertiary(), 10.0d, TonePolarity.NEARER, false);
    }

    public DynamicColor onTertiaryContainer() {
        return new DynamicColor("on_tertiary_container", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda21
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).tertiaryPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda23
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m692xb5c66ea9((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, false, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda24
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m693x9867113f((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, null, new ContrastCurve(3.0d, 4.5d, 7.0d, 11.0d), null);
    }

    /* renomeado de: lambda$onTertiaryContainer$89$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ Double m692xb5c66ea9(DynamicScheme s) {
        if (isMonochrome(s)) {
            return Double.valueOf(s.isDark ? AudioStats.AUDIO_AMPLITUDE_NONE : 100.0d);
        }
        if (isFidelity(s)) {
            return Double.valueOf(DynamicColor.foregroundTone(tertiaryContainer().tone.apply(s).doubleValue(), 4.5d));
        }
        return Double.valueOf(s.isDark ? 90.0d : 30.0d);
    }

    /* renomeado de: lambda$onTertiaryContainer$90$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ DynamicColor m693x9867113f(DynamicScheme s) {
        return tertiaryContainer();
    }

    public DynamicColor error() {
        return new DynamicColor("error", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda32
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).errorPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda34
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(s.isDark ? 80.0d : 40.0d);
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, true, new MaterialDynamicColors$$ExternalSyntheticLambda162(this), null, new ContrastCurve(3.0d, 4.5d, 7.0d, 7.0d), new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda35
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m670x590ec46a((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        });
    }

    /* renomeado de: lambda$error$93$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ ToneDeltaPair m670x590ec46a(DynamicScheme s) {
        return new ToneDeltaPair(errorContainer(), error(), 10.0d, TonePolarity.NEARER, false);
    }

    public DynamicColor onError() {
        return new DynamicColor("on_error", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda130
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).errorPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda131
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(s.isDark ? 20.0d : 100.0d);
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, false, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda132
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m675xb6a5d3ac((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, null, new ContrastCurve(4.5d, 7.0d, 11.0d, 21.0d), null);
    }

    /* renomeado de: lambda$onError$96$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ DynamicColor m675xb6a5d3ac(DynamicScheme s) {
        return error();
    }

    public DynamicColor errorContainer() {
        return new DynamicColor("error_container", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda50
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).errorPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda51
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(s.isDark ? 30.0d : 90.0d);
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, true, new MaterialDynamicColors$$ExternalSyntheticLambda162(this), null, new ContrastCurve(1.0d, 1.0d, 3.0d, 4.5d), new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda52
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m671x33346ee5((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        });
    }

    /* renomeado de: lambda$errorContainer$99$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ ToneDeltaPair m671x33346ee5(DynamicScheme s) {
        return new ToneDeltaPair(errorContainer(), error(), 10.0d, TonePolarity.NEARER, false);
    }

    public DynamicColor onErrorContainer() {
        return new DynamicColor("on_error_container", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda45
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).errorPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda46
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.lambda$onErrorContainer$101((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, false, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda47
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m676x2dffdbdb((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, null, new ContrastCurve(3.0d, 4.5d, 7.0d, 11.0d), null);
    }

    static /* sintético */ Double lambda$onErrorContainer$101(DynamicScheme s) {
        if (isMonochrome(s)) {
            return Double.valueOf(s.isDark ? 90.0d : 10.0d);
        }
        return Double.valueOf(s.isDark ? 90.0d : 30.0d);
    }

    /* renomeado de: lambda$onErrorContainer$102$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ DynamicColor m676x2dffdbdb(DynamicScheme s) {
        return errorContainer();
    }

    public DynamicColor primaryFixed() {
        return new DynamicColor("primary_fixed", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda153
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).primaryPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda154
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(MaterialDynamicColors.isMonochrome(s) ? 40.0d : 90.0d);
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, true, new MaterialDynamicColors$$ExternalSyntheticLambda162(this), null, new ContrastCurve(1.0d, 1.0d, 3.0d, 4.5d), new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda155
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m701xcb141198((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        });
    }

    /* renomeado de: lambda$primaryFixed$105$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ ToneDeltaPair m701xcb141198(DynamicScheme s) {
        return new ToneDeltaPair(primaryFixed(), primaryFixedDim(), 10.0d, TonePolarity.LIGHTER, true);
    }

    public DynamicColor primaryFixedDim() {
        return new DynamicColor("primary_fixed_dim", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda156
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).primaryPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda157
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(MaterialDynamicColors.isMonochrome(s) ? 30.0d : 80.0d);
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, true, new MaterialDynamicColors$$ExternalSyntheticLambda162(this), null, new ContrastCurve(1.0d, 1.0d, 3.0d, 4.5d), new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda158
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m702x8f195ac5((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        });
    }

    /* renomeado de: lambda$primaryFixedDim$108$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ ToneDeltaPair m702x8f195ac5(DynamicScheme s) {
        return new ToneDeltaPair(primaryFixed(), primaryFixedDim(), 10.0d, TonePolarity.LIGHTER, true);
    }

    public DynamicColor onPrimaryFixed() {
        return new DynamicColor("on_primary_fixed", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda28
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).primaryPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda29
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(MaterialDynamicColors.isMonochrome(s) ? 100.0d : 10.0d);
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, false, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda30
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m680x702e4bf2((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda31
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m681x4befc7b3((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new ContrastCurve(4.5d, 7.0d, 11.0d, 21.0d), null);
    }

    /* renomeado de: lambda$onPrimaryFixed$111$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ DynamicColor m680x702e4bf2(DynamicScheme s) {
        return primaryFixedDim();
    }

    /* renomeado de: lambda$onPrimaryFixed$112$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ DynamicColor m681x4befc7b3(DynamicScheme s) {
        return primaryFixed();
    }

    public DynamicColor onPrimaryFixedVariant() {
        return new DynamicColor("on_primary_fixed_variant", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda122
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).primaryPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda123
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(MaterialDynamicColors.isMonochrome(s) ? 90.0d : 30.0d);
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, false, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda124
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m682x19d0bbbf((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda125
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m683xf5923780((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new ContrastCurve(3.0d, 4.5d, 7.0d, 11.0d), null);
    }

    /* renomeado de: lambda$onPrimaryFixedVariant$115$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ DynamicColor m682x19d0bbbf(DynamicScheme s) {
        return primaryFixedDim();
    }

    /* renomeado de: lambda$onPrimaryFixedVariant$116$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ DynamicColor m683xf5923780(DynamicScheme s) {
        return primaryFixed();
    }

    public DynamicColor secondaryFixed() {
        return new DynamicColor("secondary_fixed", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda119
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).secondaryPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda120
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(MaterialDynamicColors.isMonochrome(s) ? 80.0d : 90.0d);
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, true, new MaterialDynamicColors$$ExternalSyntheticLambda162(this), null, new ContrastCurve(1.0d, 1.0d, 3.0d, 4.5d), new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda121
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m706x75ece309((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        });
    }

    /* renomeado de: lambda$secondaryFixed$119$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ ToneDeltaPair m706x75ece309(DynamicScheme s) {
        return new ToneDeltaPair(secondaryFixed(), secondaryFixedDim(), 10.0d, TonePolarity.LIGHTER, true);
    }

    public DynamicColor secondaryFixedDim() {
        return new DynamicColor("secondary_fixed_dim", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda138
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).secondaryPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda139
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(MaterialDynamicColors.isMonochrome(s) ? 70.0d : 80.0d);
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, true, new MaterialDynamicColors$$ExternalSyntheticLambda162(this), null, new ContrastCurve(1.0d, 1.0d, 3.0d, 4.5d), new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda141
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m707x801c242f((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        });
    }

    /* renomeado de: lambda$secondaryFixedDim$122$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ ToneDeltaPair m707x801c242f(DynamicScheme s) {
        return new ToneDeltaPair(secondaryFixed(), secondaryFixedDim(), 10.0d, TonePolarity.LIGHTER, true);
    }

    public DynamicColor onSecondaryFixed() {
        return new DynamicColor("on_secondary_fixed", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda14
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).secondaryPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda15
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(10.0d);
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, false, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda16
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m687xf72fd9a3((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda17
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m688xd2f15564((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new ContrastCurve(4.5d, 7.0d, 11.0d, 21.0d), null);
    }

    /* renomeado de: lambda$onSecondaryFixed$125$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ DynamicColor m687xf72fd9a3(DynamicScheme s) {
        return secondaryFixedDim();
    }

    /* renomeado de: lambda$onSecondaryFixed$126$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ DynamicColor m688xd2f15564(DynamicScheme s) {
        return secondaryFixed();
    }

    public DynamicColor onSecondaryFixedVariant() {
        return new DynamicColor("on_secondary_fixed_variant", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda62
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).secondaryPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda63
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(MaterialDynamicColors.isMonochrome(s) ? 25.0d : 30.0d);
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, false, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda64
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m689x26187114((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda65
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m690x8b913aa((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new ContrastCurve(3.0d, 4.5d, 7.0d, 11.0d), null);
    }

    /* renomeado de: lambda$onSecondaryFixedVariant$129$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ DynamicColor m689x26187114(DynamicScheme s) {
        return secondaryFixedDim();
    }

    /* renomeado de: lambda$onSecondaryFixedVariant$130$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ DynamicColor m690x8b913aa(DynamicScheme s) {
        return secondaryFixed();
    }

    public DynamicColor tertiaryFixed() {
        return new DynamicColor("tertiary_fixed", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda53
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).tertiaryPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda54
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(MaterialDynamicColors.isMonochrome(s) ? 40.0d : 90.0d);
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, true, new MaterialDynamicColors$$ExternalSyntheticLambda162(this), null, new ContrastCurve(1.0d, 1.0d, 3.0d, 4.5d), new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda56
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m711x59237289((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        });
    }

    /* renomeado de: lambda$tertiaryFixed$133$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ ToneDeltaPair m711x59237289(DynamicScheme s) {
        return new ToneDeltaPair(tertiaryFixed(), tertiaryFixedDim(), 10.0d, TonePolarity.LIGHTER, true);
    }

    public DynamicColor tertiaryFixedDim() {
        return new DynamicColor("tertiary_fixed_dim", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda126
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).tertiaryPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda127
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(MaterialDynamicColors.isMonochrome(s) ? 30.0d : 80.0d);
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, true, new MaterialDynamicColors$$ExternalSyntheticLambda162(this), null, new ContrastCurve(1.0d, 1.0d, 3.0d, 4.5d), new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda128
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m712x24c02d4a((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        });
    }

    /* renomeado de: lambda$tertiaryFixedDim$136$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ ToneDeltaPair m712x24c02d4a(DynamicScheme s) {
        return new ToneDeltaPair(tertiaryFixed(), tertiaryFixedDim(), 10.0d, TonePolarity.LIGHTER, true);
    }

    public DynamicColor onTertiaryFixed() {
        return new DynamicColor("on_tertiary_fixed", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda87
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).tertiaryPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda88
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(MaterialDynamicColors.isMonochrome(s) ? 100.0d : 10.0d);
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, false, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda89
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m694xfe3fcbf0((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda90
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m695xe0e06e86((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new ContrastCurve(4.5d, 7.0d, 11.0d, 21.0d), null);
    }

    /* renomeado de: lambda$onTertiaryFixed$139$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ DynamicColor m694xfe3fcbf0(DynamicScheme s) {
        return tertiaryFixedDim();
    }

    /* renomeado de: lambda$onTertiaryFixed$140$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ DynamicColor m695xe0e06e86(DynamicScheme s) {
        return tertiaryFixed();
    }

    public DynamicColor onTertiaryFixedVariant() {
        return new DynamicColor("on_tertiary_fixed_variant", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda75
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).tertiaryPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda76
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(MaterialDynamicColors.isMonochrome(s) ? 90.0d : 30.0d);
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, false, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda77
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m696x702fc122((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda78
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return MaterialDynamicColors.this.m697x4bf13ce3((DynamicScheme) obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new ContrastCurve(3.0d, 4.5d, 7.0d, 11.0d), null);
    }

    /* renomeado de: lambda$onTertiaryFixedVariant$143$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ DynamicColor m696x702fc122(DynamicScheme s) {
        return tertiaryFixedDim();
    }

    /* renomeado de: lambda$onTertiaryFixedVariant$144$com-google-android-material-color-utilities-MaterialDynamicColors, motivo: nome Java inválido */
    /* sintético */ DynamicColor m697x4bf13ce3(DynamicScheme s) {
        return tertiaryFixed();
    }

    public DynamicColor controlActivated() {
        return DynamicColor.fromPalette("control_activated", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda70
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).primaryPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda71
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(s.isDark ? 30.0d : 90.0d);
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        });
    }

    public DynamicColor controlNormal() {
        return DynamicColor.fromPalette("control_normal", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda55
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).neutralVariantPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda66
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(s.isDark ? 80.0d : 30.0d);
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        });
    }

    public DynamicColor controlHighlight() {
        return new DynamicColor("control_highlight", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda93
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).neutralPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda94
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(s.isDark ? 100.0d : AudioStats.AUDIO_AMPLITUDE_NONE);
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, false, null, null, null, null, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda95
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(s.isDark ? 0.2d : 0.12d);
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        });
    }

    public DynamicColor textPrimaryInverse() {
        return DynamicColor.fromPalette("text_primary_inverse", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda36
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).neutralPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda37
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(s.isDark ? 10.0d : 90.0d);
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        });
    }

    public DynamicColor textSecondaryAndTertiaryInverse() {
        return DynamicColor.fromPalette("text_secondary_and_tertiary_inverse", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda48
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).neutralVariantPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda49
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(s.isDark ? 30.0d : 80.0d);
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        });
    }

    public DynamicColor textPrimaryInverseDisableOnly() {
        return DynamicColor.fromPalette("text_primary_inverse_disable_only", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda133
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).neutralPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda134
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(s.isDark ? 10.0d : 90.0d);
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        });
    }

    public DynamicColor textSecondaryAndTertiaryInverseDisabled() {
        return DynamicColor.fromPalette("text_secondary_and_tertiary_inverse_disabled", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda85
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).neutralPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda96
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(s.isDark ? 10.0d : 90.0d);
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        });
    }

    public DynamicColor textHintInverse() {
        return DynamicColor.fromPalette("text_hint_inverse", new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda146
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                TonalPalette tonalPalette;
                tonalPalette = ((DynamicScheme) obj).neutralPalette;
                return tonalPalette;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, new Function() { // da classe: com.google.android.material.color.utilities.MaterialDynamicColors$$ExternalSyntheticLambda147
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Double valueOf;
                valueOf = Double.valueOf(s.isDark ? 10.0d : 90.0d);
                return valueOf;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        });
    }

    private boolean isFidelity(DynamicScheme scheme) {
        return !(!this.isExtendedFidelity || scheme.variant == Variant.MONOCHROME || scheme.variant == Variant.NEUTRAL) || scheme.variant == Variant.FIDELITY || scheme.variant == Variant.CONTENT;
    }

    private static boolean isMonochrome(DynamicScheme scheme) {
        return scheme.variant == Variant.MONOCHROME;
    }

    static double findDesiredChromaByTone(double hue, double chroma, double tone, boolean byDecreasingTone) {
        double answer = tone;
        Hct closestToChroma = Hct.from(hue, chroma, tone);
        if (closestToChroma.getChroma() < chroma) {
            double chromaPeak = closestToChroma.getChroma();
            while (closestToChroma.getChroma() < chroma) {
                double answer2 = answer + (byDecreasingTone ? -1.0d : 1.0d);
                Hct potentialSolution = Hct.from(hue, chroma, answer2);
                if (chromaPeak <= potentialSolution.getChroma() && Math.abs(potentialSolution.getChroma() - chroma) >= 0.4d) {
                    double potentialDelta = Math.abs(potentialSolution.getChroma() - chroma);
                    double currentDelta = Math.abs(closestToChroma.getChroma() - chroma);
                    if (potentialDelta < currentDelta) {
                        closestToChroma = potentialSolution;
                    }
                    chromaPeak = Math.max(chromaPeak, potentialSolution.getChroma());
                    answer = answer2;
                } else {
                    return answer2;
                }
            }
            return answer;
        }
        return answer;
    }
}
