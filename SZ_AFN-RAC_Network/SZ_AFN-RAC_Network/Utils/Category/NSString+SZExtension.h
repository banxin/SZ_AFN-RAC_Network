//
//  NSString+SZExtension.h
//  SZ_AFN-RAC_Network
//
//  Created by yanl on 2018/2/6.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SZExtension)

/// 消除收尾空格
- (NSString *)sz_removeBothEndsWhitespace;

/// 消除收尾空格+换行符
- (NSString *)sz_removeBothEndsWhitespaceAndNewline;

/// 编码
- (NSString *)sz_URLEncoding;

@end
