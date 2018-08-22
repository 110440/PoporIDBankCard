//
//  XLScanBaseViewController.h
//  IDAndBankCard
//
//  Created by mxl on 2017/3/28.
//  Copyright © 2017年 mxl. All rights reserved.
//

#import "XLBaseViewController.h"
#import "XLScanManager.h"
#import "XLScanResultModel.h"

@interface XLScanBaseViewController : XLBaseViewController

@property (nonatomic, strong) XLScanManager *cameraManager;

@property (nonatomic, getter=isShowScanResultDetailVC) BOOL showScanResultDetailVC;
@property (nonatomic, getter=isPushing) BOOL pushing;
@property (nonatomic, copy  ) void (^showScanResultDetailVCBlock)(XLScanResultModel * scanResultModel, UIImage * image);
@property (nonatomic, copy  ) void (^scanResultBlock)(XLScanResultModel * scanResultModel, UIImage * image);

@end
