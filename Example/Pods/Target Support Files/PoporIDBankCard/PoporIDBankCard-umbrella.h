#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "XLBankScanViewController.h"
#import "XLBaseViewController.h"
#import "XLIDScanViewController.h"
#import "XLScanBaseViewController.h"
#import "BankCardSearch.h"
#import "RectManager.h"
#import "UIImage+Extend.h"
#import "XLScanBaseManager.h"
#import "XLScanManager.h"
#import "XLScanManagerControl.h"
#import "XLScanManagerInitialize.h"
#import "XLScanResultModel.h"
#import "OverlayerBankView.h"
#import "OverlayerIDView.h"
#import "OverlayerViewDelegate.h"
#import "OverlayerViewTool.h"
#import "BankCard.h"
#import "exbankcard.h"
#import "exbankcardcore.h"
#import "commondef.h"
#import "excards.h"

FOUNDATION_EXPORT double PoporIDBankCardVersionNumber;
FOUNDATION_EXPORT const unsigned char PoporIDBankCardVersionString[];

