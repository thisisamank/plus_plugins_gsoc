import 'package:device_info_plus/device_info_plus.dart';
import 'package:device_info_plus_platform_interface/device_info_plus_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDeviceInfoPlusPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements DeviceInfoPlusPlatform {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('DeviceInfoPlus', () {
    late DeviceInfoPlusPlatform deviceInfoPlusPlatform;

    setUp(() {
      deviceInfoPlusPlatform = MockDeviceInfoPlusPlatform();
      DeviceInfoPlusPlatform.instance = deviceInfoPlusPlatform;
    });

    group('getPlatformName', () {
      test('returns correct name when platform implementation exists',
          () async {
        const platformName = '__test_platform__';
        when(
          () => deviceInfoPlusPlatform.getPlatformName(),
        ).thenAnswer((_) async => platformName);

        final actualPlatformName = await getPlatformName();
        expect(actualPlatformName, equals(platformName));
      });

      test('throws exception when platform implementation is missing',
          () async {
        when(
          () => deviceInfoPlusPlatform.getPlatformName(),
        ).thenAnswer((_) async => null);

        expect(getPlatformName, throwsException);
      });
    });
  });
}
