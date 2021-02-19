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

##### 3 what info :

```
// android
{"svd":"google","sdkInt":29,"release":"10","isPhysicalDevice":false,"brand":"google","device":"generic_x86","board":"goldfish_x86","androidId":"e08c1c6a3dae1ffd"}
// iOS
{"localizedModel":"iPhone","systemName":"iOS","model":"iPhone","identifierForVendor":"01A665D8-ED33-4BA3-862D-489A6CC73115","idfa":"01A665D8-ED33-4BA3-862D-489A6CC73115","svd":"iPhone 12 Pro Max","name":"iPhone 12 Pro Max","systemVersion":"14.4"}
```
