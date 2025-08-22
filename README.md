# 🚀 Flutter App Template

A clean, scalable Flutter project template designed for reuse across multiple projects. Includes architectural best practices and comprehensive renaming instructions.

---
### Clone this Repository

```bash
cd yourprojectdirectory
git clone https://github.com/JanrayCausaren/flutter-app-template.git
```

### Remove the existing Git history so it becomes a fresh project:

```bash
cd yourprojectdirectory
rm .git
```

### Remove the all of the .gitkeep temporary file

**Windows:**
```bash
Get-ChildItem -Recurse -Filter .gitkeep | Remove-Item
```

### Run Flutter command to get all the dependencies

```bash
flutter pub get
```

## 📖 Overview

This template provides a production-ready Flutter project structure with MVVM architecture. **Important**: This template requires proper renaming before development - it's not meant to be used with default identifiers.

## ⚠️ Why You Must Rename This Template

**Think of this template like a house blueprint - you can't live in the blueprint, you need to build your own house first!**

Every app needs a **unique identity** (like how every person has a unique name). This template comes with generic placeholder names that won't work in the real world.

**What happens if you don't rename:**

🚫 **App stores will reject your app**
- Google Play and Apple App Store won't accept apps with names like "com.example.flutterapptemplate"
- It's like trying to register a business with the name "Example Company" - not allowed!

📱 **Your app won't install properly**
- Phones get confused when multiple apps have the same identity
- Imagine if two people had the exact same name and address - mail delivery chaos!

**Simple example:**
- ❌ Bad: `com.example.flutterapptemplate` (generic template name)
- ✅ Good: `com.johnsmith.todoapp` (your unique app name)

**Bottom line:** Just like you need your own name and address, your app needs its own unique identity to work properly.


## 🔧 Quick Start

Choose one of two renaming methods:

### ✅ Method 1: Automated Renaming (Recommended) using Flutter Package

**Install the rename package:**

```bash
flutter pub global activate rename
```
 
**Rename your project:**

```bash
rename setAppName --value "Your App Name"  
rename setBundleId --value com.yourcompany.yourapp
```

This automatically updates:
- App display name (Android & iOS)
- Android applicationId
- iOS bundle identifier

### 🔨 Method 2: Manual Renaming

#### 1. Update Project Name

**File:** `pubspec.yaml`
```yaml
name: your_new_project_name  # Change from flutter_app_template
```

#### 2. Set App Display Name

**Android:** `android/app/src/main/AndroidManifest.xml`
```xml
android:label="Your App Name"
```

**iOS:** `ios/Runner/Info.plist`
```xml
<key>CFBundleDisplayName</key>
<string>Your App Name</string>
```

#### 3. Update Package Identifiers

**Android:** `android/app/build.gradle`
```gradle
applicationId "com.yourcompany.yourapp"
```

**iOS:** `ios/Runner.xcodeproj/project.pbxproj`
```
PRODUCT_BUNDLE_IDENTIFIER = com.yourcompany.yourapp;
```

#### 4. Update Kotlin Package (Optional)

**Move file from:**
```
android/app/src/main/kotlin/com/example/flutterapptemplate/MainActivity.kt
```

**To:**
```
android/app/src/main/kotlin/com/yourcompany/yourapp/MainActivity.kt
```

**Update package declaration in MainActivity.kt:**
```kotlin
package com.yourcompany.yourapp
```

## 📁 Project Structure

This template follows a feature-based architecture with MVVM pattern:
- learn first what is MVVM structural pattern
- how to work with it
- Customize the architecture to fit your needs


---

**Start building your app! Happy coding!** 🚀
