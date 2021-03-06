//
//  NSNotificationCenter+YJ.m
//  YJCocoa
//
//  HomePage:https://github.com/937447974/YJCocoa
//  YJ技术支持群:557445088
//
//  Created by 阳君 on 2018/6/11.
//  Copyright © 2018年 YJCocoa. All rights reserved.
//

#import "NSNotificationCenter+YJ.h"
#import <objc/runtime.h>

@implementation NSObject (YJNotificationCenter)

- (NSMutableDictionary *)yj_notificationCenterBlock {
    const void *key = "yj_notificationCenterBlock";
    NSMutableDictionary *blockDict = objc_getAssociatedObject(self, key);
    if (!blockDict) {
        blockDict = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, key, blockDict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return blockDict;
}

- (void)yj_notificationCenterCallback:(NSNotification *)note {
    NSMutableDictionary *blockDict = self.yj_notificationCenterBlock;
    void (^ block)(NSNotification *) = [blockDict objectForKey:note.name];
    block(note);
}

@end

@implementation NSNotificationCenter (YJ)

- (void)addObserver:(NSObject *)observer name:(NSNotificationName)name usingBlock:(void (^)(NSNotification *))block {
    NSMutableDictionary *blockDict = observer.yj_notificationCenterBlock;
    if (![blockDict objectForKey:name]) {
        [self addObserver:observer selector:@selector(yj_notificationCenterCallback:) name:name object:nil];
    }
    [blockDict setObject:block forKey:name];
}

@end
