import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'tesseract_latest_platform_interface.dart';

/// An implementation of [TesseractLatestPlatform] that uses method channels.
class MethodChannelTesseractLatest extends TesseractLatestPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('tesseract_latest');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
