//
//  GWCViewController.m
//  Gift
//
//  Created by GaoAng on 15/12/12.
//  Copyright © 2015年 GaoAng. All rights reserved.
//

#import "GWCViewController.h"

@interface GWCViewController ()
@property (nonatomic, strong) UIImageView  *mAvatorImage;
@property (nonatomic, strong) UITextField  *mNameTextField;

@end
@implementation GWCViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    [self.view addSubview:self.mAvatorImage];
    [self.view addSubview:self.mNameTextField];
    
    __weak typeof(UIView*)weakSelfView = self.view;
    [self.mAvatorImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelfView.mas_centerX);
        make.centerY.equalTo(weakSelfView.mas_height).multipliedBy(0.25);
        make.width.equalTo(weakSelfView.mas_width).multipliedBy(0.25);
        make.height.equalTo(make.width);
    }];
    
}

-(UIImageView*)mAvatorImage{
    if (!_mAvatorImage) {
        _mAvatorImage = [UIImageView new];
        _mAvatorImage.layer.masksToBounds = YES;
    }
    return _mAvatorImage;
}


-(UITextField*)mNameTextField{
    if (!_mNameTextField) {
        _mNameTextField = [UITextField new];
        _mNameTextField.textAlignment = NSTextAlignmentCenter;
        _mNameTextField.font = Font14;
        _mNameTextField.textColor = Color_black_50;
        _mNameTextField.backgroundColor = Color_black_30;
    }
    return _mNameTextField;
}

@end
