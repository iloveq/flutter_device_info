import Flutter
import UIKit
import KeychainAccess

private let getDeviceInfoMethod =  "getDeviceInfo";
private let uuidKey = "deviceInfoUuidKey"

public class SwiftFlutterDeviceInfoPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_device_info", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterDeviceInfoPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
        case getDeviceInfoMethod:
             result(getDeviceInfoJsonStr());
        default:
                break;
    }
  }
}

private func getDeviceInfoJsonStr() -> NSString? {
    
    var _uuid:String!
    
    if let value = Keychain.getKeyChainString(key: uuidKey) {
        _uuid = value;
    }else{
        _uuid = UIDevice.current.identifierForVendor?.uuidString
            ?? NSUUID().uuidString ;
        Keychain.setKeyChain(key: uuidKey, value: _uuid)
    }
    
    
    let device = UIDevice.current;
    var dic = [String: Any]()
    dic["name"] = device.name;
    dic["systemName"] = device.systemName;
    dic["systemVersion"] = device.systemVersion;
    dic["model"] = device.model;
    dic["localizedModel"] = device.localizedModel;
    dic["identifierForVendor"] = _uuid;
    dic["idfa"] = _uuid;
    dic["svd"] = device.name;
    
    if (!JSONSerialization.isValidJSONObject(dic)) {
        return ""
    }
    let data : NSData! = try? JSONSerialization.data(withJSONObject: dic, options: []) as NSData
    let jsonStr = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
    return jsonStr;
 }
