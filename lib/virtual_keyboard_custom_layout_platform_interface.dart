import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'virtual_keyboard_custom_layout_method_channel.dart';

abstract class VirtualKeyboardCustomLayoutPlatform extends PlatformInterface {
  /// Constructs a VirtualKeyboardCustomLayoutPlatform.
  VirtualKeyboardCustomLayoutPlatform() : super(token: _token);

  static final Object _token = Object();

  static VirtualKeyboardCustomLayoutPlatform _instance = MethodChannelVirtualKeyboardCustomLayout();

  /// The default instance of [VirtualKeyboardCustomLayoutPlatform] to use.
  ///
  /// Defaults to [MethodChannelVirtualKeyboardCustomLayout].
  static VirtualKeyboardCustomLayoutPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [VirtualKeyboardCustomLayoutPlatform] when
  /// they register themselves.
  static set instance(VirtualKeyboardCustomLayoutPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
