#import <Foundation/Foundation.h>
#import "LongRange2DModule.h"
#import "LongRange2DParamValue.h"
#import "LongRange2DDevice.h"
#import "LongRange2DProtocol.h"


@protocol LongRange2DDelegate;

@interface LongRange2D : NSObject

@property (nonatomic, strong) LongRange2DDevice *longRange2DDevice;
@property (nonatomic, assign) LongRange2DBeepState beep;
@property (nonatomic, assign) LongRange2DVibratorState vibrator;
@property (nonatomic, assign) int sleepTime;
@property (nonatomic, assign) int autoOffTime;
@property (nonatomic, assign) int scannerTimeOut;

- (id)initWithLongRange2DDevice:(LongRange2DDevice *)device delegate:(id<LongRange2DDelegate>)delegate;
- (void)disconnect;

- (void)setDelegate:(id<LongRange2DDelegate>)delegate;
- (LongRange2DCommandType)getAction;
- (NSString *)getSerialNumber;
- (NSString *)getFirmwareVersion;
- (int)getBatteryStatus;

- (LongRange2DResultCode)startScan;
- (LongRange2DResultCode)stopScan;
- (LongRange2DResultCode)setBarcodeParam:(LongRange2DParamValue *)paramData;
- (LongRange2DParamValue *)getBarcodeParam:(LongRange2DParamNameOptions)paramName;
- (LongRange2DResultCode)startBeepWithBeepTime:(int)beepTime;
- (LongRange2DResultCode)startVibratorWithVibratorTime:(int)vibratorTime;
- (LongRange2DResultCode)setDefaultScannerPrama;

- (void)updateFirmwareWithFileName:(NSString *)fileName
                          fileData:(NSData *)data
                        resultCode:(void(^)(LongRange2DResultCode resultCode))resultCode
                          progress:(void(^)(NSProgress * progress))progress;
- (NSString *)getMessageWithResultCode:(LongRange2DResultCode)resultCode;

@end

