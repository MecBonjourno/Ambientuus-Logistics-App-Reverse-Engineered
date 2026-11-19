package org.chromium.net.httpflags;

import com.google.protobuf.MessageLiteOrBuilder;
import java.util.List;
import org.chromium.net.httpflags.FlagValue;

/* carregado de: classes17.dex */
public interface FlagValueOrBuilder extends MessageLiteOrBuilder {
    FlagValue.ConstrainedValue getConstrainedValues(int i);

    int getConstrainedValuesCount();

    List<FlagValue.ConstrainedValue> getConstrainedValuesList();
}
