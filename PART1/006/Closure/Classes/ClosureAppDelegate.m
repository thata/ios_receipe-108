//
//  ClosureAppDelegate.m
//  Closure
//
//  Created by 森田秀幸 on 10/08/17.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "ClosureAppDelegate.h"
#import "ClosureViewController.h"

static int static_seven = 7;

static int static_add_seven(int num) {
    return num + static_seven;
}

@implementation ClosureAppDelegate

@synthesize window;
@synthesize viewController;


#pragma mark -
#pragma mark Application lifecycle

- (int)applyBlocks:(int(^)())block {
    return block();
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
    
    // 関数ポインタの例
    int (*static_to_local_add_seven)(int) = static_add_seven;
    NSLog(@"apply static_to_local_add_seven(5): %d", static_to_local_add_seven(5));
    
    // Blocks基本
    int seven = 7;
    int (^add_seven)(int) = ^(int num) {
        return seven + num;
    };
    
    NSLog(@"apply add_seven(5): %d", add_seven(5));

    
    // Blocksを無名で呼び出し
    NSLog(@"apply anonymous blocks: %d", ^(){ return 3; }() );


    // Blocksを無名で引数として渡す。
    // applyBlocksはBlocksを引数にとってそれを呼び出して結果を返すメソッド
    int result = [self applyBlocks:^(){ return 5; }];
    NSLog(@"anonymous blocks argument: %d", result);
    
    
    // Blocksで外側の変数の値を変更
    __block int sum = 0;
    void (^increment_sum)() = ^() {
        sum += 1;
    };
    
    NSLog(@"sum: %d", sum); // => 0
    increment_sum();
    NSLog(@"sum: %d", sum); // => 1
    increment_sum();
    NSLog(@"sum: %d", sum); // => 2
    
    
    // Blocksをheapに作成してメソッドのスコープ外に持ち出す
    NSString *foo = [[[NSMutableString alloc] initWithString:@"foo"] autorelease];
    NSLog(@"foo's retain count: %d", [foo retainCount]); // => 1
    // instanceBlockFooはインスタンス変数のためBlocksを定義した外側から呼び出される。
    instanceBlockFoo = Block_copy(^() {
        NSLog(@"refelence %@", foo);
    });
    NSLog(@"foo's retain count: %d", [foo retainCount]); // => 2

    // インスタンス変数の参照
    // barはインスタンス変数
    bar = [[NSMutableString alloc] initWithString:@"bar"];
    NSLog(@"self's retain count: %d", [self retainCount]);
    instanceBlockBar = Block_copy(^() {
        NSLog(@"refelence %@", bar);
    });
    NSLog(@"self's retain count: %d", [self retainCount]); // +1

    // Add the view controller's view to the window and display.
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    instanceBlockFoo();
    instanceBlockBar();

    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [bar release];
    Block_copy(instanceBlockBar);
    Block_copy(instanceBlockFoo);
    [viewController release];
    [window release];
    [super dealloc];
}


@end
