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
@property (nonatomic, strong) UITextField *mNameTextField;
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
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    _mAvatorImage.layer.cornerRadius = CGRectGetWidth(_mAvatorImage.frame)/2;
}

-(UIImageView*)mAvatorImage{
    if (!_mAvatorImage) {
        _mAvatorImage = [UIImageView new];
        _mAvatorImage.backgroundColor = [UIColor grayColor];
//        _mAvatorImage.
    }
    return _mAvatorImage;
}
    

    @end
