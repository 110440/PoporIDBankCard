//
//  XLIDScanViewController.m
//  IDAndBankCard
//
//  Created by  on 2017/3/28.
//  Copyright © 2017年 mxl. All rights reserved.
//

#import "XLIDScanViewController.h"
#import "OverlayerIDView.h"

@interface XLIDScanViewController ()

@property (nonatomic, strong) OverlayerIDView *OverlayerBankView;

@end

@implementation XLIDScanViewController

-(OverlayerIDView *)OverlayerBankView {
    if(!_OverlayerBankView) {
        CGRect rect = [OverlayerIDView getOverlayFrame:[UIScreen mainScreen].bounds];
        _OverlayerBankView = [[OverlayerIDView alloc] initWithFrame:rect];
    }
    return _OverlayerBankView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"身份证扫描";
    
    [self.view insertSubview:self.OverlayerBankView atIndex:0];
    
    self.cameraManager.sessionPreset = AVCaptureSessionPresetHigh;
    
    if ([self.cameraManager configIDScanManager]) {
        UIView *view = [[UIView alloc] initWithFrame:self.view.bounds];
        [self.view insertSubview:view atIndex:0];
        AVCaptureVideoPreviewLayer *preLayer = [AVCaptureVideoPreviewLayer layerWithSession: self.cameraManager.captureSession];
        preLayer.frame = [UIScreen mainScreen].bounds;
        
        preLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        [view.layer addSublayer:preLayer];
        
        [self.cameraManager startSession];
    }
    else {
        NSLog(@"打开相机失败");
        [self.navigationController popViewControllerAnimated:YES];
    }
    //    [self.cameraManager.idCardScanSuccess subscribeNext:^(id x) {
    //        [self showResult:x];
    //    }];
    //    [self.cameraManager.scanError subscribeNext:^(id x) {
    //        
    //    }];
    
    __weak typeof(self) weakSelf = self;
    self.cameraManager.idCardScanSuccessBlock = ^(XLScanResultModel *idInfo) {
        [weakSelf showResult:idInfo];
    };
    self.cameraManager.scanErrorBlock = ^(NSError *error) {
        
    };
}

- (void)showResult:(XLScanResultModel *)result {
    XLScanResultModel *model = (XLScanResultModel *)result;
    NSString *message = [NSString stringWithFormat:@"%@", [model toString]];
    UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"扫描成功" message:message delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alertV show];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [alertV dismissWithClickedButtonIndex:0 animated:YES];
    });
}

@end
