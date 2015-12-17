//
//  GBaseViewController.h
//  Gift
//
//  Created by GaoAng on 15/12/12.
//  Copyright © 2015年 GaoAng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "UtilityHelper.h"
#import "EHCustomNavBar.h"

@interface GBaseViewController : UIViewController


-(void)pushViewController:(UIViewController*)vc;
-(void)pushViewControllerNoAnimated:(UIViewController*)vc;
-(void)popViewControllerNoAnimated;
-(void)popViewControllerAnimated;
-(void)popToRootViewControllerAnimated;
-(void)popToRootViewControllerNoAnimated;


//
@property (nonatomic, strong) EHCustomNavBar *mNavBarView;
-(void)hiddenNavBarView;
-(void)setTitle:(NSString *)title;
-(void)setAttributedTitle:(NSAttributedString *)title;
- (void)backBtnPressed:(UIButton *)sender;
-(void)addRightButton:(UIButton *)button;
-(void)hiddeBackButton;
-(void)setBackButtonImage:(UIImage *)image;
-(void)setBackButtonText:(NSString *)text;

@end
