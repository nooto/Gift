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
    
    __weak typeof(self.view )weakSelfView = self.view;
    [self.mAvatorImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(weakSelfView.mas_width).multipliedBy(0.25);
        make.height.equalTo(weakSelfView.mas_width).multipliedBy(0.25);
        make.centerX.equalTo(weakSelfView.mas_centerX);
        make.centerY.equalTo(weakSelfView.mas_centerY).multipliedBy(0.5);
    }];
    
    [self.mNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mAvatorImage.mas_centerX);
        make.top.equalTo(self.mAvatorImage.mas_bottom).offset(10);
        make.width.equalTo(weakSelfView.mas_width).multipliedBy(0.5);
        make.height.mas_equalTo(30);
    }];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.mAvatorImage.layer.cornerRadius = CGRectGetWidth(self.mAvatorImage.frame)/2;
}

-(UIImageView*)mAvatorImage{
    if (!_mAvatorImage) {
        _mAvatorImage = [UIImageView new];
        _mAvatorImage.layer.masksToBounds = YES;
        _mAvatorImage.backgroundColor = [UIColor redColor];
    }
    return _mAvatorImage;
}

-(UITextField*)mNameTextField{
    if (!_mNameTextField) {
        _mNameTextField = [UITextField new];
        _mNameTextField.textAlignment = NSTextAlignmentCenter;
        _mNameTextField.font = Font14;
        _mNameTextField.textColor = [UIColor greenColor];
        _mNameTextField.layer.cornerRadius = 8.0f;
        _mNameTextField.layer.borderColor = Color_black_30.CGColor;
        _mNameTextField.layer.borderWidth = 0.5f;
    }
    return _mNameTextField;
}

@end
