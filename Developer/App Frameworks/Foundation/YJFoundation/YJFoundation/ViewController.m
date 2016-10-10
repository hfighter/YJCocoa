//
//  ViewController.m
//  YJFoundation
//
//  Created by 阳君 on 16/5/16.
//  Copyright © 2016年 YJ. All rights reserved.
//

#import "ViewController.h"
#import "YJSFoundation.h"
#import "YJCSystem.h"

#define ViewControllerS (ViewController *)[YJSSingletonMC registerStrongSingleton:[ViewController class]]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self testLog];
//    [self testSingleton];
    [self testHttp];
//    [self testPerformSelector];
//    [self testTimer];
}

#pragma mark - log
- (void)testLog {
}



#pragma mark - http相关
- (void)testHttp {

}

#pragma mark - 安全执行Selector
- (void)testPerformSelector {
    [self performSelector:@selector(testPerformSelector1) withObjects:nil];
    [self performSelector:@selector(testPerformSelector2:withObject:withObject:) withObjects:@[@"1",@"2"]];
    YJSPerformSelector *result = [self performSelector:@selector(testPerformSelector3:withObject:) withObjects:@[@"1",@"2"]];
    NSLog(@"%@", result.result);
}

- (void)testPerformSelector1 {
    NSLog(NSStringFromSelector(_cmd), nil);
}

- (void)testPerformSelector2:(id)object0 withObject:(id)object1 withObject:(id)object2 {
    NSLog(@"0:%@; 1:%@; 2:%@", object0, object1, object2);
}

- (NSString *)testPerformSelector3:(id)object1 withObject:(id)object2 {
    NSLog(@"0:%@; 1:%@; ", object1, object2);
    return @"阳君";
}

#pragma mark - 
- (void)testTimer {
    for (int i=0; i<3; i++) {
        YJSTimer *timer = [YJSTimer timerWeakWithIdentifier:nil];
        [timer addTarget:self action:@selector(testTimerLog:)];
        timer.timeInterval = 3;
        timer.time = 10;
        timer.countdown = YES;
        [timer run];
    }
}

- (void)testTimerLog:(YJSTimer *)timer {
    NSLog(@"%@ day:%ld; hour:%ld; minute:%ld; second:%.3f;", timer.identifier, (long)timer.day, (long)timer.hour, (long)timer.minute, timer.second);
    // 模拟释放当前VC
    if (timer.time<=0) {
        [timer invalidate];
    }
}

@end