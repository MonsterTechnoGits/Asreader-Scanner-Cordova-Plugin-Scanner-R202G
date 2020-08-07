#import <Foundation/Foundation.h>
#import "LongRange2DParamName.h"

@interface LongRange2DParamValue : NSObject<NSCoding>
@property (assign, readwrite) LongRange2DParamNameOptions paramName;
@property (assign, readwrite) BOOL value;

- (void)setEnabled:(BOOL)value;
@end
