//
//  AppDelegate.m
//  PlantDoctor
//
//  Created by Linda Cobb on 7/3/13.
//  Copyright (c) 2013 TimesToCome Mobile. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [self tabBarSetup];
    
    return YES;
}



- (void)tabBarSetup
{
    // tab bar setup
    
    [[UITabBar appearance] setTintColor:[UIColor greenColor]];
    [[UITabBar appearance] setSelectedImageTintColor:[UIColor greenColor]];

    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    [tabBarController.tabBar setBackgroundImage:[UIImage imageNamed:@"tabBarBackground.png"]];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {}
- (void)applicationDidEnterBackground:(UIApplication *)application {}
- (void)applicationWillEnterForeground:(UIApplication *)application {}
- (void)applicationDidBecomeActive:(UIApplication *)application {}
- (void)applicationWillTerminate:(UIApplication *)application {}

@end
