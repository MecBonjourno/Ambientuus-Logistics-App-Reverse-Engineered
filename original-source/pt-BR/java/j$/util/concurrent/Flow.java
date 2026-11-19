package j$.util.concurrent;

import java.util.concurrent.Flow;

/* carregado de: classes15.dex */
public final class Flow {
    static final int DEFAULT_BUFFER_SIZE = 256;

    public interface Processor<T, R> extends Subscriber<T>, Publisher<R> {
    }

    public interface Publisher<T> {

        /* compiled from: D8$$SyntheticClass */
        public final /* sintético */ class VivifiedWrapper implements Publisher {
            public final /* sintético */ Flow.Publisher wrappedValue;

            private /* sintético */ VivifiedWrapper(Flow.Publisher publisher) {
                this.wrappedValue = publisher;
            }

            public static /* sintético */ Publisher convert(Flow.Publisher publisher) {
                if (publisher == null) {
                    return null;
                }
                return publisher instanceof Wrapper ? Publisher.this : new VivifiedWrapper(publisher);
            }

            public /* sintético */ boolean equals(Object obj) {
                Flow.Publisher publisher = this.wrappedValue;
                if (obj instanceof VivifiedWrapper) {
                    obj = ((VivifiedWrapper) obj).wrappedValue;
                }
                return publisher.equals(obj);
            }

            public /* sintético */ int hashCode() {
                return this.wrappedValue.hashCode();
            }

            @Override // j$.util.concurrent.Flow.Publisher
            public /* sintético */ void subscribe(Subscriber subscriber) {
                this.wrappedValue.subscribe(Subscriber.Wrapper.convert(subscriber));
            }
        }

        /* compiled from: D8$$SyntheticClass */
        public final /* sintético */ class Wrapper implements Flow.Publisher {
            private /* sintético */ Wrapper() {
            }

            public static /* sintético */ Flow.Publisher convert(Publisher publisher) {
                if (publisher == null) {
                    return null;
                }
                return publisher instanceof VivifiedWrapper ? ((VivifiedWrapper) publisher).wrappedValue : new Wrapper();
            }

            public /* sintético */ boolean equals(Object obj) {
                Publisher publisher = Publisher.this;
                if (obj instanceof Wrapper) {
                    obj = Publisher.this;
                }
                return publisher.equals(obj);
            }

            public /* sintético */ int hashCode() {
                return Publisher.this.hashCode();
            }

            @Override // java.util.concurrent.Flow.Publisher
            public /* sintético */ void subscribe(Flow.Subscriber subscriber) {
                Publisher.this.subscribe(Subscriber.VivifiedWrapper.convert(subscriber));
            }
        }

        void subscribe(Subscriber<? super T> subscriber);
    }

    public interface Subscriber<T> {

        /* compiled from: D8$$SyntheticClass */
        public final /* sintético */ class VivifiedWrapper implements Subscriber {
            public final /* sintético */ Flow.Subscriber wrappedValue;

            private /* sintético */ VivifiedWrapper(Flow.Subscriber subscriber) {
                this.wrappedValue = subscriber;
            }

            public static /* sintético */ Subscriber convert(Flow.Subscriber subscriber) {
                if (subscriber == null) {
                    return null;
                }
                return subscriber instanceof Wrapper ? Subscriber.this : new VivifiedWrapper(subscriber);
            }

            public /* sintético */ boolean equals(Object obj) {
                Flow.Subscriber subscriber = this.wrappedValue;
                if (obj instanceof VivifiedWrapper) {
                    obj = ((VivifiedWrapper) obj).wrappedValue;
                }
                return subscriber.equals(obj);
            }

            public /* sintético */ int hashCode() {
                return this.wrappedValue.hashCode();
            }

            @Override // j$.util.concurrent.Flow.Subscriber
            public /* sintético */ void onComplete() {
                this.wrappedValue.onComplete();
            }

            @Override // j$.util.concurrent.Flow.Subscriber
            public /* sintético */ void onError(Throwable th) {
                this.wrappedValue.onError(th);
            }

            @Override // j$.util.concurrent.Flow.Subscriber
            public /* sintético */ void onNext(Object obj) {
                this.wrappedValue.onNext(obj);
            }

            @Override // j$.util.concurrent.Flow.Subscriber
            public /* sintético */ void onSubscribe(Subscription subscription) {
                this.wrappedValue.onSubscribe(Subscription.Wrapper.convert(subscription));
            }
        }

        /* compiled from: D8$$SyntheticClass */
        public final /* sintético */ class Wrapper implements Flow.Subscriber {
            private /* sintético */ Wrapper() {
            }

            public static /* sintético */ Flow.Subscriber convert(Subscriber subscriber) {
                if (subscriber == null) {
                    return null;
                }
                return subscriber instanceof VivifiedWrapper ? ((VivifiedWrapper) subscriber).wrappedValue : new Wrapper();
            }

            public /* sintético */ boolean equals(Object obj) {
                Subscriber subscriber = Subscriber.this;
                if (obj instanceof Wrapper) {
                    obj = Subscriber.this;
                }
                return subscriber.equals(obj);
            }

            public /* sintético */ int hashCode() {
                return Subscriber.this.hashCode();
            }

            @Override // java.util.concurrent.Flow.Subscriber
            public /* sintético */ void onComplete() {
                Subscriber.this.onComplete();
            }

            @Override // java.util.concurrent.Flow.Subscriber
            public /* sintético */ void onError(Throwable th) {
                Subscriber.this.onError(th);
            }

            @Override // java.util.concurrent.Flow.Subscriber
            public /* sintético */ void onNext(Object obj) {
                Subscriber.this.onNext(obj);
            }

            @Override // java.util.concurrent.Flow.Subscriber
            public /* sintético */ void onSubscribe(Flow.Subscription subscription) {
                Subscriber.this.onSubscribe(Subscription.VivifiedWrapper.convert(subscription));
            }
        }

        void onComplete();

        void onError(Throwable th);

        void onNext(T t);

        void onSubscribe(Subscription subscription);
    }

    public interface Subscription {

        /* compiled from: D8$$SyntheticClass */
        public final /* sintético */ class VivifiedWrapper implements Subscription {
            public final /* sintético */ Flow.Subscription wrappedValue;

            private /* sintético */ VivifiedWrapper(Flow.Subscription subscription) {
                this.wrappedValue = subscription;
            }

            public static /* sintético */ Subscription convert(Flow.Subscription subscription) {
                if (subscription == null) {
                    return null;
                }
                return subscription instanceof Wrapper ? Subscription.this : new VivifiedWrapper(subscription);
            }

            @Override // j$.util.concurrent.Flow.Subscription
            public /* sintético */ void cancel() {
                this.wrappedValue.cancel();
            }

            public /* sintético */ boolean equals(Object obj) {
                Flow.Subscription subscription = this.wrappedValue;
                if (obj instanceof VivifiedWrapper) {
                    obj = ((VivifiedWrapper) obj).wrappedValue;
                }
                return subscription.equals(obj);
            }

            public /* sintético */ int hashCode() {
                return this.wrappedValue.hashCode();
            }

            @Override // j$.util.concurrent.Flow.Subscription
            public /* sintético */ void request(long j) {
                this.wrappedValue.request(j);
            }
        }

        /* compiled from: D8$$SyntheticClass */
        public final /* sintético */ class Wrapper implements Flow.Subscription {
            private /* sintético */ Wrapper() {
            }

            public static /* sintético */ Flow.Subscription convert(Subscription subscription) {
                if (subscription == null) {
                    return null;
                }
                return subscription instanceof VivifiedWrapper ? ((VivifiedWrapper) subscription).wrappedValue : subscription.new Wrapper();
            }

            @Override // java.util.concurrent.Flow.Subscription
            public /* sintético */ void cancel() {
                Subscription.this.cancel();
            }

            public /* sintético */ boolean equals(Object obj) {
                Subscription subscription = Subscription.this;
                if (obj instanceof Wrapper) {
                    obj = Subscription.this;
                }
                return subscription.equals(obj);
            }

            public /* sintético */ int hashCode() {
                return Subscription.this.hashCode();
            }

            @Override // java.util.concurrent.Flow.Subscription
            public /* sintético */ void request(long j) {
                Subscription.this.request(j);
            }
        }

        void cancel();

        void request(long j);
    }

    private Flow() {
    }

    public static int defaultBufferSize() {
        return 256;
    }
}
