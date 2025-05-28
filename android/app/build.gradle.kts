plugins {
    id("com.android.application") version "8.7.3"
    id("org.jetbrains.kotlin.android") version "2.1.21"
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services")
}

android {
    namespace = "com.example.nho_app"
<<<<<<< HEAD
    compileSdk = 34
=======
    compileSdk = flutter.compileSdkVersion
>>>>>>> master
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_21
        targetCompatibility = JavaVersion.VERSION_21
        isCoreLibraryDesugaringEnabled = true
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_21.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.nho_app"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.html
        minSdkVersion = 23
        targetSdk = 34
        versionCode = 1
        versionName = "0.1.0"
        multidexEnabled = true
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
            isMinifyEnabled = false
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }
}
compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17 // Java 17 for Gradle 8.x
        targetCompatibility = JavaVersion.VERSION_17
        isCoreLibraryDesugaringEnabled = true // For Java 8+ APIs on older Android
    }

    kotlinOptions {
        jvmTarget = "17"
    }



flutter {
    source = "../.."
}

dependencies {

  // Import the Firebase BoM
  implementation(platform("com.google.firebase:firebase-bom:33.14.0"))

  // TODO: Add the dependencies for Firebase products you want to use
  // When using the BoM, don't specify versions in Firebase dependencies

  implementation("com.google.firebase:firebase-analytics")


  // Add the dependencies for any other desired Firebase products
  // https://firebase.google.com/docs/android/setup#available-libraries
  coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
  implementation("androidx.multidex:multidex:2.0.1")
  

}
