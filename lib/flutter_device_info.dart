import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';

class FlutterDeviceInfo {
  static AndroidDeviceInfo _andDeviceInfo;
  static IOSDeviceInfo _iosDeviceInfo;
  static const deviceInfo = "deviceInfo";
  static const MethodChannel _channel = const MethodChannel('flutter_device_info');

  static Future<String> getDeviceInfoJsonStr() async {
    try {
      var _deviceInfoStr = await _channel.invokeMethod('getDeviceInfo');
      if (Platform.isAndroid) {
        _andDeviceInfo = AndroidDeviceInfo.fromJson(json.decode(_deviceInfoStr) as Map);
      } else {
        _iosDeviceInfo = IOSDeviceInfo.fromJson(json.decode(_deviceInfoStr) as Map);
      }
      return _deviceInfoStr;
    } catch (e) {
      return null;
    }
  }

  static Future<AndroidDeviceInfo> getAndroidDeviceInfo() async {
    if (_andDeviceInfo = null) {
      await getDeviceInfoJsonStr();
    }
    return _andDeviceInfo;
  }

  static Future<IOSDeviceInfo> getIOSDeviceInfo() async{
    if(_iosDeviceInfo == null){
      await getDeviceInfoJsonStr();
    }
    return _iosDeviceInfo;
  }

}

class AndroidDeviceInfo {
  String board;
  String brand;
  String device;
  String isPhysicalDevice;
  String androidId;
  String release;
  String sdkInt;
  String svd;

  AndroidDeviceInfo({this.board,
    this.brand,
    this.device,
    this.isPhysicalDevice,
    this.androidId,
    this.release,
    this.sdkInt,
    this.svd});

  AndroidDeviceInfo.fromJson(Map<String, dynamic> json) {
    if (json['board'] != null) {
      board = json['board']?.toString();
    }
    if (json['brand'] != null) {
      brand = json['brand']?.toString();
    }
    if (json['device'] != null) {
      device = json['device']?.toString();
    }
    if (json['isPhysicalDevice'] != null) {
      isPhysicalDevice = json['isPhysicalDevice']?.toString();
    }
    if (json['androidId'] != null) {
      androidId = json['androidId']?.toString();
    }
    if (json['release'] != null) {
      release = json['release']?.toString();
    }
    if (json['sdkInt'] != null) {
      sdkInt = json['sdkInt']?.toString();
    }
    if (json['svd'] != null) {
      svd = json['svd']?.toString();
    }
  }

  Map<String, dynamic> toJson(AndroidDeviceInfo entity) {
    final data = <String, dynamic>{};
    data['board'] = entity.board;
    data['brand'] = entity.brand;
    data['device'] = entity.device;
    data['isPhysicalDevice'] = entity.isPhysicalDevice;
    data['androidId'] = entity.androidId;
    data['release'] = entity.release;
    data['sdkInt'] = entity.sdkInt;
    data['svd'] = entity.svd;
    return data;
  }
}

class IOSDeviceInfo {
  String systemName;
  String systemVersion;
  String model;
  String localizedModel;
  String idfa;
  String identifierForVendor;

  String name;
  String svd;

  IOSDeviceInfo({this.systemName,
    this.systemVersion,
    this.model,
    this.localizedModel,
    this.idfa,
    this.identifierForVendor,
    this.name,
    this.svd});

  IOSDeviceInfo.fromJson(Map<String, dynamic> json) {
    if (json['systemName'] != null) {
      systemName = json['systemName']?.toString();
    }
    if (json['systemVersion'] != null) {
      systemVersion = json['systemVersion']?.toString();
    }
    if (json['model'] != null) {
      model = json['model']?.toString();
    }
    if (json['localizedModel'] != null) {
      localizedModel = json['localizedModel']?.toString();
    }
    if (json['idfa'] != null) {
      idfa = json['idfa']?.toString();
    }
    if (json['identifierForVendor'] != null) {
      identifierForVendor = json['identifierForVendor']?.toString();
    }
    if (json['name'] != null) {
      name = json['name']?.toString();
    }
    if (json['svd'] != null) {
      svd = json['svd']?.toString();
    }
  }

  Map<String, dynamic> toJson(IOSDeviceInfo entity) {
    final data = <String, dynamic>{};
    data['systemName'] = entity.systemName;
    data['systemVersion'] = entity.systemVersion;
    data['model'] = entity.model;
    data['localizedModel'] = entity.localizedModel;
    data['idfa'] = entity.idfa;
    data['identifierForVendor'] = entity.identifierForVendor;
    data['name'] = entity.name;
    data['svd'] = entity.svd;
    return data;
  }
}
