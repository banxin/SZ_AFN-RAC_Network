//
//  SZReflection.h
//  SZ_AFN-RAC_Network
//
//  Created by yanl on 2018/2/6.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>

// Creates a selector from a key and a constant string.
//
// key    - The key to insert into the generated selector. This key should be in
//          its natural case.
// suffix - A string to append to the key as part of the selector.
//
// Returns a selector, or NULL if the input strings cannot form a valid
// selector.
SEL SZSelectorWithKeyPattern(NSString *key, const char *suffix) __attribute__((pure, nonnull(1, 2)));

// Creates a selector from a key and a constant prefix and suffix.
//
// prefix - A string to prepend to the key as part of the selector.
// key    - The key to insert into the generated selector. This key should be in
//          its natural case, and will have its first letter capitalized when
//          inserted.
// suffix - A string to append to the key as part of the selector.
//
// Returns a selector, or NULL if the input strings cannot form a valid
// selector.
SEL SZSelectorWithCapitalizedKeyPattern(const char *prefix, NSString *key, const char *suffix) __attribute__((pure, nonnull(1, 2, 3)));
