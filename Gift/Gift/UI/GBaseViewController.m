//
//  GBaseViewController.m
//  Gift
//
//  Created by GaoAng on 15/12/12.
//  Copyright © 2015年 GaoAng. All rights reserved.
//

#import "GBaseViewController.h"
@interface GBaseViewController()<EHCustomNavBarDelegate>
//@property (nonatomic, strong) EHCustomNavBar *mNavBarView;
@end

@implementation GBaseViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    [self.view addSubview:self.mNavBarView];
    
    self.view.backgroundColor = Color_Back_Ground;
}



-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationBarHidden = YES;
    [self.view bringSubviewToFront:self.mNavBarView];
}

-(void)pushViewController:(UIViewController*)vc{
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)pushViewControllerNoAnimated:(UIViewController*)vc{
    [self.navigationController pushViewController:vc animated:NO];
}

-(void)popViewControllerNoAnimated{
    [self.navigationController popViewControllerAnimated:NO];
}
-(void)popViewControllerAnimated{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)popToRootViewControllerAnimated{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)popToRootViewControllerNoAnimated{
    [self.navigationController popToRootViewControllerAnimated:NO];
}

//
-(void)setTitle:(NSString *)title{
    [super setTitle:title];
    [self.mNavBarView setTitle:title];
}

-(void)setAttributedTitle:(NSAttributedString *)title{
    [super setTitle:title.string];
    [self.mNavBarView setAttributeTitle:title];
}

-(EHCustomNavBar*)mNavBarView{
    if (!_mNavBarView) {
        _mNavBarView = [[EHCustomNavBar alloc] initWithdelegate:self];
        [_mNavBarView setBackgroundColor:Color_black_30];
    }
    return _mNavBarView;
}

-(void)hiddenNavBarView{
    self.mNavBarView.hidden = YES;
}

- (void)backBtnPressed:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)addRightButton:(UIButton *)button{
    if (button) {
        [self.mNavBarView addSubview:button];
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        button.titleLabel.font = self.mNavBarView.mTextLabel.font;
        button.center = CGPointMake(SCREEN_W - MarginW(20) - CGRectGetWidth(button.frame)/2, self.mNavBarView.mTextLabel.center.y);
    }
}

-(void)hiddeBackButton{
    self.mNavBarView.mLeftButton.hidden = YES;
}
-(void)setBackButtonImage:(UIImage *)image{
    [self.mNavBarView.mLeftButton setImage:image forState:UIControlStateNormal];
}

-(void)setBackButtonText:(NSString *)text{
    [self.mNavBarView.mLeftButton setTitle:text forState:UIControlStateNormal];
}

@end
