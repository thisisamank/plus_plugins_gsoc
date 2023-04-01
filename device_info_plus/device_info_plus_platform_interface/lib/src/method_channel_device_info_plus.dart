import 'package:device_info_plus_platform_interface/device_info_plus_platform_interface.dart';
import 'package:flutter/foundation.dart' show visibleForTesting;
import 'package:flutter/services.dart';

/// An implementation of [DeviceInfoPlusPlatform] that uses method channels.
class MethodChannelDeviceInfoPlus extends DeviceInfoPlusPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('device_info_plus');

  @override
  Future<String?> getPlatformName() {
    return methodChannel.invokeMethod<String>('getPlatformName');
  }
}
