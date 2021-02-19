import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';

class FlutterDeviceInfo {
  static var _andDeviceInfo;
  static var _iosDeviceInfo;
  static const _methodGetDeviceInfo = "getDeviceInfo";
  static const _channelFlutterDeviceInfo = "flutter_device_info";
  static const MethodChannel _channel = const MethodChannel(_channelFlutterDeviceInfo);

  static Future<String> getDeviceInfoJsonStr() async {
    try {
      return await _channel.invokeMethod(_methodGetDeviceInfo);
    } catch (e) {
      return null;
    }
  }

  static Future<AndroidDeviceInfo> getAndroidDeviceInfo() async {
    if(Platform.isIOS){
      return null;
    }
    if (null == _andDeviceInfo) {
      var _deviceInfoStr = await getDeviceInfoJsonStr();
      if(_isNullOrEmpty(_deviceInfoStr)){
        return null;
      }
      _andDeviceInfo = AndroidDeviceInfo.fromJson(json.decode(_deviceInfoStr) as Map);
      return _andDeviceInfo;
    }
    return _andDeviceInfo;
  }

  static Future<IOSDeviceInfo> getIOSDeviceInfo() async {
    if(Platform.isAndroid){
      return null;
    }
    if (null == _iosDeviceInfo) {
      var _deviceInfoStr = await getDeviceInfoJsonStr();
      if(_isNullOrEmpty(_deviceInfoStr)){
        return null;
      }
      _iosDeviceInfo = IOSDeviceInfo.fromJson(json.decode(_deviceInfoStr) as Map);
      return _iosDeviceInfo;
    }
    return _iosDeviceInfo;
  }

  static bool _isNullOrEmpty(String str){
    return null == str || str.isEmpty;
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

  AndroidDeviceInfo({this.board, this.brand, this.device, this.isPhysicalDevice, this.androidId, this.release, this.sdkInt, this.svd});

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

  @override
  String toString() {
    return 'AndroidDeviceInfo{board: $board, brand: $brand, device: $device, isPhysicalDevice: $isPhysicalDevice, androidId: $androidId, release: $release, sdkInt: $sdkInt, svd: $svd}';
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

  IOSDeviceInfo({this.systemName, this.systemVersion, this.model, this.localizedModel, this.idfa, this.identifierForVendor, this.name, this.svd});

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

  @override
  String toString() {
    return 'IOSDeviceInfo{systemName: $systemName, systemVersion: $systemVersion, model: $model, localizedModel: $localizedModel, idfa: $idfa, identifierForVendor: $identifierForVendor, name: $name, svd: $svd}';
  }
}
