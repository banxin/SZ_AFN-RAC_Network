//
//  SZHTTPResponse.h
//  SZ_AFN-RAC_Network
//
//  Created by yanl on 2018/2/6.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZBaseModel.h"

/// 请求数据返回的状态码
typedef NS_ENUM(NSUInteger, SZHTTPResponseCode) {
    
    SZHTTPResponseCodeSuccess = 200 ,                     /// 请求成功
    SZHTTPResponseCodeNotLogin = 666,                     /// 用户尚未登录
    SZHTTPResponseCodeParametersVerifyFailure = 105,      /// 参数验证失败
};

@interface SZHTTPResponse : SZBaseModel

/// The parsed MHObject object corresponding to the API response.
/// The developer need care this data 切记：若没有数据是NSNull 而不是nil .对应于服务器json数据的 data
@property (nonatomic, readonly, strong) id parsedResult;
/// 自己服务器返回的状态码 对应于服务器json数据的 code
@property (nonatomic, readonly, assign) SZHTTPResponseCode code;
/// 自己服务器返回的信息 对应于服务器json数据的 msg
@property (nonatomic, readonly, copy) NSString *msg;

// Initializes the receiver with the headers from the given response, and given the origin data and the
// given parsed model object(s).
- (instancetype)initWithResponseObject:(id)responseObject parsedResult:(id)parsedResult;

@end
