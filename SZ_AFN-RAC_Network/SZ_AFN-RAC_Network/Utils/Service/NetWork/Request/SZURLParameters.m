//
//  SZURLParameters.m
//  SZ_AFN-RAC_Network
//
//  Created by yanl on 2018/2/6.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZURLParameters.h"
#import "SAMKeychain+SZUtil.h"

@implementation CommonExtendsParameters

+ (instancetype)extendsParameters
{
    return [[self alloc] init];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (NSString *)ver
{
    static NSString *version = nil;
    if (version == nil) version = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    return (version.length>0)?version:@"";
}

- (NSString *)token
{
    //    NSString *uid = self.uid;
    //    if (MHStringIsNotEmpty(uid) && MHStringIsNotEmpty([MHHTTPService sharedInstance].token)){
    //        NSString *t_token = [NSString stringWithFormat:@"%@-%@",uid,[MHHTTPService sharedInstance].token];
    //        return t_token;
    //    }
    return @"";//[MHHTTPService sharedInstance].token;
}

- (NSString *)deviceid
{
    static NSString *deviceidStr = nil;
    if (deviceidStr == nil) deviceidStr = [SAMKeychain deviceId];
    return deviceidStr.length>0?deviceidStr:@"";
}

- (NSString *)platform
{
    return @"iOS";
}

- (NSString *)channel
{
    return @"AppStore";
}

- (NSString *)t
{
    return [NSString stringWithFormat:@"%.f", [NSDate date].timeIntervalSince1970];
}

@end

@implementation SZURLParameters

+ (instancetype)urlParametersWithMethod:(NSString *)method path:(NSString *)path parameters:(NSDictionary *)parameters
{
    return [[self alloc] initUrlParametersWithMethod:method path:path parameters:parameters];
}

- (instancetype)initUrlParametersWithMethod:(NSString *)method path:(NSString *)path parameters:(NSDictionary *)parameters
{
    self = [super init];
    if (self) {
        self.method = method;
        self.path = path;
        self.parameters = parameters;
        self.extendsParameters = [[CommonExtendsParameters alloc] init];
    }
    return self;
}

@end




















