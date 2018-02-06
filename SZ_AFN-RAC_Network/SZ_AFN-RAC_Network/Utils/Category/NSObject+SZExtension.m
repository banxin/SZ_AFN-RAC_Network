//
//  NSObject+SZExtension.m
//  SZ_AFN-RAC_Network
//
//  Created by yanl on 2018/2/6.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "NSObject+SZExtension.h"

@implementation NSObject (SZExtension)

/// Get class
- (BOOL)sz_isStringClass
{
    return [self isKindOfClass:[NSString class]];
}

- (BOOL)sz_isNumberClass
{
    return [self isKindOfClass:[NSNumber class]];
}

/// Get value
- (NSString *)sz_stringValueExtension
{
    if ([self sz_isStringClass]) {
      
        return [(NSString *)self length] ? (NSString *)self : @"";
    }
    
    if ([self sz_isNumberClass]) {
      
        return [NSString stringWithFormat:@"%@", self];
    }
    
    return @"";
}

@end
