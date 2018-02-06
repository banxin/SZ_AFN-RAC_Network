//
//  NSString+SZExtension.m
//  SZ_AFN-RAC_Network
//
//  Created by yanl on 2018/2/6.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "NSString+SZExtension.h"

@implementation NSString (SZExtension)

- (NSString *)sz_removeBothEndsWhitespace
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (NSString *)sz_removeBothEndsWhitespaceAndNewline
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)sz_URLEncoding
{
    NSString * result = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault,
                                                                                              (CFStringRef)self,
                                                                                              NULL,
                                                                                              CFSTR("!*'();:@&=+$,/?%#[]"),
                                                                                              kCFStringEncodingUTF8 ));
    return result;
}

@end
