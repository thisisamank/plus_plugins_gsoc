import 'package:device_info_plus_platform_interface/src/method_channel_device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const kPlatformName = 'platformName';

  group('$MethodChannelDeviceInfoPlus', () {
    late MethodChannelDeviceInfoPlus methodChannelDeviceInfoPlus;
    final log = <MethodCall>[];

    setUp(() async {
      methodChannelDeviceInfoPlus = MethodChannelDeviceInfoPlus()
        ..methodChannel.setMockMethodCallHandler((MethodCall methodCall) async {
          log.add(methodCall);
          switch (methodCall.method) {
            case 'getPlatformName':
              return kPlatformName;
            default:
              return null;
          }
        });
    });

    tearDown(log.clear);

    test('getPlatformName', () async {
      final platformName = await methodChannelDeviceInfoPlus.getPlatformName();
      expect(
        log,
        <Matcher>[isMethodCall('getPlatformName', arguments: null)],
      );
      expect(platformName, equals(kPlatformName));
    });
  });
}
