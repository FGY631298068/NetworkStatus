//
//  AppDelegate.m
//  NetworkStatus
//
//  Created by 范国义 on 16/5/4.
//  Copyright © 2016年 范国义. All rights reserved.
//

#import "AppDelegate.h"
#import "UIView+LXAlertView.h"
#import "CoreStatus.h"
@interface AppDelegate ()<CoreStatusProtocol>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}
//当网络改变时

-(void)coreNetworkChangeNoti:(NSNotification *)noti{
    
    NSString *stateString = nil;
    
    //获取当前网络状态
    
    CoreNetWorkStatus currentStatus = [CoreStatus currentNetWorkStatus];
    
    switch (currentStatus) {
            
        case CoreNetWorkStatusNone:
            
            stateString = @"无网络";
            
            break;
            
        case CoreNetWorkStatusWifi:
            
            stateString = @"Wifi网络";
            
            break;
            
        case CoreNetWorkStatusWWAN:
            
            stateString = @"蜂窝网络";
            
            break;
            
        case CoreNetWorkStatus2G:
            
            stateString = @"2G网络";
            
            break;
            
        case CoreNetWorkStatus3G:
            
            stateString = @"3G网络";
            
            break;
            
        case CoreNetWorkStatus4G:
            
            stateString = @"4G网络";
            
            break;
            
        case CoreNetWorkStatusUnkhow:
            
            stateString = @"未知网络";
            
            break;
            
        default:
            
            stateString = @"未知网络";
            
            break;
            
    }
    
    [UIView addLXNotifierWithText:[NSString stringWithFormat:@"您正处于%@状态",stateString] dismissAutomatically:YES];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    
    //应用程序将要入非活动状态
    
    //移除网络状态监听
    
    [CoreStatus endNotiNetwork:self];
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    //程序被推送到后台
    
    
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    
    //程序从后台将要重新回到前台
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    //应用程序入活动状态
    
    //监听网络状态
    
    [CoreStatus beginNotiNetwork:self];
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    
    //应用程序即将终止时
    
    
    
}



@end
