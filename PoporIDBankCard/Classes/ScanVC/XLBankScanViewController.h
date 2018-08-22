//
//  XLBankScanViewController.h
//  IDAndBankCard
//
//  Created by mxl on 2017/3/28.
//  Copyright © 2017年 mxl. All rights reserved.
//

#import "XLScanBaseViewController.h"
#import "OverlayerViewDelegate.h"

@interface XLBankScanViewController : XLScanBaseViewController

@property (nonatomic, copy  ) void(^customeOverLayer)(UIView<OverlayerViewDelegate> * layerView);
@property (nonatomic, copy  ) void(^customeViewDidLoad)(XLBankScanViewController * vc);

@end
