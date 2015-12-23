//
//  GSendViewController.m
//  Gift
//
//  Created by GaoAng on 15/12/17.
//  Copyright © 2015年 GaoAng. All rights reserved.
//

#import "GSendViewController.h"
@interface GSendViewController()
@property (nonatomic, strong) UIImageView *mAvatorImage;
@property (nonatomic, strong) UILabel *mNameLabel;
@property (nonatomic, strong) UILabel *mCountLabel;


@property (nonatomic, strong) UILabel *mReceiveCountLabel;
@property (nonatomic, strong) UILabel *mReceiveLabel;

@property (nonatomic, strong) UILabel *mBestCountLabel;
@property (nonatomic, strong) UILabel *mBestLabel;


@end
@implementation GSendViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    //标题
    [self setBackButtonText:@"关闭"];
    [self setBackButtonImage:nil];
    [self.mNavBarView setBackgroundColor:Color_red_eb5050];
    
    NSMutableAttributedString *sttr = [[NSMutableAttributedString alloc] initWithString:@"发出的红包 \n微信安全支付"];
    [sttr addAttributes:[[NSDictionary alloc] initWithObjectsAndKeys:Font11, NSFontAttributeName, nil] range:[sttr.string rangeOfString:@"微信安全支付"]];
    [self setAttributedTitle:sttr];
    
    //
    NSDate *newDate = [NSDate date];
    UILabel *text = [UILabel new];
    [text setFont:Font15];
    [text setTextColor:Color_black_50];
    [text setText:[NSString stringWithFormat:@"%ld年",(long)newDate.year]];
    [text sizeToFit];
    [self.view addSubview:text];
    
    WeakSelf(weakSelf);
    [text mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mNavBarView.mas_bottom).offset(20);
        make.right.equalTo(weakSelf.view.mas_right).offset(-20);
    }];
    
    UIImageView *imageView = [UIImageView new];
    [imageView setImage:[UIImage imageNamed:@"arrow_up"]];
    [imageView sizeToFit];
    [self.view addSubview:imageView];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(text.mas_centerX);
        make.top.equalTo(text.mas_bottom).offset(5);
    }];
    
    [self.view addSubview:self.mAvatorImage];
    [self.mAvatorImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageView.mas_bottom).offset(10);
        make.centerX.equalTo(weakSelf.view.mas_centerX);
        make.width.equalTo(weakSelf.view.mas_width).multipliedBy(0.3);
        make.height.equalTo(weakSelf.mAvatorImage.mas_width);
    }];
    
    [self.view addSubview:self.mNameLabel];
    [self.mNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mAvatorImage.mas_bottom).offset(10);
        make.centerX.equalTo(weakSelf.view.mas_centerX);
        make.width.equalTo(weakSelf.view.mas_width);
        make.height.mas_equalTo(40);
    }];
    
    [self.view addSubview:self.mCountLabel];
    [self.mCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mNameLabel.mas_bottom).offset(10);
        make.centerX.equalTo(weakSelf.view.mas_centerX);
        make.width.equalTo(weakSelf.view.mas_width);
        make.height.mas_equalTo(40);
    }];
    
    [self.view addSubview:self.mReceiveCountLabel];
    [self.view addSubview:self.mReceiveLabel];
    
    [self.mReceiveCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mNameLabel.mas_bottom).offset(40);
        make.centerX.equalTo(weakSelf.view.mas_centerX).dividedBy(2);
        make.width.equalTo(weakSelf.view.mas_width).dividedBy(2);
        make.height.mas_equalTo(35);
    }];
    
    
    [self.mReceiveLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mReceiveCountLabel.mas_bottom).offset(10);
        make.centerX.equalTo(weakSelf.mReceiveCountLabel.mas_centerX);
        make.width.equalTo(weakSelf.mReceiveCountLabel.mas_width);
        make.height.mas_equalTo(30);
    }];
    
    [self.view addSubview:self.mBestCountLabel];
    [self.view addSubview:self.mBestLabel];
    
    [self.mBestCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mReceiveCountLabel.mas_top);
        make.centerX.equalTo(weakSelf.view.mas_centerX).multipliedBy(1.5);
        make.width.equalTo(weakSelf.mReceiveCountLabel.mas_width);
        make.height.equalTo(weakSelf.mReceiveCountLabel.mas_height);
    }];
    
    
    [self.mBestLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mReceiveLabel.mas_top);
        make.centerX.equalTo(weakSelf.mBestCountLabel.mas_centerX);
        make.width.equalTo(weakSelf.mReceiveLabel.mas_width);
        make.height.equalTo(weakSelf.mReceiveLabel.mas_height);
    }];
    
    
    [self.mNameLabel setText:@"哈哈收到的红包"];
    [self.mCountLabel setText:@"720.13"];
    
    [self.mReceiveCountLabel setText:@"720.13"];
    [self.mReceiveLabel setText:@"收到的红包"];
    
    [self.mBestCountLabel setText:@"720.132223"];
    [self.mBestLabel setText:@"收到的红包32323"];
    
}

-(void)viewDidLayoutSubviews{
    for (UIView *subvIEW in self.view.subviews) {
        subvIEW.layer.borderColor = [UIColor grayColor].CGColor;
        subvIEW.layer.borderWidth = 1.0F;
        subvIEW.layer.cornerRadius = 10.0F;
    }
    _mAvatorImage.layer.cornerRadius = CGRectGetWidth(_mAvatorImage.frame)/2;
    [super viewDidLayoutSubviews];
}

-(UIImageView*)mAvatorImage{
    if (!_mAvatorImage) {
        _mAvatorImage = [UIImageView new];
        _mAvatorImage.backgroundColor = [UIColor grayColor];
    }
    return _mAvatorImage;
}

- (UILabel*)mNameLabel{
    if (!_mNameLabel) {
        _mNameLabel = [UILabel new];
        [_mNameLabel setFont:Font17];
        [_mNameLabel setTextColor:Color_black_50];
        _mNameLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _mNameLabel;
}

- (UILabel*)mCountLabel{
    if (!_mCountLabel) {
        _mCountLabel = [UILabel new];
        [_mCountLabel setFont:Font17];
        [_mCountLabel setTextColor:Color_red_eb5050];
        _mCountLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _mCountLabel;
}

- (UILabel*)mReceiveCountLabel{
    if (!_mReceiveCountLabel) {
        _mReceiveCountLabel = [UILabel new];
        [_mReceiveCountLabel setFont:Font17];
        [_mReceiveCountLabel setTextColor:Color_black_50];
        _mReceiveCountLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _mReceiveCountLabel;
}

- (UILabel*)mReceiveLabel{
    if (!_mReceiveLabel) {
        _mReceiveLabel = [UILabel new];
        [_mReceiveLabel setFont:Font15];
        [_mReceiveLabel setTextColor:Color_black_30];
        _mReceiveLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _mReceiveLabel;
}


- (UILabel*)mBestCountLabel{
    if (!_mBestCountLabel) {
        _mBestCountLabel = [UILabel new];
        [_mBestCountLabel setFont:self.mReceiveCountLabel.font];
        [_mBestCountLabel setTextColor:self.mReceiveCountLabel.textColor];
        _mBestCountLabel.textAlignment = self.mReceiveCountLabel.textAlignment;
    }
    return _mBestCountLabel;
}

- (UILabel*)mBestLabel{
    if (!_mBestLabel) {
        _mBestLabel = [UILabel new];
        [_mBestLabel setFont:self.mReceiveLabel.font];
        [_mReceiveLabel setTextColor:self.mReceiveLabel.textColor];
        _mBestLabel.textAlignment = self.mReceiveLabel.textAlignment;
    }
    return _mBestLabel;
}



@end