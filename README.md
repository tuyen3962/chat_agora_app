# Flutter source base

## Flutter Compatibility

| Tools    | Version |
| :------- | :------ |
| Flutter  | 3.16.5  |
| Dart     | 3.2.3   |
| DevTools | 2.28.4  |
| fvm      | 2.4.1   |
| Java     | 11.0.15 |
| VSCode   | 1.68.1  |

## Extensions of VSCode:

| Extensions                | Description                                                                                       |
| :------------------------ | :------------------------------------------------------------------------------------------------ |
| Pubspec Assist            | Allows you to easily add dependencies                                                             |
| Dart Data Class Generator | Create dart data classes easily, fast and without writing boilerplate or running code generation. |

## Keystore files:

- Release keystore:
- Debug keystore:

## Env

- .env.dev
- .env.staging
- .env.qas
- .env.production

## Documentation

[[_TOC_]]

## Getting Started

### How to get library

```
flutter pub get
```

### How to run

#### Dev

```
flutter run -t lib/common/config/main_dev.dart --flavor dev
```

#### Staging

```
flutter run -t lib/common/config/main_stag.dart --flavor staging
```

#### QAS

```
flutter run -t lib/common/config/main_qas.dart --flavor qas
```

#### Production

```
flutter run -t lib/common/config/main_prod.dart --flavor production
```

### How to build APK

#### Dev

Build apk Dev

```
flutter build apk --release -t lib/common/config/main_dev.dart --flavor dev
```

Run apk Dev

```
flutter run apk --release -t lib/common/config/main_dev.dart --flavor dev
```

#### Staging

Build apk Staging

```
flutter build apk --release -t lib/common/config/main_stag.dart --flavor staging
```

Run apk Staging

```
flutter run apk --release -t lib/common/config/main_stag.dart --flavor staging
```

#### Qas

Build apk QAS

```
flutter build apk --release -t lib/common/config/main_qas.dart --flavor qas
```

Run apk QAS

```
flutter run apk --release -t lib/common/config/main_qas.dart --flavor qas
```

#### Prod

Build apk Production

```
flutter build apk --release -t lib/common/config/main_prod.dart --flavor production
```

Build aab Production

```
flutter build appbundle --release -t lib/common/config/main_prod.dart --flavor production
```

Run apk Production

```
flutter run apk --release -t lib/common/config/main_prod.dart --flavor production
```

## How to build iOS

### Install library

#### Mac Intel

```
cd ios
pod install
```

#### Mac M1

```
arch -x86_64 pod install
```

### Ready to build

- Open Runner.xcworkspace by Xcode
- Open Runner -> Flutter folder -> Generated file
- Update `FLUTTER_TARGET, FLUTTER_BUILD_NAME, FLUTTER_BUILD_NUMBER`

## Feature

### Notification

> **IMPORTANT**

> The default behavior on all platforms is to display a notification only when the app is in the `background` or `terminated`

Display notification when the app is in the foreground

> Using [flutter_local_notifications](https://pub.dev/packages/flutter_local_notifications) library

#### Android

Move your downloaded `google-services.json` file
into your module (app-level) root directory.

![Alt text](https://www.gstatic.com/mobilesdk/230725_mobilesdk/android_studio_project_panel@2x.png)

#### iOS

Move the `GoogleService-Info.plist` file you just downloaded into the root of your Xcode project and add it to all targets.

![Alt text](https://firebasestorage.googleapis.com/v0/b/hitek-example.appspot.com/o/ios.png?alt=media&token=750b7b4a-7d2b-47e5-94a9-fc52665792c1)

![Alt text](https://www.gstatic.com/mobilesdk/160426_mobilesdk/images/xcode_project_panel@2x.png)

> See [Apple Integration](https://firebase.flutter.dev/docs/messaging/apple-integration) for reference.

### Testing

Go to Messaging on Firebase console\
Select `New campaign` -> `Notification`

## IMPORTANT command

### Generate .g file command

If you want the generator to run one time and exit, use

```
flutter pub run build_runner build --delete-conflicting-outputs
```

Use the [watch] flag to watch the files's system for edits and rebuild as necessary.

```
flutter pub run build_runner watch --delete-conflicting-outputs
```

### Generate splash screen

Logo dimensions should be 512x512

```
flutter pub run flutter_native_splash:create
```

### Generate app logo launcher

```
flutter pub run flutter_launcher_icons:main
```

## Validate AASA (apple-app-site-association) app site

```
https://branch.io/resources/aasa-validator/#resultsbox
```
