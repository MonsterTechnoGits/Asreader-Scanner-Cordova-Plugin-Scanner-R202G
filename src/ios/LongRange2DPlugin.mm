/********* LongRange2DPlugin.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import <LongRange2DSDK/LongRange2DSDK.h>
#import <AsRingAccessorySDK/AsRingDeviceSDK.h>
#import <Foundation/Foundation.h>

#define LongRange2DDeviceDidConnectedNotification   @"LongRange2DConnected"
#define LongRange2DDeviceDidDisonnectedNotification @"LongRange2DDisconnected"

@interface LongRange2DPlugin : CDVPlugin<LongRange2DDelegate>
- (void)coolMethod:(CDVInvokedUrlCommand*)command;
@property (strong, nonatomic)LongRange2DDevice *longRange2DDevice;
@property (strong, nonatomic)LongRange2D *longRange2D;
@property (strong, nonatomic)NSFileManager *fileManager;

#pragma mark ---init---
- (void)initWithLongRange2DDevice:(CDVInvokedUrlCommand *)command;
#pragma mark ---Listener---
- (void)setLongRange2DDisconnectedListener:(CDVInvokedUrlCommand *)command;
- (void)setLongRange2DInitialized:(CDVInvokedUrlCommand *)command;
- (void)setResultCodeListener:(CDVInvokedUrlCommand *)command;
- (void)setProgressListener:(CDVInvokedUrlCommand *)command;
- (void)setUpdateDeviceStateListener:(CDVInvokedUrlCommand *)command;
- (void)setChangedActionStateListener:(CDVInvokedUrlCommand *)command;
- (void)setReceivedBarcodeStringListener:(CDVInvokedUrlCommand *)command;
- (void)setReceivedBarcodeDataListener:(CDVInvokedUrlCommand *)command;
- (void)setOnAsReaderTriggerKeyEventListener:(CDVInvokedUrlCommand *)command;
#pragma mark ---Property---
- (void)setBeep:(CDVInvokedUrlCommand *)command;
- (void)getBeep:(CDVInvokedUrlCommand *)command;
- (void)setVibrator:(CDVInvokedUrlCommand *)command;
- (void)getVibrator:(CDVInvokedUrlCommand *)command;
- (void)setSleepTime:(CDVInvokedUrlCommand *)command;
- (void)getSleepTime:(CDVInvokedUrlCommand *)command;
- (void)setAutoOffTime:(CDVInvokedUrlCommand *)command;
- (void)getAutoOffTime:(CDVInvokedUrlCommand *)command;
- (void)setScannerTimeOut:(CDVInvokedUrlCommand *)command;
- (void)getScannerTimeOut:(CDVInvokedUrlCommand *)command;
#pragma mark ---Method---
- (void)getAddress:(CDVInvokedUrlCommand *)command;
- (void)getSDKVersion:(CDVInvokedUrlCommand *)command;
- (void)getAction:(CDVInvokedUrlCommand *)command;
- (void)getSerialNumber:(CDVInvokedUrlCommand *)command;
- (void)getFirmwareVersion:(CDVInvokedUrlCommand *)command;
- (void)getBatteryStatus:(CDVInvokedUrlCommand *)command;
- (void)startScan:(CDVInvokedUrlCommand *)command;
- (void)startScanWithEncodingType:(CDVInvokedUrlCommand *)command;
- (void)stopScan:(CDVInvokedUrlCommand *)command;
- (void)setBarcodeParam:(CDVInvokedUrlCommand *)command;
- (void)getBarcodeParam:(CDVInvokedUrlCommand *)command;
- (void)startBeepWithBeepTime:(CDVInvokedUrlCommand *)command;
- (void)startVibratorWithVibratorTime:(CDVInvokedUrlCommand *)command;
- (void)setDefaultScannerPrama:(CDVInvokedUrlCommand *)command;
- (void)updateFirmwareWithFileName:(CDVInvokedUrlCommand *)command;
- (void)doDefaultAsReaderTriggerKeyTouch:(CDVInvokedUrlCommand *)command;
- (void)doDefaultAsReaderTriggerKeyUp:(CDVInvokedUrlCommand *)command;
- (void)getAsRingFirmwareVersion:(CDVInvokedUrlCommand *)command;

@end

@implementation LongRange2DPlugin{
    NSStringEncoding encoding;
    NSString *longRange2DDisconnectedListenerCallbackId;
    NSString *longRange2DInitializedListenerCallbackId;
    NSString *longRange2DResultCodeListenerCallbackId;
    NSString *longRange2DProgressListenerCallbackId;
    NSString *longRange2DUpdateDeviceStateListenerCallbackId;
    NSString *longRange2DChangedActionStateListenerCallbackId;
    NSString *longRange2DReceivedBarcodeStringListenerCallbackId;
    NSString *longRange2DReceivedBarcodeDataListenerCallbackId;
    NSString *longRange2DOnAsReaderTriggerKeyEventListenerCallbackId;
}
- (void)coolMethod:(CDVInvokedUrlCommand*)command {
    CDVPluginResult* pluginResult = nil;
    NSString* echo = [command.arguments objectAtIndex:0];

    if (echo != nil && [echo length] > 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
#pragma mark ---init---
- (void)pluginInitialize {
    encoding = NSASCIIStringEncoding;
    self.fileManager = [NSFileManager defaultManager];
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(longRange2DConnected:) name:LongRange2DDeviceDidConnectedNotification object:nil];
    [center addObserver:self selector:@selector(longRange2DDisconnected:) name:LongRange2DDeviceDidDisonnectedNotification object:nil];
}
- (void)longRange2DConnected:(NSNotification *)notification {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    dispatch_async(dispatch_get_main_queue(),^{
        if (self.longRange2DDevice) {
            self.longRange2D = [[LongRange2D alloc] initWithLongRange2DDevice:self.longRange2DDevice delegate:self];
        } else {
            NSLog(@"self.longRange2DDevice is nil.");
        }
    });
}
- (void)longRange2DDisconnected:(NSNotification *)notification {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    self.longRange2D = nil;
    if (longRange2DDisconnectedListenerCallbackId) {
        CDVPluginResult *pluginResult = nil;
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:YES];
        [pluginResult setKeepCallbackAsBool:YES];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:longRange2DDisconnectedListenerCallbackId];
    }
}
- (void)initWithLongRange2DDevice:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult *pluginResult = nil;
    @try {
        if (!self.longRange2DDevice) {
            NSArray *arguments = command.arguments;
            NSString *deviceModel = [NSString stringWithFormat:@"%@", [arguments objectAtIndex:0]];
            self.longRange2DDevice = [[LongRange2DDevice alloc] initWithDeviceModel:deviceModel];
            self.longRange2DDevice.deviceModel = deviceModel;
        }
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"success"];
    } @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"sdk error"];
    } @finally {
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
#pragma mark ---Listener---
- (void)setLongRange2DDisconnectedListener:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    longRange2DDisconnectedListenerCallbackId = command.callbackId;
}
- (void)setLongRange2DInitialized:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    longRange2DInitializedListenerCallbackId = command.callbackId;
}
- (void)setResultCodeListener:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    longRange2DResultCodeListenerCallbackId = command.callbackId;
}
- (void)setProgressListener:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    longRange2DProgressListenerCallbackId = command.callbackId;
}
- (void)setUpdateDeviceStateListener:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    longRange2DUpdateDeviceStateListenerCallbackId = command.callbackId;
}
- (void)setChangedActionStateListener:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    longRange2DChangedActionStateListenerCallbackId = command.callbackId;
}
- (void)setReceivedBarcodeStringListener:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    longRange2DReceivedBarcodeStringListenerCallbackId = command.callbackId;
}
- (void)setReceivedBarcodeDataListener:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    longRange2DReceivedBarcodeDataListenerCallbackId = command.callbackId;
}
- (void)setOnAsReaderTriggerKeyEventListener:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    longRange2DOnAsReaderTriggerKeyEventListenerCallbackId = command.callbackId;
}
#pragma mark ---Property---
- (void)setBeep:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult *pluginResult = nil;
    @try {
        if (self.longRange2D) {
            NSArray *arguments = command.arguments;
            int idx = [[arguments objectAtIndex:0] intValue];
            switch (idx) {
                case 0:
                case 1:
                case 2: {
                    self.longRange2D.beep = (LongRange2DBeepState)idx;
                    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"success"];
                }
                    break;
                default:{
                    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"parameter is not sufficient"];
                }
                    break;
            }
        }else{
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"longRange2D is nil"];
        }
    } @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"sdk error"];
    } @finally {
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)getBeep:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult *pluginResult = nil;
    @try {
        if (self.longRange2D) {
            LongRange2DBeepState beep = self.longRange2D.beep;
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:(int)beep];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"longRange2D is nil"];
        }
    } @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"sdk error"];
    } @finally {
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)setVibrator:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult *pluginResult = nil;
    @try {
        if (self.longRange2D) {
            NSArray *arguments = command.arguments;
            int idx = [[arguments objectAtIndex:0] intValue];
            switch (idx) {
                case 0:
                case 1:
                case 2: {
                    self.longRange2D.vibrator = (LongRange2DVibratorState)idx;
                    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"success"];
                }
                    break;
                default:{
                    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"parameter is not sufficient"];
                }
                    break;
            }
        }else{
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"longRange2D is nil"];
        }
    } @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"sdk error"];
    } @finally {
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)getVibrator:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult *pluginResult = nil;
    @try {
        if (self.longRange2D) {
            LongRange2DVibratorState vibrator = self.longRange2D.vibrator;
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:(int)vibrator];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"longRange2D is nil"];
        }
    } @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"sdk error"];
    } @finally {
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)setSleepTime:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult *pluginResult = nil;
    @try {
        if (self.longRange2D) {
            NSArray *arguments = command.arguments;
            int sleepTime = [[arguments objectAtIndex:0] intValue];
            self.longRange2D.sleepTime = sleepTime;
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"success"];
        }else{
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"longRange2D is nil"];
        }
    } @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"sdk error"];
    } @finally {
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)getSleepTime:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult *pluginResult = nil;
    @try {
        if (self.longRange2D) {
            int sleepTime = self.longRange2D.sleepTime;
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:sleepTime];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"longRange2D is nil"];
        }
    } @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"sdk error"];
    } @finally {
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)setAutoOffTime:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult *pluginResult = nil;
    @try {
        if (self.longRange2D) {
            NSArray *arguments = command.arguments;
            int autoOffTime = [[arguments objectAtIndex:0] intValue];
            self.longRange2D.autoOffTime = autoOffTime;
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"success"];
        }else{
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"longRange2D is nil"];
        }
    } @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"sdk error"];
    } @finally {
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)getAutoOffTime:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult *pluginResult = nil;
    @try {
        if (self.longRange2D) {
            int autoOffTime = self.longRange2D.autoOffTime;
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:autoOffTime];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"longRange2D is nil"];
        }
    } @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"sdk error"];
    } @finally {
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)setScannerTimeOut:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult *pluginResult = nil;
    @try {
        if (self.longRange2D) {
            NSArray *arguments = command.arguments;
            int scannerTimeOut = [[arguments objectAtIndex:0] intValue];
            self.longRange2D.scannerTimeOut = scannerTimeOut;
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"success"];
        }else{
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"longRange2D is nil"];
        }
    } @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"sdk error"];
    } @finally {
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)getScannerTimeOut:(CDVInvokedUrlCommand *)command  {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult *pluginResult = nil;
    @try {
        if (self.longRange2D) {
            int scannerTimeOut = self.longRange2D.scannerTimeOut;
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:scannerTimeOut];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"longRange2D is nil"];
        }
    } @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"sdk error"];
    } @finally {
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
#pragma mark ---Method---
- (void)getAddress:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSString *address = @"";
    if (self.longRange2DDevice) {
        address = [self.longRange2DDevice getAddress];
    }
    CDVPluginResult *pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:address];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)getSDKVersion:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSString *versionString = @"";
    if (self.longRange2DDevice) {
        versionString = [self.longRange2DDevice getSDKVersion];
    }
    CDVPluginResult *pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:versionString];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)getAction:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult *pluginResult = nil;
    if (self.longRange2D) {
        LongRange2DCommandType commandType = [self.longRange2D getAction];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:(int)commandType];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"longRange2D is nil"];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)getSerialNumber:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult *pluginResult = nil;
    if (self.longRange2D) {
        NSString *serialNumber = [self.longRange2D getSerialNumber];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:serialNumber];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"longRange2D is nil"];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)getFirmwareVersion:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult *pluginResult = nil;
    if (self.longRange2D) {
        NSString *firmwareVersion = [self.longRange2D getFirmwareVersion];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:firmwareVersion];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"longRange2D is nil"];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)getAsRingFirmwareVersion:(CDVInvokedUrlCommand *)command{
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult *pluginResult = nil;
    NSString *asRingFirmwareRevision = [[AsRingDeviceSDK sharedAsRingDeviceSDK] getAsRingFirmwareRevision];
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:asRingFirmwareRevision];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getBatteryStatus:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult *pluginResult = nil;
    if (self.longRange2D) {
        int batteryStatus = [self.longRange2D getBatteryStatus];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:batteryStatus];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"longRange2D is nil"];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)startScan:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult *pluginResult = nil;
    @try {
        if (self.longRange2D) {
            LongRange2DResultCode resultCode = [self.longRange2D startScan];
            NSString *errorString = @"success";
            if (resultCode != LongRange2DResultNoError) {
                errorString = [self.longRange2D getMessageWithResultCode:resultCode];
            }
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:errorString];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"longRange2D is nil"];
        }
    } @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"sdk error"];
    } @finally {
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)startScanWithEncodingType:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult *pluginResult = nil;
    @try {
        if (self.longRange2D) {
            NSArray *arguments = command.arguments;
            int encodingName = [[arguments objectAtIndex:0] intValue];
            encoding = (NSStringEncoding)encodingName;
            LongRange2DResultCode resultCode = [self.longRange2D startScan];
            NSString *errorString = @"success";
            if (resultCode != LongRange2DResultNoError) {
                errorString = [self.longRange2D getMessageWithResultCode:resultCode];
            }
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:errorString];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"longRange2D is nil"];
        }
    } @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"sdk error"];
    } @finally {
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)stopScan:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult *pluginResult = nil;
    @try {
        if (self.longRange2D) {
            LongRange2DResultCode resultCode = [self.longRange2D stopScan];
            NSString *errorString = @"success";
            if (resultCode != LongRange2DResultNoError) {
                errorString = [self.longRange2D getMessageWithResultCode:resultCode];
            }
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:errorString];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"longRange2D is nil"];
        }
    } @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"sdk error"];
    } @finally {
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)setBarcodeParam:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult *pluginResult = nil;
    @try {
        if (self.longRange2D) {
            NSArray *arguments = command.arguments;
            int paramName = [[arguments objectAtIndex:0] intValue];
            BOOL accessPassword = [[arguments objectAtIndex:1] boolValue];
            LongRange2DParamValue *longRange2DParamValue = [[LongRange2DParamValue alloc] init];
            longRange2DParamValue.paramName = (LongRange2DParamNameOptions)paramName;
            longRange2DParamValue.value = accessPassword;
            LongRange2DResultCode resultCode = [self.longRange2D setBarcodeParam:longRange2DParamValue];
            NSString *errorString = @"success";
            if (resultCode != LongRange2DResultNoError) {
                errorString = [self.longRange2D getMessageWithResultCode:resultCode];
            }
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:errorString];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"longRange2D is nil"];
        }
    } @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"sdk error"];
    } @finally {
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)getBarcodeParam:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult *pluginResult = nil;
    @try {
        if (self.longRange2D) {
            NSArray *arguments = command.arguments;
            int paramName = [[arguments objectAtIndex:0] intValue];
            LongRange2DParamValue *longRange2DParamValue = [self.longRange2D getBarcodeParam:(LongRange2DParamNameOptions)paramName];
            NSMutableDictionary *dic = [NSMutableDictionary dictionary];
            if (longRange2DParamValue) {
                [dic setValue:[LongRange2DParamName getName:longRange2DParamValue.paramName] forKey:@"paramName"];
                [dic setValue:[NSString stringWithFormat:@"%d", longRange2DParamValue.value] forKey:@"value"];
                [dic setValue:[NSString stringWithFormat:@"%lu", (unsigned long)longRange2DParamValue.paramName] forKey:@"param"];
            } else {
                [dic setValue:@"" forKey:@"paramName"];
                [dic setValue:@"" forKey:@"value"];
            }
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:dic];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"longRange2D is nil"];
        }
    } @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"sdk error"];
    } @finally {
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)startBeepWithBeepTime:(CDVInvokedUrlCommand *)command{
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult *pluginResult = nil;
    @try {
       if (self.longRange2D) {
           NSArray *arguments = command.arguments;
           int beepTime = [[arguments objectAtIndex:0] intValue];
           LongRange2DResultCode resultCode = [self.longRange2D startBeepWithBeepTime:beepTime];
           NSString *errorString = @"success";
           if (resultCode != LongRange2DResultNoError) {
               errorString = [self.longRange2D getMessageWithResultCode:resultCode];
           }
           pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:errorString];
       } else {
           pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"longRange2D is nil"];
        }
    } @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"sdk error"];
    } @finally {
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)startVibratorWithVibratorTime:(CDVInvokedUrlCommand *)command{
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult *pluginResult = nil;
    @try {
       if (self.longRange2D) {
           NSArray *arguments = command.arguments;
           int vibratorTime = [[arguments objectAtIndex:0] intValue];
           LongRange2DResultCode resultCode = [self.longRange2D startVibratorWithVibratorTime:vibratorTime];
           NSString *errorString = @"success";
           if (resultCode != LongRange2DResultNoError) {
               errorString = [self.longRange2D getMessageWithResultCode:resultCode];
           }
           pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:errorString];
       } else {
           pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"longRange2D is nil"];
        }
    } @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"sdk error"];
    } @finally {
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)setDefaultScannerPrama:(CDVInvokedUrlCommand *)command{
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
       CDVPluginResult *pluginResult = nil;
       @try {
          if (self.longRange2D) {
              LongRange2DResultCode resultCode = [self.longRange2D setDefaultScannerPrama];
              NSString *errorString = @"success";
              if (resultCode != LongRange2DResultNoError) {
                  errorString = [self.longRange2D getMessageWithResultCode:resultCode];
              }
              pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:errorString];
          } else {
              pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"longRange2D is nil"];
           }
       } @catch (NSException *exception) {
           pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"sdk error"];
       } @finally {
       }
       [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)updateFirmwareWithFileName:(CDVInvokedUrlCommand *)command{
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult *pluginResult = nil;
    @try {
       if (self.longRange2D) {
           NSArray *arguments = command.arguments;
           NSString *selectFirmware = [arguments objectAtIndex:0];
           NSData *firmwareData = [arguments objectAtIndex:1];
           [self.longRange2D updateFirmwareWithFileName:selectFirmware fileData:firmwareData resultCode:^(LongRange2DResultCode resultCode) {
               NSLog(@"%s,called",__PRETTY_FUNCTION__);
               if (self->longRange2DResultCodeListenerCallbackId) {
                   CDVPluginResult *pluginResult = nil;
                   NSString *errorString = @"success";
                   if (resultCode != LongRange2DResultNoError) {
                       errorString = [self.longRange2D getMessageWithResultCode:resultCode];
                   }
                   pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:errorString];
                   [pluginResult setKeepCallbackAsBool:YES];
                   [self.commandDelegate sendPluginResult:pluginResult callbackId:self->longRange2DResultCodeListenerCallbackId];
               }
           } progress:^(NSProgress *progress) {
               dispatch_async(dispatch_get_main_queue(), ^{
                   if (progress.totalUnitCount != 0) {
                       float pro = (float)progress.completedUnitCount/(float)progress.totalUnitCount;
                       NSNumber *number = [NSNumber numberWithFloat:pro];
                       double doubleNum = number.doubleValue;
                       NSLog(@"%s,called",__PRETTY_FUNCTION__);
                       if (self->longRange2DProgressListenerCallbackId) {
                           CDVPluginResult *pluginResult = nil;
                           pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDouble:doubleNum];
                           [pluginResult setKeepCallbackAsBool:YES];
                           [self.commandDelegate sendPluginResult:pluginResult callbackId:self->longRange2DProgressListenerCallbackId];
                       }
                   }
               });
           }];
           pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"success"];
       } else {
           pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"longRange2D is nil"];
        }
    } @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"sdk error"];
    } @finally {
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)doDefaultAsReaderTriggerKeyTouch:(CDVInvokedUrlCommand *)command{
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult *pluginResult = nil;
    @try {
        if (self.longRange2D) {
            LongRange2DResultCode resultCode = [self.longRange2D startScan];
            NSString *errorString = @"success";
            if (resultCode != LongRange2DResultNoError) {
                errorString = [self.longRange2D getMessageWithResultCode:resultCode];
            }
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:errorString];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"asreader is nil"];
        }
    } @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"sdk error"];
    } @finally {
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)doDefaultAsReaderTriggerKeyUp:(CDVInvokedUrlCommand *)command{
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult *pluginResult = nil;
    @try {
        if (self.longRange2D) {
            LongRange2DResultCode resultCode = [self.longRange2D stopScan];
            NSString *errorString = @"success";
            if (resultCode != LongRange2DResultNoError) {
                errorString = [self.longRange2D getMessageWithResultCode:resultCode];
            }
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:errorString];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"asreader is nil"];
        }
    } @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"sdk error"];
    } @finally {
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
#pragma mark ---LongRange2DDelegate---
- (void)longRange2DInitialized:(LongRange2D *)longRange2D {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    if (longRange2DInitializedListenerCallbackId) {
        CDVPluginResult *pluginResult = nil;
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:YES];
        [pluginResult setKeepCallbackAsBool:YES];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:longRange2DInitializedListenerCallbackId];
    }
}
- (void)updateDeviceState:(LongRange2DResultCode)error {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    if (longRange2DUpdateDeviceStateListenerCallbackId) {
        CDVPluginResult *pluginResult = nil;
        NSString *errorString = @"success";
        if (error != LongRange2DResultNoError) {
            errorString = [self.longRange2D getMessageWithResultCode:error];
        }
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:errorString];
        [pluginResult setKeepCallbackAsBool:YES];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:longRange2DUpdateDeviceStateListenerCallbackId];
    }
}
- (void)changedActionState:(LongRange2DCommandType)action
                resultCode:(NSInteger)resultCode {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    if (longRange2DChangedActionStateListenerCallbackId) {
        CDVPluginResult *pluginResult = nil;
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        [dic setValue:[NSString stringWithFormat:@"%lu",(unsigned long)action] forKey:@"action"];
        NSString *errorString = @"success";
        if (resultCode != LongRange2DResultNoError) {
            errorString = [self.longRange2D getMessageWithResultCode:resultCode];
        }
        [dic setValue:[NSString stringWithFormat:@"%@",errorString] forKey:@"resultCode"];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:dic];
        [pluginResult setKeepCallbackAsBool:YES];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:longRange2DChangedActionStateListenerCallbackId];
    }
}
- (void)receivedBarcodeString:(NSString *)barcodeString
                  barcodeType:(LongRange2DBarcodeTypeOptions)barcodeType {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    if (longRange2DReceivedBarcodeStringListenerCallbackId) {
        NSString *barcodeTypeStr = [LongRange2DBarcodeType getBarcodeString:barcodeType];
        CDVPluginResult *pluginResult = nil;
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        [dic setValue:barcodeTypeStr forKey:@"barcodeType"];
        [dic setValue:barcodeString forKey:@"barcodeString"];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:dic];
        [pluginResult setKeepCallbackAsBool:YES];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:longRange2DReceivedBarcodeStringListenerCallbackId];
    }
}
- (void)receivedBarcodeData:(NSData *)barcodeData
                barcodeType:(LongRange2DBarcodeTypeOptions)barcodeType {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    if (longRange2DReceivedBarcodeDataListenerCallbackId) {
        NSString *barcodeString = [[NSString alloc] initWithData:barcodeData encoding:encoding];
        if (!barcodeString) {
            barcodeString = @"";
        }
        NSString *barcodeTypeStr = [LongRange2DBarcodeType getBarcodeString:barcodeType];
        CDVPluginResult *pluginResult = nil;
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        [dic setValue:barcodeTypeStr forKey:@"barcodeType"];
        [dic setValue:barcodeString forKey:@"barcodeString"];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:dic];
        [pluginResult setKeepCallbackAsBool:YES];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:longRange2DReceivedBarcodeDataListenerCallbackId];
    }
}
- (BOOL)onAsReaderTriggerKeyEvent:(BOOL)status {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    if (longRange2DOnAsReaderTriggerKeyEventListenerCallbackId) {
        CDVPluginResult *pluginResult = nil;
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:status];
        [pluginResult setKeepCallbackAsBool:YES];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:longRange2DOnAsReaderTriggerKeyEventListenerCallbackId];
    }
    return NO;
}
@end
