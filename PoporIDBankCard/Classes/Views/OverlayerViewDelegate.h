//
//  OverlayerBankView.h
//  BankCard
//
//  Created by XAYQ-FanXL on 16/7/8.
//  Copyright © 2016年 AN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OverlayerViewTool.h"

@protocol OverlayerViewDelegate <NSObject>

- (void)startScan;
- (void)stopScan;

@end
