//
//  RequestApi.m
//  RequestLib
//
//  Created by Dzy on 16/02/2017.
//  Copyright © 2017 Dzy. All rights reserved.
//

#import "RequestApi.h"
#import "ConstantStringHeader.h"

#import "AFOAuth2Manager.h"
#import "BaseApi.h"

@implementation RequestApi



+ (void)shareInstance {

    static RequestApi *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
}

@end
