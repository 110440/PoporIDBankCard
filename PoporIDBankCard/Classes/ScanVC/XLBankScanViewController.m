//
//  XLBankScanViewController.m
//  IDAndBankCard
//
//  Created by mxl on 2017/3/28.
//  Copyright © 2017年 mxl. All rights reserved.
//

#import "XLBankScanViewController.h"
#import "OverlayerBankView.h"

@interface XLBankScanViewController ()

@end

@implementation XLBankScanViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.layerView startScan];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [self.layerView stopScan];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!self.title) {
        self.title = @"银行卡扫描";
    }
    
    if (!self.layerView) {
        CGRect rect = [OverlayerViewTool getOverlayFrame:[UIScreen mainScreen].bounds];
        OverlayerBankView * layerView = [[OverlayerBankView alloc] initWithFrame:rect];
        [self.view insertSubview:self.layerView atIndex:0];
        
        self.layerView = layerView;
    }
    [self.view insertSubview:self.layerView atIndex:0];
    
    self.cameraManager.sessionPreset = AVCaptureSessionPreset1280x720;
    
    if ([self.cameraManager configBankScanManager]) {
        UIView *view = [[UIView alloc] initWithFrame:self.view.bounds];
        [self.view insertSubview:view atIndex:0];
        AVCaptureVideoPreviewLayer *preLayer = [AVCaptureVideoPreviewLayer layerWithSession: self.cameraManager.captureSession];
        preLayer.frame = [UIScreen mainScreen].bounds;
        
        preLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        
        [view.layer addSublayer:preLayer];
        
        [self.cameraManager startSession];
    } else {
        NSLog(@"打开相机失败");
        [self.navigationController popViewControllerAnimated:YES];
    }
    
    __weak typeof(self) weakSelf = self;
    self.cameraManager.bankScanSuccessBlock = ^(XLScanResultModel *model) {
        [weakSelf showResult:model];
    };
    self.cameraManager.scanErrorBlock = ^(NSError *error) {
        
    };
    
    if (self.customeViewDidLoad) {
        self.customeViewDidLoad(self);
    }
}

- (void)showResult:(id)result {
    XLScanResultModel *model = (XLScanResultModel *)result;
    NSString *message = [NSString stringWithFormat:@"%@\n%@", model.bankName, model.bankNumber];
    UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"扫描成功" message:message delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alertV show];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [alertV dismissWithClickedButtonIndex:0 animated:YES];
    });
}

@end
