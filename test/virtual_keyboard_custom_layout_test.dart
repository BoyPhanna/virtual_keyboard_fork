import 'package:flutter_test/flutter_test.dart';
import 'package:virtual_keyboard_custom_layout/virtual_keyboard_custom_layout.dart';
import 'package:virtual_keyboard_custom_layout/virtual_keyboard_custom_layout_platform_interface.dart';
import 'package:virtual_keyboard_custom_layout/virtual_keyboard_custom_layout_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockVirtualKeyboardCustomLayoutPlatform
    with MockPlatformInterfaceMixin
    implements VirtualKeyboardCustomLayoutPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final VirtualKeyboardCustomLayoutPlatform initialPlatform = VirtualKeyboardCustomLayoutPlatform.instance;

  test('$MethodChannelVirtualKeyboardCustomLayout is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelVirtualKeyboardCustomLayout>());
  });

  test('getPlatformVersion', () async {
    VirtualKeyboardCustomLayout virtualKeyboardCustomLayoutPlugin = VirtualKeyboardCustomLayout();
    MockVirtualKeyboardCustomLayoutPlatform fakePlatform = MockVirtualKeyboardCustomLayoutPlatform();
    VirtualKeyboardCustomLayoutPlatform.instance = fakePlatform;

    expect(await virtualKeyboardCustomLayoutPlugin.getPlatformVersion(), '42');
  });
}
