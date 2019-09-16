//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"
#import <path_provider/PathProviderPlugin.h>
#import <qrscan/QrscanPlugin.h>
#import <sharesdk/SharesdkPlugin.h>

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FLTPathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPathProviderPlugin"]];
  [QrscanPlugin registerWithRegistrar:[registry registrarForPlugin:@"QrscanPlugin"]];
  [SharesdkPlugin registerWithRegistrar:[registry registrarForPlugin:@"SharesdkPlugin"]];
}

@end
