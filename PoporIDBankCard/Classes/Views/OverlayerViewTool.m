//
//  OverlayerViewTool.m
//  BankCard
//
//  Created by XAYQ-FanXL on 16/7/8.
//  Copyright © 2016年 AN. All rights reserved.
//

#import "OverlayerViewTool.h"

@implementation OverlayerViewTool

+ (CGRect)getOverlayFrame:(CGRect)rect {
    float previewWidth = rect.size.width;
    float previewHeight = rect.size.height;
    
    float cardh, cardw;
    float left, top;
    
    cardw = previewWidth*70/100;
    //if(cardw < 720) cardw = 720;
    if(previewWidth < cardw)
    cardw = previewWidth;

    cardh = (int)(cardw / 0.63084f);

    left  = (previewWidth-cardw)/2;
    top   = (previewHeight-cardh)/2;
    
    return CGRectMake(left, top, cardw, cardh);
}

@end
