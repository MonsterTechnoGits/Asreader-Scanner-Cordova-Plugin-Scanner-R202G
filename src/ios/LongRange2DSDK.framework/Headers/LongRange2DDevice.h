#import <Foundation/Foundation.h>
#import <AsRingAccessorySDK/AsRingAccessorySDK.h>

#define LongRange2DDeviceDidConnectedNotification   @"LongRange2DConnected"
#define LongRange2DDeviceDidDisonnectedNotification @"LongRange2DDisconnected"
@protocol LongRange2DDeviceReadDataDelegate <NSObject>

- (void)readData:(NSData *)data;

@end

@interface LongRange2DDevice : AsRingAccessoryBaseSDK

@property (weak, nonatomic) id<LongRange2DDeviceReadDataDelegate> delegate;
@property (strong,nonatomic) NSString * deviceModel;
@property (assign,nonatomic) BOOL isConnect;

- (instancetype)initWithDeviceModel:(NSString *)deviceModel;
- (NSString *)getAddress;

- (void)disconnect;
- (NSString *)getSDKVersion;

@end

