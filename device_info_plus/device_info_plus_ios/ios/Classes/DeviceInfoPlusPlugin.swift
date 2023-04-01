import Flutter
import UIKit

public class DeviceInfoPlusPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "device_info_plus_ios", binaryMessenger: registrar.messenger())
    let instance = DeviceInfoPlusPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS")
  }
}
