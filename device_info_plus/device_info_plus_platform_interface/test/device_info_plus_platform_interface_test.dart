import 'package:device_info_plus_platform_interface/device_info_plus_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

class DeviceInfoPlusMock extends DeviceInfoPlusPlatform {
  static const mockPlatformName = 'Mock';

  @override
  Future<String?> getPlatformName() async => mockPlatformName;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('DeviceInfoPlusPlatformInterface', () {
    late DeviceInfoPlusPlatform deviceInfoPlusPlatform;

    setUp(() {
      deviceInfoPlusPlatform = DeviceInfoPlusMock();
      DeviceInfoPlusPlatform.instance = deviceInfoPlusPlatform;
    });

    group('getPlatformName', () {
      test('returns correct name', () async {
        expect(
          await DeviceInfoPlusPlatform.instance.getPlatformName(),
          equals(DeviceInfoPlusMock.mockPlatformName),
        );
      });
    });
  });
}
