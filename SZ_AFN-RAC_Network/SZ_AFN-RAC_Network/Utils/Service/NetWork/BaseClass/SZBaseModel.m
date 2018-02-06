//
//  SZBaseModel.m
//  SZ_AFN-RAC_Network
//
//  Created by yanl on 2018/2/6.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZBaseModel.h"
#import "SZReflection.h"
#import "SZEXTRuntimeExtensions.h"
#import <ReactiveObjC/ReactiveObjC.h>

// Used to cache the reflection performed in +propertyKeys.
static void *SZObjectCachedPropertyKeysKey = &SZObjectCachedPropertyKeysKey;

// Validates a value for an object and sets it if necessary.
//
// obj         - The object for which the value is being validated. This value
//               must not be nil.
// key         - The name of one of `obj`s properties. This value must not be
//               nil.
// value       - The new value for the property identified by `key`.
// forceUpdate - If set to `YES`, the value is being updated even if validating
//               it did not change it.
// error       - If not NULL, this may be set to any error that occurs during
//               validation
//
// Returns YES if `value` could be validated and set, or NO if an error
// occurred.
static BOOL SBValidateAndSetValue(id obj, NSString *key, id value, BOOL forceUpdate, NSError **error) {
    // Mark this as being autoreleased, because validateValue may return
    // a new object to be stored in this variable (and we don't want ARC to
    // double-free or leak the old or new values).
    __autoreleasing id validatedValue = value;
    
    @try {
        if (![obj validateValue:&validatedValue forKey:key error:error]) return NO;
        
        if (forceUpdate || value != validatedValue) {
            [obj setValue:validatedValue forKey:key];
        }
        
        return YES;
    } @catch (NSException *ex) {
        NSLog(@"*** Caught exception setting key \"%@\" : %@", key, ex);
        
        // Fail fast in Debug builds.
#if DEBUG
        @throw ex;
#else
        if (error != NULL) {
            *error = [NSError mtl_modelErrorWithException:ex];
        }
        
        return NO;
#endif
    }
}

@implementation SZBaseModel

/// 将 JSON (NSData,NSString,NSDictionary) 转换为 Model
+ (instancetype)modelWithJSON:(id)json { return [self modelWithJSON:json]; }

/// json-array 转 模型-数组
+ (NSArray *)modelArrayWithJSON:(id)json {
    return [NSArray modelArrayWithClass:[self class] json:json];
}

/// 字典转模型
+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary{
    return [self modelWithDictionary:dictionary];
}

- (id)toJSONObject { return [self modelToJSONObject]; }
- (NSData *)toJSONData { return [self modelToJSONData]; }
- (NSString *)toJSONString { return [self modelToJSONString]; }


/// Coding/Copying/hash/equal yy_modelInitWithCoder
- (void)encodeWithCoder:(NSCoder *)aCoder { [self modelEncodeWithCoder:aCoder]; }
- (id)initWithCoder:(NSCoder *)aDecoder { return [self modelInitWithCoder:aDecoder]; }
- (id)copyWithZone:(NSZone *)zone { return [self modelCopy]; }
- (NSUInteger)hash { return [self modelHash]; }
- (BOOL)isEqual:(id)object { return [self modelIsEqual:object]; }

/// Properties optional
- (void)setValue:(id)value forUndefinedKey:(NSString *)key { }

/// desc
- (NSString *)description { return [self modelDescription]; }





+ (NSSet *)propertyKeys {
    NSSet *cachedKeys = objc_getAssociatedObject(self, SZObjectCachedPropertyKeysKey);
    if (cachedKeys != nil) return cachedKeys;
    
    NSMutableSet *keys = [NSMutableSet set];
    
    [self enumeratePropertiesUsingBlock:^(objc_property_t property, BOOL *stop) {
        sz_propertyAttributes *attributes = sz_copyPropertyAttributes(property);
        @onExit {
            free(attributes);
        };
        
        if (attributes->readonly && attributes->ivar == NULL) return;
        
        NSString *key = @(property_getName(property));
        [keys addObject:key];
    }];
    
    // It doesn't really matter if we replace another thread's work, since we do
    // it atomically and the result should be the same.
    objc_setAssociatedObject(self, SZObjectCachedPropertyKeysKey, keys, OBJC_ASSOCIATION_COPY);
    
    return keys;
}

- (NSDictionary *)dictionaryValue {
    return [self dictionaryWithValuesForKeys:self.class.propertyKeys.allObjects];
}


#pragma mark Reflection
+ (void)enumeratePropertiesUsingBlock:(void (^)(objc_property_t property, BOOL *stop))block {
    Class cls = self;
    BOOL stop = NO;
    
    while (!stop && ![cls isEqual:SZBaseModel.class]) {
        unsigned count = 0;
        objc_property_t *properties = class_copyPropertyList(cls, &count);
        
        cls = cls.superclass;
        if (properties == NULL) continue;
        
        @onExit {
            free(properties);
        };
        
        for (unsigned i = 0; i < count; i++) {
            block(properties[i], &stop);
            if (stop) break;
        }
    }
}

#pragma mark Merging
- (void)mergeValueForKey:(NSString *)key fromModel:(SZBaseModel *)model {
    NSParameterAssert(key != nil);
    
    SEL selector = SZSelectorWithCapitalizedKeyPattern("merge", key, "FromModel:");
    if (![self respondsToSelector:selector]) {
        if (model != nil) {
            [self setValue:[model valueForKey:key] forKey:key];
        }
        return;
    }
    
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[self methodSignatureForSelector:selector]];
    invocation.target = self;
    invocation.selector = selector;
    
    [invocation setArgument:&model atIndex:2];
    [invocation invoke];
}

- (void)mergeValuesForKeysFromModel:(SZBaseModel *)model {
    NSSet *propertyKeys = model.class.propertyKeys;
    for (NSString *key in self.class.propertyKeys) {
        if (![propertyKeys containsObject:key]) continue;
        
        [self mergeValueForKey:key fromModel:model];
    }
}

@end

@implementation SZBaseModel (Validation)

- (BOOL)validate:(NSError **)error {
    for (NSString *key in self.class.propertyKeys) {
        id value = [self valueForKey:key];
        BOOL success = SBValidateAndSetValue(self, key, value, NO, error);
        if (!success) return NO;
    }
    return YES;
}

@end
