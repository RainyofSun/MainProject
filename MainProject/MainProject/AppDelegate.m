//
//  AppDelegate.m
//  MainProject
//
//  Created by EGLS_BMAC on 2020/11/5.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseViewController.h"
#import <CocoaLumberjack/CocoaLumberjack.h>

static const DDLogLevel ddLogLevel = DDLogLevelVerbose;

@interface AppDelegate ()

/** bgTask */
@property (nonatomic,assign) UIBackgroundTaskIdentifier bgTask;
/** sourceTime */
@property (nonatomic,strong) dispatch_source_t sourceTime;
/** enterBackground */
@property (nonatomic,assign) BOOL enterBackgroud;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self rootVC];
    [self addLog];
    self.enterBackgroud = NO;
    DDLogError(@"asdas");
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    self.bgTask = 0;
    self.time = 0;
    [self beginTime:self.time];
    self.enterBackgroud = YES;
    NSLog(@">>>>>>");
    __weak typeof(self) weakSelf = self;
    self.bgTask = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        NSLog(@"<<<<<<<");
        NSLog(@"堆栈信息 %@",[NSThread callStackSymbols]);
        if (weakSelf.bgTask != UIBackgroundTaskInvalid) {
            [[UIApplication sharedApplication] endBackgroundTask:weakSelf.bgTask];
            weakSelf.bgTask = UIBackgroundTaskInvalid;
        }
    }];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    [[UIApplication sharedApplication] endBackgroundTask:self.bgTask];
    self.enterBackgroud = NO;
    if (dispatch_source_testcancel(self.sourceTime) == 0) {
        dispatch_source_cancel(self.sourceTime);
    }
}

- (void)rootVC {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[BaseViewController alloc] init]];
}

- (void)beginTime:(NSInteger)speedTime {
    __block NSInteger time = speedTime;
    self.sourceTime = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    dispatch_source_set_timer(self.sourceTime, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(self.sourceTime, ^{
        NSLog(@"后台时间 %ld",time ++);
        [[NSNotificationCenter defaultCenter] postNotificationName:@"speed" object:[NSNumber numberWithInteger:time]];
    });
    if (!self.enterBackgroud) {
        dispatch_resume(self.sourceTime);
    }
}

- (void)addLog {
    if (@available(iOS 10.0, *)) {
        // 添加DDASLLogger，你的日志语句将被发送到Xcode控制台
        [DDLog addLogger:[DDTTYLogger sharedInstance]];
        // 添加DDTTYLogger，你的日志语句将被发送到Console.app
        [DDLog addLogger:[DDASLLogger sharedInstance]];
        [DDLog addLogger:[DDOSLogger sharedInstance] withLevel:DDLogLevelVerbose];
        DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
        fileLogger.rollingFrequency = 60 * 60 * 24;
        fileLogger.logFileManager.maximumNumberOfLogFiles = 7; // 日志保留7天
        [DDLog addLogger:fileLogger];
        NSString *filePath = [fileLogger.logFileManager logsDirectory];
    } else {
        // Fallback on earlier versions
    }
    
}

@end
