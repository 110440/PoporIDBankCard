//
//  XLIDScanViewController.h
//  IDAndBankCard
//
//  Created by mxl on 2017/3/28.
//  Copyright © 2017年 mxl. All rights reserved.
//

#import "XLScanBaseViewController.h"

@interface XLIDScanViewController : XLScanBaseViewController

@property (nonatomic, copy  ) void (^someblock)(NSString *name);

@end
