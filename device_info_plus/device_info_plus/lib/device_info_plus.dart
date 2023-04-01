import 'package:device_info_plus_platform_interface/device_info_plus_platform_interface.dart';

DeviceInfoPlusPlatform get _platform => DeviceInfoPlusPlatform.instance;

/// Returns the name of the current platform.
Future<String> getPlatformName() async {
  final platformName = await _platform.getPlatformName();
  if (platformName == null) throw Exception('Unable to get platform name.');
  return platformName;
}
