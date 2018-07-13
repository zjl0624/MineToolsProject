//
//  AppDelegate.m
//  ZJLFaceProject
//
//  Created by zjl on 2017/6/13.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "AppDelegate.h"
#import "LocalNotification.h"
#import "MyNaviVController.h"
#import "ViewController.h"
#import "JPEngine.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	// Override point for customization after application launch.
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	[JPEngine startEngine];
	NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"demo" ofType:@"js"];
	NSString *script = [NSString stringWithContentsOfFile:sourcePath encoding:NSUTF8StringEncoding error:nil];
	[JPEngine evaluateScript:script];
	ViewController *vc = [[ViewController alloc] init];
	MyNaviVController *navi = [[MyNaviVController alloc] initWithRootViewController:vc];
	[self.window setRootViewController:navi];
	[self.window makeKeyAndVisible];
	[LocalNotification registerLocalNotification];
	return YES;
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
	if(application.applicationState == UIApplicationStateActive){
		
	}else {
		
	}
	[UIApplication sharedApplication].applicationIconBadgeNumber = 0;
}

//- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL*)url
//{
//	// 接受传过来的参数
//	NSString *text = [[url host] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

//}

- (BOOL)application:(UIApplication*)application
			openURL:(NSURL*)url
  sourceApplication:(NSString*)sourceApplication
		 annotation:(id)annotation

{
	
	NSLog(@"sourceApplication:%@",sourceApplication);
	
	NSLog(@"URLscheme:%@",[url scheme]);
	
	NSLog(@"URLquery:%@",[url query]);
	
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
	[UIApplication sharedApplication].applicationIconBadgeNumber = 0;

}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
