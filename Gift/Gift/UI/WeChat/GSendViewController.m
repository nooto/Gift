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

@property (nonatomic, strong) UILabel *mFirstName;
@property (nonatomic, strong) UILabel *mFirstCount;
@property (nonatomic, strong) UILabel *mSecondName;
@property (nonatomic, strong) UILabel *mSecondCount;

@property (nonatomic, strong) GWCData *mCurData;

@property (nonatomic, assign) BOOL isSave;
@property (nonatomic, assign) BOOL isNeedBack;
@end
@implementation GSendViewController

-(instancetype)initWithWCData:(GWCData*)data{
    if (self = [super init]) {
        self.mCurData = data;
        self.isSave = NO;
    }
    
    return self;
}

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
    
    //认
    UIView *bottomView = [UIView new];
    bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomView];
    
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(weakSelf.view.mas_width);
        make.height.equalTo(weakSelf.view.mas_height).multipliedBy(0.2);
        make.bottom.equalTo(weakSelf.view.mas_bottom);
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = Color_black_30;
    [bottomView addSubview:lineView];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(0.5);
        make.left.equalTo(bottomView.mas_left).offset(20);
        make.right.equalTo(bottomView.mas_right);
        make.centerY.mas_equalTo(bottomView.mas_centerY);
    }];
//    self.
    
    [self.view addSubview:self.mFirstCount];
    [self.view addSubview:self.mFirstName];
    [self.view addSubview:self.mSecondCount];
    [self.view addSubview:self.mSecondName];
    
    [self.mSecondName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left).offset(-20);
        make.width.equalTo(weakSelf.view.mas_width).dividedBy(2).offset(20);
        make.bottom.equalTo(bottomView.mas_bottom).offset(20);
        
    }];
    
    
    
    [self.mNameLabel setText:self.mCurData.name];
    [self.mCountLabel setText:self.mCurData.mCount];
    [self.mReceiveCountLabel setText:self.mCurData.mRecedtive];
    [self.mBestCountLabel setText:self.mCurData.mBest];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self showSaveTIp];
}


-(void)backBtnPressed:(UIButton *)sender{
    if (self.isSave) {
        [super backBtnPressed:nil];
    }
    else{
        self.isNeedBack = YES;
        [self showSaveTIp];
    }
}


-(void)showSaveTIp{
    
    UIImageView *imagev = [[UIImageView alloc] init];
    imagev.image = [UIImage imageWithView:self.view];
    
    WeakSelf(weakSelf);
    EHCustomAlertView *alertView = [[EHCustomAlertView alloc] initWithTitle:nil message:@"是否保存到相册" leftButton:@"不保存" rightButton:@"保存" selectActin:^(NSInteger index) {
        if (index == 1) {
            weakSelf.isSave = YES;
            UIImageWriteToSavedPhotosAlbum(imagev.image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
        }
        else{
            weakSelf.isSave = NO;
        }
    }];
    
    [alertView show];
}

- (void)image: (UIImage *) image didFinishSavingWithError: (NSError *) error contextInfo: (void *) contextInfo{
    NSString *msg = nil ;
    if(error != NULL){
        self.isSave = NO;
        msg = @"保存图片失败!" ;
    }else{
        self.isSave = YES;
        msg = @"保存图片成功!" ;
    }
    
    UIAlertController *alertController = [[UIAlertController alertControllerWithTitle:@"保存图片结果提示" message:msg preferredStyle:UIAlertControllerStyleAlert] init];
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (_isNeedBack) {
            [self backBtnPressed:nil];
        }
    }]];
    
    [self presentViewController:alertController animated:YES completion:nil];
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
        [_mReceiveLabel setText:@"收到的红包"];
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
        [_mBestLabel setText:@"收到的红包32323"];
        [_mBestLabel setFont:self.mReceiveLabel.font];
        [_mReceiveLabel setTextColor:self.mReceiveLabel.textColor];
        _mBestLabel.textAlignment = self.mReceiveLabel.textAlignment;
    }
    return _mBestLabel;
}

- (UILabel*)mFirstName{
    if (!_mFirstName) {
        _mFirstName = [UILabel new];
        [_mFirstName setFont:self.mReceiveCountLabel.font];
        [_mFirstName setTextColor:self.mReceiveCountLabel.textColor];
        _mFirstName.textAlignment = self.mReceiveCountLabel.textAlignment;
    }
    return _mFirstName;
}
- (UILabel*)mFirstCount{
    if (!_mFirstCount) {
        _mFirstCount = [UILabel new];
        [_mFirstCount setFont:self.mReceiveCountLabel.font];
        [_mFirstCount setTextColor:self.mReceiveCountLabel.textColor];
        _mFirstCount.textAlignment = self.mReceiveCountLabel.textAlignment;
    }
    return _mFirstCount;
}
- (UILabel*)mSecondName{
    if (!_mSecondName) {
        _mSecondName = [UILabel new];
        [_mSecondName setFont:self.mReceiveCountLabel.font];
        [_mSecondName setTextColor:self.mReceiveCountLabel.textColor];
        _mSecondName.textAlignment = self.mReceiveCountLabel.textAlignment;
    }
    return _mSecondName;
}
- (UILabel*)mSecondCount{
    if (!_mSecondCount) {
        _mSecondCount = [UILabel new];
        [_mSecondCount setFont:self.mReceiveCountLabel.font];
        [_mSecondCount setTextColor:self.mReceiveCountLabel.textColor];
        _mSecondCount.textAlignment = self.mReceiveCountLabel.textAlignment;
    }
    return _mSecondCount;
}




@end
