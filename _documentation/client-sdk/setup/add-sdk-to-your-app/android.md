---
title: Add Nexmo Client SDK To Your Android App 
---

# Get Started - Add Nexmo Client SDK To Your Android App

Let's get started with Nexmo SDK on your Android app! Here are all the details on how to set that up:

## Prerequisites

The SDK supports min Android API level 16.

## Add The SDK To Your Android Project

Open Android Studio with your Android project codebase

### Add Dependencies

- On your app level `build.gradle` file (usually `app/build.gradle`), add the sdk  dependency:

```groovy

dependencies {
    implementation 'com.nexmo.android:client-sdk:0.6.11'
}

```

- On your project level `build.gradle` file, add the maven repository

```groovy

buildscript {
    repositories {
        maven {
            url "https://artifactory.ess-dev.com/artifactory/gradle-dev-local"
        }
    }
    //...
}

allprojects {
    repositories {
        ...
        maven {
            url "https://artifactory.ess-dev.com/artifactory/gradle-dev-local"
        }
    }
}

```

## Add Permissions

To use the in app voice features, you should add audio permissions:

1. On your `AndroidManifest.xml` add the required permissions:

```xml
 <manifest ...>

    <uses-permission android:name="android.permission.INTERNET" />
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
    <uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
    <uses-permission android:name="android.permission.CHANGE_WIFI_STATE" />

    <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS" />
    <uses-permission android:name="android.permission.RECORD_AUDIO" />
    <uses-permission android:name="android.permission.PROCESS_OUTGOING_CALLS" />
    <uses-permission android:name="android.permission.READ_PHONE_STATE" />

    <application>

    </>
 </>
```

2. For devices running Android version M (API level 23) or higher, you should add a request for the dangerous permissions required.

```java
android.Manifest.permission.READ_PHONE_STATE, android.Manifest.permission.RECORD_AUDIO, android.Manifest.permission.PROCESS_OUTGOING_CALLS
```

Read more about requesting runtime permissions on Android [here]("https://developer.android.com/training/permissions/requesting")

---

## Using NexmoClient On Your App

### 1. Init NexmoClient

Before being able to use a `NexmoClient` instance, you should initialize it.

```java
loginListener = object : NexmoLoginListener {
    override fun onLoginStateChange(eLoginState: NexmoLoginListener.ELoginState, eLoginStateReason: NexmoLoginListener.ELoginStateReason) {
        //TODO
    }

    override fun onAvailabilityChange(eAvailability: NexmoLoginListener.EAvailability, nexmoConnectionState: NexmoConnectionState) {
        //TODO
    }
}

NexmoClient.init(context, loginListener)
```

### 2. Login NexmoClient

After initialzing `NexmoClient`, you should log in to it, using a `jwt` user token. You can read more about generating the `jwt` [here](_documentation/client-sdk/concepts/jwt-acl).

Swap the token to log in the relevant user.

```java
    NexmoClient.get().login(token, loginListener)
```

After the login succeeds, the logged in user will be available via `NexmoClient.get().getUser()`.

---

Congratulations! you're all set!

## What's next?

After these steps you are ready to use the Nexmo SDK functionalities.
Feel free to explore them.