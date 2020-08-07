    var exec = require('cordova/exec');

    window.LongRange2DParamNameOptions = {
        LongRange2DUnknown                        : 0,
        LongRange2DDefault                        : 1,
        LongRange2DRevision                       : 2,
        LongRange2DRevisionDecoder                : 3,
        LongRange2DRevisionDriver                 : 4,
        LongRange2DTerminalId                     : 5,
        LongRange2DBaudrate                       : 6,
        LongRange2DWordLength                     : 7,
        LongRange2DReceiverTimeout                : 8,
        LongRange2DRtsCts                         : 9,
        LongRange2DXonXoff                        : 10,
        LongRange2DAckNak                         : 11,
        LongRange2DTtlLeve                        : 12,
        LongRange2DImageVga                       : 13,
        LongRange2DPowerUpBeeper                  : 14,
        LongRange2DBeepOnBELChar                  : 15,
        LongRange2DTriggerClick                   : 16,
        LongRange2DBeep                           : 17,
        LongRange2DBeepVolume                     : 18,
        LongRange2DBeepFreq                       : 19,
        LongRange2DBeepError                      : 20,
        LongRange2DBeepDuration                   : 21,
        LongRange2DLed                            : 22,
        LongRange2DLedPolarity                    : 23,
        LongRange2DBeepErrNumber                  : 24,
        LongRange2DBeepNumber                     : 25,
        LongRange2DBeepPolarity                   : 26,
        LongRange2DGoodReadDelay                  : 27,
        LongRange2DTriggerMode                    : 28,
        LongRange2DManualTriggerMode              : 29,
        LongRange2DIlluminationManual             : 30,
        LongRange2DReadTimeout                    : 31,
        LongRange2DLowPowerTimeout                : 32,
        LongRange2DLedAfterDecode                 : 33,
        LongRange2DLedTimeout                     : 34,
        LongRange2DPresentSensitifity             : 35,
        LongRange2DPresentaionMode                : 36,
        LongRange2DIdleIllumination               : 37,
        LongRange2DPresentationCenteringEnable    : 38,
        LongRange2DPresentationCenteringTop       : 39,
        LongRange2DPresentationCenteringBottom    : 40,
        LongRange2DPresentationCenteringLeft      : 41,
        LongRange2DPresentationCenteringRight     : 42,
        LongRange2DPoorQuality1DCodes             : 43,
        LongRange2DPoorQuality1PDFCodes           : 44,
        LongRange2DCodeGate                       : 45,
        LongRange2DHandlHeldScanning              : 46,
        LongRange2DPresentationScanning           : 47,
        LongRange2DHandsFreeTimeout               : 48,
        LongRange2DRereadDelay                    : 49,
        LongRange2DLedPowerLevel                  : 50,
        LongRange2DRereadDelay2D                  : 51,
        LongRange2DCharActMode                    : 52,
        LongRange2DActiveChar                     : 53,
        LongRange2DEndCharAct                     : 54,
        LongRange2DCharActTimeout                 : 55,
        LongRange2DCharDeactMode                  : 56,
        LongRange2DDeactChar                      : 57,
        LongRange2DIlluminationLights             : 58,
        LongRange2DImagerTimeout                  : 59,
        LongRange2DAimerDelay                     : 60,
        LongRange2DAimerMode                      : 61,
        LongRange2DCenterWindow                   : 62,
        LongRange2DCenterWindowLeft               : 63,
        LongRange2DCenterWindowRight              : 64,
        LongRange2DCenterWindowTop                : 65,
        LongRange2DCenterWindowBottom             : 66,
        LongRange2DCenterWin40                    : 67,
        LongRange2DCenterWin60                    : 68,
        LongRange2DDecodeMode                     : 69,
        LongRange2DEnterSequence                  : 70,
        LongRange2DDefaultSequence                : 71,
        LongRange2DRequireSequence                : 72,
        LongRange2DMultipleSymbols                : 73,
        LongRange2DNoRead                         : 74,
        LongRange2DPrintWeight                    : 75,
        LongRange2DVideoReverse                   : 76,
        LongRange2DWorkingOrientation             : 77,
        LongRange2DAddAllCRSuffix                 : 78,
        LongRange2DAddPrefix                      : 79,
        LongRange2DClearOnePrefix                 : 80,
        LongRange2DClearAllPrefix                 : 81,
        LongRange2DAddSuffix                      : 82,
        LongRange2DClearOneSuffix                 : 83,
        LongRange2DClearAllSuffix                 : 84,
        LongRange2DFuncCodeTransmit               : 85,
        LongRange2DIntercharacterDelay            : 86,
        LongRange2DIntercharacterDelayLength      : 87,
        LongRange2DCharacterTriggerDelay          : 88,
        LongRange2DInterfunctionDelay             : 89,
        LongRange2DIntermessageDealy              : 90,
        LongRange2DDefaultDataFormat              : 91,
        LongRange2DEnterDataFormat                : 92,
        LongRange2DClearOneDataFormat             : 93,
        LongRange2DClearAllDataFormat             : 94,
        LongRange2DDataFormatter                  : 95,
        LongRange2DAlternateDataFormats1          : 96,
        LongRange2DAlternateDataFormats2          : 97,
        LongRange2DAlternateDataFormats3          : 98,
        LongRange2DDataFormat                     : 99,
        LongRange2DAllSymbol                      : 100,
        LongRange2DCodabarDefault                 : 101,
        LongRange2DCodabar                        : 102,
        LongRange2DCodabarStartStopChar           : 103,
        LongRange2DCodabarCheckChar               : 104,
        LongRange2DCodabarConcatenation           : 105,
        LongRange2DCodabarLengthMin               : 106,
        LongRange2DCodabarLengthMax               : 107,
        LongRange2DCode39Default                  : 108,
        LongRange2DCode39                         : 109,
        LongRange2DCode39StartStopChar            : 110,
        LongRange2DCode39CheckChar                : 111,
        LongRange2DCode39LengthMin                : 112,
        LongRange2DCode39LengthMax                : 113,
        LongRange2DCode39Append                   : 114,
        LongRange2DCode32Pharmaceutical           : 115,
        LongRange2DCode39FullAscii                : 116,
        LongRange2DCode39CodePage                 : 117,
        LongRange2DI2of5Default                   : 118,
        LongRange2DI2of5                          : 119,
        LongRange2DI2of5CheckDigit                : 120,
        LongRange2DI2of5LengthMin                 : 121,
        LongRange2DI2of5LengthMax                 : 122,
        LongRange2DNEC2of5Default                 : 123,
        LongRange2DNEC2of5                        : 124,
        LongRange2DNEC2of5CheckDigit              : 125,
        LongRange2DNEC2of5LengthMin               : 126,
        LongRange2DNEC2of5LengthMax               : 127,
        LongRange2DCode93Default                  : 128,
        LongRange2DCode93                         : 129,
        LongRange2DCode93LengthMin                : 130,
        LongRange2DCode93LengthMax                : 131,
        LongRange2DCode93Append                   : 132,
        LongRange2DCode93CodePage                 : 133,
        LongRange2DR2of5Default                   : 134,
        LongRange2DR2of5                          : 135,
        LongRange2DR2of5LengthMin                 : 136,
        LongRange2DR2of5LengthMax                 : 137,
        LongRange2DA2of5Default                   : 138,
        LongRange2DA2of5                          : 139,
        LongRange2DA2of5LengthMin                 : 140,
        LongRange2DA2of5LengthMax                 : 141,
        LongRange2DX2of5Default                   : 142,
        LongRange2DX2of5                          : 143,
        LongRange2DX2of5LengthMin                 : 144,
        LongRange2DX2of5LengthMax                 : 145,
        LongRange2DCode11Default                  : 146,
        LongRange2DCode11                         : 147,
        LongRange2DCode11CheckDigit               : 148,
        LongRange2DCode11LengthMin                : 149,
        LongRange2DCode11LengthMax                : 150,
        LongRange2DCode128Default                 : 151,
        LongRange2DCode128                        : 152,
        LongRange2DIsbtConcatenation              : 153,
        LongRange2DCode128LengthMin               : 154,
        LongRange2DCode128LengthMax               : 155,
        LongRange2DCode128Append                  : 156,
        LongRange2DCode128CodePage                : 157,
        LongRange2DGS1128Default                  : 158,
        LongRange2DGS1128                         : 159,
        LongRange2DGS1128LengthMin                : 160,
        LongRange2DGS1128LengthMax                : 161,
        LongRange2DTelepenDefault                 : 162,
        LongRange2DTelepen                        : 163,
        LongRange2DTelepenOutput                  : 164,
        LongRange2DTelepenLengthMin               : 165,
        LongRange2DTelepenLengthMax               : 166,
        LongRange2DUPCADefault                    : 167,
        LongRange2DUPCA                           : 168,
        LongRange2DUPCACheckDigit                 : 169,
        LongRange2DUPCANumberSystem               : 170,
        LongRange2DUPCA2DigitAdd                  : 171,
        LongRange2DUPCA5DigitAdd                  : 172,
        LongRange2DUPCAAddReq                     : 173,
        LongRange2DUPCAAddSep                     : 174,
        LongRange2DUPCACouponCode                 : 175,
        LongRange2DCouponGS1DataBarOutput         : 176,
        LongRange2DConvertUPCAtoEAN13             : 177,
        LongRange2DUPCE0Default                   : 178,
        LongRange2DUPCE0                          : 179,
        LongRange2DUPCE0Expand                    : 180,
        LongRange2DUPCE0CheckDigit                : 181,
        LongRange2DUPCE0NumberSystem              : 182,
        LongRange2DUPCE02DigitAdd                 : 183,
        LongRange2DUPCE05DigitAdd                 : 184,
        LongRange2DUPCE0AddReq                    : 185,
        LongRange2DUPCE0AddSep                    : 186,
        LongRange2DUPCE1                          : 187,
        LongRange2DEAN13Default                   : 188,
        LongRange2DEAN13                          : 189,
        LongRange2DEAN13CheckDigit                : 190,
        LongRange2DEAN132DigitAdd                 : 191,
        LongRange2DEAN135DigitAdd                 : 192,
        LongRange2DEAN13AddReq                    : 193,
        LongRange2DEAN13AddSep                    : 194,
        LongRange2DIsbnTranslate                  : 195,
        LongRange2DEAN8Default                    : 196,
        LongRange2DEAN8                           : 197,
        LongRange2DEAN8CheckDigit                 : 198,
        LongRange2DEAN82DigitAdd                  : 199,
        LongRange2DEAN85DigitAdd                  : 200,
        LongRange2DEAN8AddReq                     : 201,
        LongRange2DEAN8AddSep                     : 202,
        LongRange2DMSIDefault                     : 203,
        LongRange2DMSI                            : 204,
        LongRange2DMSICheckChar                   : 205,
        LongRange2DMSILengthMin                   : 206,
        LongRange2DMSILengthMax                   : 207,
        LongRange2DRSS14Default                   : 208,
        LongRange2DRSS14                          : 209,
        LongRange2DRSSLimitDefault                : 210,
        LongRange2DRSSLimit                       : 211,
        LongRange2DRSSExpDefault                  : 212,
        LongRange2DRSSExp                         : 213,
        LongRange2DRSSExpLengthMin                : 214,
        LongRange2DRSSExpLengthMax                : 215,
        LongRange2DTriopticCode                   : 216,
        LongRange2DCodablockADefault              : 217,
        LongRange2DCodablockA                     : 218,
        LongRange2DCodablockALengthMin            : 219,
        LongRange2DCodablockALengthMax            : 220,
        LongRange2DCodablockFDefault              : 221,
        LongRange2DCodablockF                     : 222,
        LongRange2DCodablockFLengthMin            : 223,
        LongRange2DCodablockFLengthMax            : 224,
        LongRange2DPDF417Default                  : 225,
        LongRange2DPDF417                         : 226,
        LongRange2DPDF417LengthMin                : 227,
        LongRange2DPDF417LengthMax                : 228,
        LongRange2DMacroPDF417                    : 229,
        LongRange2DMicroPDFDefault                : 230,
        LongRange2DMicroPDF                       : 231,
        LongRange2DMicroPDFLengthMin              : 232,
        LongRange2DMicroPDFLengthMax              : 233,
        LongRange2DComCode                        : 234,
        LongRange2DUPCEANVersion                  : 235,
        LongRange2DComCodeLengthMin               : 236,
        LongRange2DComCodeLengthMax               : 237,
        LongRange2DComCodeEmulation               : 238,
        LongRange2DGS1Emulation                   : 239,
        LongRange2DTLC39                          : 240,
        LongRange2DChinaPostDefault               : 241,
        LongRange2DChinaPost                      : 242,
        LongRange2DChinaPostLengthMin             : 243,
        LongRange2DChinaPostLengthMax             : 244,
        LongRange2DJapanPost                      : 245,
        LongRange2DKoreaPostDefault               : 246,
        LongRange2DKoreaPost                      : 247,
        LongRange2DKoreaPostLengthMin             : 248,
        LongRange2DKoreaPostLengthMax             : 249,
        LongRange2DKoreaPostCheckDigit            : 250,
        LongRange2DQRCodeDefault                  : 251,
        LongRange2DQRCode                         : 252,
        LongRange2DQRCodeLengthMin                : 253,
        LongRange2DQRCodeLengthMax                : 254,
        LongRange2DQRCodeAppend                   : 255,
        LongRange2DQRCodePage                     : 256,
        LongRange2DMatrixDefault                  : 257,
        LongRange2DMatrix                         : 258,
        LongRange2DMatrixLengthMin                : 259,
        LongRange2DMatrixLengthMax                : 260,
        LongRange2DMatrixAppend                   : 261,
        LongRange2DMatrixCodePage                 : 262,
        LongRange2DMaxiCodeDefault                : 263,
        LongRange2DMaxiCode                       : 264,
        LongRange2DMaxiCodeLengthMin              : 265,
        LongRange2DMaxiCodeLengthMax              : 266,
        LongRange2DAztecCodeDefault               : 267,
        LongRange2DAztecCode                      : 268,
        LongRange2DAztecCodeLengthMin             : 269,
        LongRange2DAztecCodeLengthMax             : 270,
        LongRange2DAztecAppend                    : 271,
        LongRange2DAztecCodePage                  : 272,
        LongRange2DAztecCodeRunes                 : 273,
        LongRange2DHanXinCodeDefault              : 274,
        LongRange2DHanXinCode                     : 275,
        LongRange2DHanXinCodeLengthMin            : 276,
        LongRange2DHanXinCodeLengthMax            : 277,
        LongRange2DPostalCodes                    : 278,
        LongRange2DAustralianPostInterpretation   : 279,
        LongRange2DImageDefault                   : 290,
        LongRange2DImageStyle                     : 281,
        LongRange2DImageBeep                      : 282,
        LongRange2DImageExposure                  : 283,
        LongRange2DImageFrameRate                 : 284,
        LongRange2DImageGain                      : 285,
        LongRange2DImageDelta                     : 286,
        LongRange2DImageLed                       : 287,
        LongRange2DImageTrigger                   : 288,
        LongRange2DImageUpdate                    : 289,
        LongRange2DImageWhite                     : 290,
        LongRange2DImagePercentage                : 291,
        LongRange2DImageFilter                    : 292,
        LongRange2DImageCompensation              : 293,
        LongRange2DImagePixelDepth                : 294,
        LongRange2DImageSharpenEdges              : 295,
        LongRange2DImageFormat                    : 296,
        LongRange2DImageHistogram                 : 297,
        LongRange2DImageInvertX                   : 298,
        LongRange2DImageInvertY                   : 299,
        LongRange2DImageFlySpec                   : 300,
        LongRange2DImageRotate                    : 301,
        LongRange2DImageQuality                   : 302,
        LongRange2DImageGamma                     : 303,
        LongRange2DImageCropLeft                  : 304,
        LongRange2DImageCropBottom                : 305,
        LongRange2DImageCropMargin                : 306,
        LongRange2DImageProtocol                  : 307,
        LongRange2DImageShipEvery                 : 308,
        LongRange2DImageDocFilter                 : 309,
        LongRange2DImageShipHistogram             : 310,
        LongRange2DOCRDefault                     : 311,
        LongRange2DOCR                            : 312,
        LongRange2DOCRTemplate                    : 313,
        LongRange2DOCRVarG                        : 314,
        LongRange2DOCRVarH                        : 315,
        LongRange2DOCRCheckChar                   : 316,
        LongRange2DGS1DatabarRSS14                : 317
    } ;
    window.LongRange2DBeepState = {
        LongRange2DBeep_Off                     : 0,
        LongRange2DBeep_Low                     : 1,
        LongRange2DBeep_High                    : 2
    };
    window.LongRange2DVibratorState = {
        LongRange2DVibrator_Off                 : 0,
        LongRange2DVibrator_On                  : 1
    };
    window.LongRange2DCommandType = {
        LongRange2DCommandDecodeStart           :0x64,
        LongRange2DCommandStop                  :0x73,
        LongRange2DCommandScanTimeOut           :0x74,
        LongRange2DCommandEnterBypass           :0x42,
        LongRange2DCommandEnterBarcodeBypass    :0x59,
        LongRange2DCommandLeaveBypass           :0x43,
        LongRange2DCommandBeepStart             :0x75,
        LongRange2DCommandVibratorStart         :0x76
    };
    window.EncodingType = {
        NSASCIIStringEncoding         : 1,
        NSNEXTSTEPStringEncoding      : 2,
        NSJapaneseEUCStringEncoding   : 3,
        NSUTF8StringEncoding          : 4,
        NSISOLatin1StringEncoding     : 5,
        NSSymbolStringEncoding        : 6,
        NSNonLossyASCIIStringEncoding : 7,
        NSShiftJISStringEncoding      : 8,
        NSISOLatin2StringEncoding     : 9,
        NSUnicodeStringEncoding       : 10,
        NSWindowsCP1251StringEncoding : 11,
        NSWindowsCP1252StringEncoding : 12,
        NSWindowsCP1253StringEncoding : 13,
        NSWindowsCP1254StringEncoding : 14,
        NSWindowsCP1250StringEncoding : 15,
        NSISO2022JPStringEncoding     : 21,
        NSMacOSRomanStringEncoding    : 30
    };
    
    exports.coolMethod = function (arg0, success, error) {
        exec(success, error, 'LongRange2DPlugin', 'coolMethod', [arg0]);
    };

    module.exports = {
    initWithLongRange2DDevice: function (listener, deviceModel) {
        exec(listener, null, "LongRange2DPlugin", "initWithLongRange2DDevice", [deviceModel]);
    },
    setLongRange2DDisconnectedListener: function (listener) {
        exec(listener, null, "LongRange2DPlugin", "setLongRange2DDisconnectedListener", []);
    },
    setLongRange2DInitialized: function (listener) {
        exec(listener, null, "LongRange2DPlugin", "setLongRange2DInitialized", []);
    },
    getAddress: function (listener) {
        exec(listener, null, "LongRange2DPlugin", "getAddress", []);
    },
    getSDKVersion: function (listener) {
        exec(listener, null, "LongRange2DPlugin", "getSDKVersion", []);
    },
    getAsRingFirmwareVersion: function (listener) {
        exec(listener, null, "LongRange2DPlugin", "getAsRingFirmwareVersion", []);
    },
    setBeep: function (listener, beep) {
        exec(listener, null, "LongRange2DPlugin", "setBeep", [beep]);
    },
    getBeep: function (listener) {
        exec(listener, null, "LongRange2DPlugin", "getBeep", []);
    },
    setVibrator: function (listener, vibrator) {
        exec(listener, null, "LongRange2DPlugin", "setVibrator", [vibrator]);
    },
    getVibrator: function (listener) {
        exec(listener, null, "LongRange2DPlugin", "getVibrator", []);
    },
    setSleepTime: function (listener, sleepTime) {
        exec(listener, null, "LongRange2DPlugin", "setSleepTime", [sleepTime]);
    },
    getSleepTime: function (listener) {
        exec(listener, null, "LongRange2DPlugin", "getSleepTime", []);
    },
    setAutoOffTime: function (listener, autoOffTime) {
        exec(listener, null, "LongRange2DPlugin", "setAutoOffTime", [autoOffTime]);
    },
    getAutoOffTime: function (listener) {
        exec(listener, null, "LongRange2DPlugin", "getAutoOffTime", []);
    },
    setScannerTimeOut: function (listener, scannerTimeOut) {
        exec(listener, null, "LongRange2DPlugin", "setScannerTimeOut", [scannerTimeOut]);
    },
    getScannerTimeOut: function (listener) {
        exec(listener, null, "LongRange2DPlugin", "getScannerTimeOut", []);
    },
    getAction: function (listener) {
        exec(listener, null, "LongRange2DPlugin", "getAction", []);
    },
    getSerialNumber: function (listener) {
        exec(listener, null, "LongRange2DPlugin", "getSerialNumber", []);
    },
    getFirmwareVersion: function (listener) {
        exec(listener, null, "LongRange2DPlugin", "getFirmwareVersion", []);
    },
    getBatteryStatus: function (listener) {
        exec(listener, null, "LongRange2DPlugin", "getBatteryStatus", []);
    },
    startScan: function (listener) {
        exec(listener, null, "LongRange2DPlugin", "startScan", []);
    },
    startScanWithEncodingType: function (listener, encodingType) {
        exec(listener, null, "LongRange2DPlugin", "startScanWithEncodingType", [encodingType]);
    },
    stopScan: function (listener) {
        exec(listener, null, "LongRange2DPlugin", "stopScan", []);
    },
    setBarcodeParam: function (listener, paramName, value) {
        exec(listener, null, "LongRange2DPlugin", "setBarcodeParam", [paramName, value]);
    },
    getBarcodeParam: function (listener, paramName) {
        exec(listener, null, "LongRange2DPlugin", "getBarcodeParam", [paramName]);
    },
    startBeepWithBeepTime: function (listener, beepTime) {
        exec(listener, null, "LongRange2DPlugin", "startBeepWithBeepTime", [beepTime]);
    },
    startVibratorWithVibratorTime: function (listener, vibratorTime) {
        exec(listener, null, "LongRange2DPlugin", "startVibratorWithVibratorTime", [vibratorTime]);
    },
    setDefaultScannerPrama: function (listener) {
        exec(listener, null, "LongRange2DPlugin", "setDefaultScannerPrama", []);
    },
    updateFirmwareWithFileName: function (listener, fileName, firmwareData) {
        exec(listener, null, "LongRange2DPlugin", "updateFirmwareWithFileName", [fileName, firmwareData]);
    },
    doDefaultAsReaderTriggerKeyTouch: function (listener) {
        exec(listener, null, "LongRange2DPlugin", "doDefaultAsReaderTriggerKeyTouch", []);
    },
    doDefaultAsReaderTriggerKeyUp: function (listener) {
        exec(listener, null, "LongRange2DPlugin", "doDefaultAsReaderTriggerKeyUp", []);
    },
    setResultCodeListener: function (listener) {
        exec(listener, null, "LongRange2DPlugin", "setResultCodeListener", []);
    },
    setProgressListener: function (listener) {
        exec(listener, null, "LongRange2DPlugin", "setProgressListener", []);
    },
    setUpdateDeviceStateListener: function (listener) {
        exec(listener, null, "LongRange2DPlugin", "setUpdateDeviceStateListener", []);
    },
    setChangedActionStateListener: function (listener) {
        exec(listener, null, "LongRange2DPlugin", "setChangedActionStateListener", []);
    },
    setReceivedBarcodeStringListener: function (listener) {
        exec(listener, null, "LongRange2DPlugin", "setReceivedBarcodeStringListener", []);
    },
    setReceivedBarcodeDataListener: function (listener) {
        exec(listener, null, "LongRange2DPlugin", "setReceivedBarcodeDataListener", []);
    },
    setOnAsReaderTriggerKeyEventListener: function (listener) {
        exec(listener, null, "LongRange2DPlugin", "setOnAsReaderTriggerKeyEventListener", []);
    },
    };
