//
//  GWCData.m
//  Gift
//
//  Created by GaoAng on 15/12/23.
//  Copyright © 2015年 GaoAng. All rights reserved.
//

#import "GWCData.h"

@implementation GWCData
-(instancetype)init{
    if (self = [super init]) {
        [self loardExampleData];
    }
    return self;
}

-(void)loardExampleData{
    self.name = @"马化腾";
    self.icon = @"fadsfadsfad";
    self.iconImage = nil;
    self.mCount = @"342342";
    self.mRecedtive = @"342.23";
    
    self.mBest = @"42424.233";
    
}
@end
