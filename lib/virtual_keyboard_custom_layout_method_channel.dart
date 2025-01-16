import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'virtual_keyboard_custom_layout_platform_interface.dart';

/// An implementation of [VirtualKeyboardCustomLayoutPlatform] that uses method channels.
class MethodChannelVirtualKeyboardCustomLayout extends VirtualKeyboardCustomLayoutPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('virtual_keyboard_custom_layout');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
