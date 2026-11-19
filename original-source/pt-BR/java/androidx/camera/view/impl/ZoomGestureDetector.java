package androidx.camera.view.impl;

import android.content.Context;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.ViewConfiguration;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.core.app.NotificationCompat;
import com.google.android.gms.common.internal.ServiceSpecificExtraArgs;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.math.MathKt;

/* compiled from: ZoomGestureDetector.kt */
@Metadata(d1 = {"\u0000H\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0002\b\u0006\n\u0002\u0010\u0007\n\u0002\b\u0006\n\u0002\u0010\t\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\t\u0018\u0000 02\u00020\u0001:\u0003./0B-\b\u0007\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0003\u0010\u0004\u001a\u00020\u0005\u0012\b\b\u0003\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\u0007\u001a\u00020\b¢\u0006\u0004\b\t\u0010\nJ\u0010\u0010&\u001a\u00020\u000e2\u0006\u0010'\u001a\u00020(H\u0007J\b\u0010)\u001a\u00020\u000eH\u0002J\b\u0010*\u001a\u00020\u0015H\u0002R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\bX\u0082\u0004¢\u0006\u0002\n\u0000R\u0012\u0010\u000b\u001a\u00020\u00058\u0002@\u0002X\u0083\u000e¢\u0006\u0002\n\u0000R\u0012\u0010\f\u001a\u00020\u00058\u0002@\u0002X\u0083\u000e¢\u0006\u0002\n\u0000R\u001a\u0010\r\u001a\u00020\u000eX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\r\u0010\u000f\"\u0004\b\u0010\u0010\u0011R\u001a\u0010\u0012\u001a\u00020\u000eX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0012\u0010\u000f\"\u0004\b\u0013\u0010\u0011R\u000e\u0010\u0014\u001a\u00020\u0015X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0016\u001a\u00020\u0015X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0017\u001a\u00020\u0015X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0018\u001a\u00020\u0015X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0019\u001a\u00020\u0015X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u001a\u001a\u00020\u0015X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u001b\u001a\u00020\u001cX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u001d\u001a\u00020\u000eX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u001e\u001a\u00020\u0015X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u001f\u001a\u00020\u001cX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010 \u001a\u00020\u0015X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010!\u001a\u00020\u0015X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\"\u001a\u00020\u0005X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010#\u001a\u00020$X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010%\u001a\u00020\u000eX\u0082\u000e¢\u0006\u0002\n\u0000R\u0011\u0010+\u001a\u00020\u001c8F¢\u0006\u0006\u001a\u0004\b,\u0010-¨\u00061"}, d2 = {"Landroidx/camera/view/impl/ZoomGestureDetector;", "", "context", "Landroid/content/Context;", "spanSlop", "", "minSpan", ServiceSpecificExtraArgs.CastExtraArgs.LISTENER, "Landroidx/camera/view/impl/ZoomGestureDetector$OnZoomGestureListener;", "<init>", "(Landroid/content/Context;IILandroidx/camera/view/impl/ZoomGestureDetector$OnZoomGestureListener;)V", "focusX", "focusY", "isQuickZoomEnabled", "", "()Z", "setQuickZoomEnabled", "(Z)V", "isStylusZoomEnabled", "setStylusZoomEnabled", "currentSpan", "", "previousSpan", "currentSpanX", "currentSpanY", "previousSpanX", "previousSpanY", "eventTime", "", "isInProgress", "initialSpan", "prevTime", "anchoredZoomStartX", "anchoredZoomStartY", "anchoredZoomMode", "gestureDetector", "Landroid/view/GestureDetector;", "eventBeforeOrAboveStartingGestureEvent", "onTouchEvent", NotificationCompat.CATEGORY_EVENT, "Landroid/view/MotionEvent;", "inAnchoredZoomMode", "getIncrementalScaleFactor", "timeDelta", "getTimeDelta", "()J", "ZoomEvent", "OnZoomGestureListener", "Companion", "camera-view_release"}, k = 1, mv = {2, 0, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* carregado de: classes.dex */
public final class ZoomGestureDetector {
    private static final int ANCHORED_ZOOM_MODE_DOUBLE_TAP = 1;
    private static final int ANCHORED_ZOOM_MODE_NONE = 0;
    private static final int ANCHORED_ZOOM_MODE_STYLUS = 2;
    private static final int DEFAULT_MIN_SPAN = 0;
    private static final float SCALE_FACTOR = 0.5f;
    private int anchoredZoomMode;
    private float anchoredZoomStartX;
    private float anchoredZoomStartY;
    private final Context context;
    private float currentSpan;
    private float currentSpanX;
    private float currentSpanY;
    private boolean eventBeforeOrAboveStartingGestureEvent;
    private long eventTime;
    private int focusX;
    private int focusY;
    private GestureDetector gestureDetector;
    private float initialSpan;
    private boolean isInProgress;
    private boolean isQuickZoomEnabled;
    private boolean isStylusZoomEnabled;
    private final OnZoomGestureListener listener;
    private final int minSpan;
    private long prevTime;
    private float previousSpan;
    private float previousSpanX;
    private float previousSpanY;
    private final int spanSlop;

    /* compiled from: ZoomGestureDetector.kt */
    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\bæ\u0080\u0001\u0018\u00002\u00020\u0001J\u0010\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H'ø\u0001\u0000\u0082\u0002\u0006\n\u0004\b!0\u0001¨\u0006\u0006À\u0006\u0001"}, d2 = {"Landroidx/camera/view/impl/ZoomGestureDetector$OnZoomGestureListener;", "", "onZoomEvent", "", "zoomEvent", "Landroidx/camera/view/impl/ZoomGestureDetector$ZoomEvent;", "camera-view_release"}, k = 1, mv = {2, 0, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    public interface OnZoomGestureListener {
        boolean onZoomEvent(ZoomEvent zoomEvent);
    }

    public ZoomGestureDetector(Context context, int spanSlop, int minSpan, OnZoomGestureListener listener) {
        Intrinsics.checkNotNullParameter(context, "context");
        Intrinsics.checkNotNullParameter(listener, "listener");
        this.context = context;
        this.spanSlop = spanSlop;
        this.minSpan = minSpan;
        this.listener = listener;
        this.isQuickZoomEnabled = true;
        this.isStylusZoomEnabled = true;
        this.gestureDetector = new GestureDetector(this.context, new GestureDetector.SimpleOnGestureListener() { // da classe: androidx.camera.view.impl.ZoomGestureDetector$gestureDetector$1
            @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnDoubleTapListener
            public boolean onDoubleTap(MotionEvent e) {
                Intrinsics.checkNotNullParameter(e, "e");
                ZoomGestureDetector.this.anchoredZoomStartX = e.getX();
                ZoomGestureDetector.this.anchoredZoomStartY = e.getY();
                ZoomGestureDetector.this.anchoredZoomMode = 1;
                return true;
            }
        });
    }

    public /* sintético */ ZoomGestureDetector(Context context, int i, int i2, OnZoomGestureListener onZoomGestureListener, int i3, DefaultConstructorMarker defaultConstructorMarker) {
        this(context, (i3 & 2) != 0 ? ViewConfiguration.get(context).getScaledTouchSlop() * 2 : i, (i3 & 4) != 0 ? 0 : i2, onZoomGestureListener);
    }

    /* JADX WARN: chamada 'this' movida para o topo do método (pode alterar a semântica do código) */
    public ZoomGestureDetector(Context context, int spanSlop, OnZoomGestureListener listener) {
        this(context, spanSlop, 0, listener, 4, null);
        Intrinsics.checkNotNullParameter(context, "context");
        Intrinsics.checkNotNullParameter(listener, "listener");
    }

    /* JADX WARN: chamada 'this' movida para o topo do método (pode alterar a semântica do código) */
    public ZoomGestureDetector(Context context, OnZoomGestureListener listener) {
        this(context, 0, 0, listener, 6, null);
        Intrinsics.checkNotNullParameter(context, "context");
        Intrinsics.checkNotNullParameter(listener, "listener");
    }

    /* compiled from: ZoomGestureDetector.kt */
    @Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\b\n\u0002\b\f\b&\u0018\u00002\u00020\u0001:\u0003\u000e\u000f\u0010B'\b\u0002\u0012\b\b\u0001\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0001\u0010\u0004\u001a\u00020\u0005\u0012\b\b\u0001\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bR\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\f¨\u0006\u0011"}, d2 = {"Landroidx/camera/view/impl/ZoomGestureDetector$ZoomEvent;", "", "eventTime", "", "focusX", "", "focusY", "<init>", "(JII)V", "getEventTime", "()J", "getFocusX", "()I", "getFocusY", "Begin", "Move", "End", "camera-view_release"}, k = 1, mv = {2, 0, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    public static abstract class ZoomEvent {
        private final long eventTime;
        private final int focusX;
        private final int focusY;

        public /* sintético */ ZoomEvent(long j, int i, int i2, DefaultConstructorMarker defaultConstructorMarker) {
            this(j, i, i2);
        }

        private ZoomEvent(long eventTime, int focusX, int focusY) {
            this.eventTime = eventTime;
            this.focusX = focusX;
            this.focusY = focusY;
        }

        public final long getEventTime() {
            return this.eventTime;
        }

        public final int getFocusX() {
            return this.focusX;
        }

        public final int getFocusY() {
            return this.focusY;
        }

        /* compiled from: ZoomGestureDetector.kt */
        @Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\b\n\u0002\b\u0004\u0018\u00002\u00020\u0001B%\u0012\b\b\u0001\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0001\u0010\u0004\u001a\u00020\u0005\u0012\b\b\u0001\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\b¨\u0006\t"}, d2 = {"Landroidx/camera/view/impl/ZoomGestureDetector$ZoomEvent$Begin;", "Landroidx/camera/view/impl/ZoomGestureDetector$ZoomEvent;", "eventTime", "", "focusX", "", "focusY", "<init>", "(JII)V", "camera-view_release"}, k = 1, mv = {2, 0, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
        public static final class Begin extends ZoomEvent {
            public Begin(long eventTime, int focusX, int focusY) {
                super(eventTime, focusX, focusY, null);
            }
        }

        /* compiled from: ZoomGestureDetector.kt */
        @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0007\n\u0002\b\u0005\u0018\u00002\u00020\u0001B/\u0012\b\b\u0001\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0001\u0010\u0004\u001a\u00020\u0005\u0012\b\b\u0001\u0010\u0006\u001a\u00020\u0005\u0012\b\b\u0001\u0010\u0007\u001a\u00020\b¢\u0006\u0004\b\t\u0010\nR\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\r"}, d2 = {"Landroidx/camera/view/impl/ZoomGestureDetector$ZoomEvent$Move;", "Landroidx/camera/view/impl/ZoomGestureDetector$ZoomEvent;", "eventTime", "", "focusX", "", "focusY", "incrementalScaleFactor", "", "<init>", "(JIIF)V", "getIncrementalScaleFactor", "()F", "camera-view_release"}, k = 1, mv = {2, 0, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
        public static final class Move extends ZoomEvent {
            private final float incrementalScaleFactor;

            public final float getIncrementalScaleFactor() {
                return this.incrementalScaleFactor;
            }

            public Move(long eventTime, int focusX, int focusY, float incrementalScaleFactor) {
                super(eventTime, focusX, focusY, null);
                this.incrementalScaleFactor = incrementalScaleFactor;
            }
        }

        /* compiled from: ZoomGestureDetector.kt */
        @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0007\n\u0002\b\u0005\u0018\u00002\u00020\u0001B/\u0012\b\b\u0001\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0001\u0010\u0004\u001a\u00020\u0005\u0012\b\b\u0001\u0010\u0006\u001a\u00020\u0005\u0012\b\b\u0001\u0010\u0007\u001a\u00020\b¢\u0006\u0004\b\t\u0010\nR\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\r"}, d2 = {"Landroidx/camera/view/impl/ZoomGestureDetector$ZoomEvent$End;", "Landroidx/camera/view/impl/ZoomGestureDetector$ZoomEvent;", "eventTime", "", "focusX", "", "focusY", "incrementalScaleFactor", "", "<init>", "(JIIF)V", "getIncrementalScaleFactor", "()F", "camera-view_release"}, k = 1, mv = {2, 0, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
        public static final class End extends ZoomEvent {
            private final float incrementalScaleFactor;

            public final float getIncrementalScaleFactor() {
                return this.incrementalScaleFactor;
            }

            public End(long eventTime, int focusX, int focusY, float incrementalScaleFactor) {
                super(eventTime, focusX, focusY, null);
                this.incrementalScaleFactor = incrementalScaleFactor;
            }
        }
    }

    /* renomeado de: isQuickZoomEnabled, motivo: de getter */
    public final boolean getIsQuickZoomEnabled() {
        return this.isQuickZoomEnabled;
    }

    public final void setQuickZoomEnabled(boolean z) {
        this.isQuickZoomEnabled = z;
    }

    /* renomeado de: isStylusZoomEnabled, motivo: de getter */
    public final boolean getIsStylusZoomEnabled() {
        return this.isStylusZoomEnabled;
    }

    public final void setStylusZoomEnabled(boolean z) {
        this.isStylusZoomEnabled = z;
    }

    public final boolean onTouchEvent(MotionEvent event) {
        boolean z;
        float focusXFloat;
        float focusYFloat;
        float focusYFloat2;
        float devX;
        boolean wasInProgress;
        boolean z2;
        Intrinsics.checkNotNullParameter(event, "event");
        this.eventTime = event.getEventTime();
        int action = event.getActionMasked();
        if (this.isQuickZoomEnabled) {
            this.gestureDetector.onTouchEvent(event);
        }
        int count = event.getPointerCount();
        boolean isStylusButtonDown = (event.getButtonState() & 32) != 0;
        boolean anchoredZoomCancelled = this.anchoredZoomMode == 2 && !isStylusButtonDown;
        boolean streamComplete = action == 1 || action == 3 || anchoredZoomCancelled;
        if (action == 0 || streamComplete) {
            if (this.isInProgress) {
                z = true;
                this.listener.onZoomEvent(new ZoomEvent.End(this.eventTime, this.focusX, this.focusY, getIncrementalScaleFactor()));
                this.isInProgress = false;
                this.initialSpan = 0.0f;
                this.anchoredZoomMode = 0;
            } else {
                z = true;
                if (inAnchoredZoomMode() && streamComplete) {
                    this.isInProgress = false;
                    this.initialSpan = 0.0f;
                    this.anchoredZoomMode = 0;
                }
            }
            if (streamComplete) {
                return z;
            }
        } else {
            z = true;
        }
        if (!this.isInProgress && this.isStylusZoomEnabled && !inAnchoredZoomMode() && !streamComplete && isStylusButtonDown) {
            this.anchoredZoomStartX = event.getX();
            this.anchoredZoomStartY = event.getY();
            this.anchoredZoomMode = 2;
            this.initialSpan = 0.0f;
        }
        boolean configChanged = (action == 0 || action == 6 || action == 5 || anchoredZoomCancelled) ? z : false;
        boolean pointerUp = action == 6 ? z : false;
        int skipIndex = pointerUp ? event.getActionIndex() : -1;
        float sumX = 0.0f;
        float sumY = 0.0f;
        int div = pointerUp ? count - 1 : count;
        if (inAnchoredZoomMode()) {
            focusXFloat = this.anchoredZoomStartX;
            focusYFloat = this.anchoredZoomStartY;
            if (event.getY() < focusYFloat) {
                z2 = z;
            } else {
                z2 = false;
            }
            this.eventBeforeOrAboveStartingGestureEvent = z2;
        } else {
            for (int i = 0; i < count; i++) {
                if (skipIndex != i) {
                    sumX += event.getX(i);
                    sumY += event.getY(i);
                }
            }
            focusXFloat = sumX / div;
            focusYFloat = sumY / div;
        }
        float devSumX = 0.0f;
        float devSumY = 0.0f;
        for (int i2 = 0; i2 < count; i2++) {
            if (skipIndex != i2) {
                devSumX += Math.abs(event.getX(i2) - focusXFloat);
                devSumY += Math.abs(event.getY(i2) - focusYFloat);
            }
        }
        float devX2 = devSumX / div;
        float devY = devSumY / div;
        float f = 2;
        float spanX = devX2 * f;
        float spanY = f * devY;
        if (inAnchoredZoomMode()) {
            focusYFloat2 = focusYFloat;
            devX = spanY;
        } else {
            focusYFloat2 = focusYFloat;
            devX = (float) Math.hypot(spanX, spanY);
        }
        boolean wasInProgress2 = this.isInProgress;
        this.focusX = MathKt.roundToInt(focusXFloat);
        this.focusY = MathKt.roundToInt(focusYFloat2);
        if (inAnchoredZoomMode() || !this.isInProgress) {
            wasInProgress = wasInProgress2;
        } else if (devX < this.minSpan || configChanged) {
            wasInProgress = wasInProgress2;
            this.listener.onZoomEvent(new ZoomEvent.End(this.eventTime, this.focusX, this.focusY, getIncrementalScaleFactor()));
            this.isInProgress = false;
            this.initialSpan = devX;
        } else {
            wasInProgress = wasInProgress2;
        }
        if (configChanged) {
            this.currentSpanX = spanX;
            this.previousSpanX = this.currentSpanX;
            this.currentSpanY = spanY;
            this.previousSpanY = this.currentSpanY;
            this.currentSpan = devX;
            this.previousSpan = this.currentSpan;
            this.initialSpan = this.previousSpan;
        }
        int minSpan = inAnchoredZoomMode() ? this.spanSlop : this.minSpan;
        if (!this.isInProgress && devX >= minSpan && (wasInProgress || Math.abs(devX - this.initialSpan) > this.spanSlop)) {
            this.currentSpanX = spanX;
            this.previousSpanX = this.currentSpanX;
            this.currentSpanY = spanY;
            this.previousSpanY = this.currentSpanY;
            this.currentSpan = devX;
            this.previousSpan = this.currentSpan;
            this.prevTime = this.eventTime;
            OnZoomGestureListener onZoomGestureListener = this.listener;
            long j = this.eventTime;
            int minSpan2 = this.focusX;
            this.isInProgress = onZoomGestureListener.onZoomEvent(new ZoomEvent.Begin(j, minSpan2, this.focusY));
        }
        if (action == 2) {
            this.currentSpanX = spanX;
            this.currentSpanY = spanY;
            this.currentSpan = devX;
            boolean updatePrev = true;
            if (this.isInProgress) {
                updatePrev = this.listener.onZoomEvent(new ZoomEvent.Move(this.eventTime, this.focusX, this.focusY, getIncrementalScaleFactor()));
            }
            if (updatePrev) {
                this.previousSpanX = this.currentSpanX;
                this.previousSpanY = this.currentSpanY;
                this.previousSpan = this.currentSpan;
                this.prevTime = this.eventTime;
            }
        }
        return z;
    }

    private final boolean inAnchoredZoomMode() {
        return this.anchoredZoomMode != 0;
    }

    private final float getIncrementalScaleFactor() {
        if (!inAnchoredZoomMode()) {
            if (this.previousSpan > 0.0f) {
                return this.currentSpan / this.previousSpan;
            }
            return 1.0f;
        }
        boolean scaleUp = (this.eventBeforeOrAboveStartingGestureEvent && this.currentSpan < this.previousSpan) || (!this.eventBeforeOrAboveStartingGestureEvent && this.currentSpan > this.previousSpan);
        float spanDiff = Math.abs(1 - (this.currentSpan / this.previousSpan)) * 0.5f;
        if (this.previousSpan <= this.spanSlop) {
            return 1.0f;
        }
        return scaleUp ? 1.0f + spanDiff : 1.0f - spanDiff;
    }

    public final long getTimeDelta() {
        return this.eventTime - this.prevTime;
    }
}
