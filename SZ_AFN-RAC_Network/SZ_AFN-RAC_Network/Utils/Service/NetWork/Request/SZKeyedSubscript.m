//
//  SZKeyedSubscript.m
//  SZ_AFN-RAC_Network
//
//  Created by yanl on 2018/2/6.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZKeyedSubscript.h"

@interface SZKeyedSubscript ()

/// 字典
@property (nonatomic, readwrite, strong) NSMutableDictionary *kvs;

@end

@implementation SZKeyedSubscript

+ (instancetype) subscript
{
    return [[self alloc] init];
}

+ (instancetype) subscriptWithDictionary:(NSDictionary *) dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.kvs = [NSMutableDictionary dictionary];
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *) dict
{
    self = [super init];
    
    if (self) {
        
        self.kvs = [NSMutableDictionary dictionary];
        
        if ([dict count]) {
            
            // 拼接字典
            [self.kvs addEntriesFromDictionary:dict];
        }
    }
    
    return self;
}

- (id)objectForKeyedSubscript:(id)key
{
    return key ? [self.kvs objectForKey:key] : nil;
}

- (void)setObject:(id)obj forKeyedSubscript:(id <NSCopying>)key
{
    if (key) {
        if (obj) {
            [self.kvs setObject:obj forKey:key];
        } else {
            [self.kvs removeObjectForKey:key];
        }
    }
}

- (NSDictionary *)dictionary
{
    return self.kvs.copy;
}

@end
