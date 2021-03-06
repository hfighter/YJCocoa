//
//  YJNSRouterNode.m
//  YJUINavigationRouter
//
//  Created by 阳君 on 2017/10/17.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

#import "YJNSRouterNode.h"

YJNSRouterScope const YJNSRouterScopeSingleton = @"singleton";
YJNSRouterScope const YJNSRouterScopePrototype = @"prototype";
YJNSRouterScope const YJNSRouterScopeMemoryWarning = @"memoryWarning";

@implementation YJNSRouterNode

+ (YJNSRouterNode *)nodeWithRouterClass:(Class)routerClass routerURL:(YJNSRouterURL)routerURL {
    return [self nodeWithRouterClass:routerClass scope:YJNSRouterScopePrototype routerURL:routerURL];
}

+ (YJNSRouterNode *)nodeWithRouterClass:(Class)routerClass scope:(YJNSRouterScope)scope routerURL:(YJNSRouterURL)routerURL {
    YJNSRouterNode *node = [YJNSRouterNode new];
    node -> _routerClass = routerClass;
    node -> _scope = scope ;
    node -> _routerURL = routerURL;
    return node;
}

@end
