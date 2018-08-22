//
//  PoporIDBankCardViewController.m
//  PoporIDBankCard
//
//  Created by wangkq on 08/21/2018.
//  Copyright (c) 2018 wangkq. All rights reserved.
//

#import "PoporIDBankCardViewController.h"

#import <Masonry/Masonry.h>
#import "XLBankScanViewController.h"
#import "XLIDScanViewController.h"
#import "OverlayerIDJchView.h"

@interface PoporIDBankCardViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * infoTV;
@property (nonatomic, strong) NSArray * infoArray;

@end

@implementation PoporIDBankCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"OCR";
    self.infoArray = @[@"银行卡", @"身份证"];
    [self addTVs];
}

#pragma mark - UITableView
- (UITableView *)addTVs {
    UITableView * oneTV = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    oneTV.delegate   = self;
    oneTV.dataSource = self;
    
    oneTV.allowsMultipleSelectionDuringEditing = YES;
    oneTV.directionalLockEnabled = YES;
    
    oneTV.estimatedRowHeight           = 0;
    oneTV.estimatedSectionHeaderHeight = 0;
    oneTV.estimatedSectionFooterHeight = 0;
    
    [self.view addSubview:oneTV];
    
    [oneTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    
    return oneTV;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.infoArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * CellID = @"CellID";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.textLabel.text = self.infoArray[indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
#if TARGET_IPHONE_SIMULATOR//模拟器
    NSLog(@"不支持虚拟机环境");
#elif TARGET_OS_IPHONE//真机
    switch (indexPath.row) {
        case 0:
            [self pushBankCardOCR];
            break;
        case 1:
            [self pushIDCardOCR];
            break;
            
        default:
            break;
    }
#endif
    
}

- (void)pushBankCardOCR {
    [self.navigationController pushViewController:[XLBankScanViewController new] animated:YES];
}

- (void)pushIDCardOCR {
    CGRect rect = [OverlayerViewTool getOverlayFrame:[UIScreen mainScreen].bounds];
    OverlayerIDJchView * layerView = [[OverlayerIDJchView alloc] initWithFrame:rect];
    
    XLIDScanViewController * vc = [XLIDScanViewController new];
    vc.layerView = layerView;
    vc.customeViewDidLoad = ^(XLIDScanViewController *vc) {
        vc.title = @"自定义title";
    };
    vc.showScanResultDetailVC = YES;
    
    [self.navigationController pushViewController:vc animated:YES];
}


@end
