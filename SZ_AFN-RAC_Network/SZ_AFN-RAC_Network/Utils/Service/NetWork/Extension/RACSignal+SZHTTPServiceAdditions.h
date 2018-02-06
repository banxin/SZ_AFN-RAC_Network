//
//  RACSignal+SZHTTPServiceAdditions.h
//  SZ_AFN-RAC_Network
//
//  Created by yanl on 2018/2/6.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import <ReactiveObjC/ReactiveObjC.h>

// 便捷类别 - 从SZHTTPResponses中检索已解析的结果
@interface RACSignal (SZHTTPServiceAdditions)

// 这个方法假设接收者是SZHTTPResponses的信号。
//
// 返回一个将接收器映射成信号的信号
// SZHTTPResponses.parsedResult。
- (RACSignal *)sz_parsedResults;

@end
