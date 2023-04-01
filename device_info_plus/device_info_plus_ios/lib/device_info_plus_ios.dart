import 'package:device_info_plus_platform_interface/device_info_plus_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// The iOS implementation of [DeviceInfoPlusPlatform].
class DeviceInfoPlusIOS extends DeviceInfoPlusPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('device_info_plus_ios');

  /// Registers this class as the default instance of [DeviceInfoPlusPlatform]
  static void registerWith() {
    DeviceInfoPlusPlatform.instance = DeviceInfoPlusIOS();
  }

  @override
  Future<String?> getPlatformName() {
    return methodChannel.invokeMethod<String>('getPlatformName');
  }
}
