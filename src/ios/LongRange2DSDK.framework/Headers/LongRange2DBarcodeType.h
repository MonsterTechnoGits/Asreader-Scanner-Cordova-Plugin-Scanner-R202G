#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, LongRange2DBarcodeTypeOptions) {
    LongRange2DBarcodeTypeNoRead,
    LongRange2DBarcodeTypeAustralianPost,
    LongRange2DBarcodeTypeAztecCode,
    LongRange2DBarcodeTypeBPO,
    LongRange2DBarcodeTypeCanadaPost,
    LongRange2DBarcodeTypeDutchPost,
//    BarcodeTypeBooklandEAN,
//    BarcodeTypeBritishPost,
//    BarcodeTypeCanadianPost,
//    BarcodeTypeChinaPost,
    LongRange2DBarcodeTypeCodabar,
    LongRange2DBarcodeTypeCodablockA,
    LongRange2DBarcodeTypeCodablockF,
    LongRange2DBarcodeTypeCode11,
    LongRange2DBarcodeTypeCode128,
    LongRange2DBarcodeTypeGS1128,
    LongRange2DBarcodeTypeGS1DataBar,
    LongRange2DBarcodeTypeGS1DataBarLimited,
    LongRange2DBarcodeTypeGS1DataBarExpanded,
    LongRange2DBarcodeTypeInterleaved2Of5,
    LongRange2DBarcodeTypeJapanPost,
//    BarcodeTypeCode16K,
//    BarcodeTypeCode32,
    LongRange2DBarcodeTypeCode39,
//    BarcodeTypeCode49,
    LongRange2DBarcodeTypeCode93,
    LongRange2DBarcodeTypeCompositeAB,
    LongRange2DBarcodeTypeCompositeC,
//    BarcodeTypeD2of5,
    LongRange2DBarcodeTypeDataMatrix,
    LongRange2DBarcodeTypeMatrix2Of5,
//    BarcodeTypeEAN128,
    LongRange2DBarcodeTypeEAN13,
//    LongRange2DBarcodeTypeEAN13CouponCode,
    LongRange2DBarcodeTypeEAN8,
//    BarcodeTypeI2of5,
//    BarcodeTypeIATA,
//    BarcodeTypeISBT128,
//    BarcodeTypeISBT128Concat,
//    BarcodeTypeJapanesePost,
//    BarcodeTypeKixPost,
//    BarcodeTypeKoreaPost,
//    BarcodeTypeMacroMicroPDF,
    LongRange2DBarcodeTypeMaxiCode,
    LongRange2DBarcodeTypeMicroPDF417,
//    BarcodeTypeMicroPDF,
    LongRange2DBarcodeTypeMSI,
//    BarcodeTypeMultipacketFormat,
//    BarcodeTypeOCR,
//    BarcodeTypeParameterFNC3,
    LongRange2DBarcodeTypePDF417,
    LongRange2DBarcodeTypePlanet,
//    LongRange2DBarcodeTypePlanetCode,
    LongRange2DBarcodeTypePlesseyCode,
//    BarcodeTypePosiCode,
    LongRange2DBarcodeTypePostnet,
    LongRange2DBarcodeTypeQRCode,
    LongRange2DBarcodeTypeStandard2Of5,
    LongRange2DBarcodeTypeSwedenPost,
//    BarcodeTypeR2of5,
//    BarcodeTypeRSS,
//    BarcodeTypeScanletWebcode,
    LongRange2DBarcodeTypeTelepen,
    LongRange2DBarcodeTypeTLC39,
//    BarcodeTypeTriopticCode,
    LongRange2DBarcodeTypeUPCA,
    LongRange2DBarcodeTypeUPCE,
//    BarcodeTypeVeriCode,
//    BarcodeTypeX2of5,
//    BarcodeTypeRSSLimited,
//    BarcodeTypeChineseSensible,
//    BarcodeTypeRSSExpanded
};

@interface LongRange2DBarcodeType : NSObject
+ (LongRange2DBarcodeTypeOptions)getBarcodeType:(NSString *)typeString;
+ (NSString *)getBarcodeString:(LongRange2DBarcodeTypeOptions)barcodeType;
@end
