package org.chromium.base;

import android.text.TextUtils;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;
import org.chromium.build.annotations.MainDex;

@MainDex
/* loaded from: classes17.dex */
public abstract class CommandLine {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private static final String SWITCH_PREFIX = "--";
    private static final String SWITCH_TERMINATOR = "--";
    private static final String SWITCH_VALUE_SEPARATOR = "=";
    private static final String TAG = "CommandLine";
    private static final AtomicReference<CommandLine> sCommandLine = new AtomicReference<>();

    interface Natives {
        void appendSwitch(String str);

        void appendSwitchWithValue(String str, String str2);

        void appendSwitchesAndArguments(String[] strArr);

        String getSwitchValue(String str);

        String[] getSwitchesFlattened();

        boolean hasSwitch(String str);

        void init(String[] strArr);

        void removeSwitch(String str);
    }

    public abstract void appendSwitch(String str);

    public abstract void appendSwitchWithValue(String str, String str2);

    public abstract void appendSwitchesAndArguments(String[] strArr);

    protected abstract String[] getCommandLineArguments();

    public abstract String getSwitchValue(String str);

    public abstract Map getSwitches();

    public abstract boolean hasSwitch(String str);

    public abstract void removeSwitch(String str);

    public String getSwitchValue(String switchString, String defaultValue) {
        String value = getSwitchValue(switchString);
        return TextUtils.isEmpty(value) ? defaultValue : value;
    }

    public boolean isNativeImplementation() {
        return false;
    }

    protected void destroy() {
    }

    public static boolean isInitialized() {
        return sCommandLine.get() != null;
    }

    public static CommandLine getInstance() {
        CommandLine commandLine = sCommandLine.get();
        if (commandLine == null) {
            throw new AssertionError();
        }
        return commandLine;
    }

    public static void init(String[] args) {
        setInstance(new JavaCommandLine(args));
    }

    public static void initFromFile(String file) {
        char[] buffer = readFileAsUtf8(file);
        String[] tokenized = buffer == null ? null : tokenizeQuotedArguments(buffer);
        init(tokenized);
        if (tokenized != null) {
            Log.i(TAG, "COMMAND-LINE FLAGS: %s (from %s)", Arrays.toString(tokenized), file);
        }
    }

    static void resetForTesting() {
        setInstance(null);
    }

    static String[] tokenizeQuotedArguments(char[] buffer) {
        if (buffer.length > 98304) {
            throw new RuntimeException("Flags file too big: " + buffer.length);
        }
        ArrayList<String> args = new ArrayList<>();
        StringBuilder arg = null;
        char currentQuote = 0;
        for (char c : buffer) {
            if ((currentQuote == 0 && (c == '\'' || c == '\"')) || c == currentQuote) {
                if (arg != null && arg.length() > 0 && arg.charAt(arg.length() - 1) == '\\') {
                    arg.setCharAt(arg.length() - 1, c);
                } else {
                    currentQuote = currentQuote == 0 ? c : (char) 0;
                }
            } else if (currentQuote == 0 && Character.isWhitespace(c)) {
                if (arg != null) {
                    args.add(arg.toString());
                    arg = null;
                }
            } else {
                if (arg == null) {
                    arg = new StringBuilder();
                }
                arg.append(c);
            }
        }
        if (arg != null) {
            if (currentQuote != 0) {
                Log.w(TAG, "Unterminated quoted string: %s", arg);
            }
            args.add(arg.toString());
        }
        return (String[]) args.toArray(new String[args.size()]);
    }

    public static void enableNativeProxy() {
        sCommandLine.set(new NativeCommandLine(getJavaSwitchesOrNull()));
    }

    public static String[] getJavaSwitchesOrNull() {
        CommandLine commandLine = sCommandLine.get();
        if (commandLine != null) {
            return commandLine.getCommandLineArguments();
        }
        return null;
    }

    private static void setInstance(CommandLine commandLine) {
        CommandLine oldCommandLine = sCommandLine.getAndSet(commandLine);
        if (oldCommandLine != null) {
            oldCommandLine.destroy();
        }
    }

    private static char[] readFileAsUtf8(String fileName) {
        File f = new File(fileName);
        try {
            FileReader reader = new FileReader(f);
            try {
                char[] buffer = new char[(int) f.length()];
                int charsRead = reader.read(buffer);
                char[] copyOfRange = Arrays.copyOfRange(buffer, 0, charsRead);
                reader.close();
                return copyOfRange;
            } finally {
            }
        } catch (IOException e) {
            return null;
        }
    }

    private CommandLine() {
    }

    static class JavaCommandLine extends CommandLine {
        static final /* synthetic */ boolean $assertionsDisabled = false;
        private ArrayList<String> mArgs;
        private int mArgsBegin;
        private HashMap<String, String> mSwitches;

        JavaCommandLine(String[] args) {
            super();
            this.mSwitches = new HashMap<>();
            this.mArgs = new ArrayList<>();
            this.mArgsBegin = 1;
            if (args == null || args.length == 0 || args[0] == null) {
                this.mArgs.add("");
            } else {
                this.mArgs.add(args[0]);
                appendSwitchesInternal(args, 1);
            }
            if (this.mArgs.size() <= 0) {
                throw new AssertionError();
            }
        }

        @Override // org.chromium.base.CommandLine
        protected String[] getCommandLineArguments() {
            return (String[]) this.mArgs.toArray(new String[this.mArgs.size()]);
        }

        @Override // org.chromium.base.CommandLine
        public boolean hasSwitch(String switchString) {
            return this.mSwitches.containsKey(switchString);
        }

        @Override // org.chromium.base.CommandLine
        public String getSwitchValue(String switchString) {
            String value = this.mSwitches.get(switchString);
            if (value == null || value.isEmpty()) {
                return null;
            }
            return value;
        }

        @Override // org.chromium.base.CommandLine
        public Map<String, String> getSwitches() {
            return new HashMap(this.mSwitches);
        }

        @Override // org.chromium.base.CommandLine
        public void appendSwitch(String switchString) {
            appendSwitchWithValue(switchString, null);
        }

        @Override // org.chromium.base.CommandLine
        public void appendSwitchWithValue(String switchString, String value) {
            this.mSwitches.put(switchString, value == null ? "" : value);
            String combinedSwitchString = "--" + switchString;
            if (value != null && !value.isEmpty()) {
                combinedSwitchString = combinedSwitchString + CommandLine.SWITCH_VALUE_SEPARATOR + value;
            }
            ArrayList<String> arrayList = this.mArgs;
            int i = this.mArgsBegin;
            this.mArgsBegin = i + 1;
            arrayList.add(i, combinedSwitchString);
        }

        @Override // org.chromium.base.CommandLine
        public void appendSwitchesAndArguments(String[] array) {
            appendSwitchesInternal(array, 0);
        }

        private void appendSwitchesInternal(String[] array, int skipCount) {
            boolean parseSwitches = true;
            for (String arg : array) {
                if (skipCount > 0) {
                    skipCount--;
                } else {
                    if (arg.equals("--")) {
                        parseSwitches = false;
                    }
                    if (parseSwitches && arg.startsWith("--")) {
                        String[] parts = arg.split(CommandLine.SWITCH_VALUE_SEPARATOR, 2);
                        String value = parts.length > 1 ? parts[1] : null;
                        appendSwitchWithValue(parts[0].substring("--".length()), value);
                    } else {
                        this.mArgs.add(arg);
                    }
                }
            }
        }

        @Override // org.chromium.base.CommandLine
        public void removeSwitch(String switchString) {
            this.mSwitches.remove(switchString);
            String combinedSwitchString = "--" + switchString;
            for (int i = this.mArgsBegin - 1; i > 0; i--) {
                if (this.mArgs.get(i).equals(combinedSwitchString) || this.mArgs.get(i).startsWith(combinedSwitchString + CommandLine.SWITCH_VALUE_SEPARATOR)) {
                    this.mArgsBegin--;
                    this.mArgs.remove(i);
                }
            }
        }
    }

    private static class NativeCommandLine extends CommandLine {
        static final /* synthetic */ boolean $assertionsDisabled = false;

        public NativeCommandLine(String[] args) {
            super();
            CommandLineJni.get().init(args);
        }

        @Override // org.chromium.base.CommandLine
        public boolean hasSwitch(String switchString) {
            return CommandLineJni.get().hasSwitch(switchString);
        }

        @Override // org.chromium.base.CommandLine
        public String getSwitchValue(String switchString) {
            return CommandLineJni.get().getSwitchValue(switchString);
        }

        @Override // org.chromium.base.CommandLine
        public Map<String, String> getSwitches() {
            HashMap<String, String> switches = new HashMap<>();
            String[] keysAndValues = CommandLineJni.get().getSwitchesFlattened();
            if (keysAndValues.length % 2 != 0) {
                throw new AssertionError("must have same number of keys and values");
            }
            for (int i = 0; i < keysAndValues.length; i += 2) {
                String key = keysAndValues[i];
                String value = keysAndValues[i + 1];
                switches.put(key, value);
            }
            return switches;
        }

        @Override // org.chromium.base.CommandLine
        public void appendSwitch(String switchString) {
            CommandLineJni.get().appendSwitch(switchString);
        }

        @Override // org.chromium.base.CommandLine
        public void appendSwitchWithValue(String switchString, String value) {
            CommandLineJni.get().appendSwitchWithValue(switchString, value == null ? "" : value);
        }

        @Override // org.chromium.base.CommandLine
        public void appendSwitchesAndArguments(String[] array) {
            CommandLineJni.get().appendSwitchesAndArguments(array);
        }

        @Override // org.chromium.base.CommandLine
        public void removeSwitch(String switchString) {
            CommandLineJni.get().removeSwitch(switchString);
        }

        @Override // org.chromium.base.CommandLine
        public boolean isNativeImplementation() {
            return true;
        }

        @Override // org.chromium.base.CommandLine
        protected String[] getCommandLineArguments() {
            throw new AssertionError();
        }

        @Override // org.chromium.base.CommandLine
        protected void destroy() {
            throw new IllegalStateException("Can't destroy native command line after startup");
        }
    }
}
