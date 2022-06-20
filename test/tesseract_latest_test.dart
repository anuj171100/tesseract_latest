import 'package:flutter_test/flutter_test.dart';
import 'package:tesseract_latest/tesseract_latest.dart';
import 'package:tesseract_latest/tesseract_latest_platform_interface.dart';
import 'package:tesseract_latest/tesseract_latest_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockTesseractLatestPlatform 
    with MockPlatformInterfaceMixin
    implements TesseractLatestPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final TesseractLatestPlatform initialPlatform = TesseractLatestPlatform.instance;

  test('$MethodChannelTesseractLatest is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelTesseractLatest>());
  });

  test('getPlatformVersion', () async {
    TesseractLatest tesseractLatestPlugin = TesseractLatest();
    MockTesseractLatestPlatform fakePlatform = MockTesseractLatestPlatform();
    TesseractLatestPlatform.instance = fakePlatform;
  
    expect(await tesseractLatestPlugin.getPlatformVersion(), '42');
  });
}
