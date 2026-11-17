package org.apache.commons.lang;

import androidx.constraintlayout.core.motion.utils.TypedValues;
import androidx.exifinterface.media.ExifInterface;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* loaded from: classes17.dex */
public class ClassUtils {
    public static final char INNER_CLASS_SEPARATOR_CHAR = '$';
    private static Map abbreviationMap;
    static /* synthetic */ Class class$java$lang$Boolean;
    static /* synthetic */ Class class$java$lang$Byte;
    static /* synthetic */ Class class$java$lang$Character;
    static /* synthetic */ Class class$java$lang$Double;
    static /* synthetic */ Class class$java$lang$Float;
    static /* synthetic */ Class class$java$lang$Integer;
    static /* synthetic */ Class class$java$lang$Long;
    static /* synthetic */ Class class$java$lang$Short;
    static /* synthetic */ Class class$org$apache$commons$lang$ClassUtils;
    private static Map reverseAbbreviationMap;
    private static Map wrapperPrimitiveMap;
    public static final char PACKAGE_SEPARATOR_CHAR = '.';
    public static final String PACKAGE_SEPARATOR = String.valueOf(PACKAGE_SEPARATOR_CHAR);
    public static final String INNER_CLASS_SEPARATOR = String.valueOf('$');
    private static Map primitiveWrapperMap = new HashMap();

    static {
        Class cls;
        Class cls2;
        Class cls3;
        Class cls4;
        Class cls5;
        Class cls6;
        Class cls7;
        Class cls8;
        Map map = primitiveWrapperMap;
        Class cls9 = Boolean.TYPE;
        if (class$java$lang$Boolean == null) {
            cls = class$("java.lang.Boolean");
            class$java$lang$Boolean = cls;
        } else {
            cls = class$java$lang$Boolean;
        }
        map.put(cls9, cls);
        Map map2 = primitiveWrapperMap;
        Class cls10 = Byte.TYPE;
        if (class$java$lang$Byte == null) {
            cls2 = class$("java.lang.Byte");
            class$java$lang$Byte = cls2;
        } else {
            cls2 = class$java$lang$Byte;
        }
        map2.put(cls10, cls2);
        Map map3 = primitiveWrapperMap;
        Class cls11 = Character.TYPE;
        if (class$java$lang$Character == null) {
            cls3 = class$("java.lang.Character");
            class$java$lang$Character = cls3;
        } else {
            cls3 = class$java$lang$Character;
        }
        map3.put(cls11, cls3);
        Map map4 = primitiveWrapperMap;
        Class cls12 = Short.TYPE;
        if (class$java$lang$Short == null) {
            cls4 = class$("java.lang.Short");
            class$java$lang$Short = cls4;
        } else {
            cls4 = class$java$lang$Short;
        }
        map4.put(cls12, cls4);
        Map map5 = primitiveWrapperMap;
        Class cls13 = Integer.TYPE;
        if (class$java$lang$Integer == null) {
            cls5 = class$("java.lang.Integer");
            class$java$lang$Integer = cls5;
        } else {
            cls5 = class$java$lang$Integer;
        }
        map5.put(cls13, cls5);
        Map map6 = primitiveWrapperMap;
        Class cls14 = Long.TYPE;
        if (class$java$lang$Long == null) {
            cls6 = class$("java.lang.Long");
            class$java$lang$Long = cls6;
        } else {
            cls6 = class$java$lang$Long;
        }
        map6.put(cls14, cls6);
        Map map7 = primitiveWrapperMap;
        Class cls15 = Double.TYPE;
        if (class$java$lang$Double == null) {
            cls7 = class$("java.lang.Double");
            class$java$lang$Double = cls7;
        } else {
            cls7 = class$java$lang$Double;
        }
        map7.put(cls15, cls7);
        Map map8 = primitiveWrapperMap;
        Class cls16 = Float.TYPE;
        if (class$java$lang$Float == null) {
            cls8 = class$("java.lang.Float");
            class$java$lang$Float = cls8;
        } else {
            cls8 = class$java$lang$Float;
        }
        map8.put(cls16, cls8);
        primitiveWrapperMap.put(Void.TYPE, Void.TYPE);
        wrapperPrimitiveMap = new HashMap();
        for (Class primitiveClass : primitiveWrapperMap.keySet()) {
            Class wrapperClass = (Class) primitiveWrapperMap.get(primitiveClass);
            if (!primitiveClass.equals(wrapperClass)) {
                wrapperPrimitiveMap.put(wrapperClass, primitiveClass);
            }
        }
        abbreviationMap = new HashMap();
        reverseAbbreviationMap = new HashMap();
        addAbbreviation("int", "I");
        addAbbreviation(TypedValues.Custom.S_BOOLEAN, "Z");
        addAbbreviation(TypedValues.Custom.S_FLOAT, "F");
        addAbbreviation("long", "J");
        addAbbreviation("short", ExifInterface.LATITUDE_SOUTH);
        addAbbreviation("byte", "B");
        addAbbreviation("double", "D");
        addAbbreviation("char", "C");
    }

    static /* synthetic */ Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    private static void addAbbreviation(String primitive, String abbreviation) {
        abbreviationMap.put(primitive, abbreviation);
        reverseAbbreviationMap.put(abbreviation, primitive);
    }

    public static String getShortClassName(Object object, String valueIfNull) {
        if (object == null) {
            return valueIfNull;
        }
        return getShortClassName(object.getClass().getName());
    }

    public static String getShortClassName(Class cls) {
        if (cls == null) {
            return "";
        }
        return getShortClassName(cls.getName());
    }

    public static String getShortClassName(String className) {
        if (className == null || className.length() == 0) {
            return "";
        }
        int lastDotIdx = className.lastIndexOf(46);
        int innerIdx = className.indexOf(36, lastDotIdx == -1 ? 0 : lastDotIdx + 1);
        String out = className.substring(lastDotIdx + 1);
        if (innerIdx != -1) {
            return out.replace('$', PACKAGE_SEPARATOR_CHAR);
        }
        return out;
    }

    public static String getPackageName(Object object, String valueIfNull) {
        if (object == null) {
            return valueIfNull;
        }
        return getPackageName(object.getClass().getName());
    }

    public static String getPackageName(Class cls) {
        if (cls == null) {
            return "";
        }
        return getPackageName(cls.getName());
    }

    public static String getPackageName(String className) {
        int i;
        if (className == null || (i = className.lastIndexOf(46)) == -1) {
            return "";
        }
        return className.substring(0, i);
    }

    public static List getAllSuperclasses(Class cls) {
        if (cls == null) {
            return null;
        }
        List classes = new ArrayList();
        for (Class superclass = cls.getSuperclass(); superclass != null; superclass = superclass.getSuperclass()) {
            classes.add(superclass);
        }
        return classes;
    }

    public static List getAllInterfaces(Class cls) {
        if (cls == null) {
            return null;
        }
        List list = new ArrayList();
        while (cls != null) {
            Class[] interfaces = cls.getInterfaces();
            for (int i = 0; i < interfaces.length; i++) {
                if (!list.contains(interfaces[i])) {
                    list.add(interfaces[i]);
                }
                List<Class> superInterfaces = getAllInterfaces(interfaces[i]);
                for (Class intface : superInterfaces) {
                    if (!list.contains(intface)) {
                        list.add(intface);
                    }
                }
            }
            cls = cls.getSuperclass();
        }
        return list;
    }

    public static List convertClassNamesToClasses(List classNames) {
        if (classNames == null) {
            return null;
        }
        List classes = new ArrayList(classNames.size());
        Iterator it = classNames.iterator();
        while (it.hasNext()) {
            String className = (String) it.next();
            try {
                classes.add(Class.forName(className));
            } catch (Exception e) {
                classes.add(null);
            }
        }
        return classes;
    }

    public static List convertClassesToClassNames(List classes) {
        if (classes == null) {
            return null;
        }
        List classNames = new ArrayList(classes.size());
        Iterator it = classes.iterator();
        while (it.hasNext()) {
            Class cls = (Class) it.next();
            if (cls == null) {
                classNames.add(null);
            } else {
                classNames.add(cls.getName());
            }
        }
        return classNames;
    }

    public static boolean isAssignable(Class[] classArray, Class[] toClassArray) {
        if (!ArrayUtils.isSameLength(classArray, toClassArray)) {
            return false;
        }
        if (classArray == null) {
            classArray = ArrayUtils.EMPTY_CLASS_ARRAY;
        }
        if (toClassArray == null) {
            toClassArray = ArrayUtils.EMPTY_CLASS_ARRAY;
        }
        for (int i = 0; i < classArray.length; i++) {
            if (!isAssignable(classArray[i], toClassArray[i])) {
                return false;
            }
        }
        return true;
    }

    public static boolean isAssignable(Class cls, Class toClass) {
        if (toClass == null) {
            return false;
        }
        if (cls == null) {
            return !toClass.isPrimitive();
        }
        if (cls.equals(toClass)) {
            return true;
        }
        if (cls.isPrimitive()) {
            if (!toClass.isPrimitive()) {
                return false;
            }
            if (Integer.TYPE.equals(cls)) {
                if (!Long.TYPE.equals(toClass) && !Float.TYPE.equals(toClass) && !Double.TYPE.equals(toClass)) {
                    return false;
                }
                return true;
            }
            if (Long.TYPE.equals(cls)) {
                if (!Float.TYPE.equals(toClass) && !Double.TYPE.equals(toClass)) {
                    return false;
                }
                return true;
            }
            if (Boolean.TYPE.equals(cls) || Double.TYPE.equals(cls)) {
                return false;
            }
            if (Float.TYPE.equals(cls)) {
                return Double.TYPE.equals(toClass);
            }
            if (Character.TYPE.equals(cls)) {
                if (!Integer.TYPE.equals(toClass) && !Long.TYPE.equals(toClass) && !Float.TYPE.equals(toClass) && !Double.TYPE.equals(toClass)) {
                    return false;
                }
                return true;
            }
            if (Short.TYPE.equals(cls)) {
                if (!Integer.TYPE.equals(toClass) && !Long.TYPE.equals(toClass) && !Float.TYPE.equals(toClass) && !Double.TYPE.equals(toClass)) {
                    return false;
                }
                return true;
            }
            if (!Byte.TYPE.equals(cls)) {
                return false;
            }
            if (!Short.TYPE.equals(toClass) && !Integer.TYPE.equals(toClass) && !Long.TYPE.equals(toClass) && !Float.TYPE.equals(toClass) && !Double.TYPE.equals(toClass)) {
                return false;
            }
            return true;
        }
        return toClass.isAssignableFrom(cls);
    }

    public static Class primitiveToWrapper(Class cls) {
        if (cls == null || !cls.isPrimitive()) {
            return cls;
        }
        Class convertedClass = (Class) primitiveWrapperMap.get(cls);
        return convertedClass;
    }

    public static Class[] primitivesToWrappers(Class[] classes) {
        if (classes == null) {
            return null;
        }
        if (classes.length == 0) {
            return classes;
        }
        Class[] convertedClasses = new Class[classes.length];
        for (int i = 0; i < classes.length; i++) {
            convertedClasses[i] = primitiveToWrapper(classes[i]);
        }
        return convertedClasses;
    }

    public static Class wrapperToPrimitive(Class cls) {
        return (Class) wrapperPrimitiveMap.get(cls);
    }

    public static Class[] wrappersToPrimitives(Class[] classes) {
        if (classes == null) {
            return null;
        }
        if (classes.length == 0) {
            return classes;
        }
        Class[] convertedClasses = new Class[classes.length];
        for (int i = 0; i < classes.length; i++) {
            convertedClasses[i] = wrapperToPrimitive(classes[i]);
        }
        return convertedClasses;
    }

    public static boolean isInnerClass(Class cls) {
        return cls != null && cls.getName().indexOf(36) >= 0;
    }

    public static Class getClass(ClassLoader classLoader, String className, boolean initialize) throws ClassNotFoundException {
        if (abbreviationMap.containsKey(className)) {
            String clsName = new StringBuffer().append("[").append(abbreviationMap.get(className)).toString();
            Class clazz = Class.forName(clsName, initialize, classLoader).getComponentType();
            return clazz;
        }
        Class clazz2 = Class.forName(toCanonicalName(className), initialize, classLoader);
        return clazz2;
    }

    public static Class getClass(ClassLoader classLoader, String className) throws ClassNotFoundException {
        return getClass(classLoader, className, true);
    }

    public static Class getClass(String className) throws ClassNotFoundException {
        return getClass(className, true);
    }

    public static Class getClass(String className, boolean initialize) throws ClassNotFoundException {
        ClassLoader loader;
        Class cls;
        ClassLoader contextCL = Thread.currentThread().getContextClassLoader();
        if (contextCL == null) {
            if (class$org$apache$commons$lang$ClassUtils == null) {
                cls = class$("org.apache.commons.lang.ClassUtils");
                class$org$apache$commons$lang$ClassUtils = cls;
            } else {
                cls = class$org$apache$commons$lang$ClassUtils;
            }
            loader = cls.getClassLoader();
        } else {
            loader = contextCL;
        }
        return getClass(loader, className, initialize);
    }

    public static Method getPublicMethod(Class cls, String methodName, Class[] parameterTypes) throws SecurityException, NoSuchMethodException {
        Method declaredMethod = cls.getMethod(methodName, parameterTypes);
        if (Modifier.isPublic(declaredMethod.getDeclaringClass().getModifiers())) {
            return declaredMethod;
        }
        List<Class> candidateClasses = new ArrayList();
        candidateClasses.addAll(getAllInterfaces(cls));
        candidateClasses.addAll(getAllSuperclasses(cls));
        for (Class candidateClass : candidateClasses) {
            if (Modifier.isPublic(candidateClass.getModifiers())) {
                try {
                    Method candidateMethod = candidateClass.getMethod(methodName, parameterTypes);
                    if (Modifier.isPublic(candidateMethod.getDeclaringClass().getModifiers())) {
                        return candidateMethod;
                    }
                } catch (NoSuchMethodException e) {
                }
            }
        }
        throw new NoSuchMethodException(new StringBuffer().append("Can't find a public method for ").append(methodName).append(" ").append(ArrayUtils.toString(parameterTypes)).toString());
    }

    private static String toCanonicalName(String className) {
        String className2 = StringUtils.deleteWhitespace(className);
        if (className2 == null) {
            throw new NullArgumentException("className");
        }
        if (className2.endsWith("[]")) {
            StringBuffer classNameBuffer = new StringBuffer();
            while (className2.endsWith("[]")) {
                className2 = className2.substring(0, className2.length() - 2);
                classNameBuffer.append("[");
            }
            String abbreviation = (String) abbreviationMap.get(className2);
            if (abbreviation != null) {
                classNameBuffer.append(abbreviation);
            } else {
                classNameBuffer.append("L").append(className2).append(";");
            }
            String className3 = classNameBuffer.toString();
            return className3;
        }
        return className2;
    }

    public static Class[] toClass(Object[] array) {
        if (array == null) {
            return null;
        }
        if (array.length == 0) {
            return ArrayUtils.EMPTY_CLASS_ARRAY;
        }
        Class[] classes = new Class[array.length];
        for (int i = 0; i < array.length; i++) {
            classes[i] = array[i].getClass();
        }
        return classes;
    }

    public static String getShortCanonicalName(Object object, String valueIfNull) {
        if (object == null) {
            return valueIfNull;
        }
        return getShortCanonicalName(object.getClass().getName());
    }

    public static String getShortCanonicalName(Class cls) {
        if (cls == null) {
            return "";
        }
        return getShortCanonicalName(cls.getName());
    }

    public static String getShortCanonicalName(String canonicalName) {
        return getShortClassName(getCanonicalName(canonicalName));
    }

    public static String getPackageCanonicalName(Object object, String valueIfNull) {
        if (object == null) {
            return valueIfNull;
        }
        return getPackageCanonicalName(object.getClass().getName());
    }

    public static String getPackageCanonicalName(Class cls) {
        if (cls == null) {
            return "";
        }
        return getPackageCanonicalName(cls.getName());
    }

    public static String getPackageCanonicalName(String canonicalName) {
        return getPackageName(getCanonicalName(canonicalName));
    }

    private static String getCanonicalName(String className) {
        String className2 = StringUtils.deleteWhitespace(className);
        if (className2 == null) {
            return null;
        }
        int dim = 0;
        while (className2.startsWith("[")) {
            dim++;
            className2 = className2.substring(1);
        }
        if (dim < 1) {
            return className2;
        }
        if (className2.startsWith("L")) {
            className2 = className2.substring(1, className2.endsWith(";") ? className2.length() - 1 : className2.length());
        } else if (className2.length() > 0) {
            className2 = (String) reverseAbbreviationMap.get(className2.substring(0, 1));
        }
        StringBuffer canonicalClassNameBuffer = new StringBuffer(className2);
        for (int i = 0; i < dim; i++) {
            canonicalClassNameBuffer.append("[]");
        }
        return canonicalClassNameBuffer.toString();
    }
}
