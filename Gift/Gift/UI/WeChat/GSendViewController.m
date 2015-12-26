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
    
//    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.width.equalTo(bottomView.mas_width);
//        make.height.mas_equalTo(0.5f);
//        make.centerX.equalTo(bottomView.mas_height).dividedBy(2);
////        make.bottom.equalTo(weakSelf.view.mas_bottom);
//
////        make.left.equalTo(bottomView.mas_left).offset(20);
////        make.right.equalTo(bottomView.mas_right);
////        make.centerY.equalTo(bottomView.mas_height).multipliedBy(0.5);
////        make.height.mas_equalTo(0.5);
////        make.width.equalTo(bottomView.mas_width).offset(-20);
////        make.centerY.mas_equalTo(bottomView.mas_centerY);
//    }];
////    self.
    
    UILabel *pingLabel = [UILabel new];
    [pingLabel setText:@"拼"];
    pingLabel.textColor = [UIColor whiteColor];
    pingLabel.backgroundColor = Color_orange_F866822;
    pingLabel.font = Font15;
    pingLabel.layer.cornerRadius = 2.0f;
    [self.view addSubview:pingLabel];
    
    [self.view addSubview:self.mFirstCount];
    [self.view addSubview:pingLabel];
    [self.view addSubview:self.mFirstName];
    
    
    [self.view addSubview:self.mSecondCount];
    
    UILabel *pingLabel2 = [UILabel new];
    [pingLabel2 setText:pingLabel.text];
    pingLabel2.textColor = pingLabel.textColor;
    pingLabel2.backgroundColor = pingLabel.backgroundColor;
    pingLabel2.font = pingLabel.font;
    pingLabel2.layer.cornerRadius = pingLabel.layer.cornerRadius;
    [self.view addSubview:pingLabel2];

    
    [self.view addSubview:self.mSecondName];
    
    [self.mFirstName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left).offset(-20);
        make.centerY.equalTo(bottomView.mas_height).dividedBy(4);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(25);
    
    }];
//    self.mFirstName.mas_
    
    [pingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mFirstName.mas_centerY);
        make.left.equalTo(weakSelf.mFirstName.mas_right);
        make.width.mas_equalTo(30);
        make.width.mas_equalTo(30);
    }];
    
    UILabel *firstDate = [UILabel new];
    [firstDate setFont:Font13];
    [firstDate setTextColor:Color_black_30];
    NSDate *date = [NSDate date];
    [firstDate setText:[NSString stringWithFormat:@"%ld-%2ld",(long)date.month,(long)date.day]];
    [bottomView addSubview:firstDate];
    
    [firstDate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mFirstName.mas_left);
        make.top.equalTo(weakSelf.mFirstName.mas_bottom);
        make.width.equalTo(weakSelf.mFirstName.mas_width);
        make.height.equalTo(weakSelf.mFirstName.mas_height);
    }];
    
    [self.mFirstCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.view.mas_right).offset(-20);
        make.centerY.equalTo(weakSelf.mFirstName.mas_centerY);
        make.height.equalTo(weakSelf.mFirstName.mas_height);
        make.width.equalTo(weakSelf.mFirstName.mas_width);
    }];;
    
    
    
    [self.mSecondName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mFirstName.mas_left);
        make.centerY.equalTo(bottomView.mas_height).multipliedBy(0.75);
        make.width.mas_equalTo(weakSelf.mFirstName.width);
        make.height.mas_equalTo(weakSelf.mFirstName.height);
    }];
    
    [pingLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mSecondName.mas_centerY);
        make.left.equalTo(weakSelf.mSecondName.mas_right);
        make.width.mas_equalTo(30);
        make.width.mas_equalTo(30);
    }];
    
    [self.mSecondCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.view.mas_right).offset(-20);
        make.centerY.equalTo(weakSelf.mSecondName.mas_centerY);
        make.height.equalTo(weakSelf.mSecondName.mas_height);
        make.width.equalTo(weakSelf.mSecondName.mas_width);
    }];;
    
    UILabel *secondDate = [UILabel new];
    [secondDate setFont:Font13];
    [secondDate setTextColor:Color_black_30];
    NSDate *date22 = [NSDate date];
    [secondDate setText:[NSString stringWithFormat:@"%ld-%2ld",(long)date22.month,(long)date22.day]];
    [bottomView addSubview:secondDate];
    
    [secondDate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mSecondName.mas_left);
        make.top.equalTo(weakSelf.mSecondName.mas_bottom);
        make.width.equalTo(weakSelf.mSecondName.mas_width);
        make.height.equalTo(weakSelf.mSecondName.mas_height);
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

#pragma mark -=====自定义截屏位置大小的逻辑代码=====-
//static int ScreenshotIndex=0; //这里的逻辑直接采用上面博主的逻辑了
-(UIImage*)ScreenShot{
//    for (UIWindow *subWindow in [UIApplication sharedApplication].windows) {
//        
//        NSLog(@"%d",subWindow.windowLevel);
//    }
    
    CALayer *layer = [[UIApplication sharedApplication] keyWindow].layer;
    CGFloat scale = [UIScreen mainScreen].scale;
    UIGraphicsBeginImageContextWithOptions(layer.frame.size, NO, scale);
    
    [layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
//    
//    CGSize imageSize = CGSizeMake(SCREEN_W, SCREEN_H);
//    NSLog(@"%f,%f",imageSize.width,imageSize.height);
//    
//    //支持retina就靠这句话，不带参数的begin保存的图片分辨率很低的。
//    
////    if (UIGraphicsBeginImageContextWithOptions != NULL) {
//    
//        UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
//        
////    } else {
////        
////        UIGraphicsBeginImageContext(imageSize);
////        
////    }
    
//    
//    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
//    
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    
//    UIGraphicsEndImageContext();
//    return image;
//    
    
//    //这里因为我需要全屏接图所以直接改了，宏定义iPadWithd为1024，iPadHeight为768，
//    //    UIGraphicsBeginImageContextWithOptions(CGSizeMake(640, 960), YES, 0);     //设置截屏大小
//    UIGraphicsBeginImageContextWithOptions(CGSizeMake(SCREEN_W, SCREEN_H), YES, 0);     //设置截屏大小
//    [[self.navigationController.view layer] renderInContext:UIGraphicsGetCurrentContext()];
//    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    CGImageRef imageRef = viewImage.CGImage;
//    //    CGRect rect = CGRectMake(166, 211, 426, 320);//这里可以设置想要截图的区域
//    CGRect rect = CGRectMake(0, 0, SCREEN_W, SCREEN_H);//这里可以设置想要截图的区域
//    CGImageRef imageRefRect =CGImageCreateWithImageInRect(imageRef, rect);
//    UIImage *sendImage = [[UIImage alloc] initWithCGImage:imageRefRect];
//    UIImageWriteToSavedPhotosAlbum(sendImage, nil, nil, nil);//保存图片到照片库
////    NSData *imageViewData = UIImagePNGRepresentation(sendImage);
////    
////    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
////    NSString *documentsDirectory = [paths objectAtIndex:0];
////    NSString *pictureName= [NSString stringWithFormat:@"screenShow_%d.png",ScreenshotIndex];
////    NSString *savedImagePath = [documentsDirectory stringByAppendingPathComponent:pictureName];
////    NSLog(@"截屏路径打印: %@", savedImagePath);
////    //这里我将路径设置为一个全局String，这里做的不好，我自己是为了用而已，希望大家别这么写
////    [self SetPickPath:savedImagePath];
////    
////    [imageViewData writeToFile:savedImagePath atomically:YES];//保存照片到沙盒目录
//    CGImageRelease(imageRefRect);
////    ScreenshotIndex++;
//    return sendImage;
}

////设置路径
//- (void)SetPickPath:(NSString *)PickImage {
//    _ScreenshotsPickPath = PickImage;
//}
////获取路径<这里我就直接用于邮件推送的代码中去了，能达到效果，但肯定有更好的写法>
//- (NSString *)GetPickPath {
//    return _ScreenshotsPickPath;
//}
//


-(void)showSaveTIp{
    
    

//    UIImageView *imagev = [[UIImageView alloc] init];
//    imagev.image = [UIImage imageWithView:[UIApplication sharedApplication].keyWindow];
//    imagev.image = [UIImage imageWithView:[UINavigationBar appearance]];
////    imagev.image = [self ScreenShot];
////    UIView *screenshotView = [[self view] snapshotViewAfterScreenUpdates:YES];
////    imagev.image = [UIImage imageWithView:screenshotView];
//    
//    WeakSelf(weakSelf);
//    EHCustomAlertView *alertView = [[EHCustomAlertView alloc] initWithTitle:nil message:@"是否保存到相册" leftButton:@"不保存" rightButton:@"保存" selectActin:^(NSInteger index) {
//        if (index == 1) {
//            weakSelf.isSave = YES;
//            UIImageWriteToSavedPhotosAlbum(imagev.image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
//        }
//        else{
//            weakSelf.isSave = NO;
//        }
//    }];
//    
//    [alertView show];
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
