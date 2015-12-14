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


@property (nonatomic, strong) UIButton *mSendButton;
@property (nonatomic, strong) UIButton *mReceiveButton;
@property (nonatomic, strong) UIButton *mHistoryButton;
@end
@implementation GWCViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    [self.view addSubview:self.mAvatorImage];
    [self.view addSubview:self.mNameTextField];
    
    [self.view addSubview:self.mSendButton];
    [self.view addSubview:self.mReceiveButton];
    [self.view addSubview:self.mHistoryButton];
    
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
    
    [self.mSendButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelfView.mas_left);
        make.top.equalTo(weakSelfView.mas_bottom).offset(-45);
        make.bottom.equalTo(weakSelfView.mas_bottom);
        make.width.equalTo(self.mReceiveButton.mas_width);
    }];
    
    [self.mReceiveButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mSendButton.mas_right);
        make.width.equalTo(self.mHistoryButton.mas_width);
        make.top.equalTo(self.mSendButton.mas_top);
        make.bottom.equalTo(self.mHistoryButton.mas_bottom);
    }];
    
    [self.mHistoryButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mReceiveButton.mas_right);
        make.right.equalTo(weakSelfView.mas_right);
        make.top.equalTo(self.mSendButton.mas_top);
        make.bottom.equalTo(self.mSendButton.mas_bottom);
        make.width.equalTo(self.mSendButton.mas_width);
        make.height.equalTo(self.mSendButton.mas_height);
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
        _mNameTextField.clearButtonMode = UITextFieldViewModeAlways;
        
        _mNameTextField.leftView.backgroundColor = [UIColor greenColor];
        _mNameTextField.leftViewMode = UITextFieldViewModeAlways;
        
        _mNameTextField.rightView.backgroundColor = [UIColor redColor];
        _mNameTextField.rightViewMode = UITextFieldViewModeAlways;
    }
    return _mNameTextField;
}

-(UIButton*)mSendButton{
    if (!_mSendButton) {
        _mSendButton = [UIButton new];
        [_mSendButton setTitle:@"收到" forState:UIControlStateNormal];
        _mSendButton.layer.borderWidth = 1.0f;
        _mSendButton.layer.borderColor = Color_black_50.CGColor;
        _mSendButton.showsTouchWhenHighlighted = YES;
        [_mSendButton setTitleColor:Color_black_50 forState:UIControlStateNormal];
    }
    return _mSendButton;
}

-(UIButton*)mReceiveButton{
    if (!_mReceiveButton) {
        _mReceiveButton = [UIButton new];
        [_mReceiveButton setTitle:@"发出" forState:UIControlStateNormal];
        _mReceiveButton.layer.borderWidth = 1.0f;
        _mReceiveButton.layer.borderColor = Color_black_50.CGColor;
        _mReceiveButton.showsTouchWhenHighlighted = YES;
        [_mReceiveButton setTitleColor:Color_black_50 forState:UIControlStateNormal];
    }
    return _mReceiveButton;
}

-(UIButton*)mHistoryButton{
    if (!_mHistoryButton) {
        _mHistoryButton = [UIButton new];
        [_mHistoryButton setTitle:@"历史" forState:UIControlStateNormal];
        _mHistoryButton.layer.borderWidth = 1.0f;
        _mHistoryButton.layer.borderColor = Color_black_50.CGColor;
        _mHistoryButton.showsTouchWhenHighlighted = YES;
        [_mHistoryButton setTitleColor:Color_black_50 forState:UIControlStateNormal];
    }
    return _mHistoryButton;
}



@end
