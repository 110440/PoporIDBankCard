//
//  OverlayerBankView.h
//  BankCard
//
//  Created by XAYQ-FanXL on 16/7/8.
//  Copyright © 2016年 AN. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "OverlayerViewDelegate.h"

@interface OverlayerBankView : UIView <OverlayerViewDelegate>

+ (CGRect)getOverlayFrame:(CGRect)rect;

@end