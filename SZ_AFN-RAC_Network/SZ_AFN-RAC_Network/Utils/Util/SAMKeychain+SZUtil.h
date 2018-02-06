//
//  SAMKeychain+SZUtil.h
//  SZ_AFN-RAC_Network
//
//  Created by yanl on 2018/2/6.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import <SAMKeychain/SAMKeychain.h>

@interface SAMKeychain (SZUtil)

+ (NSString *)rawLogin ;

+ (BOOL)setRawLogin:(NSString *)rawLogin ;

+ (BOOL)deleteRawLogin;

/// 设备ID or UUID
+ (NSString *)deviceId;

@end
