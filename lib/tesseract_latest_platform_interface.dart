import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'tesseract_latest_method_channel.dart';

abstract class TesseractLatestPlatform extends PlatformInterface {
  /// Constructs a TesseractLatestPlatform.
  TesseractLatestPlatform() : super(token: _token);

  static final Object _token = Object();

  static TesseractLatestPlatform _instance = MethodChannelTesseractLatest();

  /// The default instance of [TesseractLatestPlatform] to use.
  ///
  /// Defaults to [MethodChannelTesseractLatest].
  static TesseractLatestPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TesseractLatestPlatform] when
  /// they register themselves.
  static set instance(TesseractLatestPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
