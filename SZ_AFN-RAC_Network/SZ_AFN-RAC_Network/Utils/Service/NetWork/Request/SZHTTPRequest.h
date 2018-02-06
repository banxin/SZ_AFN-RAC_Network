//
//  SZHTTPRequest.h
//  SZ_AFN-RAC_Network
//
//  Created by yanl on 2018/2/6.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RACSignal+SZHTTPServiceAdditions.h"
#import <ReactiveObjC/ReactiveObjC.h>

@class SZURLParameters;

@interface SZHTTPRequest : NSObject

/// 请求参数
@property (nonatomic, readonly, strong) SZURLParameters *urlParameters;

/**
 获取请求类 实例
 @param parameters  参数模型
 @return 请求类实例
 */
+ (instancetype)requestWithParameters:(SZURLParameters *)parameters;

@end

@interface SZHTTPRequest (SZHTTPService)

/// 入队
- (RACSignal *)enqueueResultClass:(Class /*subclass of SZBaseModel*/) resultClass;

@end
