import 'package:device_info_plus_android/device_info_plus_android.dart';
import 'package:device_info_plus_platform_interface/device_info_plus_platform_interface.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('DeviceInfoPlusAndroid', () {
    const kPlatformName = 'Android';
    late DeviceInfoPlusAndroid deviceInfoPlus;
    late List<MethodCall> log;

    setUp(() async {
      deviceInfoPlus = DeviceInfoPlusAndroid();

      log = <MethodCall>[];
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(deviceInfoPlus.methodChannel, (methodCall) async {
        log.add(methodCall);
        switch (methodCall.method) {
          case 'getPlatformName':
            return kPlatformName;
          default:
            return null;
        }
      });
    });

    test('can be registered', () {
      DeviceInfoPlusAndroid.registerWith();
      expect(DeviceInfoPlusPlatform.instance, isA<DeviceInfoPlusAndroid>());
    });

    test('getPlatformName returns correct name', () async {
      final name = await deviceInfoPlus.getPlatformName();
      expect(
        log,
        <Matcher>[isMethodCall('getPlatformName', arguments: null)],
      );
      expect(name, equals(kPlatformName));
    });
  });
}
