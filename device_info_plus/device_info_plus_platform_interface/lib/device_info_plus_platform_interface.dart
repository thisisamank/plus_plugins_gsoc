import 'package:device_info_plus_platform_interface/src/method_channel_device_info_plus.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// The interface that implementations of device_info_plus must implement.
///
/// Platform implementations should extend this class
/// rather than implement it as `DeviceInfoPlus`.
/// Extending this class (using `extends`) ensures that the subclass will get
/// the default implementation, while platform implementations that `implements`
///  this interface will be broken by newly added [DeviceInfoPlusPlatform] methods.
abstract class DeviceInfoPlusPlatform extends PlatformInterface {
  /// Constructs a DeviceInfoPlusPlatform.
  DeviceInfoPlusPlatform() : super(token: _token);

  static final Object _token = Object();

  static DeviceInfoPlusPlatform _instance = MethodChannelDeviceInfoPlus();

  /// The default instance of [DeviceInfoPlusPlatform] to use.
  ///
  /// Defaults to [MethodChannelDeviceInfoPlus].
  static DeviceInfoPlusPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [DeviceInfoPlusPlatform] when they register themselves.
  static set instance(DeviceInfoPlusPlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  /// Return the current platform name.
  Future<String?> getPlatformName();
}
