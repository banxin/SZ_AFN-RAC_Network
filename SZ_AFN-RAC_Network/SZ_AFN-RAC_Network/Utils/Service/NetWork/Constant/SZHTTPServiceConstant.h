//
//  SZHTTPServiceConstant.h
//  SZ_AFN-RAC_Network
//
//  Created by yanl on 2018/2/6.
//  Copyright © 2018年 yanl. All rights reserved.
//

#ifndef SZHTTPServiceConstant_h
#define SZHTTPServiceConstant_h

/// 服务器相关
static NSString * const SZHTTPRequestTokenKey = @"token";

/// 私钥key
static NSString * const SZHTTPServiceKey      = @"privatekey";

/// 私钥Value
static NSString * const SZHTTPServiceKeyValue = @"/** 你的私钥 **/";

/// 签名key
static NSString * const SZHTTPServiceSignKey  = @"sign";

/// 服务器返回的三个固定字段

/// 状态码key
static NSString * const SZHTTPServiceResponseCodeKey     = @"code";
/// 消息key
static NSString * const SZHTTPServiceResponseMsgKey      = @"msg";
/// 数据data
static NSString * const SZHTTPServiceResponseDataKey     = @"data";
/// 数据data{"list":[]}
static NSString * const SZHTTPServiceResponseDataListKey = @"list";


#endif /* SZHTTPServiceConstant_h */
