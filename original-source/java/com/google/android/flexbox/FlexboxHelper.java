package com.google.android.flexbox;

import android.graphics.drawable.Drawable;
import android.util.SparseIntArray;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CompoundButton;
import androidx.core.view.MarginLayoutParamsCompat;
import androidx.core.widget.CompoundButtonCompat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/* loaded from: classes.dex */
class FlexboxHelper {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private static final int INITIAL_CAPACITY = 10;
    private static final long MEASURE_SPEC_WIDTH_MASK = 4294967295L;
    private boolean[] mChildrenFrozen;
    private final FlexContainer mFlexContainer;
    int[] mIndexToFlexLine;
    long[] mMeasureSpecCache;
    private long[] mMeasuredSizeCache;

    FlexboxHelper(FlexContainer flexContainer) {
        this.mFlexContainer = flexContainer;
    }

    /* JADX WARN: Multi-variable type inference failed */
    int[] createReorderedIndices(View viewBeforeAdded, int indexForViewBeforeAdded, ViewGroup.LayoutParams paramsForViewBeforeAdded, SparseIntArray orderCache) {
        int childCount = this.mFlexContainer.getFlexItemCount();
        List<Order> orders = createOrders(childCount);
        Order orderForViewToBeAdded = new Order();
        if (viewBeforeAdded != null && (paramsForViewBeforeAdded instanceof FlexItem)) {
            orderForViewToBeAdded.order = ((FlexItem) paramsForViewBeforeAdded).getOrder();
        } else {
            orderForViewToBeAdded.order = 1;
        }
        if (indexForViewBeforeAdded == -1 || indexForViewBeforeAdded == childCount) {
            orderForViewToBeAdded.index = childCount;
        } else if (indexForViewBeforeAdded < this.mFlexContainer.getFlexItemCount()) {
            orderForViewToBeAdded.index = indexForViewBeforeAdded;
            for (int i = indexForViewBeforeAdded; i < childCount; i++) {
                orders.get(i).index++;
            }
        } else {
            orderForViewToBeAdded.index = childCount;
        }
        orders.add(orderForViewToBeAdded);
        return sortOrdersIntoReorderedIndices(childCount + 1, orders, orderCache);
    }

    int[] createReorderedIndices(SparseIntArray orderCache) {
        int childCount = this.mFlexContainer.getFlexItemCount();
        List<Order> orders = createOrders(childCount);
        return sortOrdersIntoReorderedIndices(childCount, orders, orderCache);
    }

    private List<Order> createOrders(int childCount) {
        List<Order> orders = new ArrayList<>(childCount);
        for (int i = 0; i < childCount; i++) {
            View child = this.mFlexContainer.getFlexItemAt(i);
            FlexItem flexItem = (FlexItem) child.getLayoutParams();
            Order order = new Order();
            order.order = flexItem.getOrder();
            order.index = i;
            orders.add(order);
        }
        return orders;
    }

    boolean isOrderChangedFromLastMeasurement(SparseIntArray orderCache) {
        int childCount = this.mFlexContainer.getFlexItemCount();
        if (orderCache.size() != childCount) {
            return true;
        }
        for (int i = 0; i < childCount; i++) {
            View view = this.mFlexContainer.getFlexItemAt(i);
            if (view != null) {
                FlexItem flexItem = (FlexItem) view.getLayoutParams();
                if (flexItem.getOrder() != orderCache.get(i)) {
                    return true;
                }
            }
        }
        return false;
    }

    private int[] sortOrdersIntoReorderedIndices(int childCount, List<Order> orders, SparseIntArray orderCache) {
        Collections.sort(orders);
        orderCache.clear();
        int[] reorderedIndices = new int[childCount];
        int i = 0;
        for (Order order : orders) {
            reorderedIndices[i] = order.index;
            orderCache.append(order.index, order.order);
            i++;
        }
        return reorderedIndices;
    }

    void calculateHorizontalFlexLines(FlexLinesResult result, int widthMeasureSpec, int heightMeasureSpec) {
        calculateFlexLines(result, widthMeasureSpec, heightMeasureSpec, Integer.MAX_VALUE, 0, -1, null);
    }

    void calculateHorizontalFlexLines(FlexLinesResult result, int widthMeasureSpec, int heightMeasureSpec, int needsCalcAmount, int fromIndex, List<FlexLine> existingLines) {
        calculateFlexLines(result, widthMeasureSpec, heightMeasureSpec, needsCalcAmount, fromIndex, -1, existingLines);
    }

    void calculateHorizontalFlexLinesToIndex(FlexLinesResult result, int widthMeasureSpec, int heightMeasureSpec, int needsCalcAmount, int toIndex, List<FlexLine> existingLines) {
        calculateFlexLines(result, widthMeasureSpec, heightMeasureSpec, needsCalcAmount, 0, toIndex, existingLines);
    }

    void calculateVerticalFlexLines(FlexLinesResult result, int widthMeasureSpec, int heightMeasureSpec) {
        calculateFlexLines(result, heightMeasureSpec, widthMeasureSpec, Integer.MAX_VALUE, 0, -1, null);
    }

    void calculateVerticalFlexLines(FlexLinesResult result, int widthMeasureSpec, int heightMeasureSpec, int needsCalcAmount, int fromIndex, List<FlexLine> existingLines) {
        calculateFlexLines(result, heightMeasureSpec, widthMeasureSpec, needsCalcAmount, fromIndex, -1, existingLines);
    }

    void calculateVerticalFlexLinesToIndex(FlexLinesResult result, int widthMeasureSpec, int heightMeasureSpec, int needsCalcAmount, int toIndex, List<FlexLine> existingLines) {
        calculateFlexLines(result, heightMeasureSpec, widthMeasureSpec, needsCalcAmount, 0, toIndex, existingLines);
    }

    /* JADX WARN: Multi-variable type inference failed */
    void calculateFlexLines(FlexLinesResult flexLinesResult, int i, int i2, int i3, int i4, int i5, List<FlexLine> list) {
        List<FlexLine> list2;
        int i6;
        int i7;
        int i8;
        int i9;
        int i10;
        int i11;
        int i12;
        int i13;
        FlexLine flexLine;
        int i14;
        int i15;
        int i16;
        int i17;
        int i18;
        int i19 = i;
        int i20 = i5;
        boolean isMainAxisDirectionHorizontal = this.mFlexContainer.isMainAxisDirectionHorizontal();
        int mode = View.MeasureSpec.getMode(i19);
        int size = View.MeasureSpec.getSize(i19);
        int i21 = 0;
        if (list == null) {
            list2 = new ArrayList();
        } else {
            list2 = list;
        }
        flexLinesResult.mFlexLines = list2;
        boolean z = i20 == -1;
        int paddingStartMain = getPaddingStartMain(isMainAxisDirectionHorizontal);
        int paddingEndMain = getPaddingEndMain(isMainAxisDirectionHorizontal);
        int paddingStartCross = getPaddingStartCross(isMainAxisDirectionHorizontal);
        int paddingEndCross = getPaddingEndCross(isMainAxisDirectionHorizontal);
        FlexLine flexLine2 = new FlexLine();
        flexLine2.mFirstIndex = i4;
        int i22 = 1;
        flexLine2.mMainSize = paddingStartMain + paddingEndMain;
        int flexItemCount = this.mFlexContainer.getFlexItemCount();
        boolean z2 = z;
        FlexLine flexLine3 = flexLine2;
        int i23 = 0;
        int i24 = i4;
        int i25 = Integer.MIN_VALUE;
        int i26 = 0;
        boolean z3 = z2;
        while (true) {
            if (i24 >= flexItemCount) {
                break;
            }
            View reorderedFlexItemAt = this.mFlexContainer.getReorderedFlexItemAt(i24);
            if (reorderedFlexItemAt == null) {
                if (!isLastFlexItem(i24, flexItemCount, flexLine3)) {
                    i6 = i26;
                } else {
                    addFlexLine(list2, flexLine3, i24, i23);
                    i6 = i26;
                }
            } else {
                i6 = i26;
                if (reorderedFlexItemAt.getVisibility() == 8) {
                    flexLine3.mGoneItemCount++;
                    flexLine3.mItemCount++;
                    if (isLastFlexItem(i24, flexItemCount, flexLine3)) {
                        addFlexLine(list2, flexLine3, i24, i23);
                    }
                } else {
                    if (reorderedFlexItemAt instanceof CompoundButton) {
                        evaluateMinimumSizeForCompoundButton((CompoundButton) reorderedFlexItemAt);
                    }
                    FlexItem flexItem = (FlexItem) reorderedFlexItemAt.getLayoutParams();
                    int i27 = i23;
                    if (flexItem.getAlignSelf() == 4) {
                        flexLine3.mIndicesAlignSelfStretch.add(Integer.valueOf(i24));
                    }
                    int flexItemSizeMain = getFlexItemSizeMain(flexItem, isMainAxisDirectionHorizontal);
                    if (flexItem.getFlexBasisPercent() != -1.0f && mode == 1073741824) {
                        i7 = Math.round(size * flexItem.getFlexBasisPercent());
                    } else {
                        i7 = flexItemSizeMain;
                    }
                    if (isMainAxisDirectionHorizontal) {
                        i8 = mode;
                        boolean z4 = i22;
                        int childWidthMeasureSpec = this.mFlexContainer.getChildWidthMeasureSpec(i19, paddingStartMain + paddingEndMain + getFlexItemMarginStartMain(flexItem, z4) + getFlexItemMarginEndMain(flexItem, z4), i7);
                        i9 = size;
                        i10 = flexItemCount;
                        int childHeightMeasureSpec = this.mFlexContainer.getChildHeightMeasureSpec(i2, paddingStartCross + paddingEndCross + getFlexItemMarginStartCross(flexItem, true) + getFlexItemMarginEndCross(flexItem, true) + i27, getFlexItemSizeCross(flexItem, true));
                        reorderedFlexItemAt.measure(childWidthMeasureSpec, childHeightMeasureSpec);
                        updateMeasureCache(i24, childWidthMeasureSpec, childHeightMeasureSpec, reorderedFlexItemAt);
                        i11 = 0;
                        i12 = childWidthMeasureSpec;
                    } else {
                        i8 = mode;
                        i9 = size;
                        i10 = flexItemCount;
                        i11 = 0;
                        int childWidthMeasureSpec2 = this.mFlexContainer.getChildWidthMeasureSpec(i2, paddingStartCross + paddingEndCross + getFlexItemMarginStartCross(flexItem, false) + getFlexItemMarginEndCross(flexItem, false) + i27, getFlexItemSizeCross(flexItem, false));
                        int childHeightMeasureSpec2 = this.mFlexContainer.getChildHeightMeasureSpec(i19, paddingStartMain + paddingEndMain + getFlexItemMarginStartMain(flexItem, false) + getFlexItemMarginEndMain(flexItem, false), i7);
                        reorderedFlexItemAt.measure(childWidthMeasureSpec2, childHeightMeasureSpec2);
                        updateMeasureCache(i24, childWidthMeasureSpec2, childHeightMeasureSpec2, reorderedFlexItemAt);
                        i12 = childHeightMeasureSpec2;
                    }
                    this.mFlexContainer.updateViewCache(i24, reorderedFlexItemAt);
                    checkSizeConstraints(reorderedFlexItemAt, i24);
                    int combineMeasuredStates = View.combineMeasuredStates(i21, reorderedFlexItemAt.getMeasuredState());
                    int i28 = flexLine3.mMainSize;
                    FlexLine flexLine4 = flexLine3;
                    i13 = i24;
                    int i29 = i11;
                    if (isWrapRequired(reorderedFlexItemAt, i8, i9, i28, getViewMeasuredSizeMain(reorderedFlexItemAt, isMainAxisDirectionHorizontal) + getFlexItemMarginStartMain(flexItem, isMainAxisDirectionHorizontal) + getFlexItemMarginEndMain(flexItem, isMainAxisDirectionHorizontal), flexItem, i13, i6, list2.size())) {
                        if (flexLine4.getItemCountNotGone() > 0) {
                            addFlexLine(list2, flexLine4, i13 > 0 ? i13 - 1 : i29, i27);
                            i23 = i27 + flexLine4.mCrossSize;
                        } else {
                            i23 = i27;
                        }
                        if (isMainAxisDirectionHorizontal) {
                            if (flexItem.getHeight() == -1) {
                                reorderedFlexItemAt.measure(i12, this.mFlexContainer.getChildHeightMeasureSpec(i2, this.mFlexContainer.getPaddingTop() + this.mFlexContainer.getPaddingBottom() + flexItem.getMarginTop() + flexItem.getMarginBottom() + i23, flexItem.getHeight()));
                                checkSizeConstraints(reorderedFlexItemAt, i13);
                            }
                        } else if (flexItem.getWidth() == -1) {
                            reorderedFlexItemAt.measure(this.mFlexContainer.getChildWidthMeasureSpec(i2, this.mFlexContainer.getPaddingLeft() + this.mFlexContainer.getPaddingRight() + flexItem.getMarginLeft() + flexItem.getMarginRight() + i23, flexItem.getWidth()), i12);
                            checkSizeConstraints(reorderedFlexItemAt, i13);
                        }
                        FlexLine flexLine5 = new FlexLine();
                        i14 = 1;
                        flexLine5.mItemCount = 1;
                        flexLine5.mMainSize = paddingStartMain + paddingEndMain;
                        flexLine5.mFirstIndex = i13;
                        i26 = 0;
                        flexLine = flexLine5;
                        i15 = Integer.MIN_VALUE;
                    } else {
                        flexLine = flexLine4;
                        i14 = 1;
                        flexLine.mItemCount++;
                        i26 = i6 + 1;
                        i23 = i27;
                        i15 = i25;
                    }
                    flexLine.mAnyItemsHaveFlexGrow = (flexLine.mAnyItemsHaveFlexGrow ? 1 : 0) | (flexItem.getFlexGrow() != 0.0f ? i14 : i29);
                    flexLine.mAnyItemsHaveFlexShrink = (flexLine.mAnyItemsHaveFlexShrink ? 1 : 0) | (flexItem.getFlexShrink() != 0.0f ? i14 : i29);
                    if (this.mIndexToFlexLine != null) {
                        this.mIndexToFlexLine[i13] = list2.size();
                    }
                    flexLine.mMainSize += getViewMeasuredSizeMain(reorderedFlexItemAt, isMainAxisDirectionHorizontal) + getFlexItemMarginStartMain(flexItem, isMainAxisDirectionHorizontal) + getFlexItemMarginEndMain(flexItem, isMainAxisDirectionHorizontal);
                    flexLine.mTotalFlexGrow += flexItem.getFlexGrow();
                    flexLine.mTotalFlexShrink += flexItem.getFlexShrink();
                    this.mFlexContainer.onNewFlexItemAdded(reorderedFlexItemAt, i13, i26, flexLine);
                    int max = Math.max(i15, getViewMeasuredSizeCross(reorderedFlexItemAt, isMainAxisDirectionHorizontal) + getFlexItemMarginStartCross(flexItem, isMainAxisDirectionHorizontal) + getFlexItemMarginEndCross(flexItem, isMainAxisDirectionHorizontal) + this.mFlexContainer.getDecorationLengthCrossAxis(reorderedFlexItemAt));
                    flexLine.mCrossSize = Math.max(flexLine.mCrossSize, max);
                    if (isMainAxisDirectionHorizontal) {
                        if (this.mFlexContainer.getFlexWrap() != 2) {
                            flexLine.mMaxBaseline = Math.max(flexLine.mMaxBaseline, reorderedFlexItemAt.getBaseline() + flexItem.getMarginTop());
                        } else {
                            flexLine.mMaxBaseline = Math.max(flexLine.mMaxBaseline, (reorderedFlexItemAt.getMeasuredHeight() - reorderedFlexItemAt.getBaseline()) + flexItem.getMarginBottom());
                        }
                    }
                    i16 = i10;
                    if (isLastFlexItem(i13, i16, flexLine)) {
                        addFlexLine(list2, flexLine, i13, i23);
                        i23 += flexLine.mCrossSize;
                    }
                    i17 = i5;
                    if (i17 == -1) {
                        i18 = i14;
                    } else if (list2.size() <= 0) {
                        i18 = i14;
                    } else {
                        i18 = i14;
                        if (list2.get(list2.size() - 1).mLastIndex >= i17 && i13 >= i17 && !z3) {
                            i23 = -flexLine.getCrossSize();
                            z3 = true;
                        }
                    }
                    if (i23 > i3 && z3) {
                        i21 = combineMeasuredStates;
                        break;
                    }
                    i25 = max;
                    i21 = combineMeasuredStates;
                    int i30 = i13 + 1;
                    i19 = i;
                    flexLine3 = flexLine;
                    flexItemCount = i16;
                    i20 = i17;
                    mode = i8;
                    i22 = i18;
                    i24 = i30;
                    size = i9;
                }
            }
            i8 = mode;
            i9 = size;
            flexLine = flexLine3;
            i13 = i24;
            i17 = i20;
            i18 = i22;
            i26 = i6;
            i16 = flexItemCount;
            int i302 = i13 + 1;
            i19 = i;
            flexLine3 = flexLine;
            flexItemCount = i16;
            i20 = i17;
            mode = i8;
            i22 = i18;
            i24 = i302;
            size = i9;
        }
        flexLinesResult.mChildState = i21;
    }

    private void evaluateMinimumSizeForCompoundButton(CompoundButton compoundButton) {
        FlexItem flexItem = (FlexItem) compoundButton.getLayoutParams();
        int minWidth = flexItem.getMinWidth();
        int minHeight = flexItem.getMinHeight();
        Drawable drawable = CompoundButtonCompat.getButtonDrawable(compoundButton);
        int drawableMinWidth = drawable == null ? 0 : drawable.getMinimumWidth();
        int drawableMinHeight = drawable != null ? drawable.getMinimumHeight() : 0;
        flexItem.setMinWidth(minWidth == -1 ? drawableMinWidth : minWidth);
        flexItem.setMinHeight(minHeight == -1 ? drawableMinHeight : minHeight);
    }

    private int getPaddingStartMain(boolean isMainHorizontal) {
        if (isMainHorizontal) {
            return this.mFlexContainer.getPaddingStart();
        }
        return this.mFlexContainer.getPaddingTop();
    }

    private int getPaddingEndMain(boolean isMainHorizontal) {
        if (isMainHorizontal) {
            return this.mFlexContainer.getPaddingEnd();
        }
        return this.mFlexContainer.getPaddingBottom();
    }

    private int getPaddingStartCross(boolean isMainHorizontal) {
        if (isMainHorizontal) {
            return this.mFlexContainer.getPaddingTop();
        }
        return this.mFlexContainer.getPaddingStart();
    }

    private int getPaddingEndCross(boolean isMainHorizontal) {
        if (isMainHorizontal) {
            return this.mFlexContainer.getPaddingBottom();
        }
        return this.mFlexContainer.getPaddingEnd();
    }

    private int getViewMeasuredSizeMain(View view, boolean isMainHorizontal) {
        if (isMainHorizontal) {
            return view.getMeasuredWidth();
        }
        return view.getMeasuredHeight();
    }

    private int getViewMeasuredSizeCross(View view, boolean isMainHorizontal) {
        if (isMainHorizontal) {
            return view.getMeasuredHeight();
        }
        return view.getMeasuredWidth();
    }

    private int getFlexItemSizeMain(FlexItem flexItem, boolean isMainHorizontal) {
        if (isMainHorizontal) {
            return flexItem.getWidth();
        }
        return flexItem.getHeight();
    }

    private int getFlexItemSizeCross(FlexItem flexItem, boolean isMainHorizontal) {
        if (isMainHorizontal) {
            return flexItem.getHeight();
        }
        return flexItem.getWidth();
    }

    private int getFlexItemMarginStartMain(FlexItem flexItem, boolean isMainHorizontal) {
        if (isMainHorizontal) {
            return flexItem.getMarginLeft();
        }
        return flexItem.getMarginTop();
    }

    private int getFlexItemMarginEndMain(FlexItem flexItem, boolean isMainHorizontal) {
        if (isMainHorizontal) {
            return flexItem.getMarginRight();
        }
        return flexItem.getMarginBottom();
    }

    private int getFlexItemMarginStartCross(FlexItem flexItem, boolean isMainHorizontal) {
        if (isMainHorizontal) {
            return flexItem.getMarginTop();
        }
        return flexItem.getMarginLeft();
    }

    private int getFlexItemMarginEndCross(FlexItem flexItem, boolean isMainHorizontal) {
        if (isMainHorizontal) {
            return flexItem.getMarginBottom();
        }
        return flexItem.getMarginRight();
    }

    private boolean isWrapRequired(View view, int mode, int maxSize, int currentLength, int childLength, FlexItem flexItem, int index, int indexInFlexLine, int flexLinesSize) {
        if (this.mFlexContainer.getFlexWrap() == 0) {
            return false;
        }
        if (flexItem.isWrapBefore()) {
            return true;
        }
        if (mode == 0) {
            return false;
        }
        int maxLine = this.mFlexContainer.getMaxLine();
        if (maxLine != -1 && maxLine <= flexLinesSize + 1) {
            return false;
        }
        int decorationLength = this.mFlexContainer.getDecorationLengthMainAxis(view, index, indexInFlexLine);
        if (decorationLength > 0) {
            childLength += decorationLength;
        }
        return maxSize < currentLength + childLength;
    }

    private boolean isLastFlexItem(int childIndex, int childCount, FlexLine flexLine) {
        return childIndex == childCount + (-1) && flexLine.getItemCountNotGone() != 0;
    }

    private void addFlexLine(List<FlexLine> flexLines, FlexLine flexLine, int viewIndex, int usedCrossSizeSoFar) {
        flexLine.mSumCrossSizeBefore = usedCrossSizeSoFar;
        this.mFlexContainer.onNewFlexLineAdded(flexLine);
        flexLine.mLastIndex = viewIndex;
        flexLines.add(flexLine);
    }

    private void checkSizeConstraints(View view, int index) {
        boolean needsMeasure = false;
        FlexItem flexItem = (FlexItem) view.getLayoutParams();
        int childWidth = view.getMeasuredWidth();
        int childHeight = view.getMeasuredHeight();
        if (childWidth < flexItem.getMinWidth()) {
            needsMeasure = true;
            childWidth = flexItem.getMinWidth();
        } else if (childWidth > flexItem.getMaxWidth()) {
            needsMeasure = true;
            childWidth = flexItem.getMaxWidth();
        }
        if (childHeight < flexItem.getMinHeight()) {
            needsMeasure = true;
            childHeight = flexItem.getMinHeight();
        } else if (childHeight > flexItem.getMaxHeight()) {
            needsMeasure = true;
            childHeight = flexItem.getMaxHeight();
        }
        if (needsMeasure) {
            int widthSpec = View.MeasureSpec.makeMeasureSpec(childWidth, 1073741824);
            int heightSpec = View.MeasureSpec.makeMeasureSpec(childHeight, 1073741824);
            view.measure(widthSpec, heightSpec);
            updateMeasureCache(index, widthSpec, heightSpec, view);
            this.mFlexContainer.updateViewCache(index, view);
        }
    }

    void determineMainSize(int widthMeasureSpec, int heightMeasureSpec) {
        determineMainSize(widthMeasureSpec, heightMeasureSpec, 0);
    }

    void determineMainSize(int widthMeasureSpec, int heightMeasureSpec, int fromIndex) {
        int mainSize;
        int paddingAlongMainAxis;
        int paddingAlongMainAxis2;
        int flexLineIndex;
        int mainSize2;
        ensureChildrenFrozen(this.mFlexContainer.getFlexItemCount());
        if (fromIndex >= this.mFlexContainer.getFlexItemCount()) {
            return;
        }
        int flexDirection = this.mFlexContainer.getFlexDirection();
        switch (this.mFlexContainer.getFlexDirection()) {
            case 0:
            case 1:
                int widthMode = View.MeasureSpec.getMode(widthMeasureSpec);
                int widthSize = View.MeasureSpec.getSize(widthMeasureSpec);
                int largestMainSize = this.mFlexContainer.getLargestMainSize();
                if (widthMode == 1073741824) {
                    mainSize = widthSize;
                } else {
                    mainSize = Math.min(largestMainSize, widthSize);
                }
                paddingAlongMainAxis = this.mFlexContainer.getPaddingLeft() + this.mFlexContainer.getPaddingRight();
                paddingAlongMainAxis2 = mainSize;
                break;
            case 2:
            case 3:
                int heightMode = View.MeasureSpec.getMode(heightMeasureSpec);
                int heightSize = View.MeasureSpec.getSize(heightMeasureSpec);
                if (heightMode == 1073741824) {
                    mainSize2 = heightSize;
                } else {
                    mainSize2 = this.mFlexContainer.getLargestMainSize();
                }
                int paddingAlongMainAxis3 = this.mFlexContainer.getPaddingTop() + this.mFlexContainer.getPaddingBottom();
                paddingAlongMainAxis = paddingAlongMainAxis3;
                paddingAlongMainAxis2 = mainSize2;
                break;
            default:
                throw new IllegalArgumentException("Invalid flex direction: " + flexDirection);
        }
        if (this.mIndexToFlexLine != null) {
            int flexLineIndex2 = this.mIndexToFlexLine[fromIndex];
            flexLineIndex = flexLineIndex2;
        } else {
            flexLineIndex = 0;
        }
        List<FlexLine> flexLines = this.mFlexContainer.getFlexLinesInternal();
        int i = flexLineIndex;
        int size = flexLines.size();
        for (int i2 = i; i2 < size; i2++) {
            FlexLine flexLine = flexLines.get(i2);
            if (flexLine.mMainSize < paddingAlongMainAxis2 && flexLine.mAnyItemsHaveFlexGrow) {
                expandFlexItems(widthMeasureSpec, heightMeasureSpec, flexLine, paddingAlongMainAxis2, paddingAlongMainAxis, false);
            } else if (flexLine.mMainSize > paddingAlongMainAxis2 && flexLine.mAnyItemsHaveFlexShrink) {
                shrinkFlexItems(widthMeasureSpec, heightMeasureSpec, flexLine, paddingAlongMainAxis2, paddingAlongMainAxis, false);
            }
        }
    }

    private void ensureChildrenFrozen(int size) {
        if (this.mChildrenFrozen == null) {
            this.mChildrenFrozen = new boolean[Math.max(size, 10)];
        } else if (this.mChildrenFrozen.length < size) {
            int newCapacity = this.mChildrenFrozen.length * 2;
            this.mChildrenFrozen = new boolean[Math.max(newCapacity, size)];
        } else {
            Arrays.fill(this.mChildrenFrozen, false);
        }
    }

    /* JADX WARN: Incorrect condition in loop: B:10:0x0035 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void expandFlexItems(int r26, int r27, com.google.android.flexbox.FlexLine r28, int r29, int r30, boolean r31) {
        /*
            Method dump skipped, instructions count: 665
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.flexbox.FlexboxHelper.expandFlexItems(int, int, com.google.android.flexbox.FlexLine, int, int, boolean):void");
    }

    private void shrinkFlexItems(int widthMeasureSpec, int heightMeasureSpec, FlexLine flexLine, int maxMainSize, int paddingAlongMainAxis, boolean calledRecursively) {
        int i;
        float f;
        float unitShrink;
        boolean needsReshrink;
        float accumulatedRoundError;
        boolean z;
        boolean needsReshrink2;
        double d;
        int largestCrossSize;
        float accumulatedRoundError2;
        int childWidthMeasureSpec;
        double d2;
        int childMeasuredHeight;
        boolean needsReshrink3;
        int childMeasuredHeight2;
        float rawCalculatedHeight;
        int newHeight;
        int sizeBeforeShrink = flexLine.mMainSize;
        float f2 = 0.0f;
        if (flexLine.mTotalFlexShrink <= 0.0f || maxMainSize > flexLine.mMainSize) {
            return;
        }
        float unitShrink2 = (flexLine.mMainSize - maxMainSize) / flexLine.mTotalFlexShrink;
        flexLine.mMainSize = paddingAlongMainAxis + flexLine.mDividerLengthInMainSize;
        if (!calledRecursively) {
            flexLine.mCrossSize = Integer.MIN_VALUE;
        }
        boolean needsReshrink4 = false;
        int i2 = 0;
        float accumulatedRoundError3 = 0.0f;
        int largestCrossSize2 = 0;
        while (i2 < flexLine.mItemCount) {
            int index = flexLine.mFirstIndex + i2;
            View child = this.mFlexContainer.getReorderedFlexItemAt(index);
            if (child == null) {
                i = i2;
                f = f2;
                unitShrink = unitShrink2;
                needsReshrink = needsReshrink4;
                accumulatedRoundError = accumulatedRoundError3;
            } else if (child.getVisibility() == 8) {
                i = i2;
                f = f2;
                unitShrink = unitShrink2;
                needsReshrink = needsReshrink4;
                accumulatedRoundError = accumulatedRoundError3;
            } else {
                FlexItem flexItem = (FlexItem) child.getLayoutParams();
                int flexDirection = this.mFlexContainer.getFlexDirection();
                f = f2;
                if (flexDirection == 0) {
                    z = true;
                    unitShrink = unitShrink2;
                    needsReshrink2 = needsReshrink4;
                    d = -1.0d;
                } else if (flexDirection == 1) {
                    z = true;
                    unitShrink = unitShrink2;
                    needsReshrink2 = needsReshrink4;
                    d = -1.0d;
                } else {
                    int childMeasuredHeight3 = child.getMeasuredHeight();
                    if (this.mMeasuredSizeCache == null) {
                        d2 = -1.0d;
                        childMeasuredHeight = childMeasuredHeight3;
                    } else {
                        d2 = -1.0d;
                        int childMeasuredHeight4 = extractHigherInt(this.mMeasuredSizeCache[index]);
                        childMeasuredHeight = childMeasuredHeight4;
                    }
                    int childMeasuredWidth = child.getMeasuredWidth();
                    if (this.mMeasuredSizeCache == null) {
                        unitShrink = unitShrink2;
                        needsReshrink3 = needsReshrink4;
                    } else {
                        unitShrink = unitShrink2;
                        needsReshrink3 = needsReshrink4;
                        childMeasuredWidth = extractLowerInt(this.mMeasuredSizeCache[index]);
                    }
                    if (!this.mChildrenFrozen[index] && flexItem.getFlexShrink() > f) {
                        float rawCalculatedHeight2 = childMeasuredHeight - (flexItem.getFlexShrink() * unitShrink);
                        if (i2 == flexLine.mItemCount - 1) {
                            rawCalculatedHeight2 += accumulatedRoundError3;
                            accumulatedRoundError3 = 0.0f;
                        }
                        int newHeight2 = Math.round(rawCalculatedHeight2);
                        if (newHeight2 < flexItem.getMinHeight()) {
                            newHeight = flexItem.getMinHeight();
                            this.mChildrenFrozen[index] = true;
                            flexLine.mTotalFlexShrink -= flexItem.getFlexShrink();
                            rawCalculatedHeight = rawCalculatedHeight2;
                            needsReshrink3 = true;
                        } else {
                            accumulatedRoundError3 += rawCalculatedHeight2 - newHeight2;
                            rawCalculatedHeight = rawCalculatedHeight2;
                            if (accumulatedRoundError3 > 1.0d) {
                                newHeight = newHeight2 + 1;
                                accumulatedRoundError3 -= 1.0f;
                            } else if (accumulatedRoundError3 >= d2) {
                                newHeight = newHeight2;
                            } else {
                                newHeight = newHeight2 - 1;
                                accumulatedRoundError3 += 1.0f;
                            }
                        }
                        int childWidthMeasureSpec2 = getChildWidthMeasureSpecInternal(widthMeasureSpec, flexItem, flexLine.mSumCrossSizeBefore);
                        int childHeightMeasureSpec = View.MeasureSpec.makeMeasureSpec(newHeight, 1073741824);
                        child.measure(childWidthMeasureSpec2, childHeightMeasureSpec);
                        childMeasuredWidth = child.getMeasuredWidth();
                        int childMeasuredHeight5 = child.getMeasuredHeight();
                        updateMeasureCache(index, childWidthMeasureSpec2, childHeightMeasureSpec, child);
                        this.mFlexContainer.updateViewCache(index, child);
                        childMeasuredHeight2 = childMeasuredHeight5;
                        needsReshrink4 = needsReshrink3;
                    } else {
                        childMeasuredHeight2 = childMeasuredHeight;
                        needsReshrink4 = needsReshrink3;
                    }
                    int childMeasuredHeight6 = childMeasuredHeight2;
                    largestCrossSize = Math.max(largestCrossSize2, flexItem.getMarginLeft() + childMeasuredWidth + flexItem.getMarginRight() + this.mFlexContainer.getDecorationLengthCrossAxis(child));
                    flexLine.mMainSize += childMeasuredHeight6 + flexItem.getMarginTop() + flexItem.getMarginBottom();
                    i = i2;
                    int largestCrossSize3 = flexLine.mCrossSize;
                    flexLine.mCrossSize = Math.max(largestCrossSize3, largestCrossSize);
                    largestCrossSize2 = largestCrossSize;
                    i2 = i + 1;
                    unitShrink2 = unitShrink;
                    f2 = f;
                }
                int childMeasuredWidth2 = child.getMeasuredWidth();
                if (this.mMeasuredSizeCache != null) {
                    accumulatedRoundError2 = accumulatedRoundError3;
                    childMeasuredWidth2 = extractLowerInt(this.mMeasuredSizeCache[index]);
                } else {
                    accumulatedRoundError2 = accumulatedRoundError3;
                }
                int childMeasuredHeight7 = child.getMeasuredHeight();
                if (this.mMeasuredSizeCache != null) {
                    childMeasuredHeight7 = extractHigherInt(this.mMeasuredSizeCache[index]);
                }
                if (this.mChildrenFrozen[index] || flexItem.getFlexShrink() <= f) {
                    i = i2;
                    accumulatedRoundError3 = accumulatedRoundError2;
                    childWidthMeasureSpec = childMeasuredWidth2;
                    needsReshrink4 = needsReshrink2;
                } else {
                    float rawCalculatedWidth = childMeasuredWidth2 - (flexItem.getFlexShrink() * unitShrink);
                    if (i2 != flexLine.mItemCount - 1) {
                        accumulatedRoundError3 = accumulatedRoundError2;
                    } else {
                        rawCalculatedWidth += accumulatedRoundError2;
                        accumulatedRoundError3 = 0.0f;
                    }
                    int newWidth = Math.round(rawCalculatedWidth);
                    i = i2;
                    int i3 = flexItem.getMinWidth();
                    if (newWidth < i3) {
                        newWidth = flexItem.getMinWidth();
                        this.mChildrenFrozen[index] = z;
                        flexLine.mTotalFlexShrink -= flexItem.getFlexShrink();
                        needsReshrink2 = true;
                    } else {
                        accumulatedRoundError3 += rawCalculatedWidth - newWidth;
                        if (accumulatedRoundError3 > 1.0d) {
                            newWidth++;
                            accumulatedRoundError3 -= 1.0f;
                        } else if (accumulatedRoundError3 < d) {
                            newWidth--;
                            accumulatedRoundError3 += 1.0f;
                        }
                    }
                    int childHeightMeasureSpec2 = getChildHeightMeasureSpecInternal(heightMeasureSpec, flexItem, flexLine.mSumCrossSizeBefore);
                    int childWidthMeasureSpec3 = View.MeasureSpec.makeMeasureSpec(newWidth, 1073741824);
                    child.measure(childWidthMeasureSpec3, childHeightMeasureSpec2);
                    int childMeasuredWidth3 = child.getMeasuredWidth();
                    childMeasuredHeight7 = child.getMeasuredHeight();
                    updateMeasureCache(index, childWidthMeasureSpec3, childHeightMeasureSpec2, child);
                    this.mFlexContainer.updateViewCache(index, child);
                    childWidthMeasureSpec = childMeasuredWidth3;
                    needsReshrink4 = needsReshrink2;
                }
                int largestCrossSize4 = Math.max(largestCrossSize2, flexItem.getMarginTop() + childMeasuredHeight7 + flexItem.getMarginBottom() + this.mFlexContainer.getDecorationLengthCrossAxis(child));
                int largestCrossSize5 = flexLine.mMainSize;
                flexLine.mMainSize = largestCrossSize5 + flexItem.getMarginLeft() + childWidthMeasureSpec + flexItem.getMarginRight();
                largestCrossSize = largestCrossSize4;
                int largestCrossSize32 = flexLine.mCrossSize;
                flexLine.mCrossSize = Math.max(largestCrossSize32, largestCrossSize);
                largestCrossSize2 = largestCrossSize;
                i2 = i + 1;
                unitShrink2 = unitShrink;
                f2 = f;
            }
            accumulatedRoundError3 = accumulatedRoundError;
            needsReshrink4 = needsReshrink;
            i2 = i + 1;
            unitShrink2 = unitShrink;
            f2 = f;
        }
        if (needsReshrink4 && sizeBeforeShrink != flexLine.mMainSize) {
            shrinkFlexItems(widthMeasureSpec, heightMeasureSpec, flexLine, maxMainSize, paddingAlongMainAxis, true);
        }
    }

    private int getChildWidthMeasureSpecInternal(int widthMeasureSpec, FlexItem flexItem, int padding) {
        int childWidthMeasureSpec = this.mFlexContainer.getChildWidthMeasureSpec(widthMeasureSpec, this.mFlexContainer.getPaddingLeft() + this.mFlexContainer.getPaddingRight() + flexItem.getMarginLeft() + flexItem.getMarginRight() + padding, flexItem.getWidth());
        int childWidth = View.MeasureSpec.getSize(childWidthMeasureSpec);
        if (childWidth > flexItem.getMaxWidth()) {
            return View.MeasureSpec.makeMeasureSpec(flexItem.getMaxWidth(), View.MeasureSpec.getMode(childWidthMeasureSpec));
        }
        if (childWidth < flexItem.getMinWidth()) {
            return View.MeasureSpec.makeMeasureSpec(flexItem.getMinWidth(), View.MeasureSpec.getMode(childWidthMeasureSpec));
        }
        return childWidthMeasureSpec;
    }

    private int getChildHeightMeasureSpecInternal(int heightMeasureSpec, FlexItem flexItem, int padding) {
        int childHeightMeasureSpec = this.mFlexContainer.getChildHeightMeasureSpec(heightMeasureSpec, this.mFlexContainer.getPaddingTop() + this.mFlexContainer.getPaddingBottom() + flexItem.getMarginTop() + flexItem.getMarginBottom() + padding, flexItem.getHeight());
        int childHeight = View.MeasureSpec.getSize(childHeightMeasureSpec);
        if (childHeight > flexItem.getMaxHeight()) {
            return View.MeasureSpec.makeMeasureSpec(flexItem.getMaxHeight(), View.MeasureSpec.getMode(childHeightMeasureSpec));
        }
        if (childHeight < flexItem.getMinHeight()) {
            return View.MeasureSpec.makeMeasureSpec(flexItem.getMinHeight(), View.MeasureSpec.getMode(childHeightMeasureSpec));
        }
        return childHeightMeasureSpec;
    }

    void determineCrossSize(int widthMeasureSpec, int heightMeasureSpec, int paddingAlongCrossAxis) {
        int mode;
        int size;
        float f;
        int flexDirection = this.mFlexContainer.getFlexDirection();
        switch (flexDirection) {
            case 0:
            case 1:
                mode = View.MeasureSpec.getMode(heightMeasureSpec);
                size = View.MeasureSpec.getSize(heightMeasureSpec);
                break;
            case 2:
            case 3:
                mode = View.MeasureSpec.getMode(widthMeasureSpec);
                size = View.MeasureSpec.getSize(widthMeasureSpec);
                break;
            default:
                throw new IllegalArgumentException("Invalid flex direction: " + flexDirection);
        }
        List<FlexLine> flexLines = this.mFlexContainer.getFlexLinesInternal();
        if (mode == 1073741824) {
            int totalCrossSize = this.mFlexContainer.getSumOfCrossSize() + paddingAlongCrossAxis;
            int i = 1;
            if (flexLines.size() == 1) {
                flexLines.get(0).mCrossSize = size - paddingAlongCrossAxis;
                return;
            }
            char c = 2;
            if (flexLines.size() >= 2) {
                float f2 = -1.0f;
                switch (this.mFlexContainer.getAlignContent()) {
                    case 1:
                        int spaceTop = size - totalCrossSize;
                        FlexLine dummySpaceFlexLine = new FlexLine();
                        dummySpaceFlexLine.mCrossSize = spaceTop;
                        flexLines.add(0, dummySpaceFlexLine);
                        return;
                    case 2:
                        this.mFlexContainer.setFlexLines(constructFlexLinesForAlignContentCenter(flexLines, size, totalCrossSize));
                        return;
                    case 3:
                        if (totalCrossSize < size) {
                            int numberOfSpaces = flexLines.size() - 1;
                            float spaceBetweenFlexLine = (size - totalCrossSize) / numberOfSpaces;
                            float accumulatedError = 0.0f;
                            List<FlexLine> newFlexLines = new ArrayList<>();
                            int i2 = 0;
                            int flexLineSize = flexLines.size();
                            while (i2 < flexLineSize) {
                                FlexLine flexLine = flexLines.get(i2);
                                newFlexLines.add(flexLine);
                                char c2 = c;
                                if (i2 == flexLines.size() - 1) {
                                    f = f2;
                                } else {
                                    FlexLine dummySpaceFlexLine2 = new FlexLine();
                                    f = f2;
                                    if (i2 == flexLines.size() - 2) {
                                        dummySpaceFlexLine2.mCrossSize = Math.round(spaceBetweenFlexLine + accumulatedError);
                                        accumulatedError = 0.0f;
                                    } else {
                                        dummySpaceFlexLine2.mCrossSize = Math.round(spaceBetweenFlexLine);
                                    }
                                    accumulatedError += spaceBetweenFlexLine - dummySpaceFlexLine2.mCrossSize;
                                    if (accumulatedError > 1.0f) {
                                        dummySpaceFlexLine2.mCrossSize++;
                                        accumulatedError -= 1.0f;
                                    } else if (accumulatedError < f) {
                                        dummySpaceFlexLine2.mCrossSize--;
                                        accumulatedError += 1.0f;
                                    }
                                    newFlexLines.add(dummySpaceFlexLine2);
                                }
                                i2++;
                                c = c2;
                                f2 = f;
                            }
                            this.mFlexContainer.setFlexLines(newFlexLines);
                            return;
                        }
                        return;
                    case 4:
                        if (totalCrossSize >= size) {
                            this.mFlexContainer.setFlexLines(constructFlexLinesForAlignContentCenter(flexLines, size, totalCrossSize));
                            return;
                        }
                        int spaceTopAndBottom = size - totalCrossSize;
                        int numberOfSpaces2 = flexLines.size() * 2;
                        List<FlexLine> newFlexLines2 = new ArrayList<>();
                        FlexLine dummySpaceFlexLine3 = new FlexLine();
                        dummySpaceFlexLine3.mCrossSize = spaceTopAndBottom / numberOfSpaces2;
                        for (FlexLine flexLine2 : flexLines) {
                            newFlexLines2.add(dummySpaceFlexLine3);
                            newFlexLines2.add(flexLine2);
                            newFlexLines2.add(dummySpaceFlexLine3);
                        }
                        this.mFlexContainer.setFlexLines(newFlexLines2);
                        return;
                    case 5:
                        if (totalCrossSize < size) {
                            float freeSpaceUnit = (size - totalCrossSize) / flexLines.size();
                            float accumulatedError2 = 0.0f;
                            int i3 = 0;
                            int flexLinesSize = flexLines.size();
                            while (i3 < flexLinesSize) {
                                FlexLine flexLine3 = flexLines.get(i3);
                                float newCrossSizeAsFloat = flexLine3.mCrossSize + freeSpaceUnit;
                                if (i3 == flexLines.size() - i) {
                                    newCrossSizeAsFloat += accumulatedError2;
                                    accumulatedError2 = 0.0f;
                                }
                                int newCrossSize = Math.round(newCrossSizeAsFloat);
                                int i4 = i;
                                accumulatedError2 += newCrossSizeAsFloat - newCrossSize;
                                if (accumulatedError2 > 1.0f) {
                                    newCrossSize++;
                                    accumulatedError2 -= 1.0f;
                                } else if (accumulatedError2 < -1.0f) {
                                    newCrossSize--;
                                    accumulatedError2 += 1.0f;
                                }
                                flexLine3.mCrossSize = newCrossSize;
                                i3++;
                                i = i4;
                            }
                            return;
                        }
                        return;
                    default:
                        return;
                }
            }
        }
    }

    private List<FlexLine> constructFlexLinesForAlignContentCenter(List<FlexLine> flexLines, int size, int totalCrossSize) {
        int spaceAboveAndBottom = size - totalCrossSize;
        List<FlexLine> newFlexLines = new ArrayList<>();
        FlexLine dummySpaceFlexLine = new FlexLine();
        dummySpaceFlexLine.mCrossSize = spaceAboveAndBottom / 2;
        int flexLineSize = flexLines.size();
        for (int i = 0; i < flexLineSize; i++) {
            if (i == 0) {
                newFlexLines.add(dummySpaceFlexLine);
            }
            FlexLine flexLine = flexLines.get(i);
            newFlexLines.add(flexLine);
            if (i == flexLines.size() - 1) {
                newFlexLines.add(dummySpaceFlexLine);
            }
        }
        return newFlexLines;
    }

    void stretchViews() {
        stretchViews(0);
    }

    void stretchViews(int fromIndex) {
        char c;
        if (fromIndex >= this.mFlexContainer.getFlexItemCount()) {
            return;
        }
        int flexDirection = this.mFlexContainer.getFlexDirection();
        char c2 = 4;
        if (this.mFlexContainer.getAlignItems() == 4) {
            int flexLineIndex = 0;
            if (this.mIndexToFlexLine != null) {
                flexLineIndex = this.mIndexToFlexLine[fromIndex];
            }
            List<FlexLine> flexLines = this.mFlexContainer.getFlexLinesInternal();
            int size = flexLines.size();
            for (int i = flexLineIndex; i < size; i++) {
                FlexLine flexLine = flexLines.get(i);
                int j = 0;
                int itemCount = flexLine.mItemCount;
                while (j < itemCount) {
                    int viewIndex = flexLine.mFirstIndex + j;
                    if (j >= this.mFlexContainer.getFlexItemCount()) {
                        c = c2;
                    } else {
                        View view = this.mFlexContainer.getReorderedFlexItemAt(viewIndex);
                        if (view == null) {
                            c = c2;
                        } else if (view.getVisibility() == 8) {
                            c = c2;
                        } else {
                            FlexItem flexItem = (FlexItem) view.getLayoutParams();
                            if (flexItem.getAlignSelf() == -1) {
                                c = 4;
                            } else {
                                c = 4;
                                if (flexItem.getAlignSelf() != 4) {
                                    continue;
                                }
                            }
                            switch (flexDirection) {
                                case 0:
                                case 1:
                                    stretchViewVertically(view, flexLine.mCrossSize, viewIndex);
                                    break;
                                case 2:
                                case 3:
                                    stretchViewHorizontally(view, flexLine.mCrossSize, viewIndex);
                                    break;
                                default:
                                    throw new IllegalArgumentException("Invalid flex direction: " + flexDirection);
                            }
                        }
                    }
                    j++;
                    c2 = c;
                }
            }
            return;
        }
        for (FlexLine flexLine2 : this.mFlexContainer.getFlexLinesInternal()) {
            for (Integer index : flexLine2.mIndicesAlignSelfStretch) {
                View view2 = this.mFlexContainer.getReorderedFlexItemAt(index.intValue());
                switch (flexDirection) {
                    case 0:
                    case 1:
                        stretchViewVertically(view2, flexLine2.mCrossSize, index.intValue());
                        break;
                    case 2:
                    case 3:
                        stretchViewHorizontally(view2, flexLine2.mCrossSize, index.intValue());
                        break;
                    default:
                        throw new IllegalArgumentException("Invalid flex direction: " + flexDirection);
                }
            }
        }
    }

    private void stretchViewVertically(View view, int crossSize, int index) {
        int measuredWidth;
        FlexItem flexItem = (FlexItem) view.getLayoutParams();
        int newHeight = ((crossSize - flexItem.getMarginTop()) - flexItem.getMarginBottom()) - this.mFlexContainer.getDecorationLengthCrossAxis(view);
        int newHeight2 = Math.min(Math.max(newHeight, flexItem.getMinHeight()), flexItem.getMaxHeight());
        if (this.mMeasuredSizeCache != null) {
            measuredWidth = extractLowerInt(this.mMeasuredSizeCache[index]);
        } else {
            measuredWidth = view.getMeasuredWidth();
        }
        int childWidthSpec = View.MeasureSpec.makeMeasureSpec(measuredWidth, 1073741824);
        int childHeightSpec = View.MeasureSpec.makeMeasureSpec(newHeight2, 1073741824);
        view.measure(childWidthSpec, childHeightSpec);
        updateMeasureCache(index, childWidthSpec, childHeightSpec, view);
        this.mFlexContainer.updateViewCache(index, view);
    }

    private void stretchViewHorizontally(View view, int crossSize, int index) {
        int measuredHeight;
        FlexItem flexItem = (FlexItem) view.getLayoutParams();
        int newWidth = ((crossSize - flexItem.getMarginLeft()) - flexItem.getMarginRight()) - this.mFlexContainer.getDecorationLengthCrossAxis(view);
        int newWidth2 = Math.min(Math.max(newWidth, flexItem.getMinWidth()), flexItem.getMaxWidth());
        if (this.mMeasuredSizeCache != null) {
            measuredHeight = extractHigherInt(this.mMeasuredSizeCache[index]);
        } else {
            measuredHeight = view.getMeasuredHeight();
        }
        int childHeightSpec = View.MeasureSpec.makeMeasureSpec(measuredHeight, 1073741824);
        int childWidthSpec = View.MeasureSpec.makeMeasureSpec(newWidth2, 1073741824);
        view.measure(childWidthSpec, childHeightSpec);
        updateMeasureCache(index, childWidthSpec, childHeightSpec, view);
        this.mFlexContainer.updateViewCache(index, view);
    }

    void layoutSingleChildHorizontal(View view, FlexLine flexLine, int left, int top, int right, int bottom) {
        FlexItem flexItem = (FlexItem) view.getLayoutParams();
        int alignItems = this.mFlexContainer.getAlignItems();
        if (flexItem.getAlignSelf() != -1) {
            alignItems = flexItem.getAlignSelf();
        }
        int crossSize = flexLine.mCrossSize;
        switch (alignItems) {
            case 0:
            case 4:
                if (this.mFlexContainer.getFlexWrap() != 2) {
                    view.layout(left, flexItem.getMarginTop() + top, right, flexItem.getMarginTop() + bottom);
                    break;
                } else {
                    view.layout(left, top - flexItem.getMarginBottom(), right, bottom - flexItem.getMarginBottom());
                    break;
                }
            case 1:
                if (this.mFlexContainer.getFlexWrap() != 2) {
                    view.layout(left, ((top + crossSize) - view.getMeasuredHeight()) - flexItem.getMarginBottom(), right, (top + crossSize) - flexItem.getMarginBottom());
                    break;
                } else {
                    view.layout(left, (top - crossSize) + view.getMeasuredHeight() + flexItem.getMarginTop(), right, (bottom - crossSize) + view.getMeasuredHeight() + flexItem.getMarginTop());
                    break;
                }
            case 2:
                int topFromCrossAxis = (((crossSize - view.getMeasuredHeight()) + flexItem.getMarginTop()) - flexItem.getMarginBottom()) / 2;
                if (this.mFlexContainer.getFlexWrap() != 2) {
                    view.layout(left, top + topFromCrossAxis, right, top + topFromCrossAxis + view.getMeasuredHeight());
                    break;
                } else {
                    view.layout(left, top - topFromCrossAxis, right, (top - topFromCrossAxis) + view.getMeasuredHeight());
                    break;
                }
            case 3:
                if (this.mFlexContainer.getFlexWrap() != 2) {
                    int marginTop = Math.max(flexLine.mMaxBaseline - view.getBaseline(), flexItem.getMarginTop());
                    view.layout(left, top + marginTop, right, bottom + marginTop);
                    break;
                } else {
                    int marginBottom = Math.max((flexLine.mMaxBaseline - view.getMeasuredHeight()) + view.getBaseline(), flexItem.getMarginBottom());
                    view.layout(left, top - marginBottom, right, bottom - marginBottom);
                    break;
                }
        }
    }

    void layoutSingleChildVertical(View view, FlexLine flexLine, boolean isRtl, int left, int top, int right, int bottom) {
        FlexItem flexItem = (FlexItem) view.getLayoutParams();
        int alignItems = this.mFlexContainer.getAlignItems();
        if (flexItem.getAlignSelf() != -1) {
            alignItems = flexItem.getAlignSelf();
        }
        int crossSize = flexLine.mCrossSize;
        switch (alignItems) {
            case 0:
            case 3:
            case 4:
                if (!isRtl) {
                    view.layout(flexItem.getMarginLeft() + left, top, flexItem.getMarginLeft() + right, bottom);
                    break;
                } else {
                    view.layout(left - flexItem.getMarginRight(), top, right - flexItem.getMarginRight(), bottom);
                    break;
                }
            case 1:
                if (!isRtl) {
                    view.layout(((left + crossSize) - view.getMeasuredWidth()) - flexItem.getMarginRight(), top, ((right + crossSize) - view.getMeasuredWidth()) - flexItem.getMarginRight(), bottom);
                    break;
                } else {
                    view.layout((left - crossSize) + view.getMeasuredWidth() + flexItem.getMarginLeft(), top, (right - crossSize) + view.getMeasuredWidth() + flexItem.getMarginLeft(), bottom);
                    break;
                }
            case 2:
                ViewGroup.MarginLayoutParams lp = (ViewGroup.MarginLayoutParams) view.getLayoutParams();
                int leftFromCrossAxis = (((crossSize - view.getMeasuredWidth()) + MarginLayoutParamsCompat.getMarginStart(lp)) - MarginLayoutParamsCompat.getMarginEnd(lp)) / 2;
                if (!isRtl) {
                    view.layout(left + leftFromCrossAxis, top, right + leftFromCrossAxis, bottom);
                    break;
                } else {
                    view.layout(left - leftFromCrossAxis, top, right - leftFromCrossAxis, bottom);
                    break;
                }
        }
    }

    void ensureMeasuredSizeCache(int size) {
        if (this.mMeasuredSizeCache == null) {
            this.mMeasuredSizeCache = new long[Math.max(size, 10)];
        } else if (this.mMeasuredSizeCache.length < size) {
            int newCapacity = this.mMeasuredSizeCache.length * 2;
            this.mMeasuredSizeCache = Arrays.copyOf(this.mMeasuredSizeCache, Math.max(newCapacity, size));
        }
    }

    void ensureMeasureSpecCache(int size) {
        if (this.mMeasureSpecCache == null) {
            this.mMeasureSpecCache = new long[Math.max(size, 10)];
        } else if (this.mMeasureSpecCache.length < size) {
            int newCapacity = this.mMeasureSpecCache.length * 2;
            this.mMeasureSpecCache = Arrays.copyOf(this.mMeasureSpecCache, Math.max(newCapacity, size));
        }
    }

    int extractLowerInt(long longValue) {
        return (int) longValue;
    }

    int extractHigherInt(long longValue) {
        return (int) (longValue >> 32);
    }

    long makeCombinedLong(int widthMeasureSpec, int heightMeasureSpec) {
        return (heightMeasureSpec << 32) | (widthMeasureSpec & MEASURE_SPEC_WIDTH_MASK);
    }

    private void updateMeasureCache(int index, int widthMeasureSpec, int heightMeasureSpec, View view) {
        if (this.mMeasureSpecCache != null) {
            this.mMeasureSpecCache[index] = makeCombinedLong(widthMeasureSpec, heightMeasureSpec);
        }
        if (this.mMeasuredSizeCache != null) {
            this.mMeasuredSizeCache[index] = makeCombinedLong(view.getMeasuredWidth(), view.getMeasuredHeight());
        }
    }

    void ensureIndexToFlexLine(int size) {
        if (this.mIndexToFlexLine == null) {
            this.mIndexToFlexLine = new int[Math.max(size, 10)];
        } else if (this.mIndexToFlexLine.length < size) {
            int newCapacity = this.mIndexToFlexLine.length * 2;
            this.mIndexToFlexLine = Arrays.copyOf(this.mIndexToFlexLine, Math.max(newCapacity, size));
        }
    }

    void clearFlexLines(List<FlexLine> flexLines, int fromFlexItem) {
        if (this.mIndexToFlexLine == null) {
            throw new AssertionError();
        }
        if (this.mMeasureSpecCache == null) {
            throw new AssertionError();
        }
        int fromFlexLine = this.mIndexToFlexLine[fromFlexItem];
        if (fromFlexLine == -1) {
            fromFlexLine = 0;
        }
        if (flexLines.size() > fromFlexLine) {
            flexLines.subList(fromFlexLine, flexLines.size()).clear();
        }
        int fillTo = this.mIndexToFlexLine.length - 1;
        if (fromFlexItem > fillTo) {
            Arrays.fill(this.mIndexToFlexLine, -1);
        } else {
            Arrays.fill(this.mIndexToFlexLine, fromFlexItem, fillTo, -1);
        }
        int fillTo2 = this.mMeasureSpecCache.length - 1;
        if (fromFlexItem > fillTo2) {
            Arrays.fill(this.mMeasureSpecCache, 0L);
        } else {
            Arrays.fill(this.mMeasureSpecCache, fromFlexItem, fillTo2, 0L);
        }
    }

    private static class Order implements Comparable<Order> {
        int index;
        int order;

        private Order() {
        }

        @Override // java.lang.Comparable
        public int compareTo(Order another) {
            if (this.order != another.order) {
                return this.order - another.order;
            }
            return this.index - another.index;
        }

        public String toString() {
            return "Order{order=" + this.order + ", index=" + this.index + '}';
        }
    }

    static class FlexLinesResult {
        int mChildState;
        List<FlexLine> mFlexLines;

        FlexLinesResult() {
        }

        void reset() {
            this.mFlexLines = null;
            this.mChildState = 0;
        }
    }
}
