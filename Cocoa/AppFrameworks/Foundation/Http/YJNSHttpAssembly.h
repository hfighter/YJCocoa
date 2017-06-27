//
//  YJNSHttpAssembly.h
//  YJFoundation
//
//  HomePage:https://github.com/937447974/YJCocoa
//  YJ技术支持群:557445088
//
//  Created by 阳君 on 16/6/30.
//  Copyright © 2016年 YJCocoa. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/** http链接组装参数*/
@interface YJNSHttpAssembly : NSObject

/**
 *  @abstract http组装（只有参数）
 *
 *  @param params 相关参数
 *
 *  @return NSString
 */
+ (NSString *)assemblyHttp:(NSDictionary *)params;

/**
 *  @abstract http组装,URLEncode编码（只有参数）
 *
 *  @param params 相关参数
 *
 *  @return NSString
 */
+ (NSString *)assemblyHttpEncode:(NSDictionary *)params;

/**
 *  @abstract http组装（链接+参数）
 *
 *  @param http 链接
 *  @param params 相关参数
 */
+ (NSString *)assemblyHttp:(NSString *)http params:(NSDictionary *)params;

/**
 *  @abstract http组装,URLEncode编码（链接+参数）
 *
 *  @param http 链接
 *  @param params 相关参数
 *
 *  @return NSString
 */
+ (NSString *)assemblyHttpEncode:(NSString *)http params:(NSDictionary *)params;

@end

NS_ASSUME_NONNULL_END
