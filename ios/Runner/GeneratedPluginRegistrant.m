//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"
#import <amap_location/AmapLocationPlugin.h>
#import <flutter_blue/FlutterBluePlugin.h>
#import <path_provider/PathProviderPlugin.h>
#import <sharesdk/SharesdkPlugin.h>

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [AmapLocationPlugin registerWithRegistrar:[registry registrarForPlugin:@"AmapLocationPlugin"]];
  [FlutterBluePlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterBluePlugin"]];
  [FLTPathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPathProviderPlugin"]];
  [SharesdkPlugin registerWithRegistrar:[registry registrarForPlugin:@"SharesdkPlugin"]];
}

@end
