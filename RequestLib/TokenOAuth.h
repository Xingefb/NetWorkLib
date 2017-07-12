//
//  RequestBase.h
//  RequestLib
//
//  Created by Dzy on 16/02/2017.
//  Copyright © 2017 Dzy. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TokenOAuth : NSObject

+ (void )getTokenWithName:(NSString *)name andPassword:(NSString *)password andReturn:(void (^)(BOOL))success;

+ (void )refreshTokenReturn:(void (^)(BOOL))isTrue;

+ (TokenOAuth *)instance;


@end
