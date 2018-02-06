//
//  SZHTTPRequest.m
//  SZ_AFN-RAC_Network
//
//  Created by yanl on 2018/2/6.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZHTTPRequest.h"
#import "SZURLParameters.h"
#import "SZHTTPService.h"

@interface SZHTTPRequest ()

/// 请求参数
@property (nonatomic, readwrite, strong) SZURLParameters *urlParameters;

@end

@implementation SZHTTPRequest

+ (instancetype)requestWithParameters:(SZURLParameters *)parameters
{
    return [[self alloc] initRequestWithParameters:parameters];
}

- (instancetype)initRequestWithParameters:(SZURLParameters *)parameters
{
    self = [super init];
    
    if (self) {
        self.urlParameters = parameters;
    }
    
    return self;
}

@end

/// 网络服务层分类 方便 SZHTTPRequest 主动发起请求
@implementation SZHTTPRequest (SZHTTPService)

/// 请求数据
- (RACSignal *) enqueueResultClass:(Class /*subclass of SZBaseModel*/) resultClass
{
    return [[SZHTTPService sharedInstance] enqueueRequest:self resultClass:resultClass];
}

@end
