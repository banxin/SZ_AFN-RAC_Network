//
//  SAMKeychain+SZUtil.m
//  SZ_AFN-RAC_Network
//
//  Created by yanl on 2018/2/6.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SAMKeychain+SZUtil.h"
#import <UIKit/UIKit.h>

/// 登录账号的key
static NSString * const SZ_RAW_LOGIN                = @"SZRawLogin";
static NSString * const SZ_SERVICE_NAME_IN_KEYCHAIN = @"com.lang.hbfs";
static NSString * const SZ_DEVICEID_ACCOUNT         = @"DeviceID";

@implementation SAMKeychain (SZUtil)

+ (NSString *)rawLogin
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:SZ_RAW_LOGIN];
}

+ (BOOL)setRawLogin:(NSString *)rawLogin
{
    if (rawLogin == nil) NSLog(@"+setRawLogin: %@", rawLogin);
    
    [[NSUserDefaults standardUserDefaults] setObject:rawLogin forKey:SZ_RAW_LOGIN];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    return YES;
}

+ (BOOL)deleteRawLogin
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:SZ_RAW_LOGIN];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return YES;
}

+ (NSString *)deviceId
{
    NSString * deviceidStr = [SAMKeychain passwordForService:SZ_SERVICE_NAME_IN_KEYCHAIN account:SZ_DEVICEID_ACCOUNT];
    if (deviceidStr == nil) {
        deviceidStr = [UIDevice currentDevice].identifierForVendor.UUIDString;
        [SAMKeychain setPassword:deviceidStr forService:SZ_SERVICE_NAME_IN_KEYCHAIN account:SZ_DEVICEID_ACCOUNT];
    }
    return deviceidStr;
}

@end
