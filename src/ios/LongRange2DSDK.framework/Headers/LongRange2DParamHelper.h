#import <Foundation/Foundation.h>
#import "LongRange2DParamValue.h"

@interface LongRange2DParamHelper : NSObject

+(NSData *)setBytesWithParamValue:(LongRange2DParamValue *)paramName;
+(NSData *)getBytesWithParamName:(NSNumber *)paramName;
+(NSData *)getBytesWithParamNames:(NSArray *)paramNames;
+(LongRange2DParamValue *)getParam:(NSData *)data;
+(NSArray *)getParamList:(NSData *)data;

@end
