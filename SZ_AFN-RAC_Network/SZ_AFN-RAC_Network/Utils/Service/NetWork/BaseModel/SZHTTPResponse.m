//
//  SZHTTPResponse.m
//  SZ_AFN-RAC_Network
//
//  Created by yanl on 2018/2/6.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZHTTPResponse.h"
#import "SZHTTPServiceConstant.h"

@interface SZHTTPResponse()

/// The parsed MHObject object corresponding to the API response.
/// The developer need care this data
@property (nonatomic, readwrite, strong) id parsedResult;
/// 自己服务器返回的状态码
@property (nonatomic, readwrite, assign) SZHTTPResponseCode code;
/// 自己服务器返回的信息
@property (nonatomic, readwrite, copy) NSString *msg;

@end

@implementation SZHTTPResponse

- (instancetype)initWithResponseObject:(id)responseObject parsedResult:(id)parsedResult
{
    self = [super init];
    
    if (self) {
        
        self.parsedResult = parsedResult ? : NSNull.null;
        self.code         = [responseObject[SZHTTPServiceResponseCodeKey] integerValue];
        self.msg          = responseObject[SZHTTPServiceResponseMsgKey];
    }
    
    return self;
}

@end
