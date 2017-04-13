//
//  AppDelegate.m
//  UICollectionViewDemo
//
//  Created by Leviduan on 2017/2/16.
//  Copyright © 2017年 Leviduan. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "ONE_ViewController.h"
#import "TWO_ViewController.h"
#import "THREE_ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate{
    UITabBarController *tabbar;
    UINavigationController * navigationController;
//    Custom_tabbar *customTabbar;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    tabbar = [[UITabBarController alloc] init];
    
    
    ViewController *vc = [[ViewController alloc] init];
    ONE_ViewController *one_vc = [[ONE_ViewController alloc] init];
    TWO_ViewController *two_vc = [[TWO_ViewController alloc] init];
    THREE_ViewController *thr_vc = [[THREE_ViewController alloc] init];
    
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:vc];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:one_vc];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:two_vc];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:thr_vc];
    tabbar.viewControllers = @[nav1,nav2,nav3,nav4];
//    [self customTabbar];
    NSInteger index = [[NSUserDefaults standardUserDefaults] integerForKey:@"TabIndex"];
    tabbar.selectedIndex = index;
    tabbar.selectedIndex = 2;
//    [customTabbar setSelectIndex:index];
    
    
//    navigationController = [[UINavigationController alloc] initWithRootViewController:vc];
//    self.window.rootViewController = navigationController;
    
    
    self.window.rootViewController = tabbar;
    self.window.backgroundColor = [UIColor colorWithWhite:1 alpha:0.95];
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
