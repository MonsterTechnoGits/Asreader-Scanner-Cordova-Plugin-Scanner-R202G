#ifndef RFBlasterDemo_Header_h
#define RFBlasterDemo_Header_h

#import "LongRange2DPacket.h"
#import "LongRange2DBarcodeType.h"

#define REMOTE_KEY_UP           0
#define REMOTE_KEY_DOWN         1

@class LongRange2D;
@protocol LongRange2DDelegate <NSObject>

@optional
- (void)longRange2DInitialized:(LongRange2D *)longRange2D;
- (void)updateDeviceState:(LongRange2DResultCode)error;
- (void)changedActionState:(LongRange2DCommandType)action
                resultCode:(NSInteger)resultCode;
- (void)receivedBarcodeString:(NSString *)barcodeString
                  barcodeType:(LongRange2DBarcodeTypeOptions)barcodeType;
- (void)receivedBarcodeData:(NSData *)barcodeData
                barcodeType:(LongRange2DBarcodeTypeOptions)barcodeType;
- (BOOL)onAsReaderTriggerKeyEvent:(BOOL)status;
@end

#endif
