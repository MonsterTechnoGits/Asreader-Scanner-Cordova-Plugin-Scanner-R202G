#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, LongRange2DBeepState) {
    LongRange2DBeep_Off,
    LongRange2DBeep_Low,
    LongRange2DBeep_High,
};

typedef NS_ENUM(NSUInteger, LongRange2DVibratorState) {
    LongRange2DVibrator_Off,
    LongRange2DVibrator_On,
};

typedef NS_ENUM(NSUInteger, LongRange2DResultCode) {
    LongRange2DResultNoError = 0x0000,
    // Device Error
    LongRange2DResultOtherError = 0x0001,
    LongRange2DResultInsufficientPower = 0x000B,
    // SDK Error
    LongRange2DResultInOperation = 0xE000,
    LongRange2DResultOutOfRange = 0xE001,
    LongRange2DResultNotConnected = 0xE100,
    LongRange2DResultInvalidParameter = 0xE200,
    LongRange2DResultInvalidResponse = 0xE300,
    LongRange2DResultNotSupportFirmware = 0xEE00,
    LongRange2DResultTimeout = 0xEFFF,
    // Operation Error
    LongRange2DResultHandleMismatch = 0xF001,
    LongRange2DResultCRCError = 0xF002,
    LongRange2DResultCommandFormatError = 0xF007,
    LongRange2DResultParamError = 0xFFFB,
    LongRange2DResultBusy = 0xFFFC,
    LongRange2DResultInvalidCommand = 0xFFFD,
    LongRange2DResultLowBattery = 0xFFFE,
    LongRange2DResultOperationFailed = 0xFFFF,
};
// Declare Packet Type Codes
typedef NS_ENUM(NSUInteger, LongRange2DPacketType) {
    LongRange2DPacketResSetProperty = 0x57,        // 'W'
    LongRange2DPacketResGetProperty = 0x52,        // 'R'
    LongRange2DPacketCommandAck = 0x41,            // 'A'
    LongRange2DPacketPacketEvent = 0x65,                 // 'e'
    LongRange2DPacketErrorAck = 0x45,              // 'E'
};

// Declare Property Type Codes
typedef NS_ENUM(NSUInteger, LongRange2DPropertyType) {
    LongRange2DPropertyBeep = 0x62,              // 'b'
    LongRange2DPropertyVibrator = 0x71,            // 'q'
    LongRange2DPropertyFirmwareVersion = 0x76,     // 'v'
    LongRange2DPropertyBatteryStatus = 0x65,       // 'e'
    LongRange2DPropertySerialNo = 0x53,            // 'S'
    LongRange2DPropertyBarcode =  0x48,            // 'H'  // cc barcode
    LongRange2DPropertyBarcodeOpertationMode = 0x6F,  // 'o'  // cc barcode
    LongRange2DPropertyBarcodeState = 0x78,        // 'x'  // cc barcode
    LongRange2DPropertyBarcodeRevision = 0x4B,     // 'K'  // cc barcode
    LongRange2DPropertySleepTime = 0x79,           // 'y'
    LongRange2DPropertyAutoOffTime = 0x74,         // 't'
    LongRange2DPropertyUpdateFirmwareAddress   = 0x61,                // 'a'
    LongRange2DPropertyUpdateFirmwareInfo      = 0x69,                // 'i'
    LongRange2DPropertyUpdateFirmwarePicket    = 0x66,                // 'f'
    LongRange2DPropertyUpdateFirmwarePicketEND = 0x64,                // 'd'
    LongRange2DPropertyDefaultScannerPrama     = 0x72,       // 'r'
    LongRange2DPropertyScannerTimeOut          = 0x6F,  // 'o'
};

// Declare Sub Command Type Codes
typedef NS_ENUM(NSUInteger, LongRange2DCommandType) {
    LongRange2DCommandDecodeStart = 0x64,          // 'd'
    LongRange2DCommandStop = 0x73,    				// 's'
    LongRange2DCommandScanTimeOut = 0x74,          // 't'
    LongRange2DCommandEnterBypass = 0x42,          // 'B'
    LongRange2DCommandEnterBarcodeBypass = 0x59,   // 'Y'
    LongRange2DCommandLeaveBypass = 0x43,          // 'C'
    LongRange2DCommandBeepStart = 0x75,          // 'u'
    LongRange2DCommandVibratorStart = 0x76,        // 'v'
};

// Declare Event Type Codes
typedef NS_ENUM(NSUInteger, LongRange2DEventType) {
    LongRange2DEventRemoteKey = 0x42,              // 'B'
    LongRange2DEventBarcodeValue = 0x43,           // 'C'
};

@interface LongRange2DPacket : NSObject 
@property (nonatomic) NSInteger errorCode;
@property (strong, nonatomic) NSData *data;

- (id)initWithPacketType:(LongRange2DPacketType)type subType:(uint8_t)subType;

- (LongRange2DPacketType)type;
- (uint8_t)subType;

- (void)signal;
- (void)wait;

- (BOOL)equalPacket:(LongRange2DPacketType)type subType:(uint8_t)subType;
- (BOOL)checkTimeoutInterval:(int)interval withTimeout:(int)maxTimeout;

@end

@interface LongRange2DPacketManager : NSObject 

- (void)addPacket:(LongRange2DPacket *)packet;
- (LongRange2DPacket *)waitPacket:(LongRange2DPacketType)type subType:(uint8_t)subType;
- (LongRange2DPacket *)findPacket:(LongRange2DPacketType)type subType:(uint8_t)subType;
- (LongRange2DPacket *)firstPacket;
- (void)removePacket:(LongRange2DPacket *)packet;
- (BOOL)isWaitPacket;

@end
