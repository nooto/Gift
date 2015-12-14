//
//  ViewController.m
//  Gift
//
//  Created by GaoAng on 15/12/8.
//  Copyright © 2015年 GaoAng. All rights reserved.
//
#import <AudioToolbox/AudioToolbox.h>

#import "ViewController.h"
#import "Masonry.h"
#import "GWCViewController.h"
@interface ViewController ()

@property (nonatomic, strong) UIView *mQQView;
@property (nonatomic, strong) UIView *mWechatView;
@property (nonatomic, strong) UIView *mZFBView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self hiddenNavBarView];
    
    [self.view addSubview:self.mWechatView];
    [self.view addSubview:self.mQQView];
    [self.view addSubview:self.mZFBView];
    
    __weak typeof(self.view )weaskSuperView = self.view;
    [self.mWechatView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weaskSuperView);
        make.top.equalTo(weaskSuperView.mas_top);
        make.width.equalTo(weaskSuperView.mas_width).multipliedBy(0.333);
//        make.width.equalTo(self.mZFBView.mas_width);
        make.height.equalTo(weaskSuperView.mas_height);
    }];
    
    [self.mZFBView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mWechatView.mas_right);
        make.top.equalTo(weaskSuperView.mas_top);
        make.width.equalTo(self.mQQView.mas_width);
        make.height.equalTo(self.mWechatView.mas_height);
    }];
    
    [self.mQQView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weaskSuperView.mas_right);
//        make.left.equalTo(weaskSuperView);
        make.top.equalTo(weaskSuperView.mas_top);
        make.width.equalTo(self.mWechatView.mas_width);
        make.height.equalTo(self.mWechatView.mas_height);
    }];
}

-(UIView*)mWechatView{
    if (!_mWechatView) {
        _mWechatView = [UIView new];
        _mWechatView.backgroundColor = Color_black_30;
    }
    return _mWechatView;
}

-(UIView*)mQQView{
    if (!_mQQView) {
        _mQQView = [UIView new];
        _mQQView.backgroundColor = Color_black_50;
    }
    return _mQQView;
}

-(UIView*)mZFBView{
    if (!_mZFBView) {
        _mZFBView = [UIView new];
        _mZFBView.backgroundColor = Color_black_10;
    }
    return _mZFBView;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    CGPoint pos = [touch locationInView:self.view];
    if (CGRectContainsPoint(self.mQQView.frame, pos)) {
        GWCViewController *vc = [[GWCViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (CGRectContainsPoint(self.mWechatView.frame, pos)){
        
    }
    else if (CGRectContainsPoint(self.mZFBView.frame, pos)){
        
    }
    
    
}


-(IBAction)buttonAction:(id)sender{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}








@end
