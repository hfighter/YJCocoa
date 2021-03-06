//
//  YJNSURLSessionTask.h
//  YJFoundation
//
//  HomePage:https://github.com/937447974/YJCocoa
//  YJ技术支持群:557445088
//
//  Created by 阳君 on 2016/11/29.
//  Copyright © 2016年 YJCocoa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YJNSURLRequest.h"

NS_ASSUME_NONNULL_BEGIN
// self = YJNSURLRequest.source
typedef void (^ YJNSURLSessionTaskSuccess)(id respModel);
typedef void (^ YJNSURLSessionTaskFailure)(NSError *error);

/** */
typedef NS_ENUM(NSInteger, YJNSURLSessionTaskState) {
    YJNSURLSessionTaskStateDefault,   ///< 初始化状态
    YJNSURLSessionTaskStateRunning,   ///< 正在请求
    YJNSURLSessionTaskStateSuspended, ///< 暂停请求
    YJNSURLSessionTaskStateCanceling, ///< 取消请求
    YJNSURLSessionTaskStateSuccess,   ///< 请求成功
    YJNSURLSessionTaskStateFailure,   ///< 请求失败
};

/** NSURLSessionTask*/
@interface YJNSURLSessionTask : NSObject

@property (nonatomic) BOOL mainQueue;  ///< 是否主线程返回

@property (nonatomic, readonly) YJNSURLSessionTaskState state; ///< 任务状态

@property (nonatomic, strong, readonly) YJNSURLRequest *request;///< 请求

@property (nonatomic, copy, readonly) YJNSURLSessionTaskSuccess success; ///< 成功回调
@property (nonatomic, copy, readonly) YJNSURLSessionTaskFailure failure; ///< 失败回调

@property (nonatomic, readonly) BOOL needResume; ///< 是否需要 YJNSURLSession 执行网络重连

/**
 *  @abstract 通过request.identifier生成或获取Task
 *  @discusstion 生成的YJNSURLSessionTask会存放在缓存中
 *
 *  @param request YJNSURLRequest
 *
 *  @return instancetype
 */
+ (instancetype)taskWithRequest:(YJNSURLRequest *)request;

/**
 *  @abstract 设置是否主线程返回
 *
 *  @param mainQueue 是否主线程
 *
 *  @return instancetype
 */
- (instancetype)mainQueue:(BOOL)mainQueue;

/**
 *  @abstract 链式设置回调
 *  @discusstion 建议使用此方法
 *
 *  @param success 成功回调
 *  @param failure 失败回调
 *
 *  @return instancetype
 */
- (instancetype)completionHandler:(YJNSURLSessionTaskSuccess)success failure:(nullable YJNSURLSessionTaskFailure)failure;

/**
 *  @abstract 发送请求
 */
- (void)resume;

/**
 *  @abstract 暂停请求
 */
- (void)suspend;

/**
 *  @abstract 取消请求
 */
- (void)cancel;

/**
 *  @abstract 根据服务器返回的数据生成对应的模型
 *
 *  @param modelDictionary 服务器返回的模型数据
 *
 *  @return id
 */
- (id)responseModelWithDictionary:(NSDictionary *)modelDictionary;

@end

NS_ASSUME_NONNULL_END
