import 'package:device_info_plus_ios/device_info_plus_ios.dart';
import 'package:device_info_plus_platform_interface/device_info_plus_platform_interface.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('DeviceInfoPlusIOS', () {
    const kPlatformName = 'iOS';
    late DeviceInfoPlusIOS deviceInfoPlus;
    late List<MethodCall> log;

    setUp(() async {
      deviceInfoPlus = DeviceInfoPlusIOS();

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
      DeviceInfoPlusIOS.registerWith();
      expect(DeviceInfoPlusPlatform.instance, isA<DeviceInfoPlusIOS>());
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
