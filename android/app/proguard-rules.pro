##############################################
# ZEGO SDK
##############################################
-keep class im.zego.** { *; }
-dontwarn im.zego.**

##############################################
# Firebase
##############################################
-keep class com.google.firebase.** { *; }
-dontwarn com.google.firebase.**
-keep class com.google.android.gms.** { *; }
-dontwarn com.google.android.gms.**

##############################################
# Flutter Plugins
##############################################
-keep class io.flutter.** { *; }
-dontwarn io.flutter.**
-keep class io.flutter.plugins.** { *; }

##############################################
# JSON Serialization (GSON + json_serializable)
##############################################
-keep class com.google.gson.** { *; }
-keepattributes *Annotation*
-keepclassmembers class * {
    @com.google.gson.annotations.SerializedName <fields>;
}
-keepclassmembers class * {
    @com.fasterxml.jackson.annotation.JsonProperty <fields>;
}

##############################################
# Kotlin Coroutines / Reflection
##############################################
-dontwarn kotlin.**
-keep class kotlin.** { *; }
-keep class kotlinx.coroutines.** { *; }
-keepclassmembers class ** {
    ** MODULE$;
    ** Companion;
}

##############################################
# Supabase HTTP + Auth
##############################################
-keep class io.supabase.** { *; }
-dontwarn io.supabase.**
-keepattributes Signature
-keepattributes Exceptions

##############################################
# Path Provider / File Picker / Record
##############################################
-keep class android.support.v4.** { *; }
-dontwarn android.support.v4.**

-keep class androidx.core.** { *; }
-dontwarn androidx.core.**

##############################################
# Flutter Bloc
##############################################
-keep class flutter_bloc.** { *; }
-dontwarn flutter_bloc.**

##############################################
# Prevent R8 from removing Dart plugin entry points
##############################################
-keep class * extends io.flutter.embedding.engine.plugins.FlutterPlugin { *; }

##############################################
# Keep Flutter MainActivity & Flutter Engine
##############################################
-keep class com.example.qabilati.MainActivity { *; }
-keep class io.flutter.embedding.engine.FlutterEngine { *; }


# لحماية Jackson من التشويش
-keep class com.fasterxml.** { *; }
-dontwarn com.fasterxml.**

# لحماية Conscrypt
-dontwarn org.conscrypt.**

# لحماية XML
-dontwarn javax.xml.**
-dontwarn org.w3c.dom.bootstrap.**
-dontwarn java.beans.**

# أحيانًا تقييد حذف الـ reflection يساعد
-keepattributes *Annotation*, Signature, EnclosingMethod, InnerClasses
