//
//  GWCData.h
//  Gift
//
//  Created by GaoAng on 15/12/23.
//  Copyright © 2015年 GaoAng. All rights reserved.
//

#import "GBaseData.h"
#import <UIKit/UIKit.h>
@interface GWCData : GBaseData

@property (nonatomic, strong) NSString *name;   //昵称
@property (nonatomic, strong) NSString *icon;    //头像url
@property (nonatomic, strong) UIImageView *iconImage;   //头像 image
@property (nonatomic, strong) NSString *mCount;        //收到的总数
@property (nonatomic, strong) NSString *mRecedtive;   //收到的红包个数
@property (nonatomic, strong) NSString *mBest;     //手气最佳

-(void)loardExampleData;
@end
