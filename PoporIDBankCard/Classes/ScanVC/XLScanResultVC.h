//
//  XLScanResultVC.h
//  IDAndBankCard
//
//  Created by wangkq on 2017/3/28.
//  Copyright © 2018年 wangkq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLScanResultModel.h"

@interface XLScanResultVC : UIViewController

@property (nonatomic, strong) UIImage           * image;
@property (nonatomic, strong) XLScanResultModel * model;

@property (nonatomic, strong) UIImageView * scanIV;
@property (nonatomic, strong) UILabel * scanL;
@property (nonatomic, strong) UIButton * confirmBT;

- (void)addViews;
- (void)addIV;
- (void)addL;
- (void)addBT;

- (void)confirmAction;
- (void)repeatAction;

@end
