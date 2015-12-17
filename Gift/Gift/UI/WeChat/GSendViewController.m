//
//  GSendViewController.m
//  Gift
//
//  Created by GaoAng on 15/12/17.
//  Copyright © 2015年 GaoAng. All rights reserved.
//

#import "GSendViewController.h"

@implementation GSendViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    //标题
    [self setBackButtonText:@"关闭"];
    [self setBackButtonImage:nil];
    [self.mNavBarView setBackgroundColor:Color_red_eb5050];
    
    NSMutableAttributedString *sttr = [[NSMutableAttributedString alloc] initWithString:@"发出的红包 \n微信安全支付"];
    [sttr addAttributes:[[NSDictionary alloc] initWithObjectsAndKeys:NSFontAttributeName, Font10, nil] range:[sttr.string rangeOfString:@"微信安全支付"]];
    [self setAttributedTitle:sttr];
    
    
}
@end
