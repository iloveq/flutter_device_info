# flutter_device_info
获取设备信息flutter插件

# how to use

##### 1: first in project  pubspec.yaml

```
dependencies:

    flutter_device_info:
        git:
          url: git://github.com/iloveq/flutter_device_info.git
          ref: main

```

##### 2: code use -> like example/main.dart

```
    try {
      // android
      AndroidDeviceInfo info = await FlutterDeviceInfo.getAndroidDeviceInfo();
      platformVersion =  info.toString();
      // iOS
      //  IOSDeviceInfo info = await FlutterDeviceInfo.getIOSDeviceInfo();
      //  platformVersion =  info.toString();
      // JsonStr
      // platformVersion = await FlutterDeviceInfo.getDeviceInfoJsonStr();
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
```
