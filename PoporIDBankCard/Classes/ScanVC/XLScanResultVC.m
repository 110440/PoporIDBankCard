//
//  XLScanResultVC.m
//  IDAndBankCard
//
//  Created by wangkq on 2017/3/28.
//  Copyright © 2018年 wangkq. All rights reserved.
//

#import "XLScanResultVC.h"

@interface XLScanResultVC ()

@end

@implementation XLScanResultVC

- (void)viewDidLoad {
    [super viewDidLoad];
    if (!self.title) {
        self.title = @"结果";
    }
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self addViews];
}

- (void)addViews {
    [self addIV];
    [self addL];
    [self addBT];
}

- (void)addIV {
    UIImageView * oneIV = ({
        UIImageView * iv = [UIImageView new];
        iv.layer.cornerRadius = 5;
        iv.clipsToBounds = YES;
        
        [self.view addSubview:iv];
        iv;
    });
    oneIV.image  = self.image;
    float gap    = 5;
    float width  = self.view.frame.size.width - gap*2;
    float height = width/1280.0*720.0;
    
    CGRect rect  = CGRectZero;
    //NSLog(@"self.navigationController.navigationBar.translucent: %i", self.navigationController.navigationBar.translucent);
    //NSLog(@"self.automaticallyAdjustsScrollViewInsets: %i", self.automaticallyAdjustsScrollViewInsets);
    if (self.automaticallyAdjustsScrollViewInsets) {
        CGRect StatusRect = [[UIApplication sharedApplication] statusBarFrame];//标题栏
        CGRect NavRect    = self.navigationController.navigationBar.frame;//然后将高度相加，便可以动态计算顶部高度。
        CGFloat y         = StatusRect.size.height + NavRect.size.height;
        
        rect       = CGRectMake(gap, y + gap, width, height);
    }else{
        rect       = CGRectMake(gap, gap, width, height);
    }
    oneIV.frame = rect;
    
    self.scanIV = oneIV;
}

- (void)addL {
    float gap = 20;
    UILabel * oneL = ({
        UILabel * l = [UILabel new];
        l.frame              = CGRectMake(gap, CGRectGetMaxY(self.scanIV.frame) + 20, self.view.frame.size.width- gap*2, 100);
        l.backgroundColor    = [UIColor clearColor];
        l.font               = [UIFont systemFontOfSize:15];
        l.textColor          = [UIColor darkGrayColor];
        
        [self.view addSubview:l];
        l;
    });
    
    oneL.preferredMaxLayoutWidth = oneL.frame.size.width;
    [oneL setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    oneL.numberOfLines = 0;
    //[NSString stringWithFormat:@"身份证号:%@\n姓名:%@\n性别:%@\n民族:%@\n地址:%@\n签发机关:%@\n有效期:%@",
     //_code, _name, _gender, _nation, _address, _issue, _valid];
    
    
    
    oneL.text = @"afa\nsdfa\n adfa\n\asdfa\fasd\nafa\nasdfa\n";
    [oneL sizeToFit];
    
    self.scanL = oneL;
}

- (void)addBT {
    UIButton * oneBT = ({
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame =  CGRectMake(20, self.view.frame.size.height - 64, self.view.frame.size.width - 40, 44);
        [button setTitle:@"确定" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
        
        button.layer.cornerRadius = 5;
        button.layer.borderColor = [UIColor grayColor].CGColor;
        button.layer.borderWidth = 1;
        button.clipsToBounds = YES;
        
        [self.view addSubview:button];
        
        [button addTarget:self action:@selector(btAction) forControlEvents:UIControlEventTouchUpInside];
        
        button;
    });
    
    self.confirmBT = oneBT;
}

- (void)btAction {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
