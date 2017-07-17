//
//  RequestBase.h
//  RequestLib
//
//  Created by Dzy on 16/02/2017.
//  Copyright © 2017 Dzy. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TokenOAuth : NSObject

/**
 获取token

 @param name 用户昵称
 @param password 用户密码
 @param success 是否获取成功
 */
+ (void )getTokenWithName:(NSString *)name andPassword:(NSString *)password andReturn:(void (^)(BOOL))success;

/**
 刷新token

 @param isTrue 是否刷新成功
 */
+ (void )refreshTokenReturn:(void (^)(BOOL))isTrue;


+ (TokenOAuth *)instance;


@end
