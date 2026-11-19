package com.google.protobuf;

import java.nio.ByteBuffer;

@CheckReturnValue
/* carregado de: classes16.dex */
abstract class BufferAllocator {
    private static final BufferAllocator UNPOOLED = new BufferAllocator() { // da classe: com.google.protobuf.BufferAllocator.1
        @Override // com.google.protobuf.BufferAllocator
        public AllocatedBuffer allocateHeapBuffer(int capacity) {
            return AllocatedBuffer.wrap(new byte[capacity]);
        }

        @Override // com.google.protobuf.BufferAllocator
        public AllocatedBuffer allocateDirectBuffer(int capacity) {
            return AllocatedBuffer.wrap(ByteBuffer.allocateDirect(capacity));
        }
    };

    public abstract AllocatedBuffer allocateDirectBuffer(int capacity);

    public abstract AllocatedBuffer allocateHeapBuffer(int capacity);

    BufferAllocator() {
    }

    public static BufferAllocator unpooled() {
        return UNPOOLED;
    }
}
