plugins {
    id("com.android.application")
    id("kotlin-android")
    id("com.google.gms.google-services")  
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.ccell_1"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.ccell_1"  // Your app's package name
        minSdk = 23
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
            // Add your release signing config here when ready
        }
    }
}

dependencies {
    // Import the Firebase BoM (Bill of Materials)
    implementation(platform("com.google.firebase:firebase-bom:32.1.0"))  // Use latest stable BOM version

    // Add Firebase Analytics (example)
    implementation("com.google.firebase:firebase-analytics-ktx")

    // Add any other Firebase dependencies you need, for example:
    // implementation("com.google.firebase:firebase-auth-ktx")
    // implementation("com.google.firebase:firebase-firestore-ktx")
}

flutter {
    source = "../.."
}
