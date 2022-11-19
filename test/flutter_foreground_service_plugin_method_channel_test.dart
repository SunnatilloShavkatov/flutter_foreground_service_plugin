import 'package:flutter/services.dart';
import 'package:flutter_foreground_plugin/flutter_foreground_service_plugin_method_channel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  MethodChannelFlutterForegroundServicePlugin platform =
      MethodChannelFlutterForegroundServicePlugin();
  const MethodChannel channel =
      MethodChannel('flutter_foreground_service_plugin');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
