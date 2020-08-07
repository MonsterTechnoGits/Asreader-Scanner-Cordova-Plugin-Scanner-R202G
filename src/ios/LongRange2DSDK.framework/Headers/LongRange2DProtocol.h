#import <Foundation/Foundation.h>
#import "LongRange2DPacket.h"
#import "LongRange2DDelegate.h"
#import "LongRange2DDevice.h"

@class LongRange2D,LongRange2DResultData;
@protocol LongRange2DDelegate;

#define WATCHER_INTERVAL        1

@interface LongRange2DProtocol : NSObject {
@private
    NSCondition *mRecvSync;
    NSThread *mRecvThread;
    NSThread *mWatchThread;
    NSMutableData *mRecvData;
    
    LongRange2DPacketManager *mPackets;
    LongRange2DCommandType mAction;
    
 	LongRange2DDevice * longRange2DDevice;
    BOOL mIsBarcodeContinueMode;
    BOOL isUserKeyStop;
}

@property (weak, nonatomic) id<LongRange2DDelegate> delegate;


- (id)initWithLongRange2DDevice:(LongRange2DDevice *)device delegate:(id<LongRange2DDelegate>)receiver;

- (void)disconnect;

- (LongRange2DCommandType)getAction;

- (NSString *)getProperty:(LongRange2DPropertyType)type;
- (NSString *)getProperty:(LongRange2DPropertyType)type withParameter:(NSString *)param;
- (LongRange2DResultCode)setProperty:(LongRange2DPropertyType)type;
- (LongRange2DResultCode)setProperty:(LongRange2DPropertyType)type withParameter:(NSString *)param;
- (LongRange2DResultCode)setProperty:(LongRange2DPropertyType)type picketNumber:(int)picketNumber picketData:(NSData *)picketData;

- (LongRange2DResultCode)command:(LongRange2DCommandType)command;
- (LongRange2DResultCode)command:(LongRange2DCommandType)command withParameter:(NSString *)param;
- (LongRange2DResultData *)commandSync:(LongRange2DCommandType)command withParameter:(NSString *)param;
- (NSData *)getBarcodeProperty:(LongRange2DPropertyType)type withParameter:(NSData *)param;
- (LongRange2DResultData *)setBarcodeProperty:(LongRange2DPropertyType)type withParameter:(NSData *)param;

@end
