import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_foreground_service_plugin_method_channel.dart';

abstract class FlutterForegroundServicePluginPlatform extends PlatformInterface {
  /// Constructs a FlutterForegroundServicePluginPlatform.
  FlutterForegroundServicePluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterForegroundServicePluginPlatform _instance = MethodChannelFlutterForegroundServicePlugin();

  /// The default instance of [FlutterForegroundServicePluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterForegroundServicePlugin].
  static FlutterForegroundServicePluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterForegroundServicePluginPlatform] when
  /// they register themselves.
  static set instance(FlutterForegroundServicePluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
