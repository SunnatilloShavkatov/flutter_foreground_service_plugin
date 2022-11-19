import 'package:flutter_foreground_plugin/flutter_foreground_service_plugin.dart';
import 'package:flutter_foreground_plugin/flutter_foreground_service_plugin_method_channel.dart';
import 'package:flutter_foreground_plugin/flutter_foreground_service_plugin_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterForegroundServicePluginPlatform
    with MockPlatformInterfaceMixin
    implements FlutterForegroundServicePluginPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterForegroundServicePluginPlatform initialPlatform =
      FlutterForegroundServicePluginPlatform.instance;

  test('$MethodChannelFlutterForegroundServicePlugin is the default instance',
      () {
    expect(initialPlatform,
        isInstanceOf<MethodChannelFlutterForegroundServicePlugin>());
  });

  test('getPlatformVersion', () async {
    FlutterForegroundServicePlugin flutterForegroundServicePlugin =
        FlutterForegroundServicePlugin();
    MockFlutterForegroundServicePluginPlatform fakePlatform =
        MockFlutterForegroundServicePluginPlatform();
    FlutterForegroundServicePluginPlatform.instance = fakePlatform;

    expect(await flutterForegroundServicePlugin.getPlatformVersion(), '42');
  });
}
