//
//  OverlayerIDJchView.m
//  PoporIDBankCard_Example
//
//  Created by apple on 2018/8/22.
//  Copyright © 2018年 wangkq. All rights reserved.
//

#import "OverlayerIDJchView.h"

@interface OverlayerIDJchView()

@property (nonatomic, assign) int lineLenght;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation OverlayerIDJchView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        CGFloat width = frame.size.height;
        CGFloat height = frame.size.width;
        
        self.backgroundColor = [UIColor clearColor];
        _lineLenght = height / 10;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, height)];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment   = NSTextAlignmentCenter;
        label.textColor       = [UIColor lightGrayColor];
        label.font            = [UIFont boldSystemFontOfSize:16];
        label.text            = @"请将扫描线对准身份证并对齐左右边缘。";
        [self addSubview:label];
        CGAffineTransform transform = CGAffineTransformMakeRotation((90.0f * M_PI) / 180.0f);
        label.transform = transform;
        
        float x = height * 22 / 54;
        x = x + (height - x) / 2;
        label.center = CGPointMake(x, width/2);
    }
    return self;
}

- (void)startScan {
    [self stopScan];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:.02 target:self selector:@selector(timerFire:) userInfo:nil repeats:YES];
    [self.timer fire];
}

- (void)stopScan {
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

-(void)timerFire:(id)notice {
    [self setNeedsDisplay];
}

//画边框和线
- (void)drawRect:(CGRect)rect {
    float frameLineWidth = 5.0;
    float scanLineWidth  = 2.0; // 由于残影，看起来和5.0一样宽。
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, frameLineWidth);
    CGContextSetRGBStrokeColor(context, .3, 0.8, .3, .8);
    
    CGContextBeginPath(context);
    
    CGPoint pt = rect.origin;
    CGContextMoveToPoint(context, pt.x, pt.y+_lineLenght);
    CGContextAddLineToPoint(context, pt.x, pt.y);
    
    pt = CGPointMake(rect.origin.x+rect.size.width, rect.origin.y);
    CGContextAddLineToPoint(context, pt.x, pt.y);
    CGContextAddLineToPoint(context, pt.x, pt.y+_lineLenght);
    
    pt = CGPointMake(rect.origin.x+rect.size.width, rect.origin.y+rect.size.height);
    CGContextMoveToPoint(context, pt.x, pt.y-_lineLenght);
    CGContextAddLineToPoint(context, pt.x, pt.y);
    
    pt = CGPointMake(rect.origin.x, rect.origin.y+rect.size.height);
    CGContextAddLineToPoint(context, pt.x, pt.y);
    CGContextAddLineToPoint(context, pt.x, pt.y-_lineLenght);
    CGContextStrokePath(context);
    
    
    static float moveX = 0;
    static float distance = 2;
    CGContextBeginPath(context);
    CGContextSetLineWidth(context, scanLineWidth);
    CGPoint p1, p2;
    
    moveX += distance;
    if (moveX > rect.size.width) {
        distance = -2;
    } else if (moveX < rect.origin.x){
        distance = 2;
    }
    p1 = CGPointMake(rect.origin.x + moveX, rect.origin.y + frameLineWidth);
    p2 = CGPointMake(rect.origin.x + moveX, rect.origin.y + rect.size.height - frameLineWidth);
    CGContextMoveToPoint(context,p1.x, p1.y);
    CGContextAddLineToPoint(context, p2.x, p2.y);
    CGContextStrokePath(context);
    
}

@end
