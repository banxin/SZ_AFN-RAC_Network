//
//  SZURLParameters.h
//  SZ_AFN-RAC_Network
//
//  Created by yanl on 2018/2/6.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 请求Method
/// GET 请求
static NSString * const MH_HTTTP_METHOD_GET    = @"GET";
/// HEAD
static NSString * const MH_HTTTP_METHOD_HEAD   = @"HEAD";
/// POST
static NSString * const MH_HTTTP_METHOD_POST   = @"POST";
/// PUT
static NSString * const MH_HTTTP_METHOD_PUT    = @"PUT";
/// POST
static NSString * const MH_HTTTP_METHOD_PATCH  = @"PATCH";
/// DELETE
static NSString * const MH_HTTTP_METHOD_DELETE = @"DELETE";

/// 项目额外的配置参数拓展 (PS)开发人员无需考虑
@interface CommonExtendsParameters : NSObject

/// 类方法
+ (instancetype)extendsParameters;

/// 用户token，默认空字符串
@property (nonatomic, readonly, copy) NSString *token;

/// 设备编号，自行生成
@property (nonatomic, readonly, copy) NSString *deviceid;

/// app版本号
@property (nonatomic, readonly, copy) NSString *ver;

/// 平台 pc,wap,android,iOS
@property (nonatomic, readonly, copy) NSString *platform;

/// 渠道 AppStore
@property (nonatomic, readonly, copy) NSString *channel;

/// 时间戳
@property (nonatomic, readonly, copy) NSString *t;

@end

@interface SZURLParameters : NSObject

/// 路径 （v14/order）
@property (nonatomic, readwrite, strong) NSString *path;
/// 参数列表
@property (nonatomic, readwrite, strong) NSDictionary *parameters;
/// 方法 （POST/GET）
@property (nonatomic, readwrite, strong) NSString *method;
/// 拓展的参数属性 (开发人员不必关心)
@property (nonatomic, readwrite, strong) CommonExtendsParameters *extendsParameters;

/**
 参数配置（统一用这个方法配置参数） （SBBaseUrl : https://api.cleancool.tenqing.com/）
 https://api.cleancool.tenqing.com/user/info?user_id=100013
 @param method 方法名 （GET/POST/...）
 @param path 文件路径 （user/info）
 @param parameters 具体参数 @{user_id:10013}
 @return 返回一个参数实例
 */
+ (instancetype)urlParametersWithMethod:(NSString *)method path:(NSString *)path parameters:(NSDictionary *)parameters;

@end

















