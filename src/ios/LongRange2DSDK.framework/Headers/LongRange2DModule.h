#import <Foundation/Foundation.h>
#import "LongRange2DProtocol.h"

#define NIBBLE_UNIT                 4
#define MIN_OFFSET                  16

@protocol LongRange2DDelegate;

@interface LongRange2DResultData : NSObject 

- (id)initWithResultCode:(LongRange2DResultCode)result data:(NSData *)data;
- (LongRange2DResultCode)result;
- (NSData *)data;

@end


@interface LongRange2DModule : NSObject 

- (id)initWithProtocol:(LongRange2DProtocol *)protocol;

- (NSString *)firmwareVersion;
- (NSString *)firmwareAddress;
- (NSData *)getBarcodeParam:(NSData *)data;
- (LongRange2DResultCode)setBarcodeParam:(NSData *)data;
- (int)getBarcodeState;
@end
