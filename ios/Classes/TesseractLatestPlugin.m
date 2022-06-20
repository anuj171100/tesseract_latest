#import "TesseractLatestPlugin.h"
#if __has_include(<tesseract_latest/tesseract_latest-Swift.h>)
#import <tesseract_latest/tesseract_latest-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "tesseract_latest-Swift.h"
#endif

@implementation TesseractLatestPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftTesseractLatestPlugin registerWithRegistrar:registrar];
}
@end
