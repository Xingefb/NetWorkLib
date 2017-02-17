//
//  BaseApi.h
//  RequestLib
//
//  Created by Dzy on 16/02/2017.
//  Copyright © 2017 Dzy. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface BaseApi : AFHTTPSessionManager


+ (instancetype)sharedManager;

@end
