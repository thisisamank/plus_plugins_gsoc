import 'package:device_info_plus_platform_interface/device_info_plus_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// The Android implementation of [DeviceInfoPlusPlatform].
class DeviceInfoPlusAndroid extends DeviceInfoPlusPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('device_info_plus_android');

  /// Registers this class as the default instance of [DeviceInfoPlusPlatform]
  static void registerWith() {
    DeviceInfoPlusPlatform.instance = DeviceInfoPlusAndroid();
  }

  @override
  Future<String?> getPlatformName() {
    return methodChannel.invokeMethod<String>('getPlatformName');
  }
}
