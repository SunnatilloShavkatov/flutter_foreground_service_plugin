import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_foreground_service_plugin_platform_interface.dart';

/// An implementation of [FlutterForegroundServicePluginPlatform] that uses method channels.
class MethodChannelFlutterForegroundServicePlugin extends FlutterForegroundServicePluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_foreground_service_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
