package okio;

import java.util.AbstractList;
import java.util.List;
import java.util.RandomAccess;

/* loaded from: classes17.dex */
public final class Options extends AbstractList<ByteString> implements RandomAccess {
    final ByteString[] byteStrings;
    final int[] trie;

    private Options(ByteString[] byteStrings, int[] trie) {
        this.byteStrings = byteStrings;
        this.trie = trie;
    }

    /* JADX WARN: Code restructure failed: missing block: B:40:0x00bc, code lost:
    
        continue;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static okio.Options of(okio.ByteString... r12) {
        /*
            Method dump skipped, instructions count: 258
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: okio.Options.of(okio.ByteString[]):okio.Options");
    }

    private static void buildTrieRecursive(long nodeOffset, Buffer node, int byteStringOffset, List<ByteString> byteStrings, int fromIndex, int toIndex, List<Integer> indexes) {
        int fromIndex2;
        ByteString from;
        int prefixIndex;
        int selectChoiceCount;
        int rangeEnd;
        long childNodesOffset;
        int rangeEnd2;
        int selectChoiceCount2;
        int selectChoiceCount3 = byteStringOffset;
        if (fromIndex >= toIndex) {
            throw new AssertionError();
        }
        for (int i = fromIndex; i < toIndex; i++) {
            if (byteStrings.get(i).size() < selectChoiceCount3) {
                throw new AssertionError();
            }
        }
        ByteString from2 = byteStrings.get(fromIndex);
        ByteString to = byteStrings.get(toIndex - 1);
        if (selectChoiceCount3 != from2.size()) {
            fromIndex2 = fromIndex;
            from = from2;
            prefixIndex = -1;
        } else {
            int prefixIndex2 = indexes.get(fromIndex).intValue();
            int fromIndex3 = fromIndex + 1;
            fromIndex2 = fromIndex3;
            from = byteStrings.get(fromIndex3);
            prefixIndex = prefixIndex2;
        }
        if (from.getByte(selectChoiceCount3) != to.getByte(selectChoiceCount3)) {
            int selectChoiceCount4 = 1;
            for (int i2 = fromIndex2 + 1; i2 < toIndex; i2++) {
                if (byteStrings.get(i2 - 1).getByte(selectChoiceCount3) != byteStrings.get(i2).getByte(selectChoiceCount3)) {
                    selectChoiceCount4++;
                }
            }
            int i3 = intCount(node);
            long childNodesOffset2 = nodeOffset + i3 + 2 + (selectChoiceCount4 * 2);
            node.writeInt(selectChoiceCount4);
            node.writeInt(prefixIndex);
            for (int i4 = fromIndex2; i4 < toIndex; i4++) {
                byte rangeByte = byteStrings.get(i4).getByte(selectChoiceCount3);
                if (i4 == fromIndex2 || rangeByte != byteStrings.get(i4 - 1).getByte(selectChoiceCount3)) {
                    node.writeInt(rangeByte & 255);
                }
            }
            Buffer childNodes = new Buffer();
            int rangeStart = fromIndex2;
            while (rangeStart < toIndex) {
                byte rangeByte2 = byteStrings.get(rangeStart).getByte(selectChoiceCount3);
                int i5 = rangeStart + 1;
                while (true) {
                    if (i5 >= toIndex) {
                        selectChoiceCount = selectChoiceCount4;
                        rangeEnd = toIndex;
                        break;
                    }
                    selectChoiceCount = selectChoiceCount4;
                    if (rangeByte2 == byteStrings.get(i5).getByte(selectChoiceCount3)) {
                        i5++;
                        selectChoiceCount4 = selectChoiceCount;
                    } else {
                        int rangeEnd3 = i5;
                        rangeEnd = rangeEnd3;
                        break;
                    }
                }
                int i6 = rangeStart + 1;
                if (i6 != rangeEnd || selectChoiceCount3 + 1 != byteStrings.get(rangeStart).size()) {
                    int rangeEnd4 = rangeEnd;
                    node.writeInt((int) ((intCount(childNodes) + childNodesOffset2) * (-1)));
                    childNodesOffset = childNodesOffset2;
                    rangeEnd2 = rangeEnd4;
                    selectChoiceCount2 = selectChoiceCount;
                    buildTrieRecursive(childNodesOffset, childNodes, byteStringOffset + 1, byteStrings, rangeStart, rangeEnd2, indexes);
                } else {
                    node.writeInt(indexes.get(rangeStart).intValue());
                    selectChoiceCount2 = selectChoiceCount;
                    rangeEnd2 = rangeEnd;
                    childNodesOffset = childNodesOffset2;
                }
                rangeStart = rangeEnd2;
                childNodesOffset2 = childNodesOffset;
                selectChoiceCount4 = selectChoiceCount2;
                selectChoiceCount3 = byteStringOffset;
            }
            node.write(childNodes, childNodes.size());
            return;
        }
        int scanByteCount = 0;
        int max = Math.min(from.size(), to.size());
        for (int i7 = byteStringOffset; i7 < max && from.getByte(i7) == to.getByte(i7); i7++) {
            scanByteCount++;
        }
        int i8 = intCount(node);
        long childNodesOffset3 = nodeOffset + i8 + 2 + scanByteCount + 1;
        node.writeInt(-scanByteCount);
        node.writeInt(prefixIndex);
        for (int i9 = byteStringOffset; i9 < byteStringOffset + scanByteCount; i9++) {
            node.writeInt(from.getByte(i9) & 255);
        }
        int i10 = fromIndex2 + 1;
        if (i10 == toIndex) {
            if (byteStringOffset + scanByteCount == byteStrings.get(fromIndex2).size()) {
                node.writeInt(indexes.get(fromIndex2).intValue());
                return;
            }
            throw new AssertionError();
        }
        Buffer childNodes2 = new Buffer();
        node.writeInt((int) ((intCount(childNodes2) + childNodesOffset3) * (-1)));
        buildTrieRecursive(childNodesOffset3, childNodes2, byteStringOffset + scanByteCount, byteStrings, fromIndex2, toIndex, indexes);
        node.write(childNodes2, childNodes2.size());
    }

    @Override // java.util.AbstractList, java.util.List
    public ByteString get(int i) {
        return this.byteStrings[i];
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.byteStrings.length;
    }

    private static int intCount(Buffer trieBytes) {
        return (int) (trieBytes.size() / 4);
    }
}
