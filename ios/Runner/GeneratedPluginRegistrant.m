//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"

#if __has_include(<flutter_compass/FlutterCompassPlugin.h>)
#import <flutter_compass/FlutterCompassPlugin.h>
#else
@import flutter_compass;
#endif

#if __has_include(<qrscan/QrscanPlugin.h>)
#import <qrscan/QrscanPlugin.h>
#else
@import qrscan;
#endif

#if __has_include(<simple_flutter_compass/SimpleFlutterCompassPlugin.h>)
#import <simple_flutter_compass/SimpleFlutterCompassPlugin.h>
#else
@import simple_flutter_compass;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FlutterCompassPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterCompassPlugin"]];
  [QrscanPlugin registerWithRegistrar:[registry registrarForPlugin:@"QrscanPlugin"]];
  [SimpleFlutterCompassPlugin registerWithRegistrar:[registry registrarForPlugin:@"SimpleFlutterCompassPlugin"]];
}

@end
