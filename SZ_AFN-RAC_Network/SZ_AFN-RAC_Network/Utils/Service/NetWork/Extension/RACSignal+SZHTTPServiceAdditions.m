//
//  RACSignal+SZHTTPServiceAdditions.m
//  SZ_AFN-RAC_Network
//
//  Created by yanl on 2018/2/6.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "RACSignal+SZHTTPServiceAdditions.h"
#import "SZHTTPResponse.h"

@implementation RACSignal (SZHTTPServiceAdditions)

- (RACSignal *)sz_parsedResults
{
    return [self map:^(SZHTTPResponse *response) {
        
        NSAssert([response isKindOfClass:SZHTTPResponse.class], @"Expected %@ to be an SZHTTPResponse.", response);
        
        return response.parsedResult;
    }];
}

@end
