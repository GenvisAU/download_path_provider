#import "DownloadPathProviderPlugin.h"

@implementation DownloadPathProviderPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"download_path_provider"
            binaryMessenger:[registrar messenger]];
  DownloadPathProviderPlugin* instance = [[DownloadPathProviderPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([call.method isEqualToString:@"getDownloadsDirectory"]) {
    result([self getDownloadsDirectory]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

- (NSString*)getDownloadsDirectory {
  NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDownloadsDirectory, NSUserDomainMask, YES);
  return paths.firstObject;
}

@end
