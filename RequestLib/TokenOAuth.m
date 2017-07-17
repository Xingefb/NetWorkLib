//
//  RequestBase.m
//  RequestLib
//
//  Created by Dzy on 16/02/2017.
//  Copyright © 2017 Dzy. All rights reserved.
//

#import "TokenOAuth.h"

#import "ConstantStringHeader.h"

#import "AFOAuth2Manager.h"
#import "AFHTTPSessionManager.h"

@implementation TokenOAuth

+ (void )refreshTokenReturn:(void (^)(BOOL))isTrue {

    NSURL *baseUrl = [NSURL URLWithString:BaseUrl];
    AFOAuth2Manager *OAuth2Manager = [[AFOAuth2Manager alloc] initWithBaseURL:baseUrl clientID:ClientID secret:Secret];
    AFOAuthCredential *OAuthCredential = [AFOAuthCredential retrieveCredentialWithIdentifier:serviceProviderIdentifier];
    [OAuth2Manager authenticateUsingOAuthWithURLString:@"" refreshToken:OAuthCredential.refreshToken success:^(AFOAuthCredential * _Nonnull credential) {
        if (isTrue) {
            isTrue(YES);
        }
    } failure:^(NSError * _Nonnull error) {
        if (isTrue) {
            isTrue(NO);
        }
    }];

}

+ (void )getTokenWithName:(NSString *)name andPassword:(NSString *)password andReturn:(void (^)(BOOL))success {
    
    //只需要一个参数,如果参数存在程序继续运行,如果参数为空,则程序停止打印日志
    NSParameterAssert(name);
    NSParameterAssert(password);
    
    NSURL *baseUrl = [NSURL URLWithString:BaseUrl];
    AFOAuth2Manager *OAuth2Manager = [[AFOAuth2Manager alloc] initWithBaseURL:baseUrl clientID:ClientID secret:Secret];
    [OAuth2Manager authenticateUsingOAuthWithURLString:@"" username:name password:password scope:nil success:^(AFOAuthCredential * _Nonnull credential) {
        [AFOAuthCredential storeCredential:credential withIdentifier:serviceProviderIdentifier];
        if (success) {
            success(YES);
        }
        
    } failure:^(NSError * _Nonnull error) {
        if (success) {
            success(NO);
        }
    }];
    
}

+ (TokenOAuth *)instance {
    static TokenOAuth *_instance = nil;

    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];

        }
    }

    return _instance;
}


@end
