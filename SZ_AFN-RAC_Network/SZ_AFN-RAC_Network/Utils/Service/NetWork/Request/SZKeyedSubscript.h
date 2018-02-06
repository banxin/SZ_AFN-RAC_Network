//
//  SZKeyedSubscript.h
//  SZ_AFN-RAC_Network
//
//  Created by yanl on 2018/2/6.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SZKeyedSubscript : NSObject

/// 类方法
+ (instancetype) subscript;

/// 拼接一个字典
+ (instancetype)subscriptWithDictionary:(NSDictionary *) dict;

- (instancetype)initWithDictionary:(NSDictionary *) dict;

- (id)objectForKeyedSubscript:(id)key;
- (void)setObject:(id)obj forKeyedSubscript:(id <NSCopying>)key;

/// 转换为字典
- (NSDictionary *)dictionary;

@end
